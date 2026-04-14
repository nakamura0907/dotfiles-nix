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
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  imports = [
    ./git
    ./neovim
    ./starship
    ./wezterm
    ./zsh
  ];
}
