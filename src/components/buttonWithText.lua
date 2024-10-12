local Concord = require("lib.concord")

Concord.component("buttonWithText", function(c, text, lineWidth, cornerRadius)
  c.text = text or "Button"
  c.lineWidth = lineWidth or 2
  c.cornerRadius = cornerRadius or 5
end)
