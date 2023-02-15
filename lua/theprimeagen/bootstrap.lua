-- Auto install packer.nvim if when needed.

-- Set installation path and clone url.
local path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local url = 'https://github.com/wbthomason/packer.nvim'

-- Clone packer if necessary.
if vim.fn.empty(vim.fn.glob(path)) > 0 then
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
  print('Installing packer.')
  vim.fn.system({'git', 'clone', '--depth', '1', url, path})
  vim.g.nvim_bootstrapped = 1

  -- Add packer.
  vim.cmd [[packadd packer.nvim]]
else
  vim.g.nvim_bootstrapped = 0
end
