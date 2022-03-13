require("telescope").setup {
    defaults = {file_ignore_patterns = {"^.git/", "^node_modules/"}}
}

require("telescope").load_extension("fzf")
