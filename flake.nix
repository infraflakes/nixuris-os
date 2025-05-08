{
  description = "configuration.nix + home.nix in one flake with dev shell";
  inputs = {
    nixpkgs.url    = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url                  = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    # Development shell for project
    devShells = {
      x86_64-linux.default = pkgs.mkShell {
        buildInputs = [
          #Git
          pkgs.git-filter-repo
          #Docker
          pkgs.docker
          #C++
          pkgs.gcc
          pkgs.gdb
          pkgs.clang-tools
          pkgs.cmake
          #Java
          pkgs.jdk
          #JS/Node
          pkgs.nodejs_24
          pkgs.pnpm
          pkgs.nodePackages.eslint
          pkgs.nodePackages.prettier
          #Python
          (pkgs.python3.withPackages (ps: with ps; [ pip virtualenv ]))
        ];

        shellHook = ''
          LIBRARY_PATH="${pkgs.stdenv.cc.cc}/lib:${pkgs.glibc}/lib:${pkgs.libgcc}/lib:${pkgs.libclang}/lib"
          export NIX_LD_LIBRARY_PATH="$LIBRARY_PATH"
          export NIX_LD="${pkgs.stdenv.cc}/nix-support/dynamic-linker"

          if [ ! -d .venv ]; then
            python -m venv .venv
          fi
          export VIRTUAL_ENV_DISABLE_PROMPT=1
          source .venv/bin/activate
          echo "Dev environment (Java, JS, C/C++, Python) is ready!"
          exec fish
        '';
      };
    };

    # NixOS configuration
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./modules/hardware-configuration.nix
          ./modules/sys.nix
          ./modules/graphics.nix
          ({ config, pkgs, ... }: {
            nix.settings.experimental-features = [ "nix-command" "flakes" ];
            system.stateVersion              = "24.11";
            users.users.nixuris = {
              isNormalUser = true;
              extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" "adbusers" ];
            };
          })
          home-manager.nixosModules.home-manager
          ({ config, pkgs, ... }: {
            home-manager.useGlobalPkgs = true;
            home-manager.users.nixuris = {
              imports = [
                ./modules/home/alacritty.nix
                ./modules/home/cava.nix
                ./modules/home/fastfetch.nix
                ./modules/home/fish.nix
                ./modules/home/hypr.nix
                ./modules/home/nvim.nix
                ./modules/home/ranger.nix
                ./modules/home/rofi.nix
                ./modules/home/swappy.nix
                ./modules/home/swaylock.nix
                ./modules/home/swaync.nix
                ./modules/home/waybar.nix
              ];
              i18n = {
                inputMethod.enable = true;
                inputMethod.type   = "fcitx5";
                inputMethod.fcitx5 = {
                  waylandFrontend = true;
                  addons          = with pkgs; [ fcitx5-unikey ];
                };
              };
              home = {
                username      = "nixuris";
                homeDirectory = "/home/nixuris";
                stateVersion  = "25.05";
                packages      = with pkgs; [
                  dconf vscode firefox telegram-desktop vesktop mpv ani-cli
                  cmus playerctl imv libreoffice-fresh zoom-us obs-studio
                  obs-studio-plugins.wlrobs
                ];
                sessionVariables = {
                  EDITOR         = "nvim";
                  VISUAL         = "nvim";
                  XDG_CONFIG_HOME = "$HOME/.config";
                  NIXOS_OZONE_WL = "1";
                };
              };
              gtk = {
                enable      = true;
                cursorTheme = { package = pkgs.bibata-cursors; name = "Bibata-Modern-Ice"; };
                theme       = { package = pkgs.catppuccin-gtk; name = "catppuccin-frappe-blue-standard"; };
                iconTheme   = { package = pkgs.papirus-icon-theme; name = "Papirus-Dark"; };
              };
            };
          })
        ];
      };
    };
  };
}

