local love = require("love")
local homeScreen = require("screens.home")

function love.draw()
  homeScreen:draw()
end
