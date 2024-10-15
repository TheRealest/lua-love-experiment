local utilTable = {}

function utilTable.map(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

function utilTable.tally(t)
  local counts = {}
  for _, v in ipairs(t) do
    counts[v] = (counts[v] or 0) + 1
  end
  return counts
end

function utilTable.keys(t)
  local keys = {}
  for k in pairs(t) do
    table.insert(keys, k)
  end
  return keys
end

function utilTable.shuffle(t)
    local s = {}
    for i = 1, #t do s[i] = t[i] end

    for i = #t, 2, -1 do
        local j = love.math.random(i)
        s[i], s[j] = s[j], s[i]
    end
    return s
end

function utilTable.sample(t)
  return utilTable.shuffle(t)[1]
end

return utilTable
