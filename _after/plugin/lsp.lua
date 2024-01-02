local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}
    attach(opts)
end)

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "lua_ls",
  "rust_analyzer",
})

-- Fix Undefined global "vim"
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

require('lspconfig').templ.setup({
    cmd = { "templ", "lsp", "-http=localhost:7474", "-log=/home/mpaulson/templ.log" },
    filetypes = { 'templ' },
})

require('lspconfig').tailwindcss.setup({
    filetypes = { '*' },
})

--[[
-- Add templ configuration.
local configs = require'lspconfig/configs'
if not nvim_lsp.templ then
  configs.templ = {
    default_config = {
      cmd = {"templ", "lsp"},
      filetypes = {'templ'},
      root_dir = nvim_lsp.util.root_pattern("go.mod", ".git"),
      settings = {},
    };
  }
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'gopls', 'ccls', 'cmake', 'tsserver', 'templ' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }
end
--]]

require('lspconfig').ocamllsp.setup({
    cmd = { "ocamllsp" },
    on_attach = function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
        attach(opts)
    end
})

--[[
-- Fix Undefined global "vim"
lsp.configure("rust_analyzer", {
    cmd = { "" },
})
--]]


local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    attach(opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

