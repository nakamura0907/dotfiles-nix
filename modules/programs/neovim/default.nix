{ pkgs, ...} :

{
	programs.neovim = {
		enable = true;
		plugins = with pkgs; [
			vimPlugins.nvim-tree-lua
		];
	};

	xdg.configFile."nvim" = {
		source = ./config;
		recursive = true;
	};
}
