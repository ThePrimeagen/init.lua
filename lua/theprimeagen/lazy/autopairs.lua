-- Auto-pairs plugin that automatically inserts closing brackets, quotes, and parentheses
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true,
            ts_config = {
                lua = {'string'},
                javascript = {'template_string'},
                java = false,
            }
        })
        
        -- Integration with nvim-cmp
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end
}