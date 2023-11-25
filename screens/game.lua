local beginContact = function(a, b, collision)
  _G.player:beginContact(a, b, collision)
end

local endContact = function(a, b, collision)
  _G.player:endContact(a, b, collision)
end

local function gameScreen()
  return {
    load = function(self)
      _G.currentMap:load()
      _G.player:load()
      _G.world:setCallbacks(beginContact, endContact)
    end,

    update = function(self, dt)
      _G.currentMap:update(dt)
      _G.player:update(dt)
    end,

    draw = function(self)
      _G.currentMap:draw()

      _G.love.graphics.push()
      _G.love.graphics.scale(_G.currentMap.scale, _G.currentMap.scale)
      _G.player:draw()
      _G.love.graphics.pop()
    end,
  }
end

return gameScreen()
