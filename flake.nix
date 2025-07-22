{
  description = "Personal flake for FX507ZU4";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    zen-browser,
    astal,
    quickshell,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    # NixOS configuration
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [./syswide/host.nix];
    };
    # Home Manager
    homeConfigurations."nixuris@nixos" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs;};
      modules = [./home/home.nix];
    };

    # Development shell for project
    devShells = {
      x86_64-linux.default = pkgs.mkShell {
        buildInputs = [
          #Nix formatter
          pkgs.alejandra
          #Git
          pkgs.git-filter-repo
          #Docker
          #pkgs.docker
          #C++
          pkgs.gcc
          pkgs.gdb
          pkgs.clang-tools
          pkgs.cmake
          #Java
          #pkgs.jdk
          #JS/Node
          pkgs.nodejs_24
          pkgs.pnpm
          pkgs.nodePackages.eslint
          pkgs.nodePackages.prettier
          #Python
          (pkgs.python3.withPackages (ps: with ps; [pip virtualenv]))
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
  };
}
