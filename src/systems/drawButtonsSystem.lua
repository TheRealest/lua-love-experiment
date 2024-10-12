local Concord = require("lib.concord")

local DrawButtonSystem = Concord.system({pool = {"buttonWithText", "position", "size"}})

function DrawButtonSystem:draw()
  for _, e in ipairs(self.pool) do
    love.graphics.rectangle(
    "line",
    e.position.x,
    e.position.y,
    e.size.width,
    e.size.height,
    e.buttonWithText.cornerRadius
    )

    love.graphics.printf(
    e.buttonWithText.text,
    e.position.x,
    e.position.y + (e.size.height / 2) - 8,
    e.size.width,
    "center"
    )
  end
end

return DrawButtonSystem
