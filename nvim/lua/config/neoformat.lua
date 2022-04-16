local M = {}

function M.config()
	local formatOnSave = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

	vim.api.nvim_create_autocmd("BufWritePre", {
		command = ":Neoformat",
		group = formatOnSave,
	})
end

return M
