local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Notification library
--
local _M = {}

local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist = require("deco.taglist"),
  tasklist = require("deco.tasklist")
}

-- }}}
--
function _M.init()
  local taglist_buttons = deco.taglist()
  local tasklist_buttons = deco.tasklist()

  -- Keyboard map indicator and switcher
  mykeyboardlayout = awful.widget.keyboardlayout()

  -- {{{ Wibar
  -- Create a textclock widget
  mytextclock = wibox.widget.textclock()

  awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
      awful.button({}, 1, function()
        awful.layout.inc(1)
      end), awful.button({}, 3, function() awful.layout.inc(-1) end),
      awful.button({}, 4, function()
        awful.layout.inc(1)
      end), awful.button({}, 5, function() awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
      screen = s,
      filter = awful.widget.taglist.filter.all,
      buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
      screen = s,
      filter = awful.widget.tasklist.filter.currenttags,
      buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        mylauncher,
        s.mytaglist,
        s.mypromptbox
      },
      s.mytasklist, -- Middle widget
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        mykeyboardlayout,
        wibox.widget.systray(),
        mytextclock,
        s.mylayoutbox
      }
    }
  end)
end

---@diagnostic disable-next-line: redundant-parameter
return setmetatable({}, { __call = function(_, ...) return _M.init(...) end })
