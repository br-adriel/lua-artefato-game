local BaseItem = require("items.baseItem")
local fonts = require("fonts")

local Door = {
  item = BaseItem:init()
}

function Door:init(x, y, width, height, nextMap)
  self.item = self.item:init(x, y, width, height)
  self.onCollision = function()
    if (_G.love.keyboard.isDown('space')) then
      _G.currentMap = nextMap
    end
  end
  return self
end

function Door:update(dt)
  self.item:checkCollision(
    _G.player.drawX,
    _G.player.drawY,
    _G.player.width,
    _G.player.height
  )
end

function Door:draw()
  if self.item.colliding then
    local font = fonts.commonText.large
    font:setFilter("nearest", "nearest")

    _G.love.graphics.setColor(1, 1, 1)
    _G.love.graphics.setFont(font)
    _G.love.graphics.printf(
      "Aperte espaço para entrar",
      math.floor(self.item.x),
      math.floor(self.item.y),
      self.item.width * _G.player.spriteScale,
      "center",
      nil,
      1 / _G.player.spriteScale,
      1 / _G.player.spriteScale
    )
  end
end

return Door
