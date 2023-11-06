local arrowButton = require("components.arrowButton")
local backButton = require("components.backButton")
local menuButton = require("components.menuButton")
local love = require("love")

return {
  home = {
    exit = menuButton("Sair", love.event.quit),
    settings = menuButton("Config.", function()
      table.insert(_G.previousScreens, _G.currentScreen)
      _G.currentScreen = "settings"
      _G.screenChanged = true
    end)
  },
  settings = {
    back = backButton("Voltar"),
    increaseScale = arrowButton("right", 16),
    decreaseScale = arrowButton("left", 16),
  }
}
