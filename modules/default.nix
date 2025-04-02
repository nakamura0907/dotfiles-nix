{ pkgs, ... }:

{
  imports = [
    ./direnv
    ./git
    ./starship
    ./xdg
    ./zsh
  ];
}
