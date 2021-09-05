local M = {}

function M.config()
  local cmp = require('cmp')
  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-j>'] = cmp.mapping.select_prev_item(),
      ['<C-k>'] = cmp.mapping.select_next_item(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vim_vsnip' },
      { name = 'buffer' }
    }
  }
end

return M
