function Boom2Update(dt)
 	boom.psystem:update(dt)
  for i, boom in pairs (player2.explosions2) do
    player2.explosions2[i].time = boom.time - dt
    if boom.time < 0 then
      world:remove(boom)
      table.remove(player2.explosions2, i)
    end
  end
end

function BlockDestructible2(destructible2)
	destroy.psystem:setPosition(destructible2.x,destructible2.y)
	destroy.psystem:emit(1)
	world:remove(destructible2)
  if math.random(1,100) <= 50 then
    DropPowerup(destructible2)
  end
	map.destroys[destructible2.id] = nil
end
