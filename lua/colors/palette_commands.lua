local palette_ui = require("colors.palette_ui")

local M = {}

function M.load_palette_under_cursor()
	palette_ui.load_palette_under_cursor()
end

function M.delete_palette_under_cursor()
	palette_ui.delete_palette_under_cursor()
end

function M.export_current_palette()
	palette_ui.export_current_palette()
end

return M
