{ config, username, ... }:
{
  nix.enable = false;
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  system = {
    primaryUser = username;

    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
      };
      dock = {
        orientation = "bottom";
        autohide = true;
        show-recents = false;
      };
      finder = {
        AppleShowAllExtensions = true;
      };
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    brews = [
      "mole"
    ];
    casks = [
      "wezterm"
    ];
  };
}
