-- Using the ema-2159 way of setting thigs up
local editor = require("falcomomo.plugins.editor")
local themes = require("falcomomo.plugins.themes")
local tools = require("falcomomo.plugins.tools")
local ui = require("falcomomo.plugins.ui")

local plugins = { themes, ui, tools, editor }

COLORSCHEME = "dracula"

require("lazy").setup(plugins, {
    dev = {
        -- directory where store local plugin projects
        path = "~/dev/projects/nvim_plugins",
        fallback = false,
    },
ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
    },
  },
})

vim.cmd.colorscheme(COLORSCHEME)
