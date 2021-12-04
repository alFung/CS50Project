
--https://sheepolution.com/learn/book/3
function love.load()
    Object = require "classic"
    require "player"
    require "enemy"
    require "projectile"
    difficulty = 1
    speed = 1
    player = player()
    projectileList = {}
    ogreList = {}
end

function love.update()
    player:update(dt)
    for i,v in ipairs(projectileList) do
        v:update(dt)
        v:checkCollision(ogreList)
        if v.dead then
            table.remove(ogreList, i)
        end
    end
    for i,v in ipairs(ogreList) do
        v:update(dt, player)
        v:checkCollision(player)
    end
end

function love.draw()
    player:draw()
    for i,v in ipairs(projectileList) do
        v:draw()
    for i,v in ipairs(ogreList) do
        v:draw()
end