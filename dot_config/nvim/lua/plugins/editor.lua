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
    keys = {
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (Root Dir)", remap = true },
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
    keys = {
      { "<c-p>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    },
  },
}
