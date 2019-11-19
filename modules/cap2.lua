local Map = require 'core/map'
local Entity = require 'core/entity'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'



function love.load()

  --camra
    l = 0
    t = 0
    w = 0
    h = 0


    X1 = 400
    Y1 = 300
    X2 = 415
    Y2 = 280

    hp = 100

    dir = 'left'

  --me
    x = 5400
    y = 140
    me = love.graphics.newImage('assets-1/player/felids/cat_6.png')

  --collision
    w = 64
    h = 64


sound = love.audio.newSource('music/dark_ambient.mp3', 'static')

    ent = love.graphics.newImage('assets-1/monster/boggart.png')
    cam = gamera.new(0, 0, 100000, 300)




    a = love.graphics.newImage('assets-1/dungeon/floor/grey_dirt_1.png')
    b = love.graphics.newImage('assets-1/dungeon/floor/cage_3.png')
    c = love.graphics.newImage('assets-1/dungeon/floor/grey_dirt_2.png')
    d = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_6.png')


    mapTemplate = {
      {b, 'nil', b, 'nil', 'nil'},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil', 'nil', b},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},
      {'nil', 'nil', d},

      }


    collision = {
      {a, a, a, a, c},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {a, a, a, a, c},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil'},
      {'nil', a, a, a},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
      {'nil', a, 'nil', c},
    }

  map = Map:new(mapTemplate)

  collision = Map:new(collision)




  end



  function love.update(dt)


    cam:setPosition(x, y)


    if love.keyboard.isDown('up') then
      if collision:cc(x, y - 1, 55, 30) == false then
        y = y - 10
      end
    end


    if love.keyboard.isDown('down') then
      if collision:cc(x, y + 1, 55, 30) == false then
        y = y + 10
      end
    end


    if love.keyboard.isDown('right') then
      if collision:cc(x + 1, y, 55, 30) == false then
        x = x + 10
      end
    end


    if love.keyboard.isDown('left') then
      if collision:cc(x - 1, y, 55, 30) == false then
        x = x - 10
      end
    end


if y < 100 or y > 180 then

x = 5400

end



  end



  function love.draw()
    if (hp > 0) then
    cam:draw(function(l, t, w, h)

  map:draw()

    collision:draw()

    love.graphics.draw(me, x, y)





    if x < 300 and y < 250 then
      love.graphics.print('.', 250, 50)
    end

    if x > 300 and x < 600 and y < 250 then
      love.graphics.print('.', 400, 50)
    end

    if x > 600 and x < 800 and y < 250 then
      love.graphics.print('.', 700, 50)
    end

    if x > 800 and x < 1000 and y < 250 then
      love.graphics.print('.', 900, 50)
    end

    if x > 1000 and x < 1200 and y < 250 then
      love.graphics.print('.', 910, 50)
    end

    if x > 1200 and x < 1500 and y < 250 then
      love.graphics.print('.', 1300, 50)
    end

    if x > 1500 and x < 1700 and y < 250 then
      love.graphics.print('.', 1600, 50)
    end

    if x > 1700 and x < 2000 and y < 250 then
      love.graphics.print('.', 1850, 50)
    end

    if x > 2000 and x < 2200 and y < 250 then
      love.graphics.print('.', 2100, 50)
    end

    if x > 2200 and x < 2400 and y < 250 then
      love.graphics.print('.', 2300, 50)
    end

    if x > 2400 and x < 2600 and y < 250 then
      love.graphics.print('.', 2500, 50)
    end

    if x > 2600 and x < 2800 and y < 250 then
      love.graphics.print('.', 2700, 50)
    end

    if x > 2800 and x < 3000 and y < 250 then
      love.graphics.print('.', 2900, 50)
    end

    if x > 3000 and x < 3200 and y < 250 then
      love.graphics.print('.', 3100, 50)
    end

    if x > 3200 and x < 3400 and y < 250 then
      love.graphics.print('.', 3300, 50)
    end

    if x > 3400 and x < 3600 and y < 250 then
      love.graphics.print('.', 3500, 50)
    end

    if x > 3600 and x < 3800 and y < 250 then
      love.graphics.print('.', 3700, 50)
    end

    if x > 3800 and x < 4000 and y < 250 then
      love.graphics.print('.', 3900, 50)
    end


    if x > 5300 and x < 5600 and y < 250 then
      love.graphics.print('.!!!! d', 5500, 50)
    end


      end)
      end


    end

    function love.keypressed(key)

      if x > 4300 and x < 4900 then
        love.exitModule()
      end

    if key == 'right' or key == 'left' then
      sound:play()
      end
    --key == 'space'
    end
