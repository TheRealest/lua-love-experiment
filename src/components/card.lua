local Concord = require("lib.concord")

Concord.component("card", function(c, cardType)
  c.cardType = cardType or error("cardType is required")
end)

Concord.component("inDeck")
Concord.component("inPlay")

