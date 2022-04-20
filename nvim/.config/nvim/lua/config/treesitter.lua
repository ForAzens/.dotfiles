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

local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.javascript = "tsx"
ft_to_parser["typescript.tsx"] = "tsx"
