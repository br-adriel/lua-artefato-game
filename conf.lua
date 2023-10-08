function love.conf(t)
  t.version = "11.4"                  -- The LÖVE version this game was made for (string)

  t.window.title = "Artefato"         -- The window title (string)
  t.window.icon = nil                 -- Filepath to an image to use as the window's icon (string)
  t.window.width = 800                -- The window width (number)
  t.window.height = 600               -- The window height (number)
  t.window.borderless = false         -- Remove all border visuals from the window (boolean)
  t.window.resizable = true           -- Let the window be user-resizable (boolean)
  t.window.minwidth = 800             -- Minimum window width if the window is resizable (number)
  t.window.minheight = 600            -- Minimum window height if the window is resizable (number)
  t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
end
