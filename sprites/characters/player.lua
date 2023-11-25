local anim8 = require('lib.anim8')

local function Player(frameDuration)
  local d = frameDuration or 0.1
  local sprite = _G.love.graphics.newImage('assets/sprites/characters/player.png')
  local grid = anim8.newGrid(20, 32, sprite:getWidth(), sprite:getHeight())

  return {
    animations = {
      idle = {
        left = anim8.newAnimation(grid('1-10', 1), d),
        right = anim8.newAnimation(grid('1-10', 2), d),
      }
    },
    sprite = sprite,
  }
end

return Player
