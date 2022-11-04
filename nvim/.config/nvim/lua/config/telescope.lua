require("telescope").setup {
  defaults = { file_ignore_patterns = {
    ".git/",
    "node_modules",
    "%.lock",
    "%.sqlite3",
    "%.ipynb",
    "%.jpg",
    "%.jpeg",
    "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    "%.webp",
    ".vscode/",
    "build/",
    "node_modules/",
    "%.pdb",
    "%.dll",
    "%.class",
    "%.exe",
    "%.cache",
    "%.ico",
    "%.pdf",
    "%.dylib",
    "%.jar",
    "%.docx",
    "%.met"
  } }
}

require("telescope").load_extension("fzf")
