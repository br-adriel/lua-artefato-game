local BaseItem = require("items.baseItem")

local Door = {
  item = BaseItem:init()
}

function Door:init(x, y, width, height, nextCoords)
  self.item = self.item:init(x, y, width, height)
  self.item.onCollision = function()
    if (_G.love.keyboard.isDown('space')) then
      _G.player.physics.body:setPosition(nextCoords[1], nextCoords[2])
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
    _G.love.graphics.setColor(1, 1, 1)
    _G.love.graphics.print(
      "Aperte espaço",
      _G.player.drawX,
      _G.player.drawY - 20
    )
  end
end

return Door
