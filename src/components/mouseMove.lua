local Concord = require("lib.concord")

Concord.component("mouseMove", function(c, onMouseEnter, onMouseExit)
  c.onMouseEnter = onMouseEnter or function(e, x, y) end
  c.onMouseExit = onMouseExit or function(e, x, y) end
end)

Concord.component("mouseInBounds")
Concord.component("mouseOutBounds")
