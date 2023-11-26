local anim8 = require('lib.anim8')

local function Player()
  local durationIdle = 0.2
  local spriteIdle = _G.love.graphics.newImage('assets/sprites/characters/player/idle.png')
  local gridIdle = anim8.newGrid(20, 32, spriteIdle:getWidth(), spriteIdle:getHeight())

  local spriteJump = _G.love.graphics.newImage('assets/sprites/characters/player/jump.png')
  local gridJump = anim8.newGrid(25, 37, spriteJump:getWidth(), spriteJump:getHeight())

  local durationWalk = 0.15
  local spriteWalk = _G.love.graphics.newImage('assets/sprites/characters/player/walk.png')
  local gridWalk = anim8.newGrid(23, 32, spriteWalk:getWidth(), spriteWalk:getHeight())

  return {
    animations = {
      idle = {
        left = anim8.newAnimation(gridIdle('1-10', 1), durationIdle),
        right = anim8.newAnimation(gridIdle('1-10', 2), durationIdle),
      },
      jump = {
        left = anim8.newAnimation(gridJump(1, 2), 1),
        right = anim8.newAnimation(gridJump(1, 1), 1),
      },
      walk = {
        left = anim8.newAnimation(gridWalk('1-8', 2), durationWalk),
        right = anim8.newAnimation(gridWalk('1-8', 1), durationWalk),
      },
    },
    sprite = {
      idle = spriteIdle,
      jump = spriteJump,
      walk = spriteWalk,
    },
    grids = {
      idle = gridIdle,
      jump = gridJump,
      walk = gridWalk
    }
  }
end

return Player
