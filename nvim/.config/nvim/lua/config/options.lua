require("vim._core.ui2").enable()

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1 -- Use value of shiftwidth
vim.opt.smarttab = true -- Always use shiftwidth
vim.opt.autoindent = true
vim.opt.list = false
vim.opt.listchars = {
	tab = "↹·",
	trail = "·",
}

-- Search
vim.opt.hlsearch = false
vim.o.incsearch = true -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insentive unless capitals used in searcher
