local M = {}

function M.config()
	local lualine = require("lualine")

	lualine.setup({
		options = {
			component_separators = { left = "»", right = "«" },
		},
		sections = {
			lualine_c = {
				{
					"filename",
					file_status = true,
					path = 1,
					shorting_target = 40,
				},
			},
		},
	})
end

return M
