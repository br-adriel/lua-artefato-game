local arrowButton = require("components.arrowButton")
local backButton = require("components.backButton")
local menuButton = require("components.menuButton")
local love = require("love")

return {
  home = {
    exit = menuButton("Sair", love.event.quit),
    settings = menuButton("Configurações", function()
      _G.previousScreen = "home"
      _G.currentScreen = "settings"
    end)
  },
  settings = {
    back = backButton("Voltar"),
    increaseScale = arrowButton("right", 16),
    decreaseScale = arrowButton("left", 16),
  }
}
