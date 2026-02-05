local M = {}

local highlighter = require("colors.colors_highlighter")
local palette_manager = require("colors.palette_manager")
local picker = require("colors.telescope_color_picker")

-- --- Highlighting API ---
M.toggle_highlight = function()
	highlighter.toggle()
end
M.refresh_highlight = function(bufnr)
	highlighter.highlight_colors(bufnr)
end

-- --- Palette API ---
M.list_saved_palettes = function()
	palette_manager.list_palettes()
end

-- --- Picker API ---
M.open_picker = function()
	picker.open()
end

return M
