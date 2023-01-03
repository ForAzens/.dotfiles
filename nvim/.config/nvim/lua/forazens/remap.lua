vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Allow to move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Fix API erros when using Ctrl-C
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- Quickfix navigation
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- Tmux navigator
vim.keymap.set('n', '<C-w>h', ':TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('n', '<C-w>j', ':TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('n', '<C-w>k', ':TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('n', '<C-w>l', ':TmuxNavigateRight<CR>', { silent = true })
