local love = require("love")
local homeScreen = require("screens.home")
local settingsScreen = require("screens.settings")
local gameScreen = require("screens.game")
local buttons = require("buttons")
local world01 = require("maps.world01")
local player = require("characters.player")

_G.love = love

-- restreamento de telas
local screens = {
  home = homeScreen,
  settings = settingsScreen,
  game = gameScreen,
}

_G.previousScreens = {}
_G.currentScreen = 'home'
_G.screenChanged = false
_G.navigateTo = function(screen)
  table.insert(_G.previousScreens, _G.currentScreen)
  _G.currentScreen = screen
  _G.screenChanged = true
end

-- reastreamento de nivel/mapa
_G.world = world01.world
_G.currentMap = world01.map00
_G.player = player


function _G.love.mousepressed(x, y, button, isTouch, presses)
  if button == 1 then
    for _, btn in pairs(buttons[currentScreen]) do
      btn:checkClick(x, y)
    end
  end
end

function _G.love.keypressed(key)
  _G.player:jump(key)
end

function _G.love.load()
  _G.love.graphics.setDefaultFilter("nearest", "nearest")
  if screens[currentScreen].load then
    screens[currentScreen]:load()
  end
end

function _G.love.update(dt)
  if _G.screenChanged then
    if screens[currentScreen].load then
      screens[currentScreen]:load()
    end

    _G.screenChanged = false
  end

  for _, button in pairs(buttons[currentScreen]) do
    button:update(_G.love.mouse.getPosition())
  end

  if screens[currentScreen].update then
    screens[currentScreen]:update(dt)
  end
end

function _G.love.draw()
  screens[currentScreen]:draw()
end
