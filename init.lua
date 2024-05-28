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

vim.cmd("colorscheme catppuccin-mocha")

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
lspconfig = require("lspconfig")
lspconfig["clangd"].setup({})
lspconfig["vhdl_ls"].setup({
  on_attach = on_attach,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  capabilities = capabilities
})
require("dap_init")
