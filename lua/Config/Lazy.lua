-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "Plugins.Theme" },
		{ import = "Plugins.Editor" },
		{ import = "Plugins.EditorUI" },
		{ import = "Plugins.GUI" },
		{ import = "Plugins.VSC" },
		{ import = "Plugins.PackageManager" },
		{ import = "Plugins.Format" },
		{ import = "Plugins.LSP" },
		{ import = "Plugins.Terminal" },
		{ import = "Plugins.DAP" },
		{ import = "Plugins.Languages.Lua" },
		{ import = "Plugins.Languages.Cpp" },
		{ import = "Plugins.Languages.Markdown" },
		{ import = "Plugins.Languages.Doxygen" },
	},
	checker = { enabled = true }, -- 自动检查插件更新
})
