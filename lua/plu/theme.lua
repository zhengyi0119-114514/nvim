vim.cmd.colorscheme ("catppuccin-mocha")
require("catppuccin").setup({
    neotree = true,
    telescope = {
        enabled = true,
        -- style = "nvchad"
    },
    ts_rainbow2 = true,
    treesitter = true,
    mason = true,
    lsp_saga =true,
    which_key = false,
    native_lsp = {
        enabled = true,
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
	diffview = true,
    noice = true,
})

