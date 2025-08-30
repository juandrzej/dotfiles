local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- TODO: render markdown? comment? avante?
--
-- require('lazy').setup 'plugins'
require('lazy').setup({

  -- Core functionality
  require 'plugins.gitsigns',
  require 'plugins.treesitter',
  require 'plugins.lazydev',
  require 'plugins.lspconfig',
  require 'plugins.blink', -- to be cleaned
  require 'plugins.lint',
  require 'plugins.conform',
  -- require 'plugins.debug',

  -- Navigation & UI
  require 'plugins.tokyonight',
  require 'plugins.lualine',
  require 'plugins.telescope',
  require 'plugins.harpoon',
  require 'plugins.which-key',
  require 'plugins.vim-tmux-navigator',
  require 'plugins.vim-obsession',
  require 'plugins.oil',
  -- require 'plugins.neo-tree',

  -- Text editing
  require 'plugins.guess-indent',
  require 'plugins.autopairs',
  require 'plugins.todo-comments',
  require 'plugins.mini',
  require 'plugins.surround',

  -- Focus & productivity
  require 'plugins.zen-mode',
  require 'plugins.hardtime',
  require 'plugins.vim-be-good',
}, {

  ui = { -- fallback icons in abscense of nerd font
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  rocks = {
    enabled = false, -- disable luarocks completely
  },
})
