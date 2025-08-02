-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    -- signs = false,
  },
  -- FIX: this needs fixing
  -- alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }
  -- HACK: this looks a bit funky
  -- WARN: xxxxxxx
  -- alt = { "WARNING", "XXX" }
  -- TODO: what else?
  -- NOTE: adding a note
  -- alt = { "INFO" }
  -- TEST: sfhlsjkh
  -- alt = { "TESTING", "PASSED", "FAILED" }
  -- PERF: fully optimized
  -- alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" }
}
