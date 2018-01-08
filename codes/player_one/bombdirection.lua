function BoomDirection(bomb,b) 
	newExplosion = {}
	local up,down,left,right = 0,0,0,0
	newExplosion = {x = bomb.x, y = bomb.y, time = boom_time, name = "boom"}
	Checkobjects(newExplosion,"center")
	for i=1, player.fire do
		if left == 0 then
			left = Checkobjects({x = bomb.x - 32 * i, y = bomb.y, time = boom_time, name = "boom"}, left)
		end
		if right == 0 then
			right = Checkobjects({x = bomb.x + 32 * i, y = bomb.y, time = boom_time, name = "boom"}, right)
		end
		if up == 0 then
			up = Checkobjects({x = bomb.x, y = bomb.y - 32 * i, time = boom_time, name = "boom"}, up)
		end
		if down == 0 then
			down = Checkobjects({x = bomb.x, y = bomb.y + 32 * i, time = boom_time, name = "boom"}, down)
		end
	end

	world:remove(bomb)
	table.remove(player.bombs,b)
end
--Essa função irá criar as direções da explosão, checando antes em outra função "Checkobjects" os objetos pelo caminho, 
--além de remover a bomba depois de um tempo para aparição da explosão.


function bombDraw()
	for i, bomb in pairs (player.bombs) do
	   	player.bomb.bomba:draw(bomba, bomb.x, bomb.y)
		sound2:play()
	 end
end
