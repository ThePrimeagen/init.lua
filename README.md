## Falcomomo's init.lua

Heavily based on the config by [ema2159](https://github.com/ema2159/nvimconfig).

### Plugin summary

* Plugin management by [lazy](https://github.com/folke/lazy.nvim)
* LSP configured by [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)
* LSP saga enhanced ui [lsp saga](https://github.com/nvimdev/lspsaga.nvim)
* NVIM dap ui [nvim dap ui](https://github.com/rcarriga/nvim-dap-ui)
* Telescope with ivy style searching [telescope](https://github.com/nvim-telescope/telescope.nvim)
* Notify and messages etc with noice [noice](https://github.com/folke/noice.nvim)

### How it works

init.lua loads up lazy. 

Set up the basic options in the core folder with options and keymaps.

Lazy configures everything.
In the plugins folder the init just asks lazy to load everything each of the 
editor, themes, tools, and ui files. Each of those files is just the initial 
configuration for lazy to load packages. The lazy configurations reference
specific config within the config subfolders if the package requires anything.

