local Map = require 'core/map'
local Entity = require 'core/entity'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'




function love.load()


  G = love.math.random(-3, 4);
  H = love.math.random(-3, 4);
  xx = love.math.random(0, 1000);
  yy = love.math.random(0, 1000);


sound = love.audio.newSource('music/dark_ambient.mp3', 'static')


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
  y = 100
  me = love.graphics.newImage('assets-1/player/felids/cat_6.png')

--collision
  w = 64
  h = 64



  ent = love.graphics.newImage('assets-1/monster/boggart.png')
  cam = gamera.new(0, 0, 100000, 300)

  a = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_9.png')
  b = love.graphics.newImage('assets-1/dungeon/floor/cage_3.png')
  c = love.graphics.newImage('assets-1/dungeon/floor/green_bones_12.png')


  mapTemplate = {
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},
    {b, b, b, b, b},

    }

    wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')

    collision = {
      {a, a, a, a, c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, 'nil', 'nil', 'nil', c},
      {a, a, a, a, c},
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



end



function love.draw()
  if (hp > 0) then
  cam:draw(function(l, t, w, h)

  map:draw()

  collision:draw()

  love.graphics.draw(me, x, y)

if x < 300 and y < 250 then
  love.graphics.print('Red road that can not reach the end.', 50, 50)
end

if x > 300 and x < 600 and y < 250 then
  love.graphics.print('Countless grievances flowed out from the floor', 250, 50)
end

if x > 600 and x < 700 and y < 250 then
  love.graphics.print('It is them, THEM!!', 550, 50)
end

if x > 800 and x < 1000 and y < 250 then
  love.graphics.print('You heard them', 750, 50)
end

if x > 1000 and x < 1200 and y < 250 then
  love.graphics.print('They are praying for you', 950, 50)
end

if x > 1200 and x < 1500 and y < 250 then
  love.graphics.print('For you to stay with them', 1200, 50)
end

if x > 1500 and x < 1700 and y < 250 then
  love.graphics.print('Forever!!!', 1450, 50)
end

if x > 1700 and x < 2000 and y < 250 then
  love.graphics.print('lets find it', 1850, 50)
end

if x > 2000 and x < 2200 and y < 250 then
  love.graphics.print('reach the end', 2100, 50)
end

if x > 2200 and x < 2400 and y < 250 then
  love.graphics.print('you will find yourself at the end', 2300, 50)
end

if x > 2400 and x < 2600 and y < 250 then
  love.graphics.print('or your death', 2500, 50)
end

if x > 2600 and x < 2800 and y < 250 then
  love.graphics.print('before start, make sure', 2700, 50)
end

if x > 2800 and x < 3000 and y < 250 then
  love.graphics.print('do not let them catch you', 2900, 50)
end

if x > 3000 and x < 3200 and y < 250 then
  love.graphics.print('I will promise you that', 3100, 50)
end

if x > 3200 and x < 3400 and y < 250 then
  love.graphics.print('you will not like that at all', 3300, 50)
end

if x > 3400 and x < 3600 and y < 250 then
  love.graphics.print('never stop! run! run!', 3500, 50)
end

if x > 3600 and x < 3800 and y < 250 then
  love.graphics.print('damn fast you are...', 3700, 50)
end

if x > 3800 and x < 4000 and y < 250 then
  love.graphics.print('let me help you this time, only once!', 3900, 50)
end




  end)
  end


end

function love.keypressed(key)

  if x > 4300 then
    love.exitModule()
  end

if key == 'right' then
  sound:play()
  end
--key == 'space'
end
