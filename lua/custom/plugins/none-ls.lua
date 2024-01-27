return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup {
      sources = {
        -- Formatters
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.buf,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.stylua,
        -- Linters
        null_ls.builtins.diagnostics.cpplint,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.protolint,
        null_ls.builtins.diagnostics.shellcheck,
      },
    }

    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format' })
  end,
}
