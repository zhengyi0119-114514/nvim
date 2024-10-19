require("config.options")
require("config.lazy")
require("config.Keymap")

require("plugins.theme-cappuccin")
require("plugins.theme-alpha")

require("plugins.UI-noice")

require("plugins.TabAndLines-bufferline")
require("plugins.TabAndLines-lualine")

require("plugins.TreeSetter.nvim-treesetter")
require("plugins.TreeSetter.nvim-treesetter-context")
require("plugins.TreeSetter.rainbow-delimiters")
require("plugins.TreeSetter.nvim-ts-context-commentstring")

require("plugins.LanguageServeProtocol.Snips.Luasnip")
require("plugins.LanguageServeProtocol.CMP")
require("plugins.LanguageServeProtocol.inc-rename")
require("plugins.LanguageServeProtocol.lspkind-nvim")
require("plugins.LanguageServeProtocol.lspsaga")

require("plugins.Formatter-fotmatter")
require("plugins.PackageInstaller.Mason")
require("plugins.PackageInstaller.mason-lspconfig")

require("plugins.DebugAdapterProtocol.DapUI")

require("plugins.Scrollbar-satellite")
require("plugins.Explorer-nvimtree")
require("plugins.Explorer-nvim-config-local")
require("plugins.Edit-Autopair")
require("plugins.Edit-Todo-comment")

require("plugins.LanguageServeProtocol.LSPServers.lua_ls")
require("plugins.LanguageServeProtocol.LSPServers.clangd")

vim.cmd.colorscheme("catppuccin-latte")
vim.cmd.colorscheme("catppuccin-latte")
