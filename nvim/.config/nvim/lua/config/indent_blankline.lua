vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    context_patterns = {
        'class', 'function', 'method', 'jsx_element', '^block', '^object',
        '^table', '^for', '^while', 'if_statement', 'else_clause',
        'jsx_self_closing_element', 'try_statement', 'catch_clause',
        'switch_statement', 'switch_case', 'jsx_expression', 'import_statement',
        'operation_type', 'return_statement', 'if', 'else', 'array', 'hash',
        'module', 'argument_list'
    }
}
