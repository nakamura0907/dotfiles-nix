{ pkgs, ... }:

{
  imports = [
    ./direnv
    ./git
    ./starship
  ];
}
