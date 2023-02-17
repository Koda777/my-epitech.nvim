-- Author: Koda
-- Description: This plugin will add a new header to your file
-- Usage: <leader>h
-- License: MIT
-- Version: 1.0
-- Date: 2020-03-02

-- set shortcut
vim.api.nvim_set_keymap("n", "<leader>h", ":lua Header()<CR>", { noremap = true, silent = false })

-- get project name
function GetProjetName()
	vim.api.nvim_command("call inputsave()")
	local project_name = vim.fn.input("Project name: ")
	if project_name == "" then
		print("Project name generated from current directory. If you want to change it, please use <leader>h")
		project_name = vim.fn.split(vim.fn.getcwd(), "/")[#vim.fn.split(vim.fn.getcwd(), "/")]
	end
	return project_name
end

-- get project description
function GetProjetDescription(file_name)
	vim.api.nvim_command("call inputsave()")
	local project_description = vim.fn.input("Project description: ")
	if project_description == "" then
		print("Project description generated from the file name. If you want to change it, please use <leader>h")
	end

	return (project_description == "" and file_name or project_description)
end

local function addHeader()
	-- Get the current buffer handle
	local buf = vim.api.nvim_get_current_buf()
	-- Save the current cursor position
	local cursor = vim.api.nvim_win_get_cursor(0)

	-- Go to the top of the buffer and insert the header
	vim.api.nvim_buf_set_lines(buf, 0, 0, false, { "/////////////// salut" })

	-- Restore the cursor position
	vim.api.nvim_win_set_cursor(0, cursor)
end

-- set header
function Header()
	local file_name = vim.fn.expand("%:t")
	local project_name = GetProjetName()
	local project_description = GetProjetDescription(file_name)
end
