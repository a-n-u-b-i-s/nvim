return {
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
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
}
