return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatters
        null_ls.builtins.formatting.buf,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.stylua,
        -- Linters
        null_ls.builtins.diagnostics.buf,
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.cpplint.with({
          args = { "--filter=-legal/copyright,-whitespace/braces,-whitespace/newline", "$FILENAME" },
        }),
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.protolint,
        -- null_ls.builtins.diagnostics.shellcheck (already used by bash_language_server)
      },
    })

    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })
  end,
}
