local love = require("love")
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

    checkClick = function(self, mouse_x, mouse_y)
      if self:isHorvering(mouse_x, mouse_y) then
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
      local font        = menuButtonStyle.font
      local text_width  = font:getWidth(text)
      local text_height = font:getHeight()

      love.graphics.setColor(
        menuButtonStyle.states[self.state].bg[1],
        menuButtonStyle.states[self.state].bg[2],
        menuButtonStyle.states[self.state].bg[3]
      )

      love.graphics.rectangle(
        menuButtonStyle.states[self.state].mode,
        self.x,
        self.y,
        text_width + menuButtonStyle.padding[1] * 2,
        text_height + menuButtonStyle.padding[2] * 2,
        menuButtonStyle.radius[1],
        menuButtonStyle.radius[2]
      )

      love.graphics.setColor(
        menuButtonStyle.states[self.state].text_color[1],
        menuButtonStyle.states[self.state].text_color[2],
        menuButtonStyle.states[self.state].text_color[3]
      )
      love.graphics.setFont(font)
      love.graphics.print(
        text,
        self.x + menuButtonStyle.padding[1],
        self.y + menuButtonStyle.padding[2]
      )
    end,

    height =
        menuButtonStyle.font:getHeight() + menuButtonStyle.padding[2] * 2,

    isHorvering = function(self, mouse_x, mouse_y)
      if (
            mouse_x >= self.x and mouse_x <= self.x + self.width and
            mouse_y >= self.y and mouse_y <= self.y + self.height
          ) then
        return true
      end
      return false
    end,

    update = function(self, mouse_x, mouse_y)
      if (self:isHorvering(mouse_x, mouse_y)) then
        self.state = "hover"
      else
        self.state = "normal"
      end
    end,

    width = menuButtonStyle.font:getWidth(text) + menuButtonStyle.padding[1] * 2,
  }
end

return menuButton
