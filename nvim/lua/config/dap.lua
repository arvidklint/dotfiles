local utils = require('config.utils')

local M = {}

function M.config()
  local dap = require('dap')

  dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/debug/vscode-php-debug/out/phpDebug.js' }
  }

  dap.configurations.php = {
    {
      type = 'php',
      request = 'launch',
      name = 'Listen for Xdebug',
      port = 9000,
      remotePath = '/var/www',
      cwd = vim.fn.getcwd(),
			hostname = 'localhost'
    }
  }
			-- pathMappings = {
        -- {
          -- localRoot = vim.fn.getcwd(),
          -- remoteRoot = '/var/www'
        -- }
      -- },

  -- utils.map('n', '<Leader>dc', "<cmd>lua require('dap').continue()<cr>")
  -- utils.map('n', '<Leader>db', "<cmd>lua require('dap').toggle_breakpoint()<cr>")
  -- utils.map('n', '<Leader>dn', "<cmd>lua require('dap').step_over()<cr>")
  -- utils.map('n', '<Leader>du', "<cmd>lua require('dap').step_out()<cr>")
  -- utils.map('n', '<Leader>di', "<cmd>lua require('dap').step_into()<cr>")

  dap.set_log_level('TRACE')
end

return M
