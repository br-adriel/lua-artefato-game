local love = require("love")
local fonts = require("fonts")
local buttons = require("buttons")
local Star = require("sprites.star")

-- gera as estrelas usadas no fundo estrelado
local generateRandomStars = function(amount)
  math.randomseed(os.time())

  local y = 10
  if amount and amount >= 0 then
    y = amount
  end

  local stars = {}
  for i = 1, y, 1 do
    -- impede que a estrla fique na área do título
    local x = 0;
    local y = 0;
    repeat
      x = math.random()
      y = math.random()
    until not ((x > 0.3 and x < 0.7) and (y > 0.3 and y < 0.7))

    stars[i] = {
      object = Star(math.random(7, 12) / 100),
      x = x,
      y = y,
      scale = math.random(15, 85) / 100,
    }
  end
  return stars
end

local function homeScreen()
  local textDistance = 10
  local gameTitle = "ARtefAto"
  local gameAuthor = "por Adriel Faria dos Santos"
  local stars = {}
  local sounds = {}
  sounds.bgMusic = love.audio.newSource("assets/music/AWalkIntoSpace-TopherMohrAndAlexElena.mp3", "stream")
  sounds.bgMusic:setLooping(true)


  return {
    load = function(self)
      stars = generateRandomStars(10)

      if not sounds.bgMusic:isPlaying() then
        sounds.bgMusic:play()
      end
    end,

    update = function(self, dt)
      for _, star in pairs(stars) do
        star.object.animations.default:update(dt)
      end
    end,

    draw = function(self)
      local windowWidth = love.graphics.getWidth()
      local windowHeight = love.graphics.getHeight()

      local totalTextHeight = fonts.display.large:getHeight() + fonts.commonText.normal:getHeight() + textDistance
      local textStartHeight = windowHeight / 2 - totalTextHeight / 2

      -- Desenha o fundo estrelado
      love.graphics.setColor(1, 1, 1)
      for _, star in pairs(stars) do
        star.object.animations.default:draw(
          star.object.sprite,
          star.x * windowWidth,
          star.y * windowHeight,
          nil,
          star.scale,
          star.scale
        )
      end

      -- desenha o título do jogo
      love.graphics.setColor(1, 1, 1)
      love.graphics.setFont(fonts.display.large)
      love.graphics.print(
        gameTitle,
        windowWidth / 2 - fonts.display.large:getWidth(gameTitle) / 2,
        textStartHeight
      )

      love.graphics.setFont(fonts.commonText.normal)
      love.graphics.print(
        gameAuthor,
        windowWidth / 2 - fonts.commonText.normal:getWidth(gameAuthor) / 2,
        textStartHeight + textDistance + fonts.display.large:getHeight()
      )

      -- desenha os botões
      local buttonsTotalWidth = 0
      local keys = {}
      for key, _ in pairs(buttons.home) do
        table.insert(keys, 1, key)
      end
      table.sort(keys, function(a, b) return a:upper() < b:upper() end)

      for i = 1, #keys do
        local button = buttons.home[keys[i]]
        button.x = windowWidth - button.width - 10 * i - buttonsTotalWidth
        button.y = windowHeight - button.height - 10
        button:draw()

        buttonsTotalWidth = buttonsTotalWidth + button.width
      end
    end,
  }
end

return homeScreen()
