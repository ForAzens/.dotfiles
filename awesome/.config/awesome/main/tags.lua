local awful = require("awful")

local _M = {}

function _M.get()
  tags = {}

  awful.screen.connect_for_each_screen(function(s)
    tags[s] = awful.tag({
      "1. 一 ", "2. 二 ", "3. 三 ", "4. 四 ", "5. 五 ", "6. 六 ",
      "7. 七 ", "8. 八 ", "9. 九 "
    }, s, RC.layouts[8])
  end)
end

---@diagnostic disable-next-line: redundant-parameter
return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
