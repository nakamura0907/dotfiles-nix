{
  description = "nakamura0907 dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    # Intentionally tracks latest default branch for up-to-date usage stats
    ccusage.url = "github:ccusage/ccusage";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      treefmt-nix,
      ccusage,
      ...
    }@inputs:
    let
      macSystem = "aarch64-darwin";
      wslSystem = "x86_64-linux";

      stateVersion = "24.11"; # NOTE: https://github.com/nix-community/home-manager/issues/8067
      commonArgs = { inherit inputs stateVersion; };

      allSystems = [
        macSystem
        wslSystem
      ];
      forAllSystems = nixpkgs.lib.genAttrs allSystems;

      treefmtFor =
        system:
        treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} {
          projectRootFile = "flake.nix";
          programs.alejandra.enable = true;
        };
    in
    {
      homeConfigurations.macos = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${macSystem};
        modules = [ ./hosts/macos/default.nix ];
        extraSpecialArgs = commonArgs;
      };
      darwinConfigurations.macos = nix-darwin.lib.darwinSystem {
        system = macSystem;
        modules = [ ./darwin/default.nix ];
      };

      homeConfigurations.wsl = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${wslSystem};
        modules = [ ./hosts/wsl/default.nix ];
        extraSpecialArgs = commonArgs;
      };

      formatter = forAllSystems (system: (treefmtFor system).config.build.wrapper);

      checks = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          formatting = (treefmtFor system).config.build.check;

          statix = pkgs.runCommand "statix" { nativeBuildInputs = [ pkgs.statix ]; } ''
            statix check ${self}
            touch $out
          '';

          deadnix = pkgs.runCommand "deadnix" { nativeBuildInputs = [ pkgs.deadnix ]; } ''
            deadnix --fail ${self}
            touch $out
          '';
        }
      );
    };
}
