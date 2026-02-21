vim.g.mapleader = " "
vim.g.maplocalleader = " "
local WhickKey = require("which-key")
-- Editor
WhickKey.add({
	{ "<LEADER>e", desc = "Editor" },
	{ "<LEADER>es", desc = "Split" },
})
vim.keymap.set("i", ";'", "<ESC>")
vim.keymap.set("i", "；’", "<ESC>")
-- vim.keymap.set("n", "<LEADER>ef", "<CMD>Format<CR>", { desc = "Format" })
vim.keymap.set("n", "<LEADER>ea", "<CMD>ASToggle<CR>", { desc = "Toggle Auto Save" })
vim.keymap.set("n", "<LEADER>esh", "<CMD>sp<CR>")
vim.keymap.set("n", "<LEADER>esv", "<CMD>vsp<CR>")
-- Tab
vim.keymap.set("n", "<A-]>", "<CMD>tabNext<CR>")

-- LSP
WhickKey.add({
	{ "<LEADER>l", desc = "LSP" },
	{ "<LEADER>lp", desc = "GotoPreview" },
	{ "<LEADER>lg", desc = "Goto" },
})
vim.keymap.set("n", "<LEADER>lf", vim.lsp.buf.format, { desc = "Format with LSP" })


vim.keymap.set({ "n", "v" }, "<LEADER>lgd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set({ "n", "v" }, "<LEADER>lgD", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
vim.keymap.set({ "n", "v" }, "<LEADER>lgi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set({ "n", "v" }, "<LEADER>lgr", vim.lsp.buf.references, { desc = "Goto References" })
-- Debug
WhickKey.add({
	{ "<LEADER>d", desc = "Debug" },
	{ "<LEADER>ds", desc = "Step" },
})
vim.keymap.set("n", "<LEADER>db", require("dap").toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<F9>", require("dap").toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<LEADER>dc", require("dap").continue, { desc = "Continue" })
vim.keymap.set("n", "<F5>", require("dap").continue, { desc = "Continue" })
vim.keymap.set("n", "<LEADER>dsi", require("dap").step_into, { desc = "Step into" })
vim.keymap.set("n", "<F11>", require("dap").step_into, { desc = "Step into" })
vim.keymap.set("n", "<LEADER>dsO", require("dap").step_over, { desc = "Step over" })
vim.keymap.set("n", "<F10>", require("dap").step_over, { desc = "Step over" })
vim.keymap.set("n", "<LEADER>dso", require("dap").step_out, { desc = "Step out" })
vim.keymap.set("n", "<S-F10>", require("dap").step_out, { desc = "Step out" })
