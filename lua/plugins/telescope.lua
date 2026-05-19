return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      require('telescope').setup {

        pickers = {
          find_files = {
            find_command = {
              'rg',
              '--files-without-match',
              '\\.(pyc|o)$',
            },
            follow = true,
          },
          grep_string = {
            additional_args = {
              '--follow',
            },
          },
          live_grep = {
            additional_args = {
              '--follow',
            },
          },
        },

        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Help Tags' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Keymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Files' })
      vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = 'Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Current Word' })
      vim.keymap.set('n', '<leader>sg', function()
        if vim.bo.filetype == 'neo-tree' then
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype ~= 'neo-tree' then
              vim.api.nvim_set_current_win(win)
              break
            end
          end
        end
        builtin.live_grep()
      end, { desc = 'Live Grep' })

      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Diagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Resume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>s<leader>', builtin.buffers, { desc = 'Existing Buffers' })
      vim.keymap.set('n', '<leader>s/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = 'Current Buffer' })
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Neovim' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
