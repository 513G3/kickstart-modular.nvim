return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'buf',
        'checkmake',
        'cpplint',
        'isort',
        'jsonlint',
        'protolint',
        'shfmt',
        'shellcheck',
        'stylua',
      },
    }
  end,
}
