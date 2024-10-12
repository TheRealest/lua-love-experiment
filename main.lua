local Concord = require("lib.concord")
local Systems = {}
local Assemblages = require("src/assemblages")

local world
local testEntity

local colorDuration = 0


function love.load()
  love.window.setTitle("Hello World")
  Concord.utils.loadNamespace("src/components")
  Concord.utils.loadNamespace("src/systems", Systems)

  world = Concord.world()
  world:addSystems(
  Systems.keyboardInputSystem,
  Systems.mouseInputSystem,
  Systems.drawTextSystem,
  Systems.drawButtonsSystem
  )

  Concord.entity(world)
  :give("position", 300, 200)
  :give("speed", 100)
  :give("drawableText", "Hello World")

  Concord.entity(world)
  :assemble(
  Assemblages.button,
  "Test",
  function(x, y)
    colorDuration = 0.5
  end,
  300,
  300,
  100,
  50
  )
end

function love.mousepressed(x, y, button)
  world:emit("mousepressed", x, y, button)
end

function love.update(dt)
  world:emit("update", dt)

  if colorDuration > 0 then
    colorDuration = colorDuration - dt
  end
end

function love.draw()
  world:emit("draw")

  if colorDuration > 0 then
    love.graphics.setBackgroundColor(1, 0, 0)
  else
    love.graphics.setBackgroundColor(0, 0, 0)
  end
end
