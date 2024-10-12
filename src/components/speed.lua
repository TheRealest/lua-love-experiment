local Concord = require("lib.concord")

Concord.component("speed", function(c, speed)
  c.speed = speed or 100
end)
