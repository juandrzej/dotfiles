return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return ' ' .. str
            end,
          },
        },
      },
    }
  end,
}
