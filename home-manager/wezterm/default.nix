{ pkgs, ... }: {
    # NOTE: macOSでGUIアプリをインストールするとSpotlightで検索できないため、インストールしない
    home.packages = if pkgs.stdenv.isDarwin then [] else [ pkgs.wezterm ];

    home.file = {
        ".wezterm.lua".source = ./.wezterm.lua;
    };
}
