return {
{
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')

      -- Define signs for breakpoints
      vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '🟢', texthl = '', linehl = '', numhl = '' })

      -- Keybindings
      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Start/Continue Debugging' })
      vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Step Over' })
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Step Into' })
      vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Step Out' })
      vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<Leader>dB', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end, { desc = 'Set Conditional Breakpoint' })
      vim.keymap.set('n', '<Leader>dr', dap.repl.open, { desc = 'Open REPL' })
      vim.keymap.set('n', '<Leader>dl', dap.run_last, { desc = 'Run Last Debugging Session' })
    end,
  },
	  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      require('dapui').setup()
      -- Automatically open/close dap-ui
      -- (Include the configuration from Step 5)
    end,
  },
	{ "nvim-neotest/nvim-nio" }
}
