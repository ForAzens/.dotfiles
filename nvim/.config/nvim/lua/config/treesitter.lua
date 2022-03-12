require'nvim-treesitter.configs'.setup {
    highlight = {enable = true, disable = {}},
    indent = {enable = false, disable = {}},
    ensure_installed = {
        "tsx", "json", "yaml", "html", "scss", "javascript", "css", "bash",
        "dockerfile", "lua", "query", "ruby", "rust", "svelte", "typescript",
        "vim", "vue"
    },
    context_commentstring = {enable = true},
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        }
    }
}

local parser_config = require"nvim-treesitter.parsers".get_parser_configs()

parser_config.tsx.used_by = {"javascript", "typescript.tsx"}
