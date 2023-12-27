local BaseItem = function(x, y, width, height, onCollision)
  return {
    x = x or 0,
    y = y or 0,
    width = width or 0,
    height = height or 0,
    active = true,
    colliding = false,
    onCollision = onCollision or function() end,

    checkCollision = function(self, x, y, w, h)
      self.colliding = (
        x >= self.x and x <= self.x + self.width and
        y >= self.y and y <= self.y + self.height
      ) or (
        x + w >= self.x and x + w <= self.x + self.width and
        y + h >= self.y and y + h <= self.y + self.height
      ) or (
        x >= self.x and x <= self.x + self.width and
        y + h >= self.y and y + h <= self.y + self.height
      ) or (
        x + w >= self.x and x + w <= self.x + self.width and
        y >= self.y and y <= self.y + self.height
      )

      if self.colliding then
        self:onCollision()
      end
    end
  }
end

return BaseItem
