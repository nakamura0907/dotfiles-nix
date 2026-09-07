{ pkgs, stateVersion, ... }: {
  home = {
    inherit stateVersion;
  };
  programs.home-manager.enable = true;

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
    just
  ];

  imports = [
    ./claude
    ./direnv
    ./docker
    ./git
    ./neovim
    ./python
    ./starship
    ./wezterm
    ./zsh
  ];
}
