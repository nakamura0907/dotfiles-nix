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
    go-task
  ];

  imports = [
    ./claude
    ./direnv
    ./git
    ./neovim
    ./starship
    ./wezterm
    ./zsh
  ];
}
