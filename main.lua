local Concord = require("lib.concord")
local Systems = {}
local Assemblages = require("src/assemblages")

local world

function love.load()
  love.window.setTitle("Hello World")
  Concord.utils.loadNamespace("src/components")
  Concord.utils.loadNamespace("src/systems", Systems)

  world = Concord.world()
  world:addSystems(
  Systems.keyboardInputSystem,
  Systems.mouseInputSystem,
  Systems.mouseMoveSystem,
  Systems.drawTextSystem,
  Systems.drawButtonsSystem,
  Systems.setBackgroundColorSystem,
  Systems.behaviorSystem
  )

  local backgroundFlasherEntity = Concord.entity(world)
  :assemble(Assemblages.backgroundFlasher)

  Concord.entity(world)
  :assemble(Assemblages.button,
  {
    x = 300,
    y = 300,
    text = "Test",
    onClick = function()
      backgroundFlasherEntity.behavior.behavior:setState("flashing")
    end
  })
end

function love.mousepressed(x, y, button)
  world:emit("mousepressed", x, y, button)
end

function love.mousemoved(x, y, dx, dy)
  world:emit("mousemoved", x, y, dx, dy)
end

function love.update(dt)
  world:emit("update", dt)
end

function love.draw()
  world:emit("draw")
end
