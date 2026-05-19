return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        desc = 'Format',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        proto = { 'buf' },
        sh = { 'shfmt' },
      },
      formatters = {
        shfmt = {
          prepend_args = { '-i', '4' },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
