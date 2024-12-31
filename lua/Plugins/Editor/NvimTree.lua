-- https://github.com/nvim-tree/nvim-tree.lua
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 50,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },

})
