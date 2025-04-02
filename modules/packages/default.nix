{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # cat
    bat
    # find
    fd
    # grep
    ripgrep
    # ls
    eza

    fzf
  ];
}
