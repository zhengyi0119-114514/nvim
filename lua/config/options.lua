--编码
vim.opt.clipboard = 'unnamedplus' -- use system clipboard

--缩进
-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"

-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true

-- 搜索不要高亮
vim.o.hlsearch = false
vim.o.incsearch = true

-- 鼠标支持
vim.o.mouse = "a"

-- 样式
vim.opt.termguicolors = true


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--编码
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"
