return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup {
      sources = {
        -- Built-in formatters
        null_ls.builtins.formatting.buf,
        null_ls.builtins.formatting.shfmt.with {
          args = { '-i', '4' },
        },
        null_ls.builtins.formatting.stylua,

        -- Built-in linters
        null_ls.builtins.diagnostics.buf,
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.protolint,

        -- Extra linters
        require('none-ls.diagnostics.cpplint').with {
          args = { '--filter=-legal/copyright,-whitespace/braces,-whitespace/newline', '$FILENAME' },
        },
      },
    }

    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format' })
  end,
}
