local BaseItem = require("items.baseItem")

local Door = function(x, y, width, height, nextCoords)
  return {
    item = BaseItem(
      x,
      y,
      width,
      height,
      function()
        if (_G.love.keyboard.isDown('space')) then
          _G.player.physics.body:setPosition(nextCoords[1], nextCoords[2])
        end
      end
    ),

    update = function(self, dt)
      self.item:checkCollision(
        _G.player.drawX,
        _G.player.drawY,
        _G.player.width,
        _G.player.height
      )
    end,

    draw = function(self)
      if self.item.colliding then
        _G.love.graphics.setColor(1, 1, 1)
        _G.love.graphics.print(
          "Aperte espaço",
          _G.player.drawX,
          _G.player.drawY - 20
        )
      end
    end
  }
end

return Door
