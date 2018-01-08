function BoomDirection2(bomb2,b2)
	local newExplosion2 = {}
	local up2,down2,left2,right2 = 0,0,0,0
	newExplosion2 = {x = bomb2.x, y = bomb2.y, time = boom_time, name = "boom2"}
	Checkobjects2(newExplosion2,"center")
	for i=1, player2.fire do
		if left2 == 0 then
			left2 = Checkobjects2({x = bomb2.x - 32 * i, y = bomb2.y, time = boom_time, name = "boom2"}, left2)
		end
		if right2 == 0 then
			right2 = Checkobjects2({x = bomb2.x + 32 * i, y = bomb2.y, time = boom_time, name = "boom2"}, right2)
		end
		if up2 == 0 then
			up2 = Checkobjects2({x = bomb2.x, y = bomb2.y - 32 * i, time = boom_time, name = "boom2"}, up2)
		end
		if down2 == 0 then
			down2 = Checkobjects2({x = bomb2.x, y = bomb2.y + 32 * i, time = boom_time, name = "boom2"}, down2)
		end
	end
	world:remove(bomb2)
	table.remove(player2.bombs2,b2)
end

function bomb2Draw()
	for i, bomb2 in pairs (player2.bombs2) do
	    player2.bomb2.bomba2:draw(bomba2, bomb2.x, bomb2.y)
		sound2:play()
	end
end
