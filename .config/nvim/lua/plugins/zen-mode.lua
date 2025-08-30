return {
  {
    'folke/zen-mode.nvim',
    dependencies = { 'folke/twilight.nvim' },
    cmd = 'ZenMode', -- lazy load until you run the command
    opts = {},
  },

  {
    'folke/twilight.nvim',
    lazy = true, -- only loads as dependency of zen-mode
    opts = {
      dimming = {
        alpha = 0.7, -- Less dimming (0.7 instead of default 0.25)
      },
    },
  },
}
