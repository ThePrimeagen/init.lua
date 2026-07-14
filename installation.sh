
# Check if vim is installed
if ! command -v vim &> /dev/null; then
    echo "vim is not installed. Installing..."
    sudo apt update
    sudo apt install -y vim
else
    echo "vim is already installed."
fi

# Check if neovim is installed
if ! command -v nvim &> /dev/null; then
    echo "neovim is not installed. Installing..."
    sudo apt-get update
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    cd ~
    git clone https://github.com/neovim/neovim.git
    cd neovim
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
else
    echo "neovim is already installed."
fi

# install ripgrep
sudo apt install -y git curl ripgrep neovim
# install npm (required for lsp)
sudo apt install npm

# Clone packer.nvim into the specified directory
echo "Cloning packer.nvim..."
cd "$HOME/.config"
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "packer.nvim has been cloned successfully."

# Create nvim directory in .config if it doesn't exist
NVIM_CONFIG_DIR="$HOME/.config/nvim"
if [ ! -d "$NVIM_CONFIG_DIR" ]; then
    echo "Creating $NVIM_CONFIG_DIR..."
    mkdir -p "$NVIM_CONFIG_DIR"
else
    echo "$NVIM_CONFIG_DIR already exists."
fi

# Create the required directories and files inside nvim
mkdir -p "$NVIM_CONFIG_DIR/after/plugin"
touch "$NVIM_CONFIG_DIR/after/plugin/cloak.lua"
touch "$NVIM_CONFIG_DIR/after/plugin/colors.lua"
touch "$NVIM_CONFIG_DIR/after/plugin/fugitive.lua"
touch "$NVIM_CONFIG_DIR/after/plugin/harpoon.lua"
touch "$NVIM_CONFIG_DIR/after/plugin/lsp.lua"
touch "$NVIM_CONFIG_DIR/after/plugin/refactoring.lua"
touch "$NVIM_CONFIG_DIR/after/plugin/telescope.lua"
touch "$NVIM_CONFIG_DIR/after/plugin/treesitter.lua"
touch "$NVIM_CONFIG_DIR/after/plugin/trouble.lua"
touch "$NVIM_CONFIG_DIR/after/plugin/undotree.lua"
touch "$NVIM_CONFIG_DIR/after/plugin/zenmode.lua"

NVIM_LUA_DIR="$NVIM_CONFIG_DIR/lua"
NVIM_CVC_DIR="$NVIM_LUA_DIR/cvc"

mkdir -p "$NVIM_LUA_DIR"
mkdir -p "$NVIM_CVC_DIR"
touch "$NVIM_CONFIG_DIR/init.lua"
touch "$NVIM_CVC_DIR/init.lua"
touch "$NVIM_CVC_DIR/packer.lua"
touch "$NVIM_CVC_DIR/remap.lua"
touch "$NVIM_CVC_DIR/set.lua"
# Now, populate the files with content
echo  'require("cvc")' > "$NVIM_CONFIG_DIR/init.lua"
cat << 'EOF' > "$NVIM_CVC_DIR/init.lua"
require("cvc.set")
require("cvc.remap")

local augroup = vim.api.nvim_create_augroup
local CVCGroup = augroup('CVC', {})

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
    group = CVCGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
EOF
cat <<'EOF' > "$NVIM_CONFIG_DIR/after/plugin/cloak.lua"
require("cloak").setup({
  enabled = true,                -- Enable the plugin.
  cloak_character = "*",         -- Character used to cloak the sensitive data.
  highlight_group = "Comment",   -- Visual appearance of the cloaked data will match the "Comment" group.
  patterns = {
    {
      -- List of file patterns where the cloaking should apply.
      file_pattern = {
          ".env*",               -- Any file starting with ".env" like ".env.local", ".env.production", etc.
          "wrangler.toml",       -- Specifically the "wrangler.toml" file.
          ".dev.vars",           -- Specifically the ".dev.vars" file.
      },
      -- In the above files, cloak the value part of `key=value` pairs.
      cloak_pattern = "=.+"      -- The pattern matches an equals sign and any character sequence after it.
    },
  },
})
EOF

cat <<'EOF' > "$NVIM_CVC_DIR/set.lua"
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = false

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
EOF

cat <<'EOF' > "$NVIM_CONFIG_DIR/after/plugin/harpoon.lua"
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
EOF

cat << 'EOF' > "$NVIM_CVC_DIR/packer.lua"

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
	 'rose-pine/neovim', as = 'rose-pine' 
  })
  

  use({
      'folke/trouble.nvim',
      config = function()
          require('trouble').setup {
              icons = true,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('theprimeagen/refactoring.nvim')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'});

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use('folke/zen-mode.nvim')
  use('github/copilot.vim')
  use('laytan/cloak.nvim')
end)
EOF

cat <<'EOF' > "$NVIM_CVC_DIR/remap.lua"
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", "vim.lsp.buf.format")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/cvc/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
EOF



cat <<'EOF' > "$NVIM_CONFIG_DIR/after/plugin/lsp.lua"
local lsp = require("lsp-zero")

lsp.preset("recommended")


lsp.ensure_installed({
  'pyright',         -- for Python 
  'jdtls',           -- for Java
  'clangd',          -- for C and C++
  'tsserver',        -- for TypeScript and JavaScript
  'html',            -- for HTML
  'intelephense',    -- for PHP
  'sqlls',           -- for SQL
  'tailwindcss',     -- for Tailwind CSS
  'terraformls',     -- for Terraform
  'rust_analyzer',   -- for Rust 
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

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

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
EOF

cat <<'EOF' > "$NVIM_CONFIG_DIR/after/plugin/refactoring.lua"
require('refactoring').setup({})

vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
EOF

cat <<'EOF' > "$NVIM_CONFIG_DIR/after/plugin/telescope.lua"
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
EOF

cat <<'EOF' > "$NVIM_CONFIG_DIR/after/plugin/treesitter.lua"
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {"vimdoc", "python", "javascript", "typescript", "c", "cpp", "lua", "rust",
    "haskell", "html", "css", "java", "bash", "erlang" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

cat <<'EOF' > "$NVIM_CONFIG_DIR/after/plugin/fugitive.lua"

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("CVC_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = CVC_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})
EOF

cat <<'EOF' > "$NVIM_CONFIG_DIR/after/plugin/trouble.lua"
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
EOF

cat <<'EOF' > "$NVIM_CONFIG_DIR/after/plugin/undotree.lua"
vim.keymap.set("n", "<leader>u",vim.cmd.UndotreeToggle)
EOF

cat <<'EOF' > "$NVIM_CONFIG_DIR/after/plugin/zenmode.lua"

vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 90,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
end)


vim.keymap.set("n", "<leader>zZ", function()
    require("zen-mode").setup {
        window = {
            width = 80,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = false
    vim.wo.rnu = false
    vim.opt.colorcolumn = "0"
end)
EOF
cat <<'EOF' > "$NVIM_CONFIG_DIR/after/plugin/colors.lua"
require('rose-pine').setup({
    disable_background = true
})
vim.cmd.colorscheme "rose-pine"
EOF
# after installation 
nvim ~/.config/nvim/lua/cvc/packer.lua +so +PackerSync


