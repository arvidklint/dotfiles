local gps = require("nvim-gps")

local M = {}

function M.config()
	local lualine = require("lualine")

	lualine.setup({
		options = {
			theme = "catppuccin",
			component_separators = { left = "»", right = "«" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_c = {
				{
					"filename",
					file_status = true,
					path = 0,
					shorting_target = 40,
				},
				{
					gps.get_location,
					cond = gps.is_available,
				},
			},
		},
	})
end

return M
