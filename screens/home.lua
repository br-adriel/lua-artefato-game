local love = require("love")
local fonts = require("fonts")

local function homeScreen()
  local text_distance = 10
  local game_title = "ARtefAto"
  local game_author = "por Adriel Faria dos Santos"

  return {
    draw = function(self)
      local total_text_height = fonts.display.large:getHeight() + fonts.commonText.normal:getHeight() + text_distance
      local text_start_height = love.graphics.getHeight() / 2 - total_text_height / 2

      love.graphics.setFont(fonts.display.large)
      love.graphics.print(
        game_title,
        love.graphics.getWidth() / 2 - fonts.display.large:getWidth(game_title) / 2,
        text_start_height
      )

      love.graphics.setFont(fonts.commonText.normal)
      love.graphics.print(
        game_author,
        love.graphics.getWidth() / 2 - fonts.commonText.normal:getWidth(game_author) / 2,
        text_start_height + text_distance + fonts.display.large:getHeight()
      )
    end
  }
end

return homeScreen()
