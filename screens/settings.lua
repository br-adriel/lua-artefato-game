local love = require("love")
local fonts = require("fonts")
local buttons = require("buttons")
local settingLine = require("components.setting_line")

local function settingsScreen()
  local screen_title = "confiGuRAções"

  return {
    draw = function(self)
      local window_width = love.graphics.getWidth()
      local window_height = love.graphics.getHeight()

      love.graphics.setColor(1, 1, 1)
      love.graphics.setFont(fonts.display.large)
      love.graphics.print(
        screen_title,
        window_width / 2 - fonts.display.large:getWidth(screen_title) / 2,
        50
      )

      settingLine("Escala", 0, fonts.display.large:getHeight() + 50, "1.0"):draw()

      for label, button in pairs(buttons.settings) do
        button:draw()
      end
    end
  }
end

return settingsScreen()
