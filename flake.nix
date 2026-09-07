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

      # `nix fmt` (引数なし) はフォーマッタへ0個の引数を渡すため、
      # 素の nixfmt だと標準入力待ちになり失敗する。
      # 引数がなければ *.nix を自動で探して整形するようにラップする。
      mkFormatter =
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        pkgs.writeShellApplication {
          name = "fmt";
          runtimeInputs = [
            pkgs.nixfmt
            pkgs.findutils
          ];
          text = ''
            if [ "$#" -eq 0 ]; then
              mapfile -d "" -t files < <(find . -path ./.git -prune -o -name '*.nix' -print0)
              if [ "''${#files[@]}" -gt 0 ]; then
                nixfmt "''${files[@]}"
              fi
            else
              nixfmt "$@"
            fi
          '';
        };
    in
    {
      homeConfigurations.macos = mkHome {
        system = macSystem;
        homeDirectory = "/Users/${username}";
        module = ./hosts/macos/home.nix;
      };
      darwinConfigurations.macos = nix-darwin.lib.darwinSystem {
        system = macSystem;
        modules = [ ./hosts/macos/darwin.nix ];
        specialArgs = { inherit username; };
      };

      homeConfigurations.wsl = mkHome {
        system = wslSystem;
        homeDirectory = "/home/${username}";
        module = ./hosts/wsl/home.nix;
      };

      formatter.${macSystem} = mkFormatter macSystem;
      formatter.${wslSystem} = mkFormatter wslSystem;
    };
}
