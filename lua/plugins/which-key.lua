return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require 'which-key'
      wk.setup()
      wk.add {
        { '<leader>d', desc = 'Diagnostics', icon = { icon = '󰒡', color = 'yellow' }, mode = { 'n' } },
        {
          '<leader>de',
          vim.diagnostic.open_float,
          desc = 'Error Messages',
          icon = { icon = '', color = 'red' },
          mode = { 'n' },
        },
        {
          '<leader>dq',
          vim.diagnostic.setloclist,
          desc = 'Quickfix List',
          icon = { icon = '󰁨', color = 'orange' },
          mode = { 'n' },
        },
      }
      local gs = package.loaded.gitsigns
      wk.add {
        { '<leader>g', desc = 'Git', icon = { icon = '', color = 'orange' }, mode = { 'n' } },
        { '<leader>gs', gs.stage_hunk, desc = 'Stage hunk', icon = { icon = '', color = 'green' }, mode = { 'n' } },
        { '<leader>gr', gs.reset_hunk, desc = 'Reset hunk', icon = { icon = '󰕍', color = 'red' }, mode = { 'n' } },
        { '<leader>gS', gs.stage_buffer, desc = 'Stage buffer', icon = { icon = '󰐕', color = 'green' }, mode = { 'n' } },
        { '<leader>gu', gs.undo_stage_hunk, desc = 'Undo stage hunk', icon = { icon = '󰕍', color = 'yellow' }, mode = { 'n' } },
        { '<leader>gR', gs.reset_buffer, desc = 'Reset buffer', icon = { icon = '󰜉', color = 'red' }, mode = { 'n' } },
        { '<leader>gp', gs.preview_hunk, desc = 'Preview hunk', icon = { icon = '󰈈', color = 'cyan' }, mode = { 'n' } },
        {
          '<leader>gb',
          function()
            gs.blame_line { full = false }
          end,
          desc = 'Blame line',
          icon = { icon = '', color = 'orange' },
          mode = { 'n' },
        },
        { '<leader>gd', gs.diffthis, desc = 'Diff against index', icon = { icon = '', color = 'blue' }, mode = { 'n' } },
        {
          '<leader>gD',
          function()
            gs.diffthis '~'
          end,
          desc = 'Diff against last commit',
          icon = { icon = '', color = 'blue' },
          mode = { 'n' },
        },
        { '<leader>gt', desc = 'Toggle', icon = { icon = '', color = 'azure' }, mode = { 'n' } },
        { '<leader>gtb', gs.toggle_current_line_blame, desc = 'Toggle line blame', icon = { icon = '', color = 'orange' }, mode = { 'n' } },
        { '<leader>gtd', gs.toggle_deleted, desc = 'Toggle show deleted', icon = { icon = '󰆴', color = 'red' }, mode = { 'n' } },
      }
      local ll = package.loaded.lsp_lines
      wk.add {
        { '<leader>l', desc = 'Language Server', icon = '', mode = { 'n' } },
        { '<leader>ls', desc = 'Symbols', icon = { icon = '󰊕', color = 'purple' }, mode = { 'n' } },
        { '<leader>ll', ll.toggle, desc = 'Toggle LSP Lines', icon = { icon = '󰌘', color = 'cyan' }, mode = { 'n' } },
      }
      wk.add {
        { '<leader>t', '<cmd>Neotree reveal toggle<cr>', desc = 'Toggle Tree', icon = '󰙅', mode = { 'n' } },
      }
      wk.add {
        { '<leader>s', desc = 'Search', icon = { icon = '', color = 'azure' }, mode = { 'n' } },
        { '<leader>sh', desc = 'Help Tags', icon = { icon = '󰋖', color = 'blue' }, mode = { 'n' } },
        { '<leader>sk', desc = 'Keymaps', icon = { icon = '󰌌', color = 'purple' }, mode = { 'n' } },
        { '<leader>sf', desc = 'Files', icon = { icon = '󰈞', color = 'green' }, mode = { 'n' } },
        { '<leader>st', desc = 'Telescope', icon = { icon = '', color = 'azure' }, mode = { 'n' } },
        { '<leader>sw', desc = 'Current Word', icon = { icon = '󰉿', color = 'yellow' }, mode = { 'n' } },
        { '<leader>sg', desc = 'Live Grep', icon = { icon = '󰱼', color = 'green' }, mode = { 'n' } },
        { '<leader>sd', desc = 'Diagnostics', icon = { icon = '󰒡', color = 'yellow' }, mode = { 'n' } },
        { '<leader>sr', desc = 'Resume', icon = { icon = '󰑐', color = 'cyan' }, mode = { 'n' } },
        { '<leader>s.', desc = 'Recent Files ("." for repeat)', icon = { icon = '󰋚', color = 'orange' }, mode = { 'n' } },
        { '<leader>s<leader>', desc = 'Existing Buffers', icon = { icon = '󰓩', color = 'blue' }, mode = { 'n' } },
        { '<leader>s/', desc = 'Current Buffer', icon = { icon = '󰈙', color = 'cyan' }, mode = { 'n' } },
        { '<leader>sn', desc = 'Neovim', icon = { icon = '', color = 'green' }, mode = { 'n' } },
        { '<leader>f', desc = 'Format', icon = { icon = '󰉢', color = 'purple' }, mode = { 'n' } },
        { '<leader>b', desc = 'Debug: Toggle Breakpoint', icon = { icon = '', color = 'red' }, mode = { 'n' } },
        { '<leader>B', desc = 'Debug: Set Breakpoint', icon = { icon = '󰃤', color = 'red' }, mode = { 'n' } },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
