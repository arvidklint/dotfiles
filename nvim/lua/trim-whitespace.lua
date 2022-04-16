function trim()
	local save = vim.fn.winsaveview()
	local patterns = {
		[[%s/\s\+$//e]],
		-- [[%s/\($\n\s*\)\+\%$//]],
		[[%s/\%^\n\+//]],
		[[%s/\(\n\n\)\n\+/\1/]],
	}

	for _, v in pairs(patterns) do
		vim.api.nvim_exec(string.format("silent! %s", v), false)
	end
	vim.fn.winrestview(save)
end

return function()
	vim.cmd([[au BufWrite * lua trim()]])
end
