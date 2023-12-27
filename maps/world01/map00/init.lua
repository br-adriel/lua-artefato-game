local sti = require("lib/sti")
local woodLandingSounds = require("assets.sounds.landing.wood")
local walkingSounds = require("assets.sounds.walking")
local Door = require("items.door")

return function(world)
  return {
    map = sti(require("maps.world01.map00.map00"), { "box2d" }),
    initialPlayerState = {
      x = 236, y = 239
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
      self.scale = _G.love.graphics.getHeight() / (23 * self.map.tileheight)
      _G.love.audio.stop()
      self.map:box2d_init(_G.world)
      self.map.layers.colisoes.visible = false

      table.insert(self.doors, Door(
        self.map.layers.passagens.objects[7].x,
        self.map.layers.passagens.objects[7].y,
        self.map.layers.passagens.objects[7].width,
        self.map.layers.passagens.objects[7].height,
        { 190, 831 }
      ))

      table.insert(self.doors, Door(
        self.map.layers.passagens.objects[8].x,
        self.map.layers.passagens.objects[8].y,
        self.map.layers.passagens.objects[8].width,
        self.map.layers.passagens.objects[8].height,
        { 236, 239 }
      ))
    end,

    update = function(self, dt)
      self.scale = _G.love.graphics.getHeight() / (23 * self.map.tileheight)
      _G.camera:zoomTo(self.scale)
      world:update(dt)

      for _, door in ipairs(self.doors) do
        door:update(dt)
      end
    end,

    draw = function(self)
      _G.love.graphics.setColor(1, 1, 1)
      self.map:drawLayer(self.map.layers.paredes)
      self.map:drawLayer(self.map.layers.piso)
      self.map:drawLayer(self.map.layers.portas)

      for _, door in ipairs(self.doors) do
        door:draw()
      end
    end,
  }
end
