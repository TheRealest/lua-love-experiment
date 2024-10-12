local Concord = require("lib.concord")

Concord.component("drawableText", function(c, text)
  c.text = text or "Hello World"
end)
