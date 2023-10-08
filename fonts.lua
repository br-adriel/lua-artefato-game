local love = require("love")

local function display(size)
  return love.graphics.newFont("assets/fonts/MajorMonoDisplay-Regular.ttf", size or 20)
end

return {
  display = {
    small = display(20),
    normal = display(40),
    large = display(60),
  }
}
