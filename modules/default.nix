{ pkgs, ... }:

{
  imports = [
    ./development
    ./direnv
    ./git
	./neovim
    ./packages
    ./starship
    ./xdg
    ./zsh
  ];
}
