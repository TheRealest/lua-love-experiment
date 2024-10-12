local Concord = require("lib.concord")

local MouseInputSystem = Concord.system({pool = {"mouseInput", "position", "size"}})

function MouseInputSystem:mousepressed(x, y, button)
  for _, e in ipairs(self.pool) do
    -- determine if click is within entity's bounds
    if x >= e.position.x and x <= e.position.x + e.size.width and y >= e.position.y and y <= e.position.y + e.size.height then
      e.mouseInput.action(button)
    end
  end
end

return MouseInputSystem
