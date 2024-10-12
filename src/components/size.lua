local Concord = require("lib.concord")

Concord.component("size", function(c, width, height)
  c.width = width or 100
  c.height = height or 50
end)
