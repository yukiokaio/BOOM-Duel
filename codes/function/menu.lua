require "codes/function/rectangle"
require "codes/function/circle"


function menu_load()
	mx, my = 0, 0 

 	startx = 4
  	starty = 240
  	starheight = 76
  	startwidth= 130

  	exitx = 6
  	exity = 6
  	exitheight = 64
  	exitwidth = 64

	image = love.graphics.newImage("res/img/fundo.png")
	image2 = love.graphics.newImage("res/img/button-start.png")
	image3 = love.graphics.newImage("res/img/interrogation.png")
	image4 = love.graphics.newImage("res/img/exit.png")

	fonttitle = love.graphics.setNewFont("res/fonte/bm.ttf", 45)

	abertura = love.audio.newSource("res/sound/menu_music.mp3")

	
	
end

function menu_update(dt)
	if gamestate == "menu" then
    	abertura:play()
  	end 
	function love.mousepressed(x, y, button)
		if gamestate == "menu" then
			abertura:stop()
			if button == 1 then
				mx = x
				my = y
				if checaToqueC(mx,my,410,10,64) then
					instruction()
				end
				if toqueretangulo(mx, my, startx, starty,startwidth,starheight ) then
					fase1()
				end
				if toqueretangulo(mx, my, exitx, exity,exitwidth,exitheight ) then
					love.event.quit()
				end
			end
		end
	end
end 

function menu_draw()
	love.graphics.draw(image, 0, 0)
	love.graphics.draw(image2,startx, starty)
	love.graphics.draw(image3,410, 10)
	love.graphics.draw(image4,exitx, exity)

	love.graphics.setFont(fonttitle)
	love.graphics.printf("BOOM!Duel", 100,50, 400)
end

function fase1()
	gamestate="fase1"
	fase1_load()
end

function instruction()
	gamestate = "instruction"
	instruction_load()
end
