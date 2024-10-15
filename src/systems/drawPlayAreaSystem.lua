local Concord = require("lib.concord")
local CardTypeMetadata = require("src.data.cardTypeMetadata")

local DrawPlayAreaSystem = Concord.system({pool = {"card", "position", "inPlay"}})

function DrawPlayAreaSystem:draw()
  for _, e in ipairs(self.pool) do
    local metadata = CardTypeMetadata[e.card.cardType]
    love.graphics.print(metadata.symbol, e.position.x, e.position.y)
  end
end

return DrawPlayAreaSystem
