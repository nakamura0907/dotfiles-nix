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

    dnsutils
    fzf
    go-task
  ];
}
