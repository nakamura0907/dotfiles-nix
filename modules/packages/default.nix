{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # cat
    bat
    # ls
    eza

    fzf
  ];
}
