-- Author: Koda
-- Description: This plugin will add a new header to your file
-- Usage: <leader>h
-- License: MIT
-- Version: 1.0
-- Date: 2020-03-02

-- set header
function Header()
	if not IsValid() then
		print("Warning: This file is not a C++ file")
		return
	end
	if CheckHeader() then
		print("Warning: Header Epitech already set")
		return
	end
	local header_lines = HeaderLine()
	for i, line in ipairs(header_lines) do
		HeaderStyle(i - 1, line)
	end
end
