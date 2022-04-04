local M = {}

function M.setup()
  require('neoclip').setup({
    keys = {
      telescope = {
        i = {
          paste_behind = '<c-o>'
        }
      }
    }
  })
end

return M
