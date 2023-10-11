local menuButton = require("components.menu_button")

local function backButton(text, x, y)
  local button = menuButton(
    text,
    function()
      _G.current_screen = _G.previous_screen
      _G.previous_screen = nil
    end,
    nil,
    x,
    y)

  return button
end

return backButton
