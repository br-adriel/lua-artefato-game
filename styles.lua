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
          text_color = { 1, 1, 1 },
          mode = "line",
          radius = { 4, 4 },
        },
        hover = {
          bg = { 1, 1, 1 },
          text_color = { 0, 0, 0 },
          mode = "fill",
          padding = { 16, 12 },
        },
      }
    },
    setting = {
      font = fonts.commonText.large,
      padding = { 20, 50 },
      gap = 20,
      text_color = { 1, 1, 1 }
    }
  }
}
