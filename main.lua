local love = require("love")
local homeScreen = require("screens.home")
local settingsScreen = require("screens.settings")
local buttons = require("buttons")

local screens = {
  home = homeScreen,
  settings = settingsScreen,
}

_G.previous_screen = 'home'
_G.current_screen = 'home'

function love.mousepressed(x, y, button, isTouch, presses)
  if button == 1 then
    for _, btn in pairs(buttons[current_screen]) do
      btn:checkClick(x, y)
    end
  end
end

function love.update(dt)
  for _, button in pairs(buttons[current_screen]) do
    button:update(love.mouse.getPosition())
  end
end

function love.draw()
  screens[current_screen]:draw()
end
