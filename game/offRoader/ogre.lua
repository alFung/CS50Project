Ogre = Object:extend()
-- make these spawn in somehow
-- possible "fixture" error with physics.distance
-- fixture = love.physics.newFixture( body, shape, density )
function Ogre:new()
    self.image = love.graphics.newImage("makeThis2.png")
    -- set random starter coords on edge
    coinFlip = math.random(2)
    if coinFlip = 2 then
        self.x = math.random() * love.graphics.getWidth
        self.y = 0
    else
        self.y = math.random() * love.graphics.getHeight
        self.x = 0
    end
    self.direction = 0
    self.speed = 100
end

function Ogre:update(dt, obj)
    xDist = self.x - obj.x
    yDist = self.y - obj.y

    self.x = self.x + xDist/math.sqrt(xDist * xDist + yDist * yDist) * self.speed * dt
    self.y = self.y + yDist/math.sqrt(xDist * xDist + yDist * yDist) * self.speed * dt

    self.direction = math.atan2(yDist, xDist)
end

function Ogre:draw()
    love.graphics.draw(self.image, self.x, self.y, self.direction)
end