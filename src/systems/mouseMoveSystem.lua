local Concord = require("lib.concord")

local MouseMoveSystem = Concord.system({
  poolInBounds = {"mouseMove", "mouseInBounds", "position", "size"},
  poolOutBounds = {"mouseMove", "mouseOutBounds", "position", "size"},
})

function MouseMoveSystem:mousemoved(x, y)
  for _, e in ipairs(self.poolOutBounds) do
    -- determine if click is within entity's bounds
    if x >= e.position.x and x <= e.position.x + e.size.width and y >= e.position.y and y <= e.position.y + e.size.height then
      e:remove("mouseOutBounds"):give("mouseInBounds")
      e.mouseMove.mouseInAction(e)
    end
  end

  for _, e in ipairs(self.poolInBounds) do
    -- determine if click is out of entity's bounds
    if x < e.position.x or x > e.position.x + e.size.width or y < e.position.y or y > e.position.y + e.size.height then
      e:remove("mouseInBounds"):give("mouseOutBounds")
      e.mouseMove.mouseOutAction(e)
    end
  end
end

return MouseMoveSystem
