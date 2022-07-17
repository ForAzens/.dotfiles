local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local beautiful = require("beautiful")

-- Load Debian menu entries
-- local debian = require("debian.menu")
-- local has_fdo, freedesktop = pcall(require, "freedesktop")

local M = {} -- menu
local _M = {} -- module

local terminal = RC.vars.terminal

local editor = os.getenv("EDITOR") or "editor"
local editor_cmd = terminal .. " -e " .. editor

M.awesome = {
  {
    "hotkeys",
    function() hotkeys_popup.show_help(nil, awful.screen.focused()) end
  }, { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart }, { "quit", function() awesome.quit() end }
}

function _M.get()
  local menu_awesome = { "awesome", M.awesome, beautiful.awesome_subicon }
  local menu_terminal = { "open terminal", terminal }

  local main_menu = {}

  if has_fdo then
    main_menu = freedesktop.menu.build({
      before = { menu_awesome },
      after = { menu_terminal }
    })
  else
    main_menu = awful.menu({ items = { menu_awesome, menu_terminal } })
  end

  return main_menu
end

---@diagnostic disable-next-line: redundant-parameter
return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
