local Concord = require("lib.concord")

Concord.component("buttonWithText", function(c, text, cornerRadius)
  c.text = text or "Button"
  c.cornerRadius = cornerRadius or 5
end)
