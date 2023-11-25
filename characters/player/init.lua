local love = require("love")

return {
  load = function(self)
    self.x            = 100;
    self.y            = 0
    self.width        = 20;
    self.height       = 60;
    self.xVel         = 0
    self.yVel         = 0
    self.maxSpeed     = 200
    self.acceleration = 4000
    self.friction     = 3500
    self.gravity      = 1500
    self.grounded     = false
    self.jumpAmount   = -500
    self.maxJumps     = 3
    self.jumps        = 0

    self.physics      = {
      body = love.physics.newBody(_G.world, self.x, self.y, "dynamic"),
      shape = love.physics.newRectangleShape(self.width, self.height)
    }
    self.physics.body:setFixedRotation(true)
    self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
  end,

  syncPhysics = function(self)
    self.x, self.y = self.physics.body:getPosition()
    self.physics.body:setLinearVelocity(self.xVel, self.yVel)
  end,

  move = function(self, dt)
    if love.keyboard.isDown("d", "right") then
      if self.xVel < self.maxSpeed then
        if self.xVel + self.acceleration * dt < self.maxSpeed then
          self.xVel = self.xVel + self.acceleration * dt
        else
          self.xVel = self.maxSpeed
        end
      end
    elseif love.keyboard.isDown("a", "left") then
      if self.xVel > -self.maxSpeed then
        if self.xVel - self.acceleration * dt > self.maxSpeed then
          self.xVel = self.xVel - self.acceleration * dt
        else
          self.xVel = -self.maxSpeed
        end
      end
    else
      self:applyFriction(dt)
    end
  end,

  applyFriction = function(self, dt)
    if self.xVel > 0 then
      if self.xVel - self.friction * dt > 0 then
        self.xVel = self.xVel - self.friction * dt
      else
        self.xVel = 0
      end
    elseif self.xVel < 0 then
      if self.xVel + self.friction * dt < 0 then
        self.xVel = self.xVel + self.friction * dt
      else
        self.xVel = 0
      end
    end
  end,

  applyGravity = function(self, dt)
    if not self.grounded then
      self.yVel = self.yVel + self.gravity * dt
    end
  end,

  beginContact = function(self, a, b, collision)
    if self.grounded then return end

    local nx, ny = collision.getNormal(collision)
    if a == self.physics.fixture then
      if ny > 0 then -- b está abaixo do jogador
        self:land(collision)
      end
    elseif b == self.physics.fixture then
      if ny < 0 then -- b está abaixo do jogador
        self:land(collision)
      end
    end
  end,


  endContact = function(self, a, b, collision)
    if a == self.physics.fixture or b == self.physics.fixture then
      if self.currentGroundCollision == collision then
        self.grounded = false
      end
    end
  end,

  land = function(self, collision)
    self.currentGroundCollision = collision
    self.yVel = 0
    self.grounded = true
    self.jumps = 0
  end,

  jump = function(self, key)
    if (key == "w" or key == "up") and (self.grounded or self.jumps < self.maxJumps) then
      self.yVel = self.jumpAmount
      self.grounded = false
      self.jumps = self.jumps + 1
    end
  end,

  update = function(self, dt)
    self:syncPhysics()
    self:move(dt)
    self:applyGravity(dt)
  end,

  draw = function(self)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", self.x - self.width / 2, self.y - self.height / 2, self.width, self.height)
  end,
}
