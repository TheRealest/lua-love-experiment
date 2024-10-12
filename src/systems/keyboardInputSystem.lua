local Concord = require("lib.concord")

local KeyboardInputSystem = Concord.system({pool = {"position", "speed"}})

function KeyboardInputSystem:update(dt)
  for _, e in ipairs(self.pool) do
    if love.keyboard.isDown("right") then
      e.position.x = e.position.x + e.speed.speed * dt
    end
    if love.keyboard.isDown("left") then
      e.position.x = e.position.x - e.speed.speed * dt
    end
    if love.keyboard.isDown("up") then
      e.position.y = e.position.y - e.speed.speed * dt
    end
    if love.keyboard.isDown("down") then
      e.position.y = e.position.y + e.speed.speed * dt
    end
  end
end

return KeyboardInputSystem
