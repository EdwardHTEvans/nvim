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
vim.opt.relativenumber = true

vim.cmd("colorscheme catppuccin-mocha")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})

vim.g.ale_fixers = {
    rust = {'rustfmt'},
}
vim.g.ale_linters = {
    rust = {'cargo'},
}

vim.g.rustfmt_autosave = 1

require("plugins")

-- nvim-tree
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
	git = {
		enable = true,
		ignore = false,
		timeout = 400,
	},
})

-- cmp
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()
vim.opt.completeopt = "menu,menuone,noselect"
cmp.setup({
  snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
  mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
  -- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- LSP
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within the current buffer
		{ name = "path" }, -- file system paths
	}),
})

-- lsp
local function on_attach(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end

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

lspconfig["rust_analyzer"].setup({})

local telescope = require('telescope')
telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    }
  }
}

-- hotkeys
require("hotkeys")

