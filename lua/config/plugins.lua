local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local plugins = {
	{ "folke/lazy.nvim", version = "*" },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
				},
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
				bold = false,
				italic = {
					strings = false,
					comments = false,
					operators = false,
					folds = false,
				},
			})
		end,
	},
	{
		"savq/melange-nvim",
		config = function()
			vim.g.melange_enable_font_variants = false
			vim.cmd("colorscheme gruvbox")
		end,
	},
}

table.insert(plugins, { import = "config.treesitter" })
table.insert(plugins, { import = "config.copilot" })
table.insert(plugins, { import = "config.telescope" })
table.insert(plugins, { import = "config.worktrees" })
table.insert(plugins, { import = "config.oil" })
table.insert(plugins, { import = "config.vim-visual-multi" })
table.insert(plugins, { import = "config.mini-bufremove" })
table.insert(plugins, { import = "config.completions" })
table.insert(plugins, { import = "config.mini-comment" })
table.insert(plugins, { import = "config.mini-pairs" })
table.insert(plugins, { import = "config.mini-surround" })
table.insert(plugins, { import = "config.mini-ai" })
table.insert(plugins, { import = "config.lsp" })
table.insert(plugins, { import = "config.gitsigns" })
table.insert(plugins, { import = "config.whichkey" })
table.insert(plugins, { import = "config.navic" })
table.insert(plugins, { import = "config.lualine" })
table.insert(plugins, { import = "config.bufferline" })
table.insert(plugins, { import = "config.indentblankline" })
table.insert(plugins, { import = "config.trouble" })
table.insert(plugins, { import = "config.mini-operators" })
table.insert(plugins, { import = "config.ui" })
-- table.insert(plugins, { import = "config.hardtime" })
table.insert(plugins, { import = "config.git" })
table.insert(plugins, { import = "config.org-mode" })

require("lazy").setup(plugins)
