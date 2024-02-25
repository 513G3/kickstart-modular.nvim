return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    vim.keymap.set('n', '<leader>tt', ':Neotree reveal toggle<cr>', { desc = 'toggle Neotree' })

    -- Because we have explicitly defined config(), we cannot
    -- use 'opts' at the outer layer since the toplevel's init.lua
    -- will not call setup() for us.  Since we want some options
    -- to be passed to setup() and override their default values,
    -- we need to call setup() ourselves and write out the options
    -- that we want to override:
    require('neo-tree').setup({
      filesystem = {
        filtered_items = {
          visible = true, -- Show hidden files by default
        },
        follow_current_file = {
          enabled = true, -- Refocus the tree as nvim bounces around files
        },
        use_libuv_file_watcher = true, -- Auto-update the tree as files are added and removed
      },
    })
  end,
}
