local Concord = require("lib.concord")

DEFAULT_DECK_CARDTYPES = {
  "acolyte",
  "acolyte",
  "priest",
  "goat"
}

local DeckFactory = {}

function DeckFactory.createDefaultDeck(world)
  for _, cardType in ipairs(DEFAULT_DECK_CARDTYPES) do
    Concord.entity(world)
    :give("card", cardType)
    :give("inDeck")
  end
end

return DeckFactory
