local Concord = require("lib.concord")
local util = require("src.util")

local PlayCardSystem = Concord.system({pool = {"card", "inDeck"}})

function PlayCardSystem:playCard()
  local playedCard = util.table.sample(self.pool)
  if playedCard then
    playedCard:remove("inDeck"):give("inPlay")
  end
end

return PlayCardSystem
