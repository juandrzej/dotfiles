return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',

  opts = {
    -- options = {
    --   theme = 'auto',
    --   globalstatus = true,
    -- },
    -- sections = {
    --   lualine_a = { 'mode' },
    --   lualine_b = { 'branch', 'diff' },
    --   lualine_c = { { 'filename', path = 1 } },
    --   lualine_x = { 'filetype' },
    --   lualine_y = { 'progress' },
    --   lualine_z = { 'location' },
    -- },
    -- extensions = { 'neo-tree', 'oil' },
  },
}
