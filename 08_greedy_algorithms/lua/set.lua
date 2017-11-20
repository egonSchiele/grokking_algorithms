set = {}
local mt = {__index = set}

function set.new(array)
    local s = {}
    if array ~= nil then
        for _, value in pairs(array) do
            s[value] = true
        end
    end
    return setmetatable(s, mt)
end

function set:add(value)
    if value ~= nil then
        self[value] = true
    end
    return self
end

function set:remove(value)
    if value ~= nil then
        self[value] = nil
    end
    return self
end

function set:len()
    local len = 0
    for _ in pairs(self) do
        len = len + 1
    end
    return len
end

function set.union(a, b)
    local result = set.new()
    for key in pairs(a) do
        result[key] = true
    end
    for key in pairs(b) do
        result[key] = true
    end
    return result
end

function set.difference(a, b)
    local result = set.new()
    for key in pairs(a) do
        result[key] = true
    end
    for key in pairs(b) do
        result[key] = nil
    end
    return result
end

function set.intersection(a, b)
    local result = set.new()
    for key in pairs(a) do
        result[key] = b[key]
    end
    return result
end

function set.tostring(s)
    local array = {}
    for key in pairs(s) do
        array[#array + 1] = tostring(key)
    end
    return "{" .. table.concat(array, ", ") .. "}"
end

mt.__add = set.union
mt.__sub = set.difference
mt.__mul = set.intersection
mt.__tostring = set.tostring

return set