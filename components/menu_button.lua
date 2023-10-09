local love = require("love")
local styles = require("styles")

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
      local font        = styles.menu.button.font
      local text_width  = font:getWidth(text)
      local text_height = font:getHeight()

      love.graphics.setColor(
        styles.menu.button.states[self.state].bg[1],
        styles.menu.button.states[self.state].bg[2],
        styles.menu.button.states[self.state].bg[3]
      )

      love.graphics.rectangle(
        styles.menu.button.states[self.state].mode,
        self.x,
        self.y,
        text_width + styles.menu.button.padding[1] * 2,
        text_height + styles.menu.button.padding[2] * 2,
        styles.menu.button.radius[1],
        styles.menu.button.radius[2]
      )

      love.graphics.setColor(
        styles.menu.button.states[self.state].text_color[1],
        styles.menu.button.states[self.state].text_color[2],
        styles.menu.button.states[self.state].text_color[3]
      )
      love.graphics.setFont(font)
      love.graphics.print(
        text,
        self.x + styles.menu.button.padding[1],
        self.y + styles.menu.button.padding[2]
      )
    end,

    height =
        styles.menu.button.font:getHeight() + styles.menu.button.padding[2] * 2,

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
        love.mouse.setCursor(love.mouse.getSystemCursor("hand"))
        self.state = "hover"
      else
        self.state = "normal"
        love.mouse.setCursor()
      end
    end,

    width = styles.menu.button.font:getWidth(text) + styles.menu.button.padding[1] * 2,
  }
end

return menuButton
