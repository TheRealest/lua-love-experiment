local Concord = require("lib.concord")
local util = require("src.util")

local DebugSystem = Concord.system({cardsInDeckPool = {"card", "inDeck"}, cardsInPlayPool = {"card", "inPlay"}})

function DebugSystem:draw()
  local cardTypes = util.table.map(self.cardsInDeckPool, function(e) return e.card.cardType end)
  local inDeckCardCounts = util.table.tally(cardTypes)
  local sortedCardTypes = util.table.keys(inDeckCardCounts)
  table.sort(sortedCardTypes)

  local cardTypeDebug = "-- Deck:\n"
  for _, cardType in ipairs(sortedCardTypes) do
    cardTypeDebug = cardTypeDebug .. cardType .. ": " .. inDeckCardCounts[cardType] .. "\n"
  end

  love.graphics.print(cardTypeDebug, 0, 0, 0, 0.375)
end

return DebugSystem
