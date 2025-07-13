-- ~/.config/nvim-man/init.lua
-- Minimal config for man pages with Tokyo Night theme

-- Basic settings for reading man pages
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Install Tokyo Night theme
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with Tokyo Night
require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
})

-- Apply Tokyo Night Storm colorscheme
vim.cmd([[colorscheme tokyonight-storm]])

-- Key mappings for comfortable reading
vim.keymap.set("n", "q", ":q<CR>", { silent = true })
vim.keymap.set("n", "<Space>", "<C-f>", { silent = true })
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("n", "d", "<C-d>", { silent = true })
vim.keymap.set("n", "u", "<C-u>", { silent = true })
vim.keymap.set("n", "h", "<C-f>", { silent = true })
vim.keymap.set("n", "l", "<C-b>", { silent = true })
