-- This is all heavily based on TJ's init vim, but after this bit is done I'm
-- going to use the ema-2159 init vim

require "falcomomo.core.globals"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath
    }
end
vim.opt.runtimepath:prepend(lazypath)

require "falcomomo.core"
