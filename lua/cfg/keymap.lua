--leader
vim.g.maplocalleader = " "

require("cfg.keymap-jump-whichkey")

local keymap = require("plu.which-key")

keymap("i", "jk", "<Esc>")
keymap("i", "<C-s>", "<Esc><cmd>w<CR>")
keymap("n", "<C-s>", "<cmd>w<CR>")

--nvimtree
--显示/关闭目录树
keymap("n", "<C-q>", "<cmd>NvimTreeToggle<CR>")
keymap("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>")
--转到 nvimtree
keymap("n", "<C-a>", "<cmd>NvimTreeOpen<CR>")
keymap("n", "<leader>to", "<cmd>NvimTreeOpen<CR>")
--关闭 目录树
keymap("n", "<leader>ts", "<cmd>NvimTreeClose<CR>")

--bufferline
--向左选择标签页
keymap("n", "<A-h>", "<cmd>BufferLineCyclePrev<CR>")
keymap("n", "<leader>bcl", "<cmd>BufferLineCyclePrev<CR>", "Choose Last Buffer")
--向右选择标签页
keymap("n", "<A-l>", "<cmd>BufferLineCycleNext<CR>")
keymap("n", "<leader>bcn", "<cmd>BufferLineCycleNext<CR>", "Choose Last Buffer")
--关闭标签页
keymap("n", "<leader>bd", "<cmd>NvimTreeClose<CR><cmd>bdelete %<CR>", "Delete Buffer")
--移动标签页
keymap("n", "<leader>bmn", "<cmd>BufferLineMoveNext<CR>", "Move buffer Left")
keymap("n", "<leader>bml", "<cmd>BufferLineMovePrev<CR>", "Move Buffer Right")

--telescope
local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, "Find Files")
keymap("n", "<leader>fg", builtin.live_grep, "Find Live Group")
keymap("n", "<leader>fb", builtin.buffers, "Find in buffers")
keymap("n", "<leader>fh", builtin.help_tags, "Find help tag")

--trouble
keymap("n", "<leader>st", ":Trouble diagnostics toggle win.position=right<CR>")
--ToggleTerm
keymap("n", "<leader>m", "<CMD>ToggleTerm direction=float size=104857600 name=Terminal<CR>", "Terminal")

--overseer
keymap("n", "<leader>oo", "<cmd>OverseerOpen<CR>")
keymap("n", "<leader>oc", "<cmd>OverseerClose<CR>")
keymap("n", "<leader>ot", "<cmd>OverseerToggle<CR>")
keymap("n", "<leader>ob", "<cmd>OverseerBuild<CR>")
keymap("n", "<leader>or", "<cmd>OverseerRun<CR>")
keymap("n", "<leader>oi", "<cmd>OverseerInfo<CR>")
--rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")
vim.keymap.set("n", "<F2>", ":IncRename ")
--Format
keymap("n", "<leader>ef", "<cmd>Format<CR>","Format")
keymap("n", "<S-A-F>","<CMD>Format<CR>","NULL")

