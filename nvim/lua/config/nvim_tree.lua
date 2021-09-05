local utils = require('config.utils')

local M = {}

function M.setup()
  vim.g.nvim_tree_width = 40
  vim.g.nvim_tree_ignore = {'.git'}
  vim.g.nvim_tree_auto_close = 1
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_indent_markes = 1
  vim.g.nvim_tree_lsp_diagnostics = 1

  utils.map('n', '<Leader>bb', '<cmd>NvimTreeToggle<CR>')
  utils.map('n', '<Leader>bl', '<cmd>NvimTreeFindFile<CR>')
  utils.map('n', '<Leader>br', '<cmd>NvimTreeRefresh<CR>')
end

return M
