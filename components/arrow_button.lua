local love = require("love")
local menuButtonStyle = require("styles").menu.button

local function arrowButton(
  buttonDirection,
  shapeSize,
  onClick,
  onClickParam,
  x, y
)
  return {
    buttonDirection = buttonDirection or "left",
    state = "normal",
    x = x or 0,
    y = y or 0,
    shapeSize = shapeSize or 32,
    onClick = onClick,
    onClickParam = onClickParam,

    checkClick = function(self, mouse_x, mouse_y)
      if self:isHorvering(mouse_x, mouse_y) then
        if self.onClick then
          if self.onClickParam then
            self.onClick(self.onClickParam)
          else
            self.onClick()
          end
        end
      end
    end,

    draw = function(self)
      love.graphics.setColor(
        menuButtonStyle.states[self.state].bg[1],
        menuButtonStyle.states[self.state].bg[2],
        menuButtonStyle.states[self.state].bg[3]
      )

      love.graphics.rectangle(
        menuButtonStyle.states[self.state].mode,
        self.x,
        self.y,
        self.shapeSize + menuButtonStyle.padding[1] * 2,
        self.shapeSize + menuButtonStyle.padding[2] * 2,
        menuButtonStyle.radius[1],
        menuButtonStyle.radius[2]
      )

      local vertices = {}
      if self.buttonDirection == "left" then
        vertices = {
          self.x + menuButtonStyle.padding[1],
          self.y + menuButtonStyle.padding[2] + (self.shapeSize / 2),
          self.x + menuButtonStyle.padding[1] + self.shapeSize,
          self.y + menuButtonStyle.padding[2],
          self.x + menuButtonStyle.padding[1] + self.shapeSize,
          self.y + menuButtonStyle.padding[2] + self.shapeSize,
        }
      elseif self.buttonDirection == "right" then
        vertices = {
          self.x + menuButtonStyle.padding[1] + self.shapeSize,
          self.y + menuButtonStyle.padding[2] + (self.shapeSize / 2),
          self.x + menuButtonStyle.padding[1],
          self.y + menuButtonStyle.padding[2],
          self.x + menuButtonStyle.padding[1],
          self.y + menuButtonStyle.padding[2] + self.shapeSize,
        }
      elseif self.buttonDirection == "top" or self.buttonDirection == "up" then
        vertices = {
          self.x + menuButtonStyle.padding[1] + (self.shapeSize / 2),
          self.y + menuButtonStyle.padding[2],
          self.x + menuButtonStyle.padding[1],
          self.y + menuButtonStyle.padding[2] + self.shapeSize,
          self.x + menuButtonStyle.padding[1] + self.shapeSize,
          self.y + menuButtonStyle.padding[2] + self.shapeSize,
        }
      elseif self.buttonDirection == "down" or self.buttonDirection == "bottom" then
        vertices = {
          self.x + menuButtonStyle.padding[1] + (self.shapeSize / 2),
          self.y + menuButtonStyle.padding[2] + self.shapeSize,
          self.x + menuButtonStyle.padding[1],
          self.y + menuButtonStyle.padding[2],
          self.x + menuButtonStyle.padding[1] + self.shapeSize,
          self.y + menuButtonStyle.padding[2],
        }
      end
      love.graphics.setColor(
        menuButtonStyle.states[self.state].text_color[1],
        menuButtonStyle.states[self.state].text_color[2],
        menuButtonStyle.states[self.state].text_color[3]
      )
      love.graphics.polygon(
        "fill",
        vertices
      )
    end,

    height = function(self)
      return self.shapeSize + menuButtonStyle.padding[2] * 2
    end,

    isHorvering = function(self, mouse_x, mouse_y)
      if (
            mouse_x >= self.x and mouse_x <= self.x + self:width() and
            mouse_y >= self.y and mouse_y <= self.y + self:height()
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

    width = function(self)
      return self.shapeSize + menuButtonStyle.padding[1] * 2
    end
  }
end

return arrowButton
