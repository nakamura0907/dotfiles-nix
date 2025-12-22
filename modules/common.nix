{ pkgs, ... }: {
  home.stateVersion = "24.11";
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
    ./programs/git
    ./programs/neovim
    ./programs/starship
    ./programs/zsh
  ];
}
