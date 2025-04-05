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
        aarch64-darwin = "aarch64-darwin";
      };
    in {
      homeConfigurations = {
        "x86_64-linux" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${systems."x86_64-linux"};
          modules = [
            ./hosts/x86_64-linux/default.nix
          ];
        };
        "aarch64-darwin" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${systems."aarch64-darwin"};
          modules = [
            ./hosts/aarch64-darwin/default.nix
          ];
        };
      };

      # FIXME: エラーが出るので修正する
      # devShells = flake-utils.lib.eachDefaultSystem (system: {
      #   default = import ./shells/shell.nix { inherit (nixpkgs.legacyPackages.${system}) pkgs; };
      # });
      # TODO: ループなどを使って定義を改善する
      devShells.${systems."x86_64-linux"}.default = import ./shells/shell.nix { inherit (nixpkgs.legacyPackages.${systems."x86_64-linux"}) pkgs; };
    };
}