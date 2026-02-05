if vim.g.loaded_colors_plugin then
	return
end
vim.g.loaded_colors_plugin = 1

local api = require("colors.api")

-- Highlighting Toggle
vim.api.nvim_create_user_command("ColorToggle", function()
	api.toggle_highlight()
end, { desc = "Toggle hex color highlighting" })

-- Palette Generation
local cmp_colors = require("colors.cmp_colors")
vim.api.nvim_create_user_command("PaletteGenerate", function(opts)
	local args = cmp_colors.parse_args(opts.args)
	local base_color = args[1] or "red"
	local method = args[2] or "monochromatic"
	local options = { count = tonumber(args[3]) or 5 }
	require("colors.palette_ui").show_palette(base_color, method, options)
end, {
	nargs = "*",
	desc = "Generate and display a color palette",
	complete = cmp_colors.palette_generate_complete,
})

-- Auto-trigger completion for PaletteGenerate command
vim.api.nvim_create_augroup("PaletteGenerateComplete", { clear = true })
vim.api.nvim_create_autocmd("CmdlineChanged", {
	group = "PaletteGenerateComplete",
	callback = function()
		local cmdline = vim.fn.getcmdline()
		if cmdline:match("^:PaletteGenerate%s*$") or cmdline:match("^:PaletteGenerate%s+[^%s]+$") then
			vim.feedkeys(vim.api.nvim_replace_termcodes("<C-X><C-O>", true, false, true), "n", true)
		end
	end,
})

-- Palette Management
vim.api.nvim_create_user_command("PaletteList", function()
	require("colors.palette_ui").list_palettes()
end, { desc = "List saved palettes" })

vim.api.nvim_create_user_command("PaletteStats", function()
	local stats = require("colors.palette_manager").get_palette_stats()
	vim.notify(
		string.format(
			"Palettes: %d, Colors: %d, Avg size: %.1f",
			stats.total_palettes,
			stats.total_colors,
			stats.average_palette_size
		),
		vim.log.levels.INFO
	)
end, { desc = "Show palette statistics" })

-- Telescope Picker
vim.api.nvim_create_user_command("HexColors", function()
	require("colors.telescope_color_picker").pick_colors_dynamic()
end, {})

-- Grid Color Picker
vim.api.nvim_create_user_command("ColorPick2D", function()
	require("colors.grid_color_picker").pick_color()
end, { desc = "Open 2D color picker grid" })
