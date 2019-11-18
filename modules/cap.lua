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


sound = love.audio.newSource('pathtoasset', 'static')


  x = 100
  y = 100
  l = 0
  t = 0
  w = 0
  h = 0
  X1 = 400
  Y1 = 300
  X2 = 415
  Y2 = 280
  hp = 100
  ex = 100
  ey = 100
  dir = 'left'

  ent = love.graphics.newImage('assets-1/monster/boggart.png')

  w = 64
  h = 64
me = love.graphics.newImage('assets-1/player/felids/cat_6.png')

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
    if collision:cc(x + 10, y, 55, 30) == false then
      x = x + 10
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
  love.graphics.print('Red road that cant reach the end.', 50, 50)
end

if x > 300 and x < 600 and y < 250 then
  love.graphics.print('countless grievances flowed out from the floor', 250, 50)
end

if x > 600 and x < 700 and y < 250 then
  love.graphics.print('It is them, the THEM', 550, 50)
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


  end)
  end


end

function love.keypressed(key)

  if x > 1000000 then
    love.exitModule()
  end

  if key == 'space' then
  sound:play()
  end

end
