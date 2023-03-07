local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  { import = "forazens.plugins" },
  'theprimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive',


  'christoomey/vim-tmux-navigator',

  'echasnovski/mini.ai',
  'echasnovski/mini.nvim',
  'echasnovski/mini.pairs',
  'echasnovski/mini.surround',


  -- use "elihunter173/dirbuf.nvim"
  "stevearc/oil.nvim"
})
