local menuButton = require("components.menuButton")

local function backButton(text, x, y)
  local button = menuButton(
    text,
    function()
      _G.currentScreen = _G.previousScreen
      _G.previousScreen = nil
    end,
    nil,
    x,
    y)

  return button
end

return backButton
