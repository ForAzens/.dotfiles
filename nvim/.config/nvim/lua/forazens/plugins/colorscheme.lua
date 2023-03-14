return {
    -- Lazy
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function(_, _)
        require('onedarkpro').setup({
            options = {cursorline = true, highlight_inactive_windows = true}
        })
        vim.cmd('colorscheme onedark_vivid')
    end
}
