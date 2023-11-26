local world = _G.love.physics.newWorld(0, 0)
local m00 = require("maps.world01.map00")

return {
  world = world,
  map00 = m00(world)
}
