local world01 = require("maps.world01")

local function gameScreen()
  return {
    load = function(self)
      world01.map00:load()
    end,

    update = function(self, dt)
      world01.map00:update(dt)
    end,

    draw = function(self)
      world01.map00:draw()
    end,
  }
end

return gameScreen()
