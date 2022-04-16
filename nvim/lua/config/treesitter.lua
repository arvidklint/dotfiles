local M = {}

M.config = function()
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<Leader>ti",
        node_incremental = "<Leader>tn",
        scope_incremental = "<Leader>ts",
        node_decremental = "<Leader>tm",
      }
    }
  }
end

return M
