local x = 300
local y = 200
local speed = 100
local colorDuration = 0

function love.load()
  love.window.setTitle("Hello World")
end

function love.mousepressed()
  colorDuration = 0.5
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    x = x + speed * dt
  end
  if love.keyboard.isDown("left") then
    x = x - speed * dt
  end
  if love.keyboard.isDown("up") then
    y = y - speed * dt
  end
  if love.keyboard.isDown("down") then
    y = y + speed * dt
  end

  if colorDuration > 0 then
    colorDuration = colorDuration - dt
  end
end

function love.draw()
  love.graphics.print("Hello World", x, y)
  if colorDuration > 0 then
    love.graphics.setBackgroundColor(1, 0, 0)
  else
    love.graphics.setBackgroundColor(0, 0, 0)
  end
end
