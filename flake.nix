{
  description = "nakamura0907 dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      macSystem = "aarch64-darwin";
      wslSystem = "x86_64-linux";
    in {
      homeConfigurations.macos = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${macSystem};
        modules = [ ./hosts/macos/default.nix ];
      };

      homeConfigurations.wsl = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${wslSystem};
        modules = [ ./hosts/wsl/default.nix ];
      };
    };
}
