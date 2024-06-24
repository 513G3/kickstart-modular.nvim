return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
        path = 1,
      },
    }
  end,
}
