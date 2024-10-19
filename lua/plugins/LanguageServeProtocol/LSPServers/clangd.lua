require("lspconfig")["clangd"].setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	cmd = {
		"clangd",
		"--all-scopes-completion=true",
		"--background-index",
		"--clang-tidy",
		"--fallback-style=Google",
		"--function-arg-placeholders=false",
		"--header-insertion-decorators",
		"--header-insertion=iwyu",
		"--parse-forwarding-functions",
	},
})

