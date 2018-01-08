local anim8 = require "codes/libraries/anim8"

boom_time = 0.45
destroy_time = 0.35
sprite = love.graphics.newQuad
b,x,y,w,h,sw1,sw2,sh=32,32,0,32,32,224,128,32


boom = {}
	boom.psystem = love.graphics.newParticleSystem(love.graphics.newImage("res/img/explosion.png"), b)
	boom.psystem:setParticleLifetime(boom_time)
	boom.psystem:setQuads(
			sprite(0*x,y,w,h,sw1,sh),
			sprite(1*x,y,w,h,sw1,sh),
			sprite(2*x,y,w,h,sw1,sh),
			sprite(3*x,y,w,h,sw1,sh),
			sprite(4*x,y,w,h,sw1,sh),
			sprite(5*x,y,w,h,sw1,sh),
			sprite(6*x,y,w,h,sw1,sh))

destroy = {}
	destroy.psystem = love.graphics.newParticleSystem(love.graphics.newImage("res/img/blocos.png"), b)
	destroy.psystem:setParticleLifetime(destroy_time)
	destroy.psystem:setQuads(
			sprite(0*x,y,w,h,sw2,sh),
			sprite(1*x,y,w,h,sw2,sh),
			sprite(2*x,y,w,h,sw2,sh),
			sprite(3*x,y,w,h,sw2,sh))

function CreatePlayer()

  bomberman = love.graphics.newImage("res/img/bomberman.png")
  width, h1 = bomberman:getWidth(), bomberman:getHeight()
  w1 = width / 18
  g = anim8.newGrid(w1, h1, width, h1)
  loop = 0.1

  bomba = love.graphics.newImage("res/img/bomb1.png")
  h = anim8.newGrid(32, 32, bomba:getWidth(), bomba:getHeight())

 player = {
   name = "player1",
   bomberman = bomberman,
   x = 32,
   y = 32,
   speed = 100,
   w1=w1,
   h1=h1,
   animations = {
     up = anim8.newAnimation(g('15-18', 1, 16 , 1), loop),
     left = anim8.newAnimation(g('7-10', 1, 8, 1), loop),
     down_move = anim8.newAnimation(g('1-2', 1, 2 ,1), 0.2),
     down = anim8.newAnimation(g('3-6', 1, 4, 1), loop),
     right = anim8.newAnimation(g('11-14', 1, 12, 1), loop),
   },
  life = 1,
	explosions = {},
  bombs = {},
  bomb = {bomba = anim8.newAnimation(h('1-2',1), 0.1), name = "bomb"},
  n_bomb = 1,
  fire = 2,
  fuse = 1.5
 }
end

function playerLoad()
  player.animation = player.animations.down_move
  world:add(player, player.x, player.y, player.w1, player.h1)
end

function playerUpdate(dt)
  player.animation:update(dt)
end

function playerDraw()
	player.animation:draw(bomberman, player.x, player.y)
end