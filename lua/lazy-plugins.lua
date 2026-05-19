require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'plugins/gitsigns',

  require 'plugins/which-key',

  require 'plugins/telescope',

  require 'plugins/lspconfig',

  require 'plugins/cmp',

  require 'plugins/tokyonight',

  require 'plugins/todo-comments',

  require 'plugins/treesitter',

  require 'plugins/indent-blankline',

  { import = 'custom/plugins' },
}, {})

-- vim: ts=2 sts=2 sw=2 et
