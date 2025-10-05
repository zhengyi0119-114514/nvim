vim.g.mapleader = " "
vim.g.maplocalleader = " "
local WhickKey = require("which-key")
-- Editor
WhickKey.add({
	{ "<LEADER>e", desc = "Editor" },
	{ "<LEADER>es", desc = "Split" },
})
vim.keymap.set("i", ";'", "<ESC>")
vim.keymap.set("n", "<LEADER>et", "<CMD>Neotree toggle<CR>", { desc = "File Explorer" })
vim.keymap.set("n", "<C-A-e>", "<CMD>Neotree toggle<CR>", { desc = "File Explorer" })
-- vim.keymap.set("n", "<LEADER>ef", "<CMD>Format<CR>", { desc = "Format" })
vim.keymap.set("n", "<LEADER>ef", require("conform").format, { desc = "Format" })
vim.keymap.set("n", "<LEADER>ea", "<CMD>ASToggle<CR>", { desc = "Toggle Auto Save" })
vim.keymap.set("n", "<LEADER>esh", "<CMD>sp<CR>")
vim.keymap.set("n", "<LEADER>esv", "<CMD>vsp<CR>")
-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-LEFT>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-DOWN>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-UP>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-RIGHT>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-LEFT>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-DOWN>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-UP>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-RIGHT>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
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
WhickKey.add({
	{ "<LEADER>f", desc = "Find" },
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<LEADER>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<LEADER>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<LEADER>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<LEADER>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- LSP
WhickKey.add({
	{ "<LEADER>l", desc = "LSP" },
	{ "<LEADER>lt", desc = "Trouble" },
	{ "<LEADER>lp", desc = "GotoPreview" },
	{ "<LEADER>lg", desc = "Goto" },
})
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
vim.keymap.set("n", "<LEADER>lr", ":IncRename ", { desc = "Rename" })
vim.keymap.set("n", "<LEADER>lf", vim.lsp.buf.format, { desc = "Format with LSP" })
vim.keymap.set("n", "<F2>", ":IncRename ", { desc = "Rename" })
vim.keymap.set({ "v", "n" }, "<LEADER>la", require("actions-preview").code_actions, { desc = "Cade Action" })

local GotoPreview = require("goto-preview")

vim.keymap.set({ "n", "v" }, "<LEADER>lpd", GotoPreview.goto_preview_definition, { desc = "Preview Definition" })
vim.keymap.set(
	{ "n", "v" },
	"<LEADER>lpD",
	GotoPreview.goto_preview_type_definition,
	{ desc = "Preview Type Definition" }
)
vim.keymap.set(
	{ "n", "v" },
	"<LEADER>lpi",
	GotoPreview.goto_preview_implementation,
	{ desc = "Preview Implementation" }
)
vim.keymap.set({ "n", "v" }, "<LEADER>lpr", GotoPreview.goto_preview_references, { desc = "Preview References" })
vim.keymap.set("n", "<LEADER>lpc", GotoPreview.close_all_win, { desc = "Close Preview Window" })

vim.keymap.set({ "n", "v" }, "<LEADER>lgd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set({ "n", "v" }, "<LEADER>lgD", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
vim.keymap.set({ "n", "v" }, "<LEADER>lpi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set({ "n", "v" }, "<LEADER>lpr", vim.lsp.buf.references, { desc = "Goto References" })
-- VSC
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
