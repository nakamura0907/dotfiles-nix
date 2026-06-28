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
    # autosuggestions.enable = true; # BUGFIX: The option `programs.zsh.autosuggestions' does not exist.
    syntaxHighlighting.enable = true;
  };

  home.file = {
    ".zshrc.manual".source = ./.zshrc;
  };
}
