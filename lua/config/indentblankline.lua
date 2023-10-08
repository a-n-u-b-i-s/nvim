return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		main = "ibl",
		opts = {
			debounce = 100,
			indent = { char = "▏" },
			whitespace = { highlight = { "Whitespace", "NonText" } },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
				},
			},
		},
	},
}
