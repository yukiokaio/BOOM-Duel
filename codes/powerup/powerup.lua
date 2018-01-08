
function DropPowerup(pos)
	local newPowerup = {
		x = pos.x, 
		y = pos.y, 
		powerup = powerups[math.random(1,4)], 
		id = #powerups_active + 1, 
		name="powerup"
		}
	powerups_active[newPowerup.id] = newPowerup
	world:add(newPowerup,pos.x,pos.y,cellsize,cellsize)
end

function bonusPowerup(powerup,bonus) --essa função efetua os bônus validos para cada imagem no jogo
	if bonus then
		if powerup.powerup.bonus == "bombs"then 
			bonus.n_bomb = bonus.n_bomb + powerup.powerup.value
		elseif powerup.powerup.bonus == "fire"then
			bonus.fire = bonus.fire + powerup.powerup.value
		elseif powerup.powerup.bonus == "speed"then
			bonus.speed = bonus.speed + powerup.powerup.value
		elseif powerup.powerup.bonus == "slow"then
			bonus.speed = bonus.speed - powerup.powerup.value
		end
		
	end
	world:remove(powerup)
	powerups_active[powerup.id] = nil
end
