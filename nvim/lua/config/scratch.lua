local utils = require('config.utils')

local M = {}

function M.config()
  utils.map('n', '<Leader>q', '<cmd>Scratch<CR>')
end

return M
