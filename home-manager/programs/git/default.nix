{ pkgs, ... }:

{
    home.packages = with pkgs; [
        git
    ];

    programs.gh = {
        enable = true;
    };

    xdg.configFile = {
        "git/config".source = ./config;
        "git/.commit_template".source = ./.commit_template;
    };
}
