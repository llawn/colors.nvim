--- Neovim commands for palette generation
local palette_gen = require("colors.palette_generator")
local palette_mgr = require("colors.palette_manager")

local M = {}

--- Generate and display a palette in a floating window
--- @param base_color string Base color name
--- @param method string Generation method
--- @param options table Optional generation parameters
function M.show_palette(base_color, method, options)
	local palette = palette_gen.generate_palette(base_color, method, options)

	if not palette then
		vim.notify("Base color '" .. base_color .. "' not found", vim.log.levels.ERROR)
		return
	end

	local buf = vim.api.nvim_create_buf(false, true)
	local lines = {
		"Generated Palette: " .. method .. " from " .. base_color,
		string.rep("=", 50),
		"",
	}

	for i, color in ipairs(palette) do
		local hex = string.format("#%06X", color)
		table.insert(lines, string.format("%d. %s", i, hex))
	end

	table.insert(lines, "")
	table.insert(lines, "Press 's' to save this palette, 'a' to check accessibility, 'q' to close")

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

	local width = 50
	local height = #lines
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = "minimal",
		border = "rounded",
	}

	vim.api.nvim_open_win(buf, true, opts)

	vim.api.nvim_buf_set_keymap(buf, "n", "q", ":close<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", ":close<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"s",
		':lua require("colors.palette_ui").save_current_palette()<CR>',
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"a",
		':lua require("colors.palette_ui").check_palette_accessibility()<CR>',
		{ noremap = true, silent = true }
	)

	vim.api.nvim_buf_set_var(buf, "palette_data", {
		palette = palette,
		method = method,
		base_color = base_color,
		options = options,
	})
end

--- Save the current palette shown in the floating window
function M.save_current_palette()
	local buf = vim.api.nvim_get_current_buf()
	local ok, data = pcall(vim.api.nvim_buf_get_var, buf, "palette_data")

	if not ok then
		vim.notify("No palette data found", vim.log.levels.ERROR)
		return
	end

	vim.ui.input({ prompt = "Palette name: " }, function(name)
		if not name or name == "" then
			vim.notify("Save cancelled", vim.log.levels.INFO)
			return
		end

		local success, err = palette_mgr.save_palette(data.palette, name, data.method, data.base_color, data.options)

		if success then
			vim.notify("Palette '" .. name .. "' saved successfully", vim.log.levels.INFO)
		else
			vim.notify("Failed to save palette: " .. (err or "unknown error"), vim.log.levels.ERROR)
		end

		vim.cmd("close")
	end)
end

--- List saved palettes
function M.list_palettes()
	local names = palette_mgr.get_saved_palette_names()

	if #names == 0 then
		vim.notify("No saved palettes found", vim.log.levels.INFO)
		return
	end

	local buf = vim.api.nvim_create_buf(false, true)
	local lines = {
		"Saved Palettes",
		string.rep("=", 30),
		"",
	}

	for _, name in ipairs(names) do
		local palette_data = palette_mgr.load_palette(name)
		local method = "unknown"
		local count = 0
		if palette_data and palette_data.metadata then
			method = palette_data.metadata.method or "unknown"
			count = palette_data.metadata.color_count or 0
		end
		table.insert(lines, string.format("%s (%s, %d colors)", name, method, count))
	end

	table.insert(lines, "")
	table.insert(lines, "Press 'l' to load")
	table.insert(lines, "'e' to export")
	table.insert(lines, "'r' to rename")
	table.insert(lines, "'d' to delete")
	table.insert(lines, "'q' to close")

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

	local width = 50
	local height = #lines
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = "minimal",
		border = "rounded",
	}

	vim.api.nvim_open_win(buf, true, opts)

	vim.api.nvim_buf_set_keymap(buf, "n", "q", ":close<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"l",
		':lua require("colors.palette_commands").load_palette_under_cursor()<CR>',
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"d",
		':lua require("colors.palette_commands").delete_palette_under_cursor()<CR>',
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"e",
		':lua require("colors.palette_ui").export_palette_from_list()<CR>',
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"r",
		':lua require("colors.palette_ui").rename_palette_from_list()<CR>',
		{ noremap = true, silent = true }
	)
end

--- Load the palette under the cursor
function M.load_palette_under_cursor()
	local line = vim.api.nvim_get_current_line()
	local name = line:match("^([^%(]+)%s*%(")

	if name then
		name = name:gsub("%s+$", "")
		local palette_data = palette_mgr.load_palette(name)

		if palette_data then
			M.show_loaded_palette(palette_data.colors, name, palette_data.metadata)
		else
			vim.notify("Failed to load palette '" .. name .. "'", vim.log.levels.ERROR)
		end
	end
end

--- Delete the palette under the cursor
function M.delete_palette_under_cursor()
	local line = vim.api.nvim_get_current_line()
	local name = line:match("^([^%(]+)%s*%(")

	if name then
		name = name:gsub("%s+$", "")

		vim.ui.select({ "Yes", "No" }, { prompt = "Delete palette '" .. name .. "'?" }, function(choice)
			if choice == "Yes" then
				local success = palette_mgr.delete_palette(name)
				if success then
					vim.notify("Palette '" .. name .. "' deleted", vim.log.levels.INFO)
					vim.cmd("close")
					M.list_palettes()
				else
					vim.notify("Failed to delete palette", vim.log.levels.ERROR)
				end
			end
		end)
	end
end

--- Show a loaded palette
--- @param palette table Array of color objects
--- @param name string Palette name
--- @param metadata table Palette metadata
function M.show_loaded_palette(palette, name, metadata)
	local buf = vim.api.nvim_create_buf(false, true)
	local method = metadata and metadata.method or "unknown"
	local count = #palette
	local lines = {
		"Palette: " .. name .. " (" .. method .. ", " .. count .. " colors)",
		string.rep("=", 50),
		"",
	}

	for i, color in ipairs(palette) do
		local hex = string.format("#%06X", color)
		table.insert(lines, string.format("%d. %s", i, hex))
	end

	table.insert(lines, "")
	table.insert(lines, "'l' back to the palette list")
	table.insert(lines, "'q' Quit menu")
	table.insert(lines, "'e' Export to lua")
	table.insert(lines, "'d' Delete palette")
	table.insert(lines, "'r' Rename palette")
	table.insert(lines, "'a' Check accessibility")

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

	local width = 50
	local height = #lines
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = "minimal",
		border = "rounded",
	}

	vim.api.nvim_open_win(buf, true, opts)

	vim.api.nvim_buf_set_keymap(buf, "n", "q", ":close<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"l",
		':lua require("colors.palette_ui").back_to_palette_list()<CR>',
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"e",
		':lua require("colors.palette_ui").export_current_palette()<CR>',
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"d",
		':lua require("colors.palette_ui").delete_current_palette()<CR>',
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"r",
		':lua require("colors.palette_ui").rename_current_palette()<CR>',
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"a",
		':lua require("colors.palette_ui").check_palette_accessibility()<CR>',
		{ noremap = true, silent = true }
	)

	vim.api.nvim_buf_set_var(buf, "palette_view_data", {
		palette = palette,
		name = name,
		metadata = metadata,
	})
end

--- Back to the palette list
function M.back_to_palette_list()
	vim.cmd("close")
	M.list_palettes()
end

--- Delete current palette
function M.delete_current_palette()
	local buf = vim.api.nvim_get_current_buf()
	local ok, data = pcall(vim.api.nvim_buf_get_var, buf, "palette_view_data")

	if not ok then
		vim.notify("No palette data found", vim.log.levels.ERROR)
		return
	end

	vim.ui.select({ "Yes", "No" }, { prompt = "Delete palette '" .. data.name .. "'?" }, function(choice)
		if choice == "Yes" then
			local success = palette_mgr.delete_palette(data.name)
			if success then
				vim.notify("Palette '" .. data.name .. "' deleted", vim.log.levels.INFO)
				vim.cmd("close")
				M.list_palettes()
			else
				vim.notify("Failed to delete palette", vim.log.levels.ERROR)
			end
		end
	end)
end

--- Rename current palette
function M.rename_current_palette()
	local buf = vim.api.nvim_get_current_buf()
	local ok, data = pcall(vim.api.nvim_buf_get_var, buf, "palette_view_data")

	if not ok then
		vim.notify("No palette data found", vim.log.levels.ERROR)
		return
	end

	vim.ui.input({ prompt = "New name for palette '" .. data.name .. "': ", default = data.name }, function(new_name)
		if not new_name or new_name == "" or new_name == data.name then
			vim.notify("Rename cancelled", vim.log.levels.INFO)
			return
		end

		local success = palette_mgr.rename_palette(data.name, new_name)
		if success then
			vim.notify("Palette renamed to '" .. new_name .. "'", vim.log.levels.INFO)
			data.name = new_name
			vim.api.nvim_buf_set_var(buf, "palette_view_data", data)
			-- Update the window title
			vim.api.nvim_set_option_value("modifiable", true, { buf = buf })
			local method = data.metadata and data.metadata.method or "unknown"
			local count = #data.palette
			local new_header = "Palette: " .. new_name .. " (" .. method .. ", " .. count .. " colors)"
			vim.api.nvim_buf_set_lines(buf, 0, 1, false, { new_header })
			vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
		else
			vim.notify("Failed to rename palette", vim.log.levels.ERROR)
		end
	end)
end

--- Export palette from the list view
function M.export_palette_from_list()
	local line = vim.api.nvim_get_current_line()
	local name = line:match("^([^%(]+)%s*%(")

	if name then
		name = name:gsub("%s+$", "")
		local palette_data = palette_mgr.load_palette(name)

		if palette_data then
			local lua_code = palette_mgr.export_palette_to_lua(palette_data.colors, name)
			vim.fn.setreg("+", lua_code)
			vim.notify("Palette '" .. name .. "' exported to clipboard", vim.log.levels.INFO)
		else
			vim.notify("Failed to load palette '" .. name .. "'", vim.log.levels.ERROR)
		end
	end
end

--- Rename palette from the list view
function M.rename_palette_from_list()
	local line = vim.api.nvim_get_current_line()
	local name = line:match("^([^%(]+)%s*%(")

	if name then
		name = name:gsub("%s+$", "")

		vim.ui.input({ prompt = "New name for palette '" .. name .. "': ", default = name }, function(new_name)
			if not new_name or new_name == "" or new_name == name then
				vim.notify("Rename cancelled", vim.log.levels.INFO)
				return
			end

			local success = palette_mgr.rename_palette(name, new_name)
			if success then
				vim.notify("Palette renamed to '" .. new_name .. "'", vim.log.levels.INFO)
				vim.cmd("close")
				M.list_palettes()
			else
				vim.notify("Failed to rename palette", vim.log.levels.ERROR)
			end
		end)
	end
end

--- Check palette accessibility
function M.check_palette_accessibility()
	local buf = vim.api.nvim_get_current_buf()
	local ok, data = pcall(vim.api.nvim_buf_get_var, buf, "palette_data")
	
	if not ok then
		-- Try to get data from palette_view_data instead
		local ok2, view_data = pcall(vim.api.nvim_buf_get_var, buf, "palette_view_data")
		if not ok2 then
			vim.notify("No palette data found", vim.log.levels.ERROR)
			return
		end
		data = { palette = view_data.palette }
	end

	local analysis = require("colors.palette_generator").analyze_palette_accessibility(data.palette)
	
	-- Create accessibility report buffer
	local report_buf = vim.api.nvim_create_buf(false, true)
	local lines = {
		"Accessibility Report",
		string.rep("=", 40),
		"",
		"WCAG Compliance Summary:",
		"",
	}
	
	-- Add compliance summary
	local total_pairs = analysis.compliance.aa_normal.total
	if total_pairs > 0 then
		table.insert(lines, string.format("AA Normal: %d/%d pairs (%.1f%%)", 
			analysis.compliance.aa_normal.passed, total_pairs, 
			(analysis.compliance.aa_normal.passed / total_pairs) * 100))
		table.insert(lines, string.format("AA Large: %d/%d pairs (%.1f%%)", 
			analysis.compliance.aa_large.passed, total_pairs,
			(analysis.compliance.aa_large.passed / total_pairs) * 100))
		table.insert(lines, string.format("AAA Normal: %d/%d pairs (%.1f%%)", 
			analysis.compliance.aaa_normal.passed, total_pairs,
			(analysis.compliance.aaa_normal.passed / total_pairs) * 100))
		table.insert(lines, string.format("AAA Large: %d/%d pairs (%.1f%%)", 
			analysis.compliance.aaa_large.passed, total_pairs,
			(analysis.compliance.aaa_large.passed / total_pairs) * 100))
	else
		table.insert(lines, "No color pairs to analyze")
	end
	
	table.insert(lines, "")
	
	-- Add contrast ratios if available
	if next(analysis.contrast_ratios) then
		table.insert(lines, "Contrast Ratios:")
		table.insert(lines, "")
		for pair, ratio in pairs(analysis.contrast_ratios) do
			local status = ""
			if ratio >= 7.0 then
				status = " (AAA)"
			elseif ratio >= 4.5 then
				status = " (AA)"
			elseif ratio >= 3.0 then
				status = " (AA Large)"
			else
				status = " (FAIL)"
			end
			table.insert(lines, string.format("%s: %.2f:1%s", pair, ratio, status))
		end
		table.insert(lines, "")
	end
	
	-- Add recommendations
	if #analysis.recommendations > 0 then
		table.insert(lines, "Recommendations:")
		table.insert(lines, "")
		for _, rec in ipairs(analysis.recommendations) do
			table.insert(lines, "• " .. rec)
		end
		table.insert(lines, "")
	end
	
	table.insert(lines, "Press 'q' to close")
	
	vim.api.nvim_buf_set_lines(report_buf, 0, -1, false, lines)
	vim.api.nvim_set_option_value("modifiable", false, { buf = report_buf })
	
	local width = 60
	local height = #lines
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = "minimal",
		border = "rounded",
	}
	
	vim.api.nvim_open_win(report_buf, true, opts)
	vim.api.nvim_buf_set_keymap(report_buf, "n", "q", ":close<CR>", { noremap = true, silent = true })
end

--- Export the current palette to Lua code
function M.export_current_palette()
	local buf = vim.api.nvim_get_current_buf()
	local ok, data = pcall(vim.api.nvim_buf_get_var, buf, "export_data")

	if not ok then
		-- Try to get data from palette_view_data instead
		local ok2, view_data = pcall(vim.api.nvim_buf_get_var, buf, "palette_view_data")
		if not ok2 then
			vim.notify("No export data found", vim.log.levels.ERROR)
			return
		end
		data = { palette = view_data.palette, name = view_data.name }
	end

	local lua_code = palette_mgr.export_palette_to_lua(data.palette, data.name)

	-- Copy to clipboard using vim's clipboard register
	vim.fn.setreg("+", lua_code)
	vim.notify("Palette exported to clipboard", vim.log.levels.INFO)
end

return M
