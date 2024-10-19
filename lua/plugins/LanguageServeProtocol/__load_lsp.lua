return function(LSPServer)
	require("lspconfig")[LSPServer].setup({
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	})
end
