
require "codes/bomb/bombupdate"
require "codes/bomb/checkobjects"
require "codes/bomb/checkobjects2"
require "codes/player_one/playerone"
require "codes/player_one/player1"
require "codes/player_one/bombdirection"
require "codes/player_two/player2"
require "codes/player_two/playertwo"
require "codes/player_two/bombdirection2"
require "codes/maps/map"
require "codes/player_one/draw"
require "codes/player_one/explosionandblocks"
require "codes/player_two/explosionandblocks2"
require "codes/powerup/powerup"
require "codes/powerup/characenergy"

math.randomseed(os.time())

function fase1_load()
  sound = love.audio.newSource("res/sound/explosion.ogg")
  sound2 = love.audio.newSource("res/sound/plant.ogg")
  icon = love.graphics.newImage("res/img/player1.png")
  icon2 = love.graphics.newImage("res/img/player2.png")

	CreatePlayer()
  CreatePlayer2()
  playerLoad()
  player2Load()
  LoadMap()
end


function fase1_update(dt)
  if player.life <= 0 then 
    reset2()
  end 
  if player2.life <= 0 then 
    reset()
  end

  ControlUpdate(dt)
  Control2Update(dt)
	
  BombUpdate(dt) 
  
  BoomUpdate(dt)
  Boom2Update(dt)

  destroy.psystem:update(dt)
 
  playerUpdate(dt)
  player2Update(dt)

end

function fase1_draw()
  draw()
  bombDraw()
  bomb2Draw()
  playerDraw()
  player2Draw()

end

function reset()
  gamestate = "reset"
  reset_load()
end

function reset2()
  gamestate = "reset2"
  reset2_load()
end