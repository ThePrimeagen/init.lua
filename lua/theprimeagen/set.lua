vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

if vim.loop.os_uname().sysname == 'Windows_NT' then

    -- Use Powershell Core, if not available Windows Powershell
    if vim.fn.executable('pwsh') == 1 then
        vim.opt.shell = 'pwsh'
    else
        vim.opt.shell = 'powershell'
    end

    vim.opt.shellcmdflag =
    [[-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command
    [Console]::InputEncoding=[Console]::OutputEncoding =
    [System.Text.Encoding]::UTF8;]]
    vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.opt.shellquote = ''
    vim.opt.shellxquote = ''
end
