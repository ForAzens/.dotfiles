local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>') -- jk to escape
utils.map('t', 'jk', '<C-\\><C-N>') -- jk to escape in terminal mode

-- File explorer
utils.map('n', '<leader>tt', ':NvimTreeToggle<CR>')
utils.map('n', '<leader>tr', ':NvimTreeRefresh<CR>')
utils.map('n', '<leader>tn', ':NvimTreeFindFile<CR>')

-- Git
utils.map('n', '<leader>gs', ':Neogit<CR>')
utils.map('n', '<leader>gb', ':Telescope git_branches<CR>')

-- Telescope
-- utils.map('n', '<leader>ff', ':Telescope find_files hidden=true<CR>')
-- utils.map('n', '<leader>fg', ':Telescope live_grep hidden=true<CR>')
-- utils.map('n', '<leader>fb', ':Telescope buffers<CR>')
-- utils.map('n', '<leader>fh', ':Telescope help_tags<CR>')
-- utils.map('n', '<leader>fs', ':Telescope live_grep<CR>')

utils.map('n', '<leader>gws',
  ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')
utils.map('n', '<leader>gwa',
  ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')

-- Hop
utils.map('n', 's', ':HopWord<CR>')

-- Quickfix
utils.map('n', '<leader>co', ':copen<CR>')
utils.map('n', '<C-n>', ':cnext<CR>')
utils.map('n', '<C-p>', ':cprevious<CR>')

-- Fix API erros when using Ctrl-C

utils.map('i', '<C-c>', '<Esc>')

-- Keeping it centered
utils.map('n', 'n', 'nzzzv')
utils.map('n', 'N', 'Nzzzv')
utils.map('n', 'J', 'mzJ`z')

-- Moving text
utils.map('v', 'J', ":m '>+1<CR>gv=gv")
utils.map('v', 'K', ":m '<-2<CR>gv=gv")
utils.map('n', '<leader>j', ':m .+1<CR>==')
utils.map('n', '<leader>k', ':m .-2<CR>==')

-- Tmux navigator
vim.cmd('let g:tmux_navigator_no_mappings = 1')
utils.map('n', '<C-w>h', ':TmuxNavigateLeft<CR>', { silent = true })
utils.map('n', '<C-w>j', ':TmuxNavigateDown<CR>', { silent = true })
utils.map('n', '<C-w>k', ':TmuxNavigateUp<CR>', { silent = true })
utils.map('n', '<C-w>l', ':TmuxNavigateRight<CR>', { silent = true })

-- Harpoon
utils.map('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>')
utils.map('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
utils.map('n', '<leader>tc',
  ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>')

utils.map('n', '<C-H>', ':lua require("harpoon.ui").nav_file(1)<CR>', { silent = true })
utils.map('n', '<C-J>', ':lua require("harpoon.ui").nav_file(2)<CR>', { silent = true })
utils.map('n', '<C-K>', ':lua require("harpoon.ui").nav_file(3)<CR>', { silent = true })
utils.map('n', '<C-L>', ':lua require("harpoon.ui").nav_file(4)<CR>', { silent = true })

-- Trouble
-- utils.map('n', '<leader>xx', ':Trouble<CR>', { silent = true, noremap = true })
-- utils.map('n', '<leader>xw', ':Trouble workspace_diagnostics<CR>', { silent = true, noremap = true })
-- utils.map('n', '<leader>xd', ':Trouble document_diagnostics<CR>', { silent = true, noremap = true })
-- utils.map('n', '<leader>xl', ':Trouble loclist<CR>', { silent = true, noremap = true })
-- utils.map('n', '<leader>xq', ':Trouble quickfix<CR>', { silent = true, noremap = true })
-- utils.map('n', '<leader>gR', ':Trouble lsp_references<CR>', { silent = true, noremap = true })

local wk = require("which-key")

wk.register({
  x = {
    name = "Diagnostics",
    x = { "<cmd>Trouble<CR>", "All", silent = true, noremap = true, },
    w = { "<cmd>Trouble workspace_diagnostics<CR>", "Workspace", silent = true, noremap = true },
    d = { "<cmd>Trouble document_diagnostics<CR>", "Current file", silent = true, noremap = true },
    l = { "<cmd>Trouble document_diagnostics<CR>", "Open loclist", silent = true, noremap = true },
    q = { "<cmd>Trouble document_diagnostics<CR>", "Open quickfix", silent = true, noremap = true }
  },
  f = {
    name = "Files",
    f = { "<cmd>Telescope find_files hidden=true<CR>", "Find files" },
    s = { "<cmd>Telescope live_grep hidden=true<CR>", "Search in files" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    h = { "<cmd>Telescope help_tags<CR>", "Help tags" }
  }
}, { prefix = "<leader>" })
