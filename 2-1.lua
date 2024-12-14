local file = io.open("data/2.data")

local rows = {}

for line in file:lines() do
    local row = {}

    for number in string.gmatch(line, "%S+") do
        table.insert(row, tonumber(number))
    end

    table.insert(rows, row)
end

file:close()

function is_matching_row(row)
    local get_change

    if row[1] > row[2] then
        get_change = function (a, b) return b - a end
    else
        get_change = function (a, b) return a - b end
    end

    local previous = row[1]

    for i = 2, #row do
        local difference = get_change(row[i], previous)

        if difference < 1 or difference > 3 then
            return false
        end

        previous = row[i]
    end

    return true
end

local count = 0

for _, row in ipairs(rows) do
    if is_matching_row(row) then
        count = count + 1
    end
end

print(count)
