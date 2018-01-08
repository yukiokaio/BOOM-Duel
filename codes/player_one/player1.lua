function ControlUpdate(dt)

	  function PlayerFilter(item,other)
			if other.name == "block" then
				return 'slide'
			elseif other.name == "destroy"  then
				return 'slide'
			elseif other.name == "player2" then
				return 'slide'
			elseif other.name == "powerup" then
				return 'cross'
			elseif other.name == "boom" then
				return 'cross'
			elseif other.name == "boom2" then
				return 'cross'

			elseif other.name == "bomb" and
				  ((item.x - other.x >= 0 and item.x - other.x < 1*25) or
				  (item.x - other.x <= 0 and item.x - other.x > -1*25)) and
				  ((item.y - other.y >= 0 and item.y - other.y < 1*25) or
					(item.y - other.y <= 0 and item.y - other.y > -1*25)) then
	        return 'cross'

			elseif other.name == "bomb" then
				return 'slide'
			elseif other.name == "bomb"  then
				return 'cross'

			elseif other.name == "bomb2"  and
				  ((item.x - other.x >= 0 and item.x - other.x < 1*25) or
				  (item.x - other.x <= 0 and item.x - other.x > -1*25)) and
				  ((item.y - other.y >= 0 and item.y - other.y < 1*25) or
					(item.y - other.y <= 0 and item.y - other.y > -1*25)) then
	        return 'cross'

			elseif other.name == "bomb2"  then
				return 'slide'
			elseif other.name == "bomb2" then
				return 'cross'
			end

		end


		local px, py = 0, 0
		if love.keyboard.isDown('right') then
			px = player.speed * dt
			player.animation = player.animations.right
		elseif love.keyboard.isDown('left') then
			px = -player.speed * dt
			player.animation = player.animations.left
		elseif love.keyboard.isDown('down') then
			py = player.speed * dt
		player.animation = player.animations.down
		elseif love.keyboard.isDown('up') then
			py = -player.speed * dt
			player.animation = player.animations.up
		else
			player.animation = player.animations.down_move
		end

		if px ~= 0 or py ~= 0 then
			local newx, newy, cols, cols_len = world:move(player, player.x + px, player.y + py, PlayerFilter)
			if cols_len > 0 then -- esse if verifica a colisão entre o player e a imagem do powerup, sendo verdadeira o powerup é absorvido e some 
				for i=1,cols_len do
					local col = cols[i]
					if col.other.name == "powerup" then 
						 bonusPowerup(col.other,player)
					end
				end
			end
			world:update(player, newx, newy)
			player.x, player.y = newx, newy
		end


	end