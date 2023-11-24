local world01 = require("maps.world01")
local player = require("characters.player")
local love = require("love")

_G.world = world01.world

local function gameScreen()
  return {
    load = function(self)
      world01.map00:load()
      player:load()
    end,

    update = function(self, dt)
      world01.map00:update(dt)
      player:update(dt)
    end,

    draw = function(self)
      world01.map00:draw()

      love.graphics.push()
      love.graphics.scale(world01.map00.scale, world01.map00.scale)
      player:draw()
      love.graphics.pop()
    end,
  }
end

return gameScreen()
