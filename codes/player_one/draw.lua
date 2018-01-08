function draw()

  for i = 0, map_x do
      for j = 0, map_y do
        love.graphics.draw(map.ground, i*32, j*32)
      end
    end
  for i, block in pairs (map.blocks) do
    love.graphics.draw(map.block, block.x, block.y)
  end
  for i, destroy in pairs(map.destroys) do
    love.graphics.draw(map.destroy, destroy.x, destroy.y)
  end
  for i, powerup in pairs (powerups_active) do
    love.graphics.draw(powerup.powerup.img, powerup.x, powerup.y)
  end

  love.graphics.draw(boom.psystem)
  love.graphics.draw(destroy.psystem)
  love.graphics.draw(icon,10,415)
  love.graphics.draw(icon2,300,415)
  love.graphics.printf({{255,255,255}," = " .. player.life}, 80,430,999)
  love.graphics.printf({{255,255,255}," = " .. player2.life}, 370,430,999)
end
