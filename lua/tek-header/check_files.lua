-- Author: Koda
-- Description: This plugin will add a new header to your file
-- Usage: <leader>h
-- License: MIT
-- Version: 1.0
-- Date: 2020-03-02

-- check if header is already set
function CheckHeader()
	local buf = vim.api.nvim_get_current_buf()
	local first_line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
	if string.match(first_line, "^/%*") then
		return true
	end
	return false
end

-- check extension
function IsValid()
	local extension = vim.fn.expand("%:e")

	if extension == "cpp" or extension == "hpp" then
		return true
	end
	return false
end
