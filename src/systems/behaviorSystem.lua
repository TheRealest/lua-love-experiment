local Concord = require("lib.concord")

local BehaviorSystem = Concord.system({pool = {"behavior"}})

function BehaviorSystem:update(dt)
  for _, e in ipairs(self.pool) do
    e.behavior.behavior:update(dt)
  end
end

return BehaviorSystem
