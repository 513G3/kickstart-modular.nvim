return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'beautysh',
        'buf',
        'checkmake',
        'cpplint',
        'isort',
        'jsonlint',
        'protolint',
        'shellcheck',
        'stylua',
      },
    }
  end,
}
