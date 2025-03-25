{ pkgs, ... }:

{
    home.packages = with pkgs; [
        git
    ];

    xdg.configFile = {
        "git/config".source = ./config;
        "git/.commit_template".source = ./.commit_template;
    };
}
