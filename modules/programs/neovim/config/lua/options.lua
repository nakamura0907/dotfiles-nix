-- Options
local options = {
	-- Indention
	autoindent = true,
	expandtab = true,
	shiftround = true,
	shiftwidth = 4,
	smarttab = true,
	tabstop = 4,
	-- Search
	hlsearch = true,
	ignorecase = true,
	incsearch = true,
	smartcase = true,
	-- Text Rendering
	encoding = "utf-8",
	linebreak = true,
	scrolloff = 3,
	wrap = true,
	-- User Interface
	number = true,
	title = true,
	background = "dark"
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.clipboard:append{'unnamedplus'}
