return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts =
        {
            indent_blankline = {
                enabled = true,
                scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                colored_indent_levels = false,
            },
            mason = true,
            rainbow_delimiters = true,
            noice = true,
            notify = true,
            gitgraph = true,
            neogit = true,
            neotest = true,
            diffview = true,
            lsp_saga = true,
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
        }
    }
}
