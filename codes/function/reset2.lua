require "codes/function/rectangle"
require "codes/function/circle"

function reset2_load()
 	mx, my = 0, 0 

 	startx = 4
  	starty = 320
  	starheight = 130
  	startwidth= 76

  	victory2 = love.graphics.newImage("res/img/victory2.jpg")
  	exit2 = love.graphics.newImage("res/img/exit.png")
end

function reset2_update(dt)
	function love.mousepressed(x, y, button)
		if gamestate == "reset2" then
			if button == 1 then
				mx = x
				my = y	
				if toqueretangulo(mx, my, startx, starty,startwidth,starheight) then
					love.event.quit()
				end
			end
		end
	end
end 

function reset2_draw()
	love.graphics.draw(victory2, 0, 0)
	love.graphics.draw(exit2,startx, starty)
end 
