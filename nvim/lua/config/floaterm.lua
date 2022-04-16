local utils = require("config.utils")

local M = {}

function M.config()
	utils.map("n", "<Leader>tt", "<cmd>FloatermToggle<cr>")
	utils.map("t", "<Leader>tt", "<cmd>FloatermToggle<cr>")
	vim.g.floaterm_autoclose = 1
end

return M
