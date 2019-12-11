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

zx = 0
zy = 0

  x = 64
  y = 64
  me = love.graphics.newImage('assets-1/player/felids/cat_6.png')

  fx = 0
  fy = 0
  floor = love.graphics.newImage('assets-1/dungeon/floor/mesh_3.png')

    c = love.graphics.newImage('assets-1/dungeon/wall/zot_blue_3.png')

    --collision
      w = 64
      h = 64
sound = love.audio.newSource('music/Dark Descent.mp3', 'static')

hp = 100


  cam = gamera.new(0, 0, 9000, 9000)

end

function love.update(dt)


  cam:setPosition(x, y)


      if love.keyboard.isDown('up') and y > -5 then
          y = y - 30
      end


      if love.keyboard.isDown('down') and y < 8950 then
          y = y + 30
      end


  if love.keyboard.isDown('right') and x < 8950 then
          x = x + 30
      end


      if love.keyboard.isDown('left') and x > 0 then
          x = x - 30
      end


    end


    function love.draw()

      if (hp > 0) then

      cam:draw(function(l, t, w, h)


        for i2 = 0, 141 do
          for i = 0, 141 do
            love.graphics.draw(floor, fx + (i * 64), fy + (i2 * 64) )
          end
        end



      for i4 = 0, 200 do
    for i3 = 0, 100 do

    love.graphics.print('The End', zx + (i3 * 120), zy + (i4 * 50),0,2)
      love.graphics.setColor(1, 0, 0)
  end
end





            love.graphics.draw(me, x, y)


          end)
          end
        end



function love.keypressed(key)

  if x > 8900 and y > 8900 then
    love.exitModule()
    end

if key == 'right' or key == 'left' or key == 'up' or key == 'down' then
  sound:play()
  end

  end
