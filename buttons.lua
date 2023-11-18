local arrowButton = require("components.arrowButton")
local backButton = require("components.backButton")
local menuButton = require("components.menuButton")
local love = require("love")

return {
  home = {
    _1_exit = menuButton("Sair", love.event.quit),
    _2_settings = menuButton("Config.", function() _G.navigateTo("settings") end),
    _3_play = menuButton("Jogar", function() _G.navigateTo("game") end),
  },
  settings = {
    back = backButton("Voltar"),
    increaseScale = arrowButton("right", 16),
    decreaseScale = arrowButton("left", 16),
  },
  game = {}
}
