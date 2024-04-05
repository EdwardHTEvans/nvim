-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.listchars = { trail = "·", tab = "->" }
vim.opt.list = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.opt.number = true

vim.cmd("colorscheme kanagawa-wave")

require("plugins")

-- setup nvim-tree with options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

require("nvim-cmp")
require("hotkeys")
require("conform_init")
require("lspconfig").clangd.setup({})
require("dap_init")
