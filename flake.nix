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
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    zen-browser,
    niri,
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
    # Dev Shell
    devShells.${system} = {
      cpp = import ./devshells/cpp.nix {inherit pkgs;};
      js = import ./devshells/js.nix {inherit pkgs;};
      python = import ./devshells/python.nix {inherit pkgs;};
      all = import ./devshells/all.nix {inherit pkgs;};
    };
  };
}
