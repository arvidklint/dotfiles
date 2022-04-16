local M = {}

function M.config()
	local utils = require("config.utils")
	utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	utils.map("n", "F", "<cmd>lua vim.lsp.buf.formatting()<CR>")

	local lsp_installer = require("nvim-lsp-installer")

	local saga = require("lspsaga")
	saga.init_lsp_saga()
	utils.map("n", "<Leader>ca", "<cmd>Lspsaga code_action<cr>")
	utils.map("n", "K", "<cmd>Lspsaga hover_doc<cr>")
	utils.map("n", "<Leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>")
	utils.map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")
	utils.map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")

	lsp_installer.on_server_ready(function(server)
		require("lsp_signature").on_attach()

		local cmp_capabilities = require("cmp_nvim_lsp").update_capabilities(
			vim.lsp.protocol.make_client_capabilities()
		)

		local opts = {
			capabilities = cmp_capabilities,
			flags = {
				debounce_text_changes = 150,
			},
		}

		if server.name == "sumneko_lua" then
			opts.settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = {
							"vim",
						},
					},
				},
			}
		end

		-- This setup() function is exactly the same as lspconfig's setup function.
		-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		server:setup(opts)
	end)
end

return M
