require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {},
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()
function load_lsp(name)
	require("lspconfig")[name].setup({
		capabilities = capabilities,
	})
end
load_lsp("lua_ls")
