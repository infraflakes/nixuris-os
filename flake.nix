{
  description = "configuration.nix + home.nix in one flake";
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
  in {
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
              #Tablet
              #hardware.opentabletdriver.enable = true;
          })

          # Home Manager
          home-manager.nixosModules.home-manager
          ({ config, pkgs, ... }: {
            home-manager = {
              useGlobalPkgs    = true;
              users.nixuris = {
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

                i18n.inputMethod = {
                  enable = true;
                  type   = "fcitx5";
                  fcitx5 = {
                    waylandFrontend = true;
                    addons          = with pkgs; [ fcitx5-unikey ];
                  };
                };

                home = {
                  username       = "nixuris";
                  homeDirectory  = "/home/nixuris";
                  stateVersion   = "25.05";
                  packages       = with pkgs; [ 
                    dconf
                    vscode #code-cursor 
                    #obsidian
    
                    # Media
                    firefox telegram-desktop vesktop
                    mpv ani-cli
                    cmus playerctl #youtube-music ffmpeg yt-dlp 
                    imv
                    libreoffice-fresh
    
                    #Others  
                    zoom-us
                    obs-studio obs-studio-plugins.wlrobs #obs wayland
                    #cbonsai cmatrix pipes tty-clock #cli aesthetics
                  ];
                  sessionVariables = {
                    EDITOR          = "nvim";
                    VISUAL          = "nvim";
                    XDG_CONFIG_HOME = "$HOME/.config";
                    NIXOS_OZONE_WL  = "1";
                  };
                };

                gtk = {
                  enable      = true;
                  cursorTheme = {
                    package = pkgs.bibata-cursors;
                    name    = "Bibata-Modern-Ice";
                  };
                  theme = {
                    package = pkgs.catppuccin-gtk;
                    name    = "catppuccin-frappe-blue-standard";
                  };
                  iconTheme = {
                    package = pkgs.papirus-icon-theme;
                    name    = "Papirus-Dark";
                  };
                };
              };
            };
          })

        ];
      };
    };
  };
}

