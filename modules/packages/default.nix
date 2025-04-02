{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # ls
    eza
  ];
}
