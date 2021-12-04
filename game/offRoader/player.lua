Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("makeThis0.png")
    -- start in center of screen
    self.x = love.graphics.getWidth / 2
    self.y = love.graphics.getHeight / 2
    self.direction = 0
end

function Player:update(dt)
    -- movement
    if love.keyboard.isDown("w") then
        self.y = self.y + self.speed * dt
    else if love.keyboard.isDown("s") then
        self.y = self.y - self.speed * dt
    end
    
    if love.keyboard.isDown("d") then
        self.x = self.x + self.speed * dt
    else if love.keyboard.isDown("a") then
        self.x = self.x - self.speed * dt
    end

    -- handle out of bounds
    local xBoundary = love.graphics.getWidth

    local yBoundary = love.graphics.getHeight

    if self.x < 0 then
        self.x = 0
    else if self.x > xBoundary then
        self.x = xBoundary
    end

    if self.y < 0 then
        self.y = 0
    else if self.y > yBoundary then
        self.y = yBoundary
    end
    -- edit rotation to be in direction of mouse https://www.tutorialspoint.com/lua/lua_math_library.htm
    v = {}
    v[0] = (love.mouse.getx - self.x)
    v[1] = (love.mouse.gety - self.y)
    v[0] = v[0]/math.sqrt(v[0] * v[0] + v[1] * v[1])
    v[1] = v[1]/math.sqrt(v[0] * v[0] + v[1] * v[1])
    self.direction = math.atan2(v[1], v[0])
end

-- shoot a projectile
function Player:mousepressed()
    table.insert(projectileList, Bullet(self.x, self.y, self.direction))
end

function Player:draw()
    -- declaring self.image as non-string is correct
    love.graphics.draw(self.image, self.x, self.y, self.direction)
end