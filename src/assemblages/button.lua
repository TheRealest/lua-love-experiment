return function(e, text, clickAction, mouseInAction, mouseOutAction, x, y, width, height, cornerRadius)
  e:give("position", x, y)
  e:give("size", width, height)
  e:give("mouseInput", clickAction)
  e:give("mouseMove", mouseInAction, mouseOutAction)
  e:give("mouseOutBounds")
  e:give("buttonWithText", text, lineWidth, cornerRadius)
end
