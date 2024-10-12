local Concord = require("lib.concord")

local SetBackgroundColorSystem = Concord.system({pool = {"backgroundColor", "behavior"}})

function SetBackgroundColorSystem:draw()
  for _, e in ipairs(self.pool) do
    love.graphics.setBackgroundColor(unpack(e.behavior.behavior.frame.backgroundColor))
  end
end

return SetBackgroundColorSystem
