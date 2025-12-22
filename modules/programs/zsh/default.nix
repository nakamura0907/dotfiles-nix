{ pkgs, ...}:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
    };
  };

  home.file = {
    ".zshrc".source = ./.zshrc;
  };
}
