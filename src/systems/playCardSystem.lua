local Concord = require("lib.concord")
local util = require("src.util")

local PLAY_AREA_MARGIN = 200

local PlayCardSystem = Concord.system({pool = {"card", "inDeck"}})

function PlayCardSystem:playCard()
  local playedCard = util.table.sample(self.pool)
  if playedCard then
    playedCard
    :remove("inDeck")
    :give("inPlay")
    :give("position",
      love.math.random(PLAY_AREA_MARGIN, love.graphics.getWidth() - PLAY_AREA_MARGIN),
      love.math.random(PLAY_AREA_MARGIN, love.graphics.getHeight() - PLAY_AREA_MARGIN)
    )
  end
end

return PlayCardSystem
