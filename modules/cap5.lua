local Map = require 'core/map'
local Entity = require 'core/entity'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()



  G = 20
  H = -20

ex = 300
ey = 300



  e = love.graphics.newImage('assets-1/player/felids/cat_6.png')

ex2 = 400
ey2 = 400

  e2 = love.graphics.newImage('assets-1/player/felids/cat_6.png')
  --camra
    l = 0
    t = 0
    w = 0
    h = 0


  x = 64
  y = 64
  me = love.graphics.newImage('assets-1/player/felids/cat_6.png')

  fx = 64
  fy = 64
  floor = love.graphics.newImage('assets-1/dungeon/floor/mesh_3.png')

    c = love.graphics.newImage('assets-1/dungeon/wall/zot_blue_3.png')

    --collision
      w = 64
      h = 64
sound = love.audio.newSource('music/Dark Descent.mp3', 'static')


collision = {

  {c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
  {c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c},

  }
  collision = Map:new(collision)


      hp = 100


        cam = gamera.new(0, 0, 3392, 3392)

end



function love.update(dt)


  cam:setPosition(x, y)


      if love.keyboard.isDown('up') then
        if collision:cc(x, y - 1, 30, 30) == false then
          y = y - 20
        end
      end


      if love.keyboard.isDown('down') then
        if collision:cc(x, y + 1, 30, 30) == false then
          y = y + 20
        end
      end


      if love.keyboard.isDown('right') then
        if collision:cc(x + 1, y, 30, 30) == false then
          x = x + 20
        end
      end


      if love.keyboard.isDown('left') then
        if collision:cc(x - 1, y, 30, 30) == false then
          x = x - 20
        end
      end


--enemy
      if x > ex then
       ex = ex + 3
       end

       if x < ex then
        ex = ex - 3
      end

       if y > ey then
         ey = ey + 3
       end

       if y < ey then
         ey = ey - 3
       end



--attack
     if ex > x - 5 and ex < x + 5 and ey > y - 5 and ex < y + 5 then
       x = x + G
       y = y + H
     end



end


function love.draw()

  if (hp > 0) then

  cam:draw(function(l, t, w, h)


    for i2 = 0, 50 do
      for i = 0, 50 do
        love.graphics.draw(floor, fx + (i * 64), fy + (i2 * 64) )
      end
    end


    collision:draw()


    love.graphics.draw(me, x, y)

    love.graphics.draw(e, ex, ey)

    love.graphics.draw(e2, ex2, ey2)



  end)
  end

end



  function love.keypressed(key)

  --if x > 1728 and x < 1792 and y > 1920 and y < 1984 then
    if x > 3000 then
      love.exitModule()
    end

    if key == 'right' or key == 'left' or key == 'up' or key == 'down' then
      sound:play()
    end

  end
