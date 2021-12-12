local M = {}

function M.setup()
  require('neoclip').setup({
    keys = {
      i = {
        paste_behind = '<c-o>'
      }
    }
  })
end

return M
