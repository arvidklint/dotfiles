local M = {}

function M.config()
	require("nvim-gps").setup({
		separator = " » ",
	})
end

return M
