local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>') -- jk to escape

-- File explorer
utils.map('n', '<leader>tt', ':NvimTreeToggle<CR>')
utils.map('n', '<leader>tr', ':NvimTreeRefresh<CR>')
utils.map('n', '<leader>tn', ':NvimTreeFindFile<CR>')

-- Reload neovim config
utils.map('n', '<leader>sv', ':source $MYVIMRC<CR>')

-- Git
utils.map('n', '<leader>gs', ':Neogit<CR>')
utils.map('n', '<leader>gb', ':Telescope git_branches<CR>')

-- Telescope
utils.map('n', '<leader>ff', ':Telescope find_files hidden=true<CR>')
utils.map('n', '<leader>fg', ':Telescope live_grep<CR>')
utils.map('n', '<leader>fb', ':Telescope buffers<CR>')
utils.map('n', '<leader>fh', ':Telescope help_tags<CR>')
utils.map('n', '<leader>fs', ':Telescope live_grep<CR>')

utils.map('n', '<leader>gws',
          ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')
utils.map('n', '<leader>gwa',
          ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')

-- Hop
utils.map('n', 's', ':HopWord<CR>')

-- Quickfix
utils.map('n', '<leader>co', ':copen<CR>')
utils.map('n', '<leader>cn', ':cnext<CR>')
utils.map('n', '<leader>cp', ':cprevious<CR>')

-- Fix API erros when using Ctrl-C
utils.map('i', '<C-c>', '<Esc>')

-- Open tmux sessionizer
utils.map('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>',
          {silent = true})

-- Keeping it centered
utils.map('n', 'n', 'nzzzv')
utils.map('n', 'N', 'Nzzzv')
utils.map('n', 'J', 'mzJ`z')

-- Moving text
utils.map('v', 'J', ":m '>+1<CR>gv=gv")
utils.map('v', 'K', ":m '<-2<CR>gv=gv")
utils.map('n', '<leader>j', ':m .+1<CR>==')
utils.map('n', '<leader>k', ':m .-2<CR>==')

