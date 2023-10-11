local love = require("love")
local fonts = require("fonts")
local buttons = require("buttons")

local function homeScreen()
  local text_distance = 10
  local game_title = "ARtefAto"
  local game_author = "por Adriel Faria dos Santos"


  return {
    draw = function(self)
      local window_width = love.graphics.getWidth()
      local window_height = love.graphics.getHeight()

      local total_text_height = fonts.display.large:getHeight() + fonts.commonText.normal:getHeight() + text_distance
      local text_start_height = window_height / 2 - total_text_height / 2

      love.graphics.setColor(1, 1, 1)
      love.graphics.setFont(fonts.display.large)
      love.graphics.print(
        game_title,
        window_width / 2 - fonts.display.large:getWidth(game_title) / 2,
        text_start_height
      )

      love.graphics.setFont(fonts.commonText.normal)
      love.graphics.print(
        game_author,
        window_width / 2 - fonts.commonText.normal:getWidth(game_author) / 2,
        text_start_height + text_distance + fonts.display.large:getHeight()
      )

      local buttons_total_width = 0
      local i = 1;
      for _, button in pairs(buttons.home) do
        button.x = window_width - button.width - 10 * i - buttons_total_width
        button.y = window_height - button.height - 10
        button:draw()
        buttons_total_width = buttons_total_width + button.width
        i = i + 1
      end
    end
  }
end

return homeScreen()
