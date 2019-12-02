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


  x = 64
  y = 64
  me = love.graphics.newImage('assets-1/player/felids/cat_6.png')

  fx = 64
  fy = 64
  floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_0.png')

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
    --18 line
    {c,'nil',c,'nil',c,'nil','nil','nil',c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c,'nil',c},
    --19 line
    {c,'nil',c,'nil',c,'nil',c,'nil',c,'nil',c,c,c,c,c,c,c,c,c,c,c,c,c,'nil',c},
    --20 line
    {c,'nil',c,'nil','nil','nil',c,'nil',c,'nil',c,'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil',c},
    --21 line
    {c,'nil',c,c,c,c,c,'nil',c,'nil',c,'nil',c,c,c,c,c,'nil',c,c,c,c,c,'nil',c},
    --22 line
    {c,'nil',c,'nil',c,'nil',c,'nil',c,'nil',c,'nil',c,'nil','nil','nil',c,'nil',c,'nil',c,'nil','nil','nil',c},
    --23 line
    {c,'nil',c,'nil',c,'nil',c,'nil',c,'nil',c,c,c,c,c,'nil',c,'nil',c,'nil',c,c,c,c,c},
    --24 line
    {c,'nil','nil','nil',c,'nil','nil','nil',c,'nil','nil','nil','nil','nil','nil','nil',c,'nil','nil','nil','nil','nil','nil','nil',c},
    -- top
    {c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c},

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


    for i2 = 0, 23 do
      for i = 0, 23 do
        love.graphics.draw(floor, fx + (i * 64), fy + (i2 * 64) )
      end
    end


    collision:draw()


    love.graphics.draw(me, x, y)


    --line 1
    if x < 256 and y < 128 then
      love.graphics.print('go find the exit, for victory!', 100, 100)
    end

    if x < 512 and x > 256 and y < 128 then
      love.graphics.print('keep going this way!', 400, 100)
    end

    if x < 768 and x > 512 and y < 128 then
      love.graphics.print('destroy this wall!', 600, 100)
    end

    if x < 768 and x > 704 and y < 256 then
      love.graphics.print('hahahahaha you did trust me.', 700, 150)
    end

    --line 2
    if x < 256 and y < 256 and y > 128 then
      love.graphics.print('alright, it is here', 100, 220)
    end

    if x < 768 and x > 256 and y < 256 and y > 128 then
      love.graphics.print('walk till the end, you will find the truth of this world', 300, 220)
    end

    if x < 1472 and x > 850 and y < 128 then
      love.graphics.print('I will miss this adventure time that we spent together.', 850, 100)
    end

    if x < 1600 and x > 1400 and y < 256 then
      love.graphics.print('It is ridiculously enough, as you are! HAHAHA!', 1250, 100)
    end


    --line 3

    if x < 256 and y < 384 and y > 256 then
      love.graphics.print('Stop and turn to here', 100, 340)
    end

    if x < 768 and x > 256 and y < 384 and y > 256 then
      love.graphics.print('You made the right choice', 300, 340)
    end

    if x < 768 and x > 256 and y < 512 and y > 384 then
      love.graphics.print('Here is the ending', 300, 470)
    end












    --ending point
    if x > 1400 and y > 1300 then
      love.graphics.print('No! Leave here! That is a trap!', 1350, 1400,0,2)
    end


    end)
    end

  end


  function love.keypressed(key)

    if x > 1472 and y > 1472 then
      --LOAD_MODULE =  'cap'
      love.exitModule()
    end

    if key == 'right' or key == 'left' or key == 'up' or key == 'down' then
      sound:play()
      end

  end
