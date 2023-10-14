local love = require("love")
local fonts = require("fonts")
local buttons = require("buttons")

local function homeScreen()
  local textDistance = 10
  local gameTitle = "ARtefAto"
  local gameAuthor = "por Adriel Faria dos Santos"


  return {
    draw = function(self)
      local windowWidth = love.graphics.getWidth()
      local windowHeight = love.graphics.getHeight()

      local totalTextHeight = fonts.display.large:getHeight() + fonts.commonText.normal:getHeight() + textDistance
      local textStartHeight = windowHeight / 2 - totalTextHeight / 2

      love.graphics.setColor(1, 1, 1)
      love.graphics.setFont(fonts.display.large)
      love.graphics.print(
        gameTitle,
        windowWidth / 2 - fonts.display.large:getWidth(gameTitle) / 2,
        textStartHeight
      )

      love.graphics.setFont(fonts.commonText.normal)
      love.graphics.print(
        gameAuthor,
        windowWidth / 2 - fonts.commonText.normal:getWidth(gameAuthor) / 2,
        textStartHeight + textDistance + fonts.display.large:getHeight()
      )

      local buttonsTotalWidth = 0
      local keys = {}
      for key, _ in pairs(buttons.home) do
        table.insert(keys, 1, key)
      end
      table.sort(keys, function(a, b) return a:upper() < b:upper() end)

      for i = 1, #keys do
        local button = buttons.home[keys[i]]
        button.x = windowWidth - button.width - 10 * i - buttonsTotalWidth
        button.y = windowHeight - button.height - 10
        button:draw()

        buttonsTotalWidth = buttonsTotalWidth + button.width
      end
    end
  }
end

return homeScreen()
