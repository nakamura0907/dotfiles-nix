{ pkgs, ... }:

{
  imports = [
    ./direnv
    ./git
    ./packages
    ./starship
    ./xdg
    ./zsh
  ];
}
