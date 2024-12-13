local file = io.open("data/1.data")
if not file then
    error("failed to open file")
end

local lefts, rights = {}, {}

for line in file:lines() do
    local left, right = line:match("(%S+)%s+(%S+)")
    table.insert(lefts, tonumber(left))
    table.insert(rights, tonumber(right))
end

file:close()

table.sort(lefts)
table.sort(rights)

local distance = 0

for i = 1, #lefts, 1 do
    distance = distance + math.abs(lefts[i] - rights[i])
end

print(distance)
