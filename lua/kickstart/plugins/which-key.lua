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
      local gs = package.loaded.gitsigns
      wk.add {
        { '<leader>g', desc = 'Git', mode = { 'n' } },
        { '<leader>gs', gs.stage_hunk, desc = 'Stage hunk', mode = { 'n' } },
        { '<leader>gr', gs.reset_hunk, desc = 'Reset hunk', mode = { 'n' } },
        { '<leader>gS', gs.stage_buffer, desc = 'Stage buffer', mode = { 'n' } },
        { '<leader>gu', gs.undo_stage_hunk, desc = 'Undo stage hunk', mode = { 'n' } },
        { '<leader>gR', gs.reset_buffer, desc = 'Reset buffer', mode = { 'n' } },
        { '<leader>gp', gs.preview_hunk, desc = 'Preview hunk', mode = { 'n' } },
        {
          '<leader>gb',
          function()
            gs.blame_line { full = false }
          end,
          desc = 'Blame line',
          mode = { 'n' } },
        { '<leader>gd', gs.diffthis, desc = 'Diff against index' },
        {
          '<leader>gD',
          function()
            gs.diffthis '~'
          end,
          desc = 'Diff against last commit',
          mode = { 'n' } },
        { '<leader>gt', desc = 'Toggle', mode = { 'n' } },
        { '<leader>gtb', gs.toggle_current_line_blame, desc = 'Toggle line blame', mode = { 'n' } },
        { '<leader>gtd', gs.toggle_deleted, desc = 'Toggle show deleted', mode = { 'n' } },
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
