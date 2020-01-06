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

--me
  x = 128
  y = 128
  me = love.graphics.newImage('assets-1/player/felids/cat_6.png')
--floor start location
  fx = 64
  fy = 64
  floor = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_3.png')

    c = love.graphics.newImage('assets-1/dungeon/wall/bars_red_8.png')

    --collision wide and hight
      w = 64
      h = 64
--music
sound = love.audio.newSource('music/The Dark Amulet.mp3', 'static')
--collision
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

--collision map
  collision = Map:new(collision)
--hp, only lose hp at last map
  hp = 100

--camra location limit
    cam = gamera.new(-1000, -1000, 10000, 10000)




end

function love.update(dt)


  cam:setPosition(x, y)
-- player movement

      if love.keyboard.isDown('up') then
        if collision:cc(x, y - 1, 55, 30) == false then
          y = y - 2
        end
      end


      if love.keyboard.isDown('down') then
        if collision:cc(x, y + 1, 55, 30) == false then
          y = y + 2
        end
      end


      if love.keyboard.isDown('right') then
        if collision:cc(x + 1, y, 55, 30) == false then
          x = x + 2
        end
      end


      if love.keyboard.isDown('left') then
        if collision:cc(x - 1, y, 55, 30) == false then
          x = x - 2
        end
      end


end

  function love.draw()

    if (hp > 0) then
    cam:draw(function(l, t, w, h)

--Map draw 2.0, this way easier
for i2 = 0, 50 do
  for i = 0, 50 do
    love.graphics.draw(floor, fx + (i * 64), fy + (i2 * 64) )
  end
end

    collision:draw()


--story
    if x < 1200 and y < 350 then
      love.graphics.print('lets see what we have here', 200, 50,0,3)
    end

    if x < 1200 and y < 550 then
      love.graphics.print('You need to find that unique floor.', 200, 250,0,3)
    end

    if x < 1200 and y < 850 then
      love.graphics.print('Not unique on outlook, but immanence', 200, 550,0,3)
    end

    if x < 1200 and y < 1050 then
      love.graphics.print('We have no other way to leave this space', 200, 750,0,3)
    end

    if x < 1200 and y < 1250 then
      love.graphics.print('Those Red array limited my power', 200, 950,0,3)
    end

    if x < 1200 and y < 1450 then
      love.graphics.print('All I can do is make you move faster', 200, 1150,0,3)
    end

    if x < 1200 and y < 1650 then
      love.graphics.print('1/2500 chance, go find it!', 200, 1350,0,3)
    end

    if x < 1200 and y < 1850 then
      love.graphics.print('Hint: You have to Circle around the special square to leave', 200, 1550,0,3)
    end

love.graphics.draw(me, x, y)



end)
end


end
--go to next map
function love.keypressed(key)

  if x > 1728 and x < 1792 and y > 1920 and y < 1984 then
    LOAD_MODULE =  'cap4'
    love.exitModule()
  end
--play music
  if key == 'right' or key == 'left' then
    sound:play()
    end

end
