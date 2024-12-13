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

local similarity = 0

for i = 1, #lefts, 1 do
    local count = 0
    
    for _, value in ipairs(rights) do
        if value == lefts[i] then
            count = count + 1
        end
    end

    similarity = similarity + count * lefts[i]
end

print(similarity)
