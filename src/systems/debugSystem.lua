local Concord = require("lib.concord")

local DebugSystem = Concord.system({cardsInDeckPool = {"card", "inDeck"}, cardsInPlayPool = {"card", "inPlay"}})

function DebugSystem:draw()
  local inDeckCardCounts = {}
  for _, e in ipairs(self.cardsInDeckPool) do
    inDeckCardCounts[e.card.cardType] = (inDeckCardCounts[e.card.cardType] or 0) + 1
  end

  local sortedCardTypes = {}
  for cardType, _ in pairs(inDeckCardCounts) do
    table.insert(sortedCardTypes, cardType)
  end
  table.sort(sortedCardTypes)

  local cardTypeDebug = "-- Deck:\n"
  for _, cardType in ipairs(sortedCardTypes) do
    cardTypeDebug = cardTypeDebug .. cardType .. ": " .. inDeckCardCounts[cardType] .. "\n"
  end

  love.graphics.print(cardTypeDebug, 0, 0, 0, 0.375)
end

return DebugSystem
