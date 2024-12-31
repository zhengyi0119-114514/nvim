vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>et", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>eo", "<CMD>NvimTreeOpen<CR>")
vim.keymap.set("n", "<leader>ec", "<CMD>NvimTreeClose<CR>")

vim.keymap.set("n", "<A-S-f>", "<CMD>Format<CR>")

vim.keymap.set("n","<leader>bd","<CMD>bdelete! %<CR>")
vim.keymap.set("n","<leader>bcn","<CMD>BufferLineCycleNext<CR>")
vim.keymap.set("n","<leader>bcl","<CMD>BufferLineCyclePrev<CR>")
