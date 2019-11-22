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
    x = 100
    y = 140
    me = love.graphics.newImage('assets-1/player/felids/cat_6.png')

  --collision
    w = 64
    h = 64


sound = love.audio.newSource('music/dark_ambient.mp3', 'static')

    ent = love.graphics.newImage('assets-1/monster/boggart.png')
    cam = gamera.new(-1000, -1000, 10000, 10000)




    a = love.graphics.newImage('assets-1/dungeon/floor/grey_dirt_1.png')
    b = love.graphics.newImage('assets-1/dungeon/floor/cage_3.png')
    c = love.graphics.newImage('assets-1/dungeon/floor/grey_dirt_2.png')
    d = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_6.png')
    e = love.graphics.newImage('assets-1/dungeon/gateways/zig_portal.png')

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


if y < 100 or y > 180 then

x = 5400
y = 140

end



  end



  function love.draw()
    
    if (hp > 0) then
    cam:draw(function(l, t, w, h)

  map:draw()

    collision:draw()

    love.graphics.draw(me, x, y)





    if x < 300 and y < 250 then
      love.graphics.print('do not fall in the darkness', 250, 50)
    end

    if x > 300 and x < 600 and y < 250 then
      love.graphics.print('It will engulf you!', 400, 50)
    end

    if x > 600 and x < 800 and y < 250 then
      love.graphics.print('this world will not mercy to you', 700, 50)
    end

    if x > 800 and x < 1000 and y < 250 then
      love.graphics.print('and no one will', 900, 50)
    end

    if x > 1000 and x < 1200 and y < 250 then
      love.graphics.print('You can only try to cross this ', 1100, 50)
    end

    if x > 1200 and x < 1500 and y < 250 then
      love.graphics.print('It has an ending ', 1300, 50)
    end

    if x > 1500 and x < 1700 and y < 250 then
      love.graphics.print('Theoretically have', 1600, 50)
    end

    if x > 1700 and x < 2000 and y < 250 then
      love.graphics.print('giving up all only for ', 1850, 50)
    end

    if x > 2000 and x < 2200 and y < 250 then
      love.graphics.print('Unreachable and inaccessible hope', 2100, 50)
    end

    if x > 2200 and x < 2400 and y < 250 then
      love.graphics.print('that is how humans are', 2300, 50)
    end

    if x > 2400 and x < 2600 and y < 250 then
      love.graphics.print('Hahaha ha ha ha~~~ ha~~~~~ ha~~~~~~~', 2500, 50)
    end

    if x > 2600 and x < 2800 and y < 250 then
      love.graphics.print('You wont learn how to fear', 2700, 50)
    end

    if x > 2800 and x < 3000 and y < 250 then
      love.graphics.print('unless you face them', 2900, 50)
    end

    if x > 3000 and x < 3200 and y < 250 then
      love.graphics.print('and when you face them', 3100, 50)
    end

    if x > 3200 and x < 3400 and y < 250 then
      love.graphics.print('You dont even have a chance to', 3300, 50)
    end

    if x > 3400 and x < 3600 and y < 250 then
      love.graphics.print('F  E A R!!!!', 3500, 50)
    end

    if x > 3600 and x < 3800 and y < 250 then
      love.graphics.print('I can not wait to see your fearful expression!', 3700, 50)
    end

    if x > 3800 and x < 4000 and y < 250 then
      love.graphics.print('I will always eye on you.', 3900, 50)
    end

    if x > 4000 and x < 4200 and y < 250 then
      love.graphics.print('lets see where you will jump to.     Have luck', 4100, 50)
    end


    if x > 5300 and x < 5500 and y < 250 then
      love.graphics.print('damn idiot!', 5400, 50)
    end

    if x > 5500 and x < 5800 and y < 250 then
      love.graphics.print('You almost dead!', 5650, 50)
    end

    if x > 5800 and x < 6000 and y < 250 then
      love.graphics.print('I am not your babysitter!', 5900, 50)
    end

    if x > 6000 and x < 6200 and y < 250 then
      love.graphics.print('This is the last time!', 6100, 50)
    end

    if x > 6200 and x < 6400 and y < 250 then
      love.graphics.print('have hell!', 6300, 50)
    end


  love.graphics.draw(e, 4300, 50)
  love.graphics.draw(e, 4300, 250)









if x > 6400 then
  love.graphics.draw(e, 6500, 50)
  love.graphics.draw(e, 6550, 50)
  love.graphics.draw(e, 6600, 50)
  love.graphics.draw(e, 6650, 50)


  love.graphics.draw(e, 6500, 250)
  love.graphics.draw(e, 6550, 250)
  love.graphics.draw(e, 6600, 250)
  love.graphics.draw(e, 6650, 250)

end





      end)
      end


    end

    function love.keypressed(key)

      if x > 4300 and x < 4900 then
        LOAD_MODULE =  'cap3'
        love.exitModule()
      end

    if key == 'right' or key == 'left' then
      sound:play()
      end
    --key == 'space'
    end
