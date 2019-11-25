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


  x = 66
  y = 66
  me = love.graphics.newImage('assets-1/player/felids/cat_6.png')

  fx = 64
  fy = 64
  floor = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_3.png')

    c = love.graphics.newImage('assets-1/dungeon/wall/bars_red_8.png')

    --collision
      w = 64
      h = 64
sound = love.audio.newSource('music/Dark Descent.mp3', 'static')


collision = {
    --bottom 1 line
    {c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c},
    --2 line
    {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    --3 line
    {c,'nil',c,'nil',c,'nil',c,c,c,c,c,c,c,c,c,c,c,'nil',c,c,c,c,c,'nil',c},
    --4 line
    {c,'nil',c,'nil',c,'nil',c,'nil','nil','nil',c,'nil','nil','nil','nil','nil',c,'nil',c,'nil','nil','nil','nil','nil',c},
    --5 line
    {c,'nil',c,'nil',c,'nil',c,'nil',c,c,c,c,c,'nil',c,'nil',c,'nil',c,'nil',c,c,c,'nil',c},
    --6 line
    {c,'nil',c,'nil',c,'nil',c,'nil',c,'nil','nil','nil','nil','nil',c,'nil',c,'nil',c,'nil',c,'nil',c,'nil',c},
    --7 line
    {c,'nil',c,'nil',c,'nil',c,'nil',c,'nil',c,c,c,c,c,c,c,'nil',c,c,c,'nil',c,'nil',c},
    --8 line
    {c,'nil',c,'nil',c,'nil','nil','nil',c,'nil','nil','nil','nil','nil','nil','nil','nil','nil',c,'nil',c,'nil','nil','nil',c},
    --9 line
    {c,'nil',c,'nil',c,c,c,'nil',c,c,c,c,c,c,c,c,c,c,c,'nil',c,c,c,c,c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    --10 line
    {c,'nil',c,'nil','nil','nil',c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    --11 line
    {c,'nil',c,c,c,'nil',c,'nil',c,'nil',c,c,c,c,c,c,c,c,c,c,c,c,c,'nil',c},
    --12 line
    {c,'nil','nil','nil',c,'nil',c,'nil',c,'nil',c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    --13 line
    {c,c,c,c,c,'nil',c,'nil',c,'nil',c,'nil',c,c,c,c,c,c,c,c,c,'nil',c,c,c},
    --14 line
    {c,'nil','nil','nil','nil','nil',c,'nil',c,'nil',c,'nil','nil','nil',c,'nil','nil','nil','nil','nil',c,'nil','nil','nil',c},
    --15 line
    {c,'nil',c,c,c,c,c,'nil',c,'nil',c,c,c,'nil',c,'nil',c,c,c,'nil',c,c,c,c,c},
    --16 line
    {c,'nil',c,'nil','nil','nil','nil','nil',c,'nil',c,'nil','nil','nil',c,'nil','nil','nil',c,'nil',c,'nil','nil','nil',c},
    --17 line
    {c,'nil',c,'nil',c,c,c,c,c,'nil',c,c,c,c,c,c,c,c,c,'nil',c,'nil',c,'nil',c},
    --18 line(have not finish)
    {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    {c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    {c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c},

  }

  collision = Map:new(collision)


      hp = 100


        cam = gamera.new(-1000, -1000, 10000, 10000)

end



function love.update(dt)


  cam:setPosition(x, y)


      if love.keyboard.isDown('up') then
        if collision:cc(x, y - 1, 30, 30) == false then
          y = y - 2
        end
      end


      if love.keyboard.isDown('down') then
        if collision:cc(x, y + 1, 30, 30) == false then
          y = y + 2
        end
      end


      if love.keyboard.isDown('right') then
        if collision:cc(x + 1, y, 30, 30) == false then
          x = x + 2
        end
      end


      if love.keyboard.isDown('left') then
        if collision:cc(x - 1, y, 30, 30) == false then
          x = x - 2
        end
      end


end


function love.draw()

  if (hp > 0) then

  cam:draw(function(l, t, w, h)


    collision:draw()


    love.graphics.draw(me, x, y)



    end)
    end

  end


  function love.keypressed(key)

    if x > 1728 and x < 1792 and y > 1920 and y < 1984 then
      LOAD_MODULE =  'cap'
      love.exitModule()
    end

    if key == 'right' or key == 'left' or key == 'up' or key == 'down' then
      sound:play()
      end

  end
