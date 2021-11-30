local M = {}

function M.config()
  local utils = require('config.utils')
  utils.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  utils.map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  utils.map('n', 'F', '<cmd>lua vim.lsp.buf.formatting()<CR>')

  local lsp_installer = require('nvim-lsp-installer')

  lsp_installer.on_server_ready(function(server)
    require('lsp_signature').on_attach()

    local cmp_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local opts = {
      capabilities = cmp_capabilities,
      flags = {
        debounce_text_changes = 150,
      }
    }

    if server.name == 'sumneko_lua' then
      opts.settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = {
              'vim'
            }
          }
        }
      }
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end)
end

return M
