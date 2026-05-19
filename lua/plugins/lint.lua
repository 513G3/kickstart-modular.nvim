return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        c = { 'cpplint' },
        cpp = { 'cpplint' },
        make = { 'checkmake' },
        proto = { 'buf_lint', 'protolint' },
      }

      lint.linters.cpplint.args = {
        '--filter=-legal/copyright,-whitespace/braces,-whitespace/newline',
        '--linelength=100',
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
        group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
