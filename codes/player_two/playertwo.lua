local anim8 = require "codes/libraries/anim8"

function CreatePlayer2()
 	bomberman2 = love.graphics.newImage("res/img/bomberman2.png")
 	width, h2 = bomberman2:getWidth(), bomberman2:getHeight()
  	w2 = width / 18
  	i = anim8.newGrid(w2, h2, width, h2)
  	loop = 0.1

  	bomba2 = love.graphics.newImage("res/img/bomb1.png")
  	j = anim8.newGrid(32, 32, bomba2:getWidth(), bomba2:getHeight())

	player2 = {
		name = "player2",
		bomberman2 = bomberman2,
		x = 423,
		y = 359,
		speed = 100,
		w2=w2,
		h2=h2,
		animations = {
			up = anim8.newAnimation(i('15-18', 1, 16 , 1), loop),
			left = anim8.newAnimation(i('7-10', 1, 8, 1), loop),
			down_move = anim8.newAnimation(i('1-2', 1, 2 ,1), 0.2),
			down = anim8.newAnimation(i('3-6', 1, 4, 1), loop),
			right = anim8.newAnimation(i('11-14', 1, 12, 1), loop),
		},
 		life = 1,
 		explosions2 = {},
 		bombs2 = {},
 		bomb2 = {bomba2 = anim8.newAnimation(j('1-2',1), 0.1), name = "bomb2"},
 		n_bomb = 1,
 		fire = 2,
 		fuse2 = 1.5
	}
end

function player2Load()
	player2.animation = player2.animations.down_move
	world:add(player2, player2.x, player2.y, player2.w2, player2.h2)
end

function player2Update(dt)

	player2.animation:update(dt)

end

function player2Draw()
	player2.animation:draw(bomberman2, player2.x, player2.y)
end
