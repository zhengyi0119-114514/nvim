vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>rn", ":IncRename ", { desc = "Rename" })
vim.keymap.set("n", "<F2>", ":IncRename ")

vim.keymap.set("n", "<leader>la", "<CMD>Lspsaga code_action<CR>", { desc = "Code Action from Lspsaga" })
vim.keymap.set("n", "<leader>lgd", "<CMD>Lspsaga goto_definition<CR>", { desc = "Goto Definition from Lspsaga" })
vim.keymap.set(
	"n",
	"<leader>lgtd",
	"<CMD>Lspsaga goto_type_definition<CR>",
	{ desc = "Goto Type Definition from Lspsaga" }
)
vim.keymap.set("n", "<leader>lo", "<CMD>Lspsaga outline<CR>", { desc = "Symbol Table from Lspsaga" })

vim.keymap.set("n", "<leader>dp", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint from nvim-dap" })
vim.keymap.set("n", "<leader>doc", require("dap").continue, { desc = "Continue from nvim-dap" })
vim.keymap.set("n", "<leader>doo", require("dap").step_over, { desc = "Step Over from nvim-dap" })
vim.keymap.set("n", "<leader>doi", require("dap").step_into, { desc = "Step Into from nvim-dap" })
vim.keymap.set("n", "<leader>du", require("dapui").toggle, { desc = "UI from nvim-dap-ui" })

vim.keymap.set("n", "<leader>bcn", "<CMD>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<A-l>", "<CMD>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>bcp", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<A-h>", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>bd", "<CMD>NvimTreeClose<CR><CMD>bdelete! %<CR>")

vim.keymap.set("n", "<leader>ca", require("cmp").mapping.abort, { desc = "Abort CMP" })
vim.keymap.set("n", "<leader>ca", require("cmp").mapping.complete, { desc = "Complete CMP" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>mf", "<CMD>Format<CR>", { desc = "Format files" })
vim.keymap.set("n", "<A-S-f>", "<CMD>Format<CR>")
vim.keymap.set("i", "<A-S-f>", "<ESC><CMD>Format<CR>a")
