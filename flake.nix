{
  description = "nakamura0907 dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    ccusage.url = "github:ccusage/ccusage";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      ccusage,
      ...
    }@inputs:
    let
      username = "nakamura0907";
      macSystem = "aarch64-darwin";
      wslSystem = "x86_64-linux";

      stateVersion = "24.11"; # NOTE: https://github.com/nix-community/home-manager/issues/8067

      mkHome =
        {
          system,
          homeDirectory,
          module,
        }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ module ];
          extraSpecialArgs = {
            inherit
              inputs
              stateVersion
              username
              homeDirectory
              ;
          };
        };
    in
    {
      homeConfigurations.macos = mkHome {
        system = macSystem;
        homeDirectory = "/Users/${username}";
        module = ./hosts/macos/default.nix;
      };
      darwinConfigurations.macos = nix-darwin.lib.darwinSystem {
        system = macSystem;
        modules = [ ./darwin/default.nix ];
        specialArgs = { inherit username; };
      };

      homeConfigurations.wsl = mkHome {
        system = wslSystem;
        homeDirectory = "/home/${username}";
        module = ./hosts/wsl/default.nix;
      };

      formatter.${macSystem} = nixpkgs.legacyPackages.${macSystem}.nixfmt;
      formatter.${wslSystem} = nixpkgs.legacyPackages.${wslSystem}.nixfmt;
    };
}
