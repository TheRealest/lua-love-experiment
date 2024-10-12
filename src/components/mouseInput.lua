local Concord = require("lib.concord")

Concord.component("mouseInput", function(c, onClick)
  c.onClick = onClick or function(e, button)
    print("Button clicked " .. button)
  end
end)
