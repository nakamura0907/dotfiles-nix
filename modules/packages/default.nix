{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # cat
    bat
    # grep
    ripgrep
    # ls
    eza

    fzf
  ];
}
