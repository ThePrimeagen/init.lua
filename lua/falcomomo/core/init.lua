-- Set the package.path for plugins configuration
package.path = vim.fn.stdpath("config") .. "/lua/falcomomo/plugins/configs/?.lua;" .. package.path
package.path = vim.fn.stdpath("config") .. "/lua/falcomomo/plugins/configs/?/init.lua;" .. package.path

require("falcomomo.core.options")
require("falcomomo.core.keymaps")

-- Initialize plugins
require("falcomomo.plugins")
