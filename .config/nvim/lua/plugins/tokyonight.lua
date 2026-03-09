return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    }
    -- vim.cmd.colorscheme 'tokyonight-night'
    vim.cmd.colorscheme 'tokyonight-moon'
    -- vim.cmd.colorscheme 'tokyonight-storm'
    -- vim.cmd.colorscheme 'tokyonight-day'

    -- Theme switcher
    local themes = { 'tokyonight-moon', 'tokyonight-storm', 'tokyonight-day' }
    local current = 1

    vim.keymap.set('n', '<leader>tt', function()
      current = (current % #themes) + 1
      vim.cmd.colorscheme(themes[current])
    end, { desc = 'Toggle Theme' })
  end,
}
