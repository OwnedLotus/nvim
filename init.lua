-- Set leader keys
vim.g.mapleader = " " -- space as leader
vim.g.maplocalleader = " " -- optional, for local leader

-- init.lua

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from lua/plugins.lua
require("lazy").setup("plugins")

-- Basic settings (optional)
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.filetype.add({
	extension = {
		razor = "razor",
		cshtml = "razor",
	},
})
