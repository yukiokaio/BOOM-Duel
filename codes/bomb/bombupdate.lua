function BombUpdate(dt)
	player.bomb.bomba:update(dt)
	player2.bomb2.bomba2:update(dt)
	function love.keypressed(key)
			if key == "return" and #player.bombs < player.n_bomb then
				local posx,posy = math.floor(player.x % 32), math.floor(player.y % 32)
				local bx, by = world:toCell(player.x,player.y) -- retorna as coordenadas do player no mundo
				if posx < 32/2 then -- o if vai permitir verificar onde a bomba deve ser plantada dependendo da posição do player
					bx = bx - 1
				end
				if posy < 32/2 then
					 by = by - 1
				end
				local newBomb = {x=bx*32, y=by*32, fuse=player.fuse, name="bomb", speed=0, id=#player.bombs}
				Checkobjects(newBomb,"center")
			end
			if key == "space" and #player2.bombs2 < player2.n_bomb then
				local posx2,posy2 = math.floor(player2.x % 32), math.floor(player2.y % 32)
				local bx2, by2 = world:toCell(player2.x,player2.y)
				if posx2 < 32/2 then
					bx2 = bx2 - 1
				end
				if posy2 < 32/2 then
					by2 = by2 - 1
				end
				local newBomb2 = {x=bx2*32, y=by2*32, fuse=player2.fuse2, name="bomb2", speed=0, id=#player2.bombs2}
				Checkobjects2(newBomb2,"center")
			end
	end
	for i, bomb in pairs (player.bombs) do
		player.bombs[i].fuse = bomb.fuse - dt
		if bomb.fuse < 0 then -- efetua o desaparecimento depois de um tempo para a aparição da explosão 
			BoomDirection(bomb,i)
		end
	end
	for i, bomb2 in pairs (player2.bombs2) do
		player2.bombs2[i].fuse = bomb2.fuse - dt
		if bomb2.fuse < 0 then
			BoomDirection2(bomb2,i)
		end
	end

end