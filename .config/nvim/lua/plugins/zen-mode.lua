return {
  {
    'folke/zen-mode.nvim',
    dependencies = { 'folke/twilight.nvim' },
    cmd = 'ZenMode', -- lazy load until you run the command
    opts = {
      plugins = {
        twilight = { enabled = false }, -- don't auto-enable Twilight when ZenMode opens
      },
    },
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
