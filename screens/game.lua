local love = require("love")
local sti = require("lib/sti")
local maps = require("maps")

local function gameScreen()
  local map = sti(maps.world01.m00)
  local scaleFactor = 1

  return {
    load = function(self)
      love.audio.stop()
    end,

    update = function(self, dt)
      scaleFactor = love.graphics.getWidth() / 1920 * 10
    end,

    draw = function(self)
      love.graphics.setColor(1, 1, 1)
      map:draw(0, 0, scaleFactor, scaleFactor)
    end,
  }
end

return gameScreen()
