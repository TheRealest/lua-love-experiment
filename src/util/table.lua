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

return utilTable
