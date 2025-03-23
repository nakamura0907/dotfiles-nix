{
  description = "Home Manager configuration of nakamura0907";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, home-manager, flake-utils, ... }:
    let
      systems = {
        x86_64-linux = "x86_64-linux";
      };
    in {
      homeConfigurations = {
        "x86_64-linux" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${systems."x86_64-linux"};
          modules = [
            ./hosts/x86_64-linux/default.nix
          ];
        };
      };

      devShells = flake-utils.lib.eachDefaultSystem (system: {
        default = import ./shells/shell.nix { inherit (nixpkgs.legacyPackages.${system}) pkgs; };
      });
    };
}
