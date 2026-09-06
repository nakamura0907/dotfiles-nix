{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;

    # NOTE: https://github.com/NixOS/nixpkgs/issues/507531
    package = pkgs.direnv.overrideAttrs (oldAttrs: {
      doCheck = false;
    });
  };
}
