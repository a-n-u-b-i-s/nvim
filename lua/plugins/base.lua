-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
  { import = "lazyvim.plugins.extras.coding.copilot" },
  {
    "ThePrimeagen/git-worktree.nvim",
    lazy = false,
    config = function()
      require("git-worktree").setup({})
      require("telescope").load_extension("git_worktree")
    end,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
}
