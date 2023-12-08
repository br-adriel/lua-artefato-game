local BaseItem = {
  x = 0,
  y = 0,
  width = 0,
  height = 0,
  active = true,
  colliding = false,
  onCollision = function() end
}

function BaseItem:init(x, y, width, height)
  self.x = x or 0
  self.y = y or 0
  self.width = width or 0
  self.height = height or 0

  return self
end

function BaseItem:checkCollision(x, y, w, h)
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

return BaseItem
