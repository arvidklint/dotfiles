local M = {}

function M.config()
  local lspconfig = require('lspconfig')
  local lspinstall = require('lspinstall')

  lspinstall.setup()

  local on_attach = function(client, bufnr)
    local utils = require('config.utils')

    utils.bmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    utils.bmap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    utils.bmap(bufnr, 'n', 'F', '<cmd>lua vim.lsp.buf.formatting()<CR>')

    require('lsp_signature').on_attach()
  end

  local servers = lspinstall.installed_servers()

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
end

return M
