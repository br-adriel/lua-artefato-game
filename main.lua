local love = require("love")
local homeScreen = require("screens.home")
local settingsScreen = require("screens.settings")
local buttons = require("buttons")

local screens = {
  home = homeScreen,
  settings = settingsScreen,
}

_G.previousScreens = {}
_G.currentScreen = 'home'
_G.screenChanged = false

function love.mousepressed(x, y, button, isTouch, presses)
  if button == 1 then
    for _, btn in pairs(buttons[currentScreen]) do
      btn:checkClick(x, y)
    end
  end
end

function love.load()
  if screens[currentScreen].load then
    screens[currentScreen]:load()
  end
end

function love.update(dt)
  if _G.screenChanged then
    if screens[currentScreen].load then
      screens[currentScreen]:load()
    end

    _G.screenChanged = false
  end

  for _, button in pairs(buttons[currentScreen]) do
    button:update(love.mouse.getPosition())
  end

  if screens[currentScreen].update then
    screens[currentScreen]:update(dt)
  end
end

function love.draw()
  screens[currentScreen]:draw()
end
