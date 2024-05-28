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

local function on_attach(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end

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
lspconfig["clangd"].setup({
  on_attach = on_attach,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  capabilities = capabilities
})
lspconfig["vhdl_ls"].setup({
  on_attach = on_attach,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  capabilities = capabilities
})
require("dap_init")

