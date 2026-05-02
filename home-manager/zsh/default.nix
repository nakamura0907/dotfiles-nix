{ pkgs, ...}:

{
  programs.zsh = {
    enable = true;

    initContent = ''
      source ~/.zshrc.manual
    '';

    oh-my-zsh = {
      enable = true;
    };
  };

  home.file = {
    ".zshrc.manual".source = ./.zshrc;
  };
}
