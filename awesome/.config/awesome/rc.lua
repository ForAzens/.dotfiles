-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local menubar = require("menubar")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

require("main.error-handling")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
local home = os.getenv("HOME")
beautiful.init(home .. "/.config/awesome/themes/clone/theme.lua")

RC = {}
RC.vars = require("main.user-variables")

-- This is used later as the default terminal and editor to run.
terminal = RC.vars.terminal
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = RC.vars.modkey

local main = {
  layouts = require("main.layouts"),
  tags = require("main.tags"),
  menu = require("main.menu"),
  rules = require("main.rules")
}

local bindings = {
  globalbuttons = require("bindings.globalbuttons"),
  clientbuttons = require("bindings.clientbuttons"),
  globalkeys = require("bindings.globalkeys"),
  clientkeys = require("bindings.clientkeys"),
  bindtotags = require("bindings.bindtotags")
}

RC.layouts = main.layouts()
RC.tags = main.tags()

-- {{{ menu

RC.mainmenu = main.menu()
RC.launcher = awful.widget.launcher({
  image = beautiful.awesome_subicon,
  menu = RC.mainmenu
})

menubar.utils.terminal = RC.vars.terminal
-- }}}

local statusbar = require("statusbar.default.statusbar")

statusbar()

-- {{{ Mouse bindings
root.buttons(bindings.globalbuttons())
-- }}}

-- {{{ Key bindings

RC.globalkeys = bindings.globalkeys()
RC.globalkeys = bindings.bindtotags(RC.globalkeys)

-- Set keys
root.keys(RC.globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = main.rules(bindings.clientkeys(), bindings.clientbuttons())
-- }}}

-- {{{ Signals
require("main.signals")
-- }}}

-- Autostart
awful.spawn.with_shell("~/.screenlayout/dual-monitor.sh")
awful.spawn.with_shell("picom")
awful.spawn.with_shell("sleep 2 && nitrogen --restore")
