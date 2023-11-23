return {
  {
    "echasnovski/mini.indentscope",
    enabled = false,
  },

  {
    "folke/noice.nvim",
    enabled = false,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup()
    end,
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diffview" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
      { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "Open file history" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        section_separators = "",
        component_separators = "",
      },
    },
  },
  { import = "lazyvim.plugins.extras.editor.navic" },
  {
    "folke/zen-mode.nvim",
    cmd = "Zen",
    keys = {
      { "<leader>z", "<cmd>Zen<cr>", desc = "Toggle zen mode" },
    },
  },
}
