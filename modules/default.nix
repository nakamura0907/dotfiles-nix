{ pkgs, ... }:

{
  imports = [
    ./development
    ./direnv
    ./git
    ./packages
    ./starship
    ./xdg
    ./zsh
  ];
}
