FONT_SIZE = 32

local Concord = require("lib.concord")
local Systems = {}
local Assemblages = require("src/assemblages")
local DeckFactory = require("src/factories/deckFactory")

local world

function love.load()
  love.window.setTitle("Hello World")
  love.graphics.setFont(love.graphics.newFont("assets/fonts/DejaVuSansMono.ttf", FONT_SIZE))

  Concord.utils.loadNamespace("src/components")
  Concord.utils.loadNamespace("src/systems", Systems)

  --Systems.debugSystem:setEnable(false)

  world = Concord.world()
  world:addSystems(
  Systems.debugSystem,
  Systems.keyboardInputSystem,
  Systems.mouseInputSystem,
  Systems.mouseMoveSystem,
  Systems.behaviorSystem,
  Systems.playCardSystem,
  Systems.drawPlayAreaSystem,
  Systems.drawTextSystem,
  Systems.drawButtonsSystem,
  Systems.setBackgroundColorSystem
  )

  local backgroundFlasherEntity = Concord.entity(world)
  :assemble(Assemblages.backgroundFlasher)

  Concord.entity(world)
  :assemble(Assemblages.button,
  {
    x = 680,
    y = 530,
    text = "Draw",
    onClick = function() world:emit("playCard") end
  })

  DeckFactory.createDefaultDeck(world)
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
