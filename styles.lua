local fonts = require("fonts")

return {
  menu = {
    text = { 1, 1, 1 },
    button = {
      font = fonts.commonText.normal,
      padding = { 16, 12 },
      radius = { 4, 4 },
      states = {
        normal = {
          bg = { 206 / 255, 218 / 255, 235 / 255 },
          textColor = { 1, 1, 1 },
          mode = "line",
          radius = { 4, 4 },
        },
        hover = {
          bg = { 1, 1, 1 },
          textColor = { 0, 0, 0 },
          mode = "fill",
          padding = { 12, 12 },
        },
      }
    },
    setting = {
      font = fonts.commonText.large,
      padding = { 10, 10 },
      gap = 16,
      textColor = { 1, 1, 1 }
    }
  }
}
