local Concord = require("lib.concord")
local Behavior = require("lib.knife.behavior")

Concord.component("behavior", function(c, states)
  states = states or { default = { { duration = 1 } } }
  c.behavior = Behavior(states, c.__entity)
end)
