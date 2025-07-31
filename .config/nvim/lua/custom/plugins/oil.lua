return {
  'stevearc/oil.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    require('oil').setup {
      columns = { 'permissions', 'icon' },
      delete_to_trash = true,

      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
        ['<C-k>'] = false,
        ['<C-j>'] = false,
        ['<C-x>'] = 'actions.select_split',
      },
      view_options = {
        show_hidden = true,
      },
    }

    -- Open parent directory in current window
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    -- Open parent directory in floating window
    vim.keymap.set('n', '<space>-', require('oil').toggle_float)
  end,
}
