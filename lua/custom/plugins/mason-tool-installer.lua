return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'buf',
        'checkmake',
        'cpplint',
        'protolint',
        'shfmt',
        'shellcheck', -- Used by bash-language-server
        'stylua',
      },
    }
  end,
}
