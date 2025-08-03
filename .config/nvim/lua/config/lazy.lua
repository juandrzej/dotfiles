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

-- TODO: render markdown? comment? avante? harpoon?
--
-- require('lazy').setup 'plugins'
require('lazy').setup({

  -- Core functionality
  require 'plugins.gitsigns',
  require 'plugins.treesitter', -- done
  require 'plugins.lazydev', -- done
  require 'plugins.lspconfig', -- done
  require 'plugins.blink',
  require 'plugins.lint', -- done
  require 'plugins.conform', -- done
  -- require 'plugins.debug',

  -- Navigation & UI
  require 'plugins.tokyonight', -- done
  require 'plugins.lualine', -- done
  require 'plugins.telescope',
  require 'plugins.which-key',
  require 'plugins.vim-tmux-navigator', -- done
  require 'plugins.oil', -- done
  -- require 'plugins.neo-tree',

  -- Text editing
  require 'plugins.guess-indent', -- done
  require 'plugins.autopairs', -- done
  require 'plugins.todo-comments', -- done
  require 'plugins.mini',
  -- require 'plugins.surround',

  -- Focus & productivity DONE
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
