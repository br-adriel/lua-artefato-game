local sti = require("lib/sti")
local maps = require("maps")
local world = _G.love.physics.newWorld(0, 0)
local woodSounds = require("assets.sounds.landing.wood")

return {
  world = world,
  map00 = {
    map = sti(maps.world01.m00, { "box2d" }),
    scale = 1,
    sounds = {
      player = {
        landing = {
          small = _G.love.audio.newSource(woodSounds.small.source, woodSounds.small.type),
          medium = _G.love.audio.newSource(woodSounds.medium.source, woodSounds.medium.type),
          large = _G.love.audio.newSource(woodSounds.large.source, woodSounds.large.type),
        }
      }
    },

    load = function(self)
      _G.world = world
      self.scale = _G.love.graphics.getHeight() / (self.map.height * self.map.tileheight)
      _G.love.audio.stop()
      self.map:box2d_init(_G.world)
      self.map.layers.solid.visible = false
    end,

    update = function(self, dt)
      self.scale = _G.love.graphics.getHeight() / (self.map.height * self.map.tileheight)
      world:update(dt)
    end,

    draw = function(self)
      _G.love.graphics.setColor(1, 1, 1)
      self.map:draw(0, 0, self.scale, self.scale)
    end,
  }
}
