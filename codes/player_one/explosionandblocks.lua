function BoomUpdate(dt)
 	boom.psystem:update(dt)
	for i, boom in pairs (player.explosions) do
		player.explosions[i].time = boom.time - dt
		if boom.time <= 0 then
			world:remove(boom)
			table.remove(player.explosions, i)
		end
	end
end
--Essa função fica atualizando e verificando a presença da explosão, quando o tempo for menor ou igual a zero, 
-- ela remove do mundo e da tabela

function BlockDestructible(destructible)
	destroy.psystem:setPosition(destructible.x,destructible.y)
	destroy.psystem:emit(1)
	world:remove(destructible)
	if math.random(1,100) <= 70 then
    	DropPowerup(destructible)
 	end
	map.destroys[destructible.id] = nil
end

-- Essa função executa a animação de destruição dos blocos e os remove logo depois,
-- além de adicionar os powerup ao mundo