local world01 = require("maps.world01")
local player = require("characters.player")
local love = require("love")

local beginContact = function(a, b, collision)
  player:beginContact(a, b, collision)
end

local endContact = function(a, b, collision)
  player:endContact(a, b, collision)
end

_G.world = world01.world
_G.player = player

local function gameScreen()
  return {
    load = function(self)
      world01.map00:load()
      _G.player:load()
      _G.world:setCallbacks(beginContact, endContact)
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
