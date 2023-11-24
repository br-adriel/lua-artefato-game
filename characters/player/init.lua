local love = require("love")

return {
  load = function(self)
    self.x = 100;
    self.y = 0
    self.width = 20;
    self.height = 60;
    self.xVel = 0
    self.yVel = 100
    self.maxSpeed = 200
    self.acceleration = 4000
    self.friction = 3500

    self.physics = {
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

  update = function(self, dt)
    self:syncPhysics()
    self:move(dt)
  end,

  draw = function(self)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", self.x - self.width / 2, self.y - self.height / 2, self.width, self.height)
  end,
}
