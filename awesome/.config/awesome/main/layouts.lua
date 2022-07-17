local awful = require("awful")

local _M = {}

function _M.get()
  local layouts = {
    awful.layout.suit.floating, -- 1
    awful.layout.suit.tile, -- 2
    awful.layout.suit.tile.left, -- 3
    awful.layout.suit.tile.bottom, -- 4
    awful.layout.suit.tile.top, -- 5
    awful.layout.suit.fair, -- 6
    awful.layout.suit.fair.horizontal, -- 7
    awful.layout.suit.spiral, -- 8
    awful.layout.suit.spiral.dwindle, awful.layout.suit.max,
    awful.layout.suit.max.fullscreen, awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,

  }

  return layouts
end

---@diagnostic disable-next-line: redundant-parameter
return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
