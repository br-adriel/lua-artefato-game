local anim8 = require('lib.anim8')

local function Star(frameDuration)
  local d = frameDuration or 0.1
  local sprite = _G.love.graphics.newImage('assets/sprites/star.png')
  local grid = anim8.newGrid(64, 64, sprite:getWidth(), sprite:getHeight())

  return {
    animations = {
      default = anim8.newAnimation(grid('1-10', 1), d)
    },
    sprite = sprite,
  }
end

return Star
