local Concord = require("lib.concord")

Concord.component("mouseInput", function(c, action)
  c.action = action or function(button)
    print("Button clicked " .. button)
  end
end)
