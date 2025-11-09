{
  description = "Personal flake for FX507ZU4";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    serein-cli = {
      url = "github:infraflakes/serein-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    serein-cli,
    zen-browser,
    niri,
    mangowc,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    # NixOS configuration
    nixosConfigurations.serein = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [./syswide/host.nix];
    };
    # Home Manager
    homeConfigurations."infraflakes@serein" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs;};
      modules = [
        ./home/home.nix
        mangowc.hmModules.mango
      ];
    };
    # Dev Shell
    devShells.${system} = {
      rs = import ./devshells/rs.nix {inherit pkgs;};
      go = import ./devshells/go.nix {inherit pkgs;};
      js = import ./devshells/js.nix {inherit pkgs;};
      py = import ./devshells/py.nix {inherit pkgs;};
      c = import ./devshells/c.nix {inherit pkgs;};
    };
  };
}
