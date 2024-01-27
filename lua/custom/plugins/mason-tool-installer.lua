return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'beautysh',
        'buf',
        'cpplint',
        'isort',
        'protolint',
        'shellcheck'
      }
    }
  end
}
