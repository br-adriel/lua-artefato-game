local love = require("love")
local fonts = require("fonts")
local menuButton = require("components.menu_button")

local exitButton = menuButton("Sair", love.event.quit)

function love.update(dt)
  exitButton:update(love.mouse.getPosition())
end

function love.mousepressed(x, y, button, isTouch, presses)
  if button == 1 then
    exitButton:checkClick(x, y)
  end
end

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

      exitButton.x = window_width - exitButton.width - 10
      exitButton.y = window_height - exitButton.height - 10
      exitButton:draw()
    end
  }
end

return homeScreen()
