return function(e, text, action, x, y, width, height, cornerRadius)
  e:give("position", x, y)
  e:give("size", width, height)
  e:give("mouseInput", action)
  e:give("buttonWithText", text, cornerRadius)
end
