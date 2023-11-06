local menuButton = require("components.menuButton")

local function backButton(text, x, y)
  local button = menuButton(
    text,
    function()
      _G.currentScreen = table.remove(_G.previousScreens)
      _G.screenChanged = true
    end,
    nil,
    x,
    y)

  return button
end

return backButton
