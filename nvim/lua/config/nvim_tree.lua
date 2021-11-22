local utils = require('config.utils')

local M = {}

function M.setup()
  vim.g.nvim_tree_ignore = {'.git'}
  -- vim.g.nvim_tree_indent_markes = 1

  require('nvim-tree').setup {
    auto_close = true,
    diagnostics = {
      enable = true,
    },
    view = {
      width = 40,
    },
    update_focused_file = {
      enable = true,
    }
  }

  utils.map('n', '<C-b>', '<cmd>NvimTreeToggle<CR>')
  utils.map('n', '<Leader>bb', '<cmd>NvimTreeToggle<CR>')
  utils.map('n', '<Leader>bl', '<cmd>NvimTreeFindFile<CR>')
  utils.map('n', '<Leader>br', '<cmd>NvimTreeRefresh<CR>')
end

return M
