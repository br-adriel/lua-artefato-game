local love = require('love')
local sti = require("lib/sti")
local maps = require("maps")
local world = love.physics.newWorld(0, 0)

return {
  world = world,
  map00 = {
    map = sti(maps.world01.m00, { "box2d" }),
    scale = 1,

    load = function(self)
      _G.world = world
      self.scale = love.graphics.getHeight() / (self.map.height * self.map.tileheight)
      love.audio.stop()
      self.map:box2d_init(_G.world)
      self.map.layers.solid.visible = false
    end,

    update = function(self, dt)
      self.scale = love.graphics.getHeight() / (self.map.height * self.map.tileheight)
      world:update(dt)
    end,

    draw = function(self)
      love.graphics.setColor(1, 1, 1)
      self.map:draw(0, 0, self.scale, self.scale)
    end,
  }
}
