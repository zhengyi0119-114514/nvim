vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Editor
vim.keymap.set("i", ":'", "<ESC>")
vim.keymap.set("n", "<LEADER>et", "<CMD>Neotree toggle<CR>", { desc = "File Explorer" })
vim.keymap.set("n", "<LEADER>ef", "<CMD>Format<CR>", { desc = "Format" })
vim.keymap.set("n", "<LEADER>ea", "<CMD>ASToggle<CR>", { desc = "Toggle Auto Save" })
-- Buffer
vim.keymap.set("n", "<A-h>", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<A-l>", "<CMD>BufferLineCycleNext<CR>")
-- vim.keymap.set("n","<LEADER>bd","<CMD>w<CR><CMD>bdelete %<CR>")
vim.keymap.set(
	"n",
	"<LEADER>bd",
	"<CMD>Neotree toggle<CR><CMD>w<CR><CMD>bdelete %<CR><CMD>Neotree toggle<CR>",
	{ desc = "Delete Current Buffer" }
)
-- Find
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- LSP
vim.keymap.set("n", "<LEADER>ltd", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Diagnostics 诊断 (Trouble)" })
vim.keymap.set(
	"n",
	"<LEADER>ltD",
	"<CMD>Trouble diagnostics toggle filter.buf=0<<CR>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
vim.keymap.set(
	"n",
	"<LEADER>ltr",
	"<CMD>Trouble lsp toggle focus=false win.position=right<CR>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
vim.keymap.set("n", "<LEADER>lts", "<CMD>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<LEADER>ltl", "<CMD>Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<LEADER>ltq", "<CMD>Trouble qflist toggle<CR>", { desc = "Quickfix List (Trouble)" })
vim.keymap.set("n", "<LEADER>ls", "<CMD>Outline<CR>", { desc = "Toggle Outline" })
-- VSC
vim.keymap.set("n", "<LEADER>gg", function()
	require("gitgraph").draw({}, { all = true, max_count = 5000 })
end, { desc = "GitGraph - Draw" })
-- vim.keymap.set("n")
