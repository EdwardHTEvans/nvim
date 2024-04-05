require("conform").setup({
	formatters_by_ft = {
		c = { "indent" },
		cpp = { "indent" },
		h = { "indent" },
		hpp = { "indent" },
		lua = { "stylua" },
		json = { { "prettierd", "prettier" } },
		markdown = { { "prettierd", "prettier" } },
		html = { "htmlbeautifier" },
		bash = { "beautysh" },
		rust = { "rustfmt" },
		yaml = { "yamlfix" },
		toml = { "taplo" },
	},
})
