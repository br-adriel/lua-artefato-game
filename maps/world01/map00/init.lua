local sti = require("lib/sti")
local woodLandingSounds = require("assets.sounds.landing.wood")
local walkingSounds = require("assets.sounds.walking")
local Door = require("items.door")

return function(world)
  return {
    map = sti(require("maps.world01.map00.map00"), { "box2d" }),
    initialPlayerState = {
      x = 236,
      y = 239,
    },
    scale = 1,
    doors = {},
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
      self.map.layers.colisoes.visible = false

      for _, passagem in pairs(self.map.layers.passagens.objects) do
        local door = Door:init(passagem.x, passagem.y, passagem.width, passagem.height,
          require("maps.world01").map01)
        table.insert(self.doors, door)
      end
    end,

    update = function(self, dt)
      self.scale = _G.love.graphics.getHeight() / (self.map.height * self.map.tileheight)
      _G.camera:zoomTo(self.scale)
      world:update(dt)

      for _, door in pairs(self.doors) do
        door:update(dt)
      end
    end,

    draw = function(self)
      _G.love.graphics.setColor(1, 1, 1)
      self.map:drawLayer(self.map.layers.paredes)
      self.map:drawLayer(self.map.layers.piso)
      self.map:drawLayer(self.map.layers.portas)

      for _, door in pairs(self.doors) do
        door:draw()
      end
    end,
  }
end
