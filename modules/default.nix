{ pkgs, ... }:

{
 programs.direnv = {
  enable = true;
  nix-direnv.enable = true;
  enableZshIntegration = true;
 };

 programs.git = {
    enable = true;
    userName = "nakamura0907";
    userEmail = "53244048+nakamura0907@users.noreply.github.com";
  };
}
