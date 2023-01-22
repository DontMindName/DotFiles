local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- COLORSCHEME --
	{"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme tokyonight-night]])
	end},

	-- SYNTAX HIGHLIGHTING --
	{"nvim-treesitter/nvim-treesitter",
	build = ':TSUpdate',
	config = function()
		require("plugins.configs.treesitter")
	end},
	
	-- DASHBOARD --
	{'goolord/alpha-nvim',
	requires = { 'nvim-tree/nvim-web-devicons' },
	config = function ()
		require('plugins.configs.alpha')
	end},

	-- FUZZY FINDER --
	{'nvim-telescope/telescope.nvim',
	tag = '0.1.1',
	lazy = true,
	cmd = "Telescope",
	dependencies ={'nvim-lua/plenary.nvim'}},

	-- STATUSLINE --
	{'nvim-lualine/lualine.nvim',
	event = "VeryLazy",
	config = function()
		require("plugins.configs.lualine")
	end,
	dependencies = {'nvim-tree/nvim-web-devicons',
	config = function()
		require'nvim-web-devicons'.setup{
			color_icons = true;
			default = true}
	end}},

	-- FILE BROWSER --
	{"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	lazy = true,
	cmd = "Neotree",
	dependencies = {"MunifTanjim/nui.nvim"}}
})
