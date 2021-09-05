local utils = require('config.utils')

local M = {}

function M.config()
  utils.map('n', '<Leader>xx', '<cmd>TroubleToggle<cr>')
end

return M
