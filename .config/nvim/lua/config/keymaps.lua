-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- General keymaps
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Write to file' })
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>th', ':split | terminal<CR>', { desc = 'Terminal horizontal' })
vim.keymap.set('n', '<leader>tv', ':vsplit | terminal<CR>', { desc = 'Terminal vertical' })

-- Toggle keymaps
vim.keymap.set('n', '<leader>tz', '<cmd>ZenMode<CR>', { desc = 'Toggle Zen Mode' })
vim.keymap.set('n', '<leader>tt', '<cmd>Twilight<CR>', { desc = 'Toggle Twilight' })
vim.keymap.set('n', '<leader>td', '<cmd>Hardtime toggle<CR>', { desc = 'Toggle Hardtime' })
vim.keymap.set('n', '<leader>tg', '<cmd>VimBeGood<CR>', { desc = 'Toggle VimBeGood' })

-- Add blank line below/above without insert mode
vim.keymap.set('n', '<leader>o', 'o<Esc>', { desc = 'Add blank line below' })
vim.keymap.set('n', '<leader>O', 'O<Esc>', { desc = 'Add blank line above' })

-- Clear highlights on search when pressing <Esc> in normal mode `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open [d]iagnostic quickfix list' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Quick window navigation from terminal
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Terminal: Go to left window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Terminal: Go to bottom window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Terminal: Go to top window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Terminal: Go to right window' })

-- Keybinds to make split navigation easier. `:help wincmd`
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })
