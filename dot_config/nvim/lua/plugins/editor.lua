return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    opts = function()
      local fzf = require("fzf-lua")
      local actions = fzf.actions

      return {
        files = {
          actions = {
            ["ctrl-o"] = actions.file_vsplit,
          },
        },
      }
    end,
  },
}
