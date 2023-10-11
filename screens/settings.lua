local love = require("love")
local fonts = require("fonts")
local buttons = require("buttons").settings
local settingLine = require("components.setting_line")
local padding = require("styles").menu.setting.padding

local function settingsScreen()
  local screen_title = "confiGuRAções"

  return {
    draw = function(self)
      local window_width = love.graphics.getWidth()
      local window_height = love.graphics.getHeight()

      love.graphics.setColor(1, 1, 1)
      love.graphics.setFont(fonts.display.normal)
      love.graphics.print(
        screen_title,
        window_width / 2 - fonts.display.normal:getWidth(screen_title) / 2,
        50
      )

      settingLine(
        "Escala",
        0,
        fonts.display.normal:getHeight() + 50 * 2,
        "1.0",
        buttons.decreaseScale,
        buttons.increaseScale
      ):draw()

      local backButton = buttons.back
      backButton.x = window_width - padding[1] - backButton.width
      backButton.y = window_height - padding[2] - backButton.height
      backButton:draw()
    end
  }
end

return settingsScreen()
