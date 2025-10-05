-- 文件编码 encode
vim.g.encoding = "UTF-8"
vim.opt.fileencoding = "UTF-8"

-- editor
vim.opt.relativenumber = true -- 相对行号
vim.opt.number = true -- 行号
vim.opt.cursorline = true -- 高亮
vim.opt.splitright = true -- 横向分割
vim.opt.splitbelow = true -- 纵向分割
-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = "screen"
-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
vim.opt.termguicolors = true -- 终端颜色
vim.opt.signcolumn = "yes"
vim.opt.backup = false -- 去你妈的备份
vim.opt.swapfile = false -- 去你妈的swapfile
vim.opt.wrap = true -- 自动换行
vim.opt.confirm = true -- 亲切的退出确认交互
vim.opt.shiftround = true -- 使用 >> 和 << 移动时对齐到 shiftwidth 的倍数
vim.opt.cindent = true -- C 文件自动缩进
vim.opt.autoindent = true -- 新行缩进对齐到当前行
vim.opt.smartindent = true -- 开启智能缩进
-- 缩进 tab
vim.opt.smarttab = true -- 开启智能 Tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
-- mouse and clipboard
vim.opt.mouse:append("a")
vim.opt.clipboard:append("unnamedplus")

-- search
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered
