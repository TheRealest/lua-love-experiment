return function(e)
  e:give("behavior", {
    default = { { backgroundColor = {0, 0, 0}, duration = 1 } },
    flashing = {
      { backgroundColor = {1, 0, 0}, duration = 0.1 },
      { backgroundColor = {0, 0, 0}, duration = 0.1 },
      { backgroundColor = {1, 0, 0}, duration = 0.07 },
      { backgroundColor = {0, 0, 0}, duration = 0.07 },
      { backgroundColor = {1, 0, 0}, duration = 0.3, after = "default" }
    }
  })
  e:give("backgroundColor")
end
