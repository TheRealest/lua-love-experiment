local Concord = require("lib.concord")

local DrawTextSystem = Concord.system({pool = {"position", "drawableText"}})

function DrawTextSystem:draw()
  for _, e in ipairs(self.pool) do
    love.graphics.print(e.drawableText.text, e.position.x, e.position.y)
  end
end

return DrawTextSystem
