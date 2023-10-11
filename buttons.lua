local menuButton = require("components.menu_button")
local backButton = require("components.back_button")
local arrowButton = require("components.arrow_button")
local love = require("love")

return {
  home = {
    menuButton("Sair", love.event.quit),
    menuButton("Configurações", function()
      _G.previous_screen = "home"
      _G.current_screen = "settings"
    end)
  },
  settings = {
    backButton("Voltar", 50, 50),
  }
}
