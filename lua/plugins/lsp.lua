return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua servers
        "stylua",
        "shfmt",
        "lua-language-server",

        -- web development servers
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettierd",
        "eslint-lsp",
        "json-lsp",
        "tailwindcss-language-server",
        "unocss-language-server",

        -- shell servers
        "shfmt",
        "shellcheck",
        "bash-language-server",

        "clangd",
        "clang-format",

        -- rust server
        "rust-analyzer",
      },
    },
  },
  {
    "llllvvuu/nvim-js-actions",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        callback = function()
          vim.keymap.set(
            "n",
            "<leader>cC",
            "<cmd>lua require('nvim-js-actions').js_arrow_fn.toggle()<cr>",
            { noremap = true, desc = "Toggle Arrow Function" }
          )
        end,
      })
    end,
  },
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },
}
