local map = require("config.utils").map

local M = {}

function M.config()
	require("neogit").setup({
		integrations = {
			diffview = true,
		},
	})

	map("n", "<Leader>gg", ":lua require('neogit').open({ kind = 'vsplit' })<CR>")
end

return M
