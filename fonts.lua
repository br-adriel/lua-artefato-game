local love = require("love")

local function display(size)
  return love.graphics.newFont("assets/fonts/MajorMonoDisplay-Regular.ttf", size or 20)
end

local function commonText(size)
  return love.graphics.newFont("assets/fonts/Urbanist-VariableFont_wght.ttf", size or 20)
end

return {
  display = {
    small = display(20),
    normal = display(40),
    large = display(60),
  },
  commonText = {
    small = commonText(14),
    normal = commonText(20),
    large = commonText(28),
  }
}
