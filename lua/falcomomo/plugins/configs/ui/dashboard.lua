local function browse_files()
  local extensions = require("telescope").extensions
  return extensions.file_browser.file_browser
end

local function recent_files()
  local builtin = require("telescope.builtin")
  return builtin.oldfiles
end

local function projects()
  local extensions = require("telescope").extensions
  return extensions.project.project
end

local function themes()
  local builtin = require("telescope.builtin")
  return builtin.colorscheme
end

local function lazy()
  vim.cmd("Lazy")
end

return function()
  require("dashboard").setup({
    theme = "doom",
    config = {
      header = {
        [[          ____          ]],
        [[         /.../\         ]],
        [[        /.../--\        ]],
        [[       /.../----\       ]],
        [[      /.../------\      ]],
        [[     /.../---/\---\     ]],
        [[    /.../---/\\\---\    ]],
        [[   /.../---/\\\\\---\   ]],
        [[  /.../===/__\\\\\---\  ]],
        [[ /............\\\\\---\ ]],
        [[/..............\\\\\---\]],
        [[\\\\\\\\\\\\\\\\\\\\\--/]],
        [[ \\\\\\\\\\\\\\\\\\\\\/ ]],
        [[                        ]],
        [[  Not Emmacs anymore :( ]],
        [[                        ]],
      },
      center = {
        {
          icon = "  ",
          icon_hl = "Title",
          desc = "Recent Files",
          desc_hl = "String",
          key = "r",
          keymap = "",
          key_hl = "Number",
          action = recent_files(),
        },
        {
          icon = "  ",
          icon_hl = "Title",
          desc = "Projects",
          desc_hl = "String",
          key = "p",
          keymap = "",
          key_hl = "Number",
          action = projects(),
        },
        {
          icon = "  ",
          icon_hl = "Title",
          desc = "File Browser",
          desc_hl = "String",
          key = "b",
          keymap = "",
          key_hl = "Number",
          action = browse_files(),
        },
        {
          icon = "  ",
          icon_hl = "Title",
          desc = "Themes",
          desc_hl = "String",
          key = "t",
          keymap = "",
          key_hl = "Number",
          action = themes(),
        },
        {
          icon = "  ",
          icon_hl = "Title",
          desc = "Plugins",
          desc_hl = "String",
          key = "u",
          keymap = "",
          key_hl = "Number",
          action = lazy,
        },
      },
    },
  })
end
