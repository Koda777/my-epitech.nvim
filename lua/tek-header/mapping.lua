-- Author: Koda
-- Description: This plugin will add a new header to your file
-- Usage: <leader>h
-- License: MIT
-- Version: 1.0
-- Date: 2020-03-02
vim.api.nvim_set_keymap("n", "<leader>h", ":lua Header()<CR>", { noremap = true, silent = false })
