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
      local screenWidth, screenHeight = _G.love.graphics.getDimensions()
      local mapWidth = _G.currentMap.map.width * _G.currentMap.map.tilewidth
      local mapHeight = _G.currentMap.map.height * _G.currentMap.map.tileheight

      _G.currentMap:update(dt)
      _G.player:update(dt)

      -- fixa a camera no jogador
      _G.camera:lookAt(
        _G.player.x,
        _G.player.y
      )


      -- impede que a camera ultrapasse a borda esquerda
      if _G.camera.x < screenWidth / 2 / _G.currentMap.scale then
        _G.camera.x = screenWidth / 2 / _G.currentMap.scale
      end

      -- impede que a camera ultrapasse a borda superior
      if _G.camera.y < screenHeight / 2 / _G.currentMap.scale then
        _G.camera.y = screenHeight / 2 / _G.currentMap.scale
      end

      -- impede que a camera ultrapasse a borda direita
      if _G.camera.x > mapWidth - screenWidth / 2 / _G.currentMap.scale then
        _G.camera.x = mapWidth - screenWidth / 2 / _G.currentMap.scale
      end

      -- impede que a camera ultrapasse a borda inferior
      if _G.camera.y > mapHeight - screenHeight / 2 / _G.currentMap.scale then
        _G.camera.y = mapHeight - screenHeight / 2 / _G.currentMap.scale
      end
    end,

    draw = function(self)
      _G.camera:attach() -- camera

      _G.currentMap:draw()

      _G.love.graphics.push()
      _G.player:draw()
      _G.love.graphics.pop()
      _G.camera:detach() -- fim da camera
    end,
  }
end

return gameScreen()
