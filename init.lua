-- Leader keys must be set before loading plugins.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'

require 'keymaps'

require 'lazy-bootstrap'

require 'lazy-plugins'

-- vim: ts=2 sts=2 sw=2 et
