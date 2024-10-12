local Concord = require("lib.concord")

Concord.component("mouseMove", function(c, mouseInAction, mouseOutAction)
  c.mouseInAction = mouseInAction or function(e, x, y) end
  c.mouseOutAction = mouseOutAction or function(e, x, y) end
end)

Concord.component("mouseInBounds")
Concord.component("mouseOutBounds")
