-- 11/30: added check collision
Projectile = Object:extend()

function Projectile:new(x,y,v)
    self.image = love.graphics.newImage("makeThis1.png")
    self.x = x
    self.y = y
    self.direction = v
    self.speed = 700
    self.width = self.image:getWidth()
    self.width = self.image:getHeight()
    self.dead = false
end

function Projectile:update()
    self.x = self.x + math.cos(self.direction) * self.speed
    self.y = self.y + math.sin(self.direction) * self.speed
end

function Projectile:draw()
    love.graphics.draw(self.image, self.x, self.y, self.direction)
end

function Projectile:checkCollision(ogres)
    for i,v in ipairs(ogres) do
        if love.physics.getDistance(self, v) <= 0 then
            -- remove ogre and bullet
            table.remove(ogreList, i)
            self.dead = true
        end
        if self.x > love.graphics.getWidth or self.x < 0 or self.y < 0 or self.y > love.graphics.getHeight then
            self.dead = true
        end
    end
end