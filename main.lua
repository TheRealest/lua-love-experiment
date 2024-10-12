local Concord = require("lib.concord")
local Systems = {}
local Assemblages = require("src/assemblages")

local world
local testEntity

--local colorDuration = 0


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

  --Concord.entity(world)
  --:give("position", 300, 200)
  --:give("speed", 100)
  --:give("drawableText", "Hello World")

  local backgroundFlasherEntity = Concord.entity(world)
  :give("behavior", {
    default = { { backgroundColor = {0, 0, 0}, duration = 1 } },
    flashing = {
      { backgroundColor = {1, 0, 0}, duration = 0.1 },
      { backgroundColor = {0, 0, 0}, duration = 0.1 },
      { backgroundColor = {1, 0, 0}, duration = 0.07 },
      { backgroundColor = {0, 0, 0}, duration = 0.07 },
      { backgroundColor = {1, 0, 0}, duration = 0.3, after = "default" }
    }
  })
  :give("backgroundColor")

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

  --if colorDuration > 0 then
    --colorDuration = colorDuration - dt
  --end
end

function love.draw()
  world:emit("draw")

  --if colorDuration > 0 then
    --love.graphics.setBackgroundColor(1, 0, 0)
  --else
    --love.graphics.setBackgroundColor(0, 0, 0)
  --end
end
