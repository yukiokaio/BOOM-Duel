require "codes/function/rectangle"
require "codes/function/circle"

function instruction_load()
	mx, my= 0, 0

	menucircle = {x = 32, y = 430,	r = 32}

	red = love.graphics.newImage("res/img/red.png")

	fonttitle = love.graphics.setNewFont("res/fonte/bm.ttf", 53)
	fonttext  = love.graphics.setNewFont("res/fonte/bm.ttf", 20)
	fonttext2 = love.graphics.setNewFont("res/fonte/bm.ttf", 15)
end

function instruction_update(dt)
	function love.mousepressed( x, y, button )
		if gamestate == "instruction" then 
			if button == 1 then
				mx = x
				my = y
				if checaToqueC(mx, my, menucircle.x, menucircle.y, menucircle.r) then -- Detecção de toque apenas quando ocorrer click do mouse
	       			menu() --Havendo click na Coordenadas do botão back, volta para o menu
				end
			end
		end
	end
end

function instruction_draw()
	love.graphics.setBackgroundColor (95,159,159)
	

--Impressão do botão back para voltar ao menu
	love.graphics.draw(red, menucircle.x-32, menucircle.y-25)
	love.graphics.setFont(fonttext2) 
	love.graphics.printf("MENU", menucircle.x - 25, menucircle.y , 100)

--Fontes e textos impressos na tela
	love.graphics.setFont(fonttitle)
	love.graphics.printf("Instruction", 40, 0, 400)
	love.graphics.setFont(fonttext)
	love.graphics.printf("Player 1: Use as setas para movimento e ENTER para plantar a bomba.",50,170,400)
	love.graphics.printf("Player 2: Use W,S,A,D para movimento e SPACE para plantar a bomba.",50,240,400)
end

function menu() -- Função para ser empregada a volta para o menu
	gamestate="menu"
	menu_load()
end
