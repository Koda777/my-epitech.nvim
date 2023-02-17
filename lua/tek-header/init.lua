-- Author: Koda
-- Description: This plugin will add a new header to your file
-- Usage: <leader>h
-- License: MIT
-- Version: 1.0
-- Date: 2020-03-02

-- set shortcut
vim.api.nvim_set_keymap("n", "<leader>h", ":lua Header()<CR>", { noremap = true, silent = false })

local file_name = vim.fn.expand("%:t")

-- get project name
local project_name = function()
	vim.api.nvim_command("call inputsave()")
	local name = vim.fn.input("Project name: ")
	if name == "" then
		-- print("Project name generated from current directory. If you want to change it, please use <leader>h")
		name = vim.fn.split(vim.fn.getcwd(), "/")[#vim.fn.split(vim.fn.getcwd(), "/")]
	end
	return name
end

-- get project description
local project_description = function()
	vim.api.nvim_command("call inputsave()")
	local description = vim.fn.input("Project description: ")

	return (description == "" and file_name or description)
end

-- generate header
local header = function()
	local header = string.format(
		"/*\n** EPITECH PROJECT, %d\n** %s\n** File description:\n** %s\n*/",
		os.date("%Y"),
		project_name(),
		project_description()
	)
	return header
end

local header_line = function()
	local header_lines = {}
	for line in string.gmatch(header(), "[^\n]+") do
		table.insert(header_lines, line)
	end
	return header_lines
end

-- set header style
local HeaderStyle = function(index, line)
	local buf = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	vim.api.nvim_buf_set_lines(buf, index, index, false, { line })
	vim.api.nvim_win_set_cursor(0, cursor)
end

-- set header
function Header()
	local header_lines = header_line()
	for i, line in ipairs(header_lines) do
		HeaderStyle(i - 1, line)
	end
end
