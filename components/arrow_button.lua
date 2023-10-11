local love = require("love")
local styles = require("styles")

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
      local font = styles.menu.button.font

      love.graphics.setColor(
        styles.menu.button.states[self.state].bg[1],
        styles.menu.button.states[self.state].bg[2],
        styles.menu.button.states[self.state].bg[3]
      )

      love.graphics.rectangle(
        styles.menu.button.states[self.state].mode,
        self.x,
        self.y,
        self.shapeSize + styles.menu.button.padding[1] * 2,
        self.shapeSize + styles.menu.button.padding[2] * 2,
        styles.menu.button.radius[1],
        styles.menu.button.radius[2]
      )

      love.graphics.setColor(
        styles.menu.button.states[self.state].text_color[1],
        styles.menu.button.states[self.state].text_color[2],
        styles.menu.button.states[self.state].text_color[3]
      )
      love.graphics.setFont(font)

      local vertices = {}
      if self.buttonDirection == "left" then
        vertices = {
          self.x + styles.menu.button.padding[1],
          self.y + styles.menu.button.padding[2] + (self.shapeSize / 2),
          self.x + styles.menu.button.padding[1] + self.shapeSize,
          self.y + styles.menu.button.padding[2],
          self.x + styles.menu.button.padding[1] + self.shapeSize,
          self.y + styles.menu.button.padding[2] + self.shapeSize,
        }
      elseif self.buttonDirection == "right" then
        vertices = {
          self.x + styles.menu.button.padding[1] + self.shapeSize,
          self.y + styles.menu.button.padding[2] + (self.shapeSize / 2),
          self.x + styles.menu.button.padding[1],
          self.y + styles.menu.button.padding[2],
          self.x + styles.menu.button.padding[1],
          self.y + styles.menu.button.padding[2] + self.shapeSize,
        }
      elseif self.buttonDirection == "top" or self.buttonDirection == "up" then
        vertices = {
          self.x + styles.menu.button.padding[1] + (self.shapeSize / 2),
          self.y + styles.menu.button.padding[2],
          self.x + styles.menu.button.padding[1],
          self.y + styles.menu.button.padding[2] + self.shapeSize,
          self.x + styles.menu.button.padding[1] + self.shapeSize,
          self.y + styles.menu.button.padding[2] + self.shapeSize,
        }
      elseif self.buttonDirection == "down" or self.buttonDirection == "bottom" then
        vertices = {
          self.x + styles.menu.button.padding[1] + (self.shapeSize / 2),
          self.y + styles.menu.button.padding[2] + self.shapeSize,
          self.x + styles.menu.button.padding[1],
          self.y + styles.menu.button.padding[2],
          self.x + styles.menu.button.padding[1] + self.shapeSize,
          self.y + styles.menu.button.padding[2],
        }
      end
      love.graphics.polygon(
        "fill",
        vertices
      )
    end,

    height = function(self)
      return self.shapeSize + styles.menu.button.padding[2] * 2
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
        love.mouse.setCursor(love.mouse.getSystemCursor("hand"))
        self.state = "hover"
      else
        self.state = "normal"
        love.mouse.setCursor()
      end
    end,

    width = function(self)
      return self.shapeSize + styles.menu.button.padding[1] * 2
    end
  }
end

return arrowButton
