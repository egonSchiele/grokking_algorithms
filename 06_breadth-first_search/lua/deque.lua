deque = {}

function deque:new()
    self.__index = self
    return setmetatable({first = 0, last = -1}, self)
end

function deque:len()
    return self.last - self.first + 1
end

function deque:push_left(value)
    local first = self.first - 1
    self.first = first
    self[first] = value
end

function deque:push_right(value)
    local last = self.last + 1
    self.last = last
    self[last] = value
end

function deque:pop_left()
    local first = self.first
    if first > self.last then
        error "deque is empty"
    end
    local value = self[first]
    self[first] = nil
    self.first = first + 1
    return value
end

function deque:pop_right()
    local last = self.last
    if self.first > last then
        error "deque is empty"
    end
    local value = self[last]
    self[last] = nil
    self.last = last - 1
    return value
end

return deque