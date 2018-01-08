function Checkobjects2(object,side)
	local items = world:queryRect(object.x,object.y,25,25)
	local posx, posy
	local posx2, posy2

	if object.name == "boom2" then
		for j, item in pairs(items) do
			if item.name == "block" then
				side = 1
			elseif item.name == "destroy" then
				side = 2
				BlockDestructible2(item)
			elseif item.name == "bomb2" and side ~= "center" then
				side = 3
				item.fuse = -1
			elseif item.name == "player1" then
				if math.floor(player.x % cellsize) < 25 then
					posx = math.floor(player.x/cellsize)
				else
					posx = math.ceil(player.x/cellsize)
				end
				if math.floor(player.y % cellsize) < 25 then
					posy = math.floor(player.y/cellsize)
				else
					posy = math.ceil(player.y/cellsize)
				end
				if posx == object.x/cellsize and posy == object.y/cellsize then
					player.life = player.life - 1
				end
			elseif item.name == "player2" then
				if math.floor(player2.x % cellsize) < 25 then
					posx2 = math.floor(player2.x/cellsize)
				else
					posx2= math.ceil(player2.x/cellsize)
				end
				if math.floor(player2.y % cellsize) < 25 then
					posy2 = math.floor(player2.y/cellsize)
				else
					posy2 = math.ceil(player2.y/cellsize)
				end
				if posx2 == object.x/cellsize and posy2 == object.y/cellsize then
					player2.life = player2.life - 1
				end
			elseif item.name == "powerup" then
				bonusPowerup(item)
			end
		end

		if side == 0 or side == "center" then
			boom.psystem:setPosition(object.x+1, object.y+1)
			boom.psystem:emit(1)
			table.insert(player2.explosions2, object)
			world:add(object,object.x,object.y,cellsize,cellsize)
			sound:play()
		end
		return side

	elseif object.name == "bomb2" then
		for j, item in pairs(items) do
			if item.name == "block" then 
				side = 1
			elseif item.name == "destroys" then 
				side = 2
			elseif item.name == "bomb2" then 
				side = 3
			elseif item.name == "boom2" then 
				object.fuse = -1
			end
		end
		if side == 0 or side == "center" then
			table.insert(player2.bombs2, object)
			world:add(object,object.x,object.y,25,25)
		end
		return side
	end
end