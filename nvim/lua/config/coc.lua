local map = require('config.utils').map

local M = {}

function M.config()
	-- use <tab> for trigger completion and navigate to the next complete item
	-- vim.cmd [[
    -- function! s:check_back_space() abort
      -- let col = col('.') - 1
      -- return !col || getline('.')[col - 1]  =~ '\s'
    -- endfunction

    -- inoremap <silent><expr> <Tab>
      -- \ <SID>check_back_space() ? "\<Tab>" :
      -- \ pumvisible() ? "\<C-n>" :
      -- \ coc#refresh()
    -- ]]
  -- map('i', '<Tab>', 'coc#refresh()', { expr = true, silent = true })
  -- map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { silent = true, expr = true })

  vim.cmd [[inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]]

end

return M
