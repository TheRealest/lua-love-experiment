return function(e, options)
  if type(options.x) ~= "number" then
    error("button x must be a number")
  elseif type(options.y) ~= "number" then
    error("button y must be a number")
  elseif type(options.text) ~= "string" then
    error("button text must be a string")
  end

  options.width = options.width or 100
  options.height = options.height or 50
  options.lineWidth = options.lineWidth or 2
  options.onMouseEnter = options.onMouseEnter or function(e)
    e.buttonWithText.lineWidth = 5
  end
  options.onMouseExit = options.onMouseExit or function(e)
    e.buttonWithText.lineWidth = 2
  end

  e:give("position", options.x, options.y)
  e:give("size", options.width, options.height)
  e:give("mouseInput", options.onClick)
  e:give("mouseMove", options.onMouseEnter, options.onMouseExit)
  e:give("mouseOutBounds")
  e:give("buttonWithText", options.text, options.lineWidth, options.cornerRadius)
end
