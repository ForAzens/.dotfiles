vim.g.vimwiki_list = {}

vim.g.vimwiki_automatic_nested_syntaxes = 1
vim.g.vimwiki_links_space_char = '_'

-- Custom config

local config = {
  rootPath = os.getenv("HOME") .. '/wiki',
  maxDepth = 3,
  ignoreFolders = { 'node_modules', '.git' },
  wikiConfig = { syntax = 'markdown', ext = '.md' }
}

local scan_dir = require('plenary.scandir').scan_dir

-- Generate config for the folder which has an index.md in their root
local getWikiFolders = function()
  local wikiFolders = scan_dir(config.rootPath,
    { depth = config.maxDepth, search_pattern = "index.md", respect_gitignore = true })

  local list = {}

  for _, f in ipairs(wikiFolders) do
    local path = string.gsub(f, "/index.md", "")
    local name = string.gsub(path, config.rootPath, "")

    if string.len(name) == 0 then
      name = '/'
    end

    local item = {
      name = name,
      path = path,
      syntax = config.wikiConfig.syntax,
      ext = config.wikiConfig.ext,
    }
    table.insert(list, item)
  end

  return list
end

local updateWikiFolders = function()
  local folders_list = getWikiFolders()

  vim.g.vimwiki_list = folders_list
  vim.api.nvim_call_function("vimwiki#vars#init", {})
end

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- Telescope picker to change selected wiki
local selectNewWikiPicker = function(opts)
  opts = opts or {}
  local results = {}
  local number_of_wikis = vim.api.nvim_call_function("vimwiki#vars#number_of_wikis", {})

  for idx = 1, number_of_wikis do
    local item = {
      index = idx,
      name = vim.api.nvim_call_function("vimwiki#vars#get_wikilocal", { "name", idx - 1 }),
      path = vim.api.nvim_call_function("vimwiki#vars#get_wikilocal", { "path", idx - 1 })
    }
    table.insert(results, item)
  end

  pickers.new(opts, {
    prompt_title = "Choose a Wiki",
    finder = finders.new_table {
      results = results,
      entry_maker = function(entry)
        return {
          value = tonumber(entry.index),
          display = entry.name,
          ordinal = entry.name,
        }
      end
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        updateWikiFolders()
        local selection = action_state.get_selected_entry()
        vim.api.nvim_call_function("vimwiki#base#goto_index", { selection.value })
      end)
      return true
    end,
  }):find()
end

-- Telescope picker to search within the wiki folder
local allWikisGrep = function()
  require("telescope.builtin").live_grep({ cwd = config.rootPath })
end

-- Telescope picker to search files in the wiki folder
local wikiFiles = function()
  require("telescope.builtin").find_files({ cwd = config.rootPath })
end

-- Telescope picker to insert a link from any other wiki
local setOrCreateLink = function(opts)
  opts = opts or {}
  local files = scan_dir(config.rootPath,
    { depth = config.maxDepth, respect_gitignore = true })

  local results = {}

  for _, f in ipairs(files) do
    local item = {
      name = string.gsub(f, config.rootPath, ""),
      path = f
    }
    table.insert(results, item)
  end

  pickers.new(opts, {
    prompt_title = "Create o set a new wiki link",
    finder = finders.new_table {
      results = results,
      entry_maker = function(entry)
        return {
          value = entry.path,
          display = entry.name,
          ordinal = entry.name,
        }
      end
    },
    sorter = conf.generic_sorter(opts),
    previewer = require("telescope.config").values.file_previewer(opts),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)

        local selection = action_state.get_selected_entry()
        local wiki_path = vim.api.nvim_call_function("vimwiki#vars#get_wikilocal", { "path" })
        local selected_filepath = selection.value
        local buf_name = vim.fn.fnamemodify(selected_filepath, ":t:r") -- Get filename without path or extension. See :h filename-modifiers for more info

        local relative_path = vim.api.nvim_call_function("vimwiki#path#relpath", { wiki_path, selected_filepath })

        local link = "[" .. buf_name .. "](" .. relative_path .. ")"
        vim.api.nvim_put({ link }, "", true, true)
      end)
      return true
    end,
  }):find()

end


vim.keymap.set('n', '<leader>ws', selectNewWikiPicker)
vim.keymap.set('n', '<leader>wf', wikiFiles)
vim.keymap.set('n', '<leader>wg', allWikisGrep)
vim.keymap.set('n', '<leader>wl', setOrCreateLink)
vim.keymap.set('n', '<leader>ww', "<cmd>VimwikiIndex 1<CR>")


-- Update the wiki folders when executing neovim
updateWikiFolders()
