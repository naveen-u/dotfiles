-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.list = true     -- show certain non-printable characters
vim.opt.listchars = {   -- update listchars for tabs and trailing spaces
  tab = ">~",
  trail = "·",
}
