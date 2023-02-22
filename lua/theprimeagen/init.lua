-- TODO: Add file exists function.
-- https://www.grepper.com/answers/120776/how+to+check+if+file+exists+lua
local function file_exists(name)
    local f=io.open(name,'r')
    if f ~= nil then io.close() return true else return false end
end

-- TODO: Bootstrap when necessary.
require("theprimeagen.bootstrap")

-- required modules.
require("theprimeagen.packer")
require("theprimeagen.set")
require("theprimeagen.remap")

-- TODO: Don't use my streaming tools.
if file_exists("~/personal/streamer-tools") then
    vim.opt.rtp:append("~/personal/streamer-tools")
end

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
