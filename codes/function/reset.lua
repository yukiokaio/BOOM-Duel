require "codes/function/rectangle"
require "codes/function/circle"

function reset_load()
 	mx = 0
  	my = 0 

  	score = 0

 	startx = 4
  	starty = 320
  	starheight = 130
  	startwidth= 76

  	victory1 = love.graphics.newImage("res/img/victory1.jpg")
  	exit2 = love.graphics.newImage("res/img/exit.png")
end

function reset_update(dt)
	function love.mousepressed(x, y, button)
		if gamestate == "reset" then
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

function reset_draw()
	love.graphics.draw(victory1, 0, 0)
	love.graphics.draw(exit2,startx, starty)

end 
