{ username, homeDirectory, ... }: {
  imports = [ ../../home-manager ];

  home.username = username;
  home.homeDirectory = homeDirectory;
}
