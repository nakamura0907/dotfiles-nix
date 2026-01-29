{ pkgs, ... }: {
  imports = [ ../../modules/common.nix ];

  home.username = "nakamura0907";
  home.homeDirectory = "/home/nakamura0907";
}
