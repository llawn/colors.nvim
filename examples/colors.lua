return {
	"llawn/colors.nvim",
	config = function()
		require("colors").setup({
			highlighting = {
				enabled = true,
				max_lines = 5000,
				enable_virtual_text = true,
				enable_background_highlights = true,
			},
			keymaps = {
				toggle_highlight = "<leader>ct",
				palette_list = "<leader>cl",
				palette_stats = "<leader>cs",
				hex_colors = "<leader>cc",
				grid_picker = "<leader>cC",
			},
		})
	end,
}
