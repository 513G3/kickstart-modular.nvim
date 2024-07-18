return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
    config = function() -- This is the function that runs, AFTER loading
      local wk = require 'which-key'
      wk.setup()

      -- Diagnostics
      wk.add {
        { '<leader>d', desc = 'Diagnostics', mode = { 'n' } },
        {
          '<leader>de',
          vim.diagnostic.open_float,
          desc = 'Error Messages',
          icon = { icon = '', color = 'red' },
          mode = { 'n' },
        },
        { '<leader>dq', vim.diagnostic.setloclist, desc = 'Quickfix List', mode = { 'n' } },
      }

      -- Git
      wk.add {
        { '<leader>g', desc = 'Git', mode = { 'n' } },
        { '<leader>gt', desc = 'Toggle', mode = { 'n' } },
      }

      -- LSP
      wk.add {
        { '<leader>l', desc = 'Language Server', icon = '', mode = { 'n' } },
        { '<leader>ls', desc = 'Symbols', mode = { 'n' } },
      }

      -- Tree
      wk.add {
        { '<leader>t', '<cmd>Neotree reveal toggle<cr>', desc = 'Tree', icon = '󰙅', mode = { 'n' } },
      }

      -- Search
      wk.add {
        { '<leader>s', desc = 'Search', mode = { 'n' } },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
