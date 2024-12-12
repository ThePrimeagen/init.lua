local api = vim.api
local buf = api.nvim_create_buf(false, true)
local win = vim.api.nvim_open_win(buf, true,
          {relative='win', row=3, col=3, width=12, height=3})


