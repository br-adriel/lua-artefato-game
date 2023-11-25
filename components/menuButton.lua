local menuButtonStyle = require("styles").menu.button

local function menuButton(
  buttonText,
  onClick,
  onClickParam,
  x, y
)
  local text = buttonText or ""

  return {
    state = "normal",
    x = x or 0,
    y = y or 0,

    checkClick = function(self, mouseX, mouseY)
      if self:isHorvering(mouseX, mouseY) then
        if onClick then
          if onClickParam then
            onClick(onClickParam)
          else
            onClick()
          end
        end
      end
    end,

    draw = function(self)
      local font       = menuButtonStyle.font
      local textWidth  = font:getWidth(text)
      local textHeight = font:getHeight()

      _G.love.graphics.setColor(
        menuButtonStyle.states[self.state].bg[1],
        menuButtonStyle.states[self.state].bg[2],
        menuButtonStyle.states[self.state].bg[3]
      )

      _G.love.graphics.rectangle(
        menuButtonStyle.states[self.state].mode,
        self.x,
        self.y,
        textWidth + menuButtonStyle.padding[1] * 2,
        textHeight + menuButtonStyle.padding[2] * 2,
        menuButtonStyle.radius[1],
        menuButtonStyle.radius[2]
      )

      _G.love.graphics.setColor(
        menuButtonStyle.states[self.state].textColor[1],
        menuButtonStyle.states[self.state].textColor[2],
        menuButtonStyle.states[self.state].textColor[3]
      )
      _G.love.graphics.setFont(font)
      _G.love.graphics.print(
        text,
        self.x + menuButtonStyle.padding[1],
        self.y + menuButtonStyle.padding[2]
      )
    end,

    height =
        menuButtonStyle.font:getHeight() + menuButtonStyle.padding[2] * 2,

    isHorvering = function(self, mouseX, mouseY)
      if (
            mouseX >= self.x and mouseX <= self.x + self.width and
            mouseY >= self.y and mouseY <= self.y + self.height
          ) then
        return true
      end
      return false
    end,

    update = function(self, mouseX, mouseY)
      if (self:isHorvering(mouseX, mouseY)) then
        self.state = "hover"
      else
        self.state = "normal"
      end
    end,

    width = menuButtonStyle.font:getWidth(text) + menuButtonStyle.padding[1] * 2,
  }
end

return menuButton
