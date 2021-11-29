local M = {}

function M.config()
  local lspconfig = require('lspconfig')
  local lsp_installer = require('nvim-lsp-installer')

  lsp_installer.on_server_ready(function(server)
    local utils = require('config.utils')

    utils.bmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    utils.bmap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    utils.bmap(bufnr, 'n', 'F', '<cmd>lua vim.lsp.buf.formatting()<CR>')

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    require('lsp_signature').on_attach()

    local cmp_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local opts = {
      capabilities = cmp_capabilities,
      flags = {
        debounce_text_changes = 150,
      }
    }
    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end)
end

return M
