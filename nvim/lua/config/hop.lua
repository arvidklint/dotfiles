local utils = require('config.utils')

local M = {}

function M.config()
  require('hop').setup {}  

  utils.map('n', '<Leader>w', "<cmd>lua require('hop').hint_words()<CR>")
end

return M
