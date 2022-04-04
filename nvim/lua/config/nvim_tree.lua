local utils = require('config.utils')

local M = {}

function M.setup()
  require('nvim-tree').setup {
    diagnostics = {
      enable = true,
    },
    view = {
      width = 40,
    },
    update_focused_file = {
      enable = true,
    },
    git = {
      ignore = false
    }
  }

  utils.map('n', '<C-b>', '<cmd>NvimTreeToggle<CR>')
  utils.map('n', '<Leader>bb', '<cmd>NvimTreeToggle<CR>')
  utils.map('n', '<Leader>bl', '<cmd>NvimTreeFindFile<CR>')
  utils.map('n', '<Leader>br', '<cmd>NvimTreeRefresh<CR>')
end

return M
