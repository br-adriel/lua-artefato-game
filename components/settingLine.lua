local styles = require("styles")
local arrowButton = require("components.arrowButton")

local function settingLine(settingName, x, y, value, leftButton, rightButton)
  local name = settingName or ""
  local leftBtn = leftButton or arrowButton("left")
  local rightBtn = rightButton or arrowButton("right")
  local style = styles.menu.setting

  return {
    value = value or "",

    draw = function(self)
      local windowWidth = _G.love.graphics.getWidth()
      local textY = y + style.padding[2] + (rightBtn:height() - style.font:getHeight()) / 2

      _G.love.graphics.setColor(1, 1, 1)
      _G.love.graphics.setFont(style.font)
      _G.love.graphics.print(
        name,
        x + style.padding[1],
        textY
      )

      rightBtn.x = windowWidth - style.padding[1] - rightBtn:width()
      rightBtn.y = y + style.padding[2]
      rightBtn:draw()

      leftBtn.x = rightBtn.x - style.font:getWidth(self.value) - leftBtn:width() - style.gap * 2
      leftBtn.y = y + style.padding[2]
      leftBtn:draw()

      _G.love.graphics.setColor(1, 1, 1)
      _G.love.graphics.setFont(style.font)
      _G.love.graphics.print(
        self.value,
        leftBtn.x + leftBtn:width() + style.gap,
        textY
      )
    end,
  }
end

return settingLine
