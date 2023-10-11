local menuButton = require("components.menu_button")
local backButton = require("components.back_button")
local arrowButton = require("components.arrow_button")
local love = require("love")

return {
  home = {
    exit = menuButton("Sair", love.event.quit),
    settings = menuButton("Configurações", function()
      _G.previous_screen = "home"
      _G.current_screen = "settings"
    end)
  },
  settings = {
    back = backButton("Voltar", 50, 50),
  }
}
