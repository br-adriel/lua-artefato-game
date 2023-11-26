local sti = require("lib/sti")
local woodLandingSounds = require("assets.sounds.landing.wood")
local walkingSounds = require("assets.sounds.walking")

return function(world)
  return {
    map = sti(require("maps.world01.map00.map00"), { "box2d" }),
    scale = 1,
    sounds = {
      player = {
        landing = {
          small = _G.love.audio.newSource(woodLandingSounds.small.source, woodLandingSounds.small.type),
          medium = _G.love.audio.newSource(woodLandingSounds.medium.source, woodLandingSounds.medium.type),
          large = _G.love.audio.newSource(woodLandingSounds.large.source, woodLandingSounds.large.type),
        },
        walking = {
          default = _G.love.audio.newSource(walkingSounds.wood.source, walkingSounds.wood.type)
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
      _G.camera:zoomTo(self.scale)
      world:update(dt)
    end,

    draw = function(self)
      _G.love.graphics.setColor(1, 1, 1)
      -- _G.love.graphics.scale(self.scale)
      self.map:drawLayer(self.map.layers.paredes)
      self.map:drawLayer(self.map.layers.portas)
    end,
  }
end
