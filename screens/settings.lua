local fonts = require("fonts")
local buttons = require("buttons").settings
local settingLine = require("components.settingLine")
local padding = require("styles").menu.setting.padding

local function settingsScreen()
  local screenTitle = "confiGuRAções"

  return {
    load = function(self)
    end,

    update = function(self)
    end,

    draw = function(self)
      local windowWidth = _G.love.graphics.getWidth()
      local windowHeight = _G.love.graphics.getHeight()
      local heightUnit = windowHeight / 500

      _G.love.graphics.setColor(1, 1, 1)
      _G.love.graphics.setFont(fonts.display.normal)
      _G.love.graphics.print(
        screenTitle,
        windowWidth / 2 - fonts.display.normal:getWidth(screenTitle) / 2,
        30 * heightUnit
      )

      settingLine(
        "Escala",
        0,
        fonts.display.normal:getHeight() + 30 * heightUnit * 2,
        "1.0",
        buttons.decreaseScale,
        buttons.increaseScale
      ):draw()

      local backButton = buttons.back
      backButton.x = windowWidth - padding[1] - backButton.width
      backButton.y = windowHeight - padding[2] - backButton.height
      backButton:draw()
    end
  }
end

return settingsScreen()
