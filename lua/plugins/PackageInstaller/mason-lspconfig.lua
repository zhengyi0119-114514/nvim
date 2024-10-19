local install_list = { "lua_ls" }
require("mason-lspconfig").setup({
	ensure_installed = install_list,
})
