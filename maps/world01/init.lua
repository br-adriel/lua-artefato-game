local world = _G.love.physics.newWorld(0, 0)
local m00 = require("maps.world01.map00")
local m01 = require("maps.world01.map01")

return {
  world = world,
  map00 = m00(world),
  map01 = m01(world),
}
