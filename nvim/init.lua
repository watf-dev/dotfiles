local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
  "git",
  "clone",
  "--filter=blob:none",
  "https://github.com/folke/lazy.nvim.git",
  "--branch=stable", -- latest stable release
  lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

-- set encoding
vim.opt.fileencoding = "utf-8"

-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- load files
require("lazy").setup("plugins")
require("config.keymaps")
require("config.options")
require("config.autocmds")
