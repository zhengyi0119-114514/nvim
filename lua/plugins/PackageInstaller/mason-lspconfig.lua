local install_list = { "lua_ls" }
require("mason-lspconfig").setup({
	ensure_installed = install_list,
})
for inxed, value in ipairs(install_list) do
	require("plugins.LanguageServeProtocol.__load_lsp")("lua_ls")
end
