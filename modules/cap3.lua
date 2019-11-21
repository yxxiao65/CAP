local Map = require 'core/map'
local Entity = require 'core/entity'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()


  cam = gamera.new(-1000, -1000, 10000, 10000)



  --camra
    l = 0
    t = 0
    w = 0
    h = 0


  x = 100
  y = 140
  me = love.graphics.newImage('assets-1/player/felids/cat_6.png')

  fx = 0
  fy = 0
  floor = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_9.png')

    ent = love.graphics.newImage('assets-1/monster/boggart.png')

    --collision
      w = 64
      h = 64


  collision = {
          {ent, ent},
          }


  collision = Map:new(collision)

  hp = 100



end

function love.update(dt)


  cam:setPosition(x, y)


      if love.keyboard.isDown('up') then
        if collision:cc(x, y - 1, 55, 30) == false then
          y = y - 1
        end
      end


      if love.keyboard.isDown('down') then
        if collision:cc(x, y + 1, 55, 30) == false then
          y = y + 1
        end
      end


      if love.keyboard.isDown('right') then
        if collision:cc(x + 1, y, 55, 30) == false then
          x = x + 1
        end
      end


      if love.keyboard.isDown('left') then
        if collision:cc(x - 1, y, 55, 30) == false then
          x = x - 1
        end
      end


end

  function love.draw()

    if (hp > 0) then
    cam:draw(function(l, t, w, h)






  end)
  end



for i2 = 0, 50 do
  for i = 0, 50 do
    love.graphics.draw(floor, fx + (i * 64), fy + (i2 * 64) )
  end
end


    collision:draw()


love.graphics.draw(me, x, y)


end
