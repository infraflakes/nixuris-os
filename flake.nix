{
  description = "Unified Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      # This is the line that nixos-rebuild uses
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          #./nixos/hardware-configuration.nix
          ./nixos/sys/basic.nix
          ./nixos/sys/nvidia.nix
          ./nixos/user/user.nix
          ./nixos/user/apps.nix
          ./nixos/user/env/hyprland.nix
          ({ config, pkgs, ... }: {
            nix.settings.experimental-features = [ "nix-command" "flakes" ];
            system.stateVersion = "24.11";
          })
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixuris = import ./nixos/user/home.nix;
          }
        ];
      };

      # Optional: keep per-system outputs for other things (like `packages`, etc.)
      # Needed if you wanna use `nix build .#somePackage` and friends
      # But not necessary just for nixos-rebuild
      # Keep it if you're planning to scale
      # Use this if you ever want to expose derivations:
      # flake-utils.lib.eachDefaultSystem (system: {
      #   packages.default = pkgs.hello;
      # })
    };
}
