function Control2Update(dt)
	  function Player2Filter(item,other)
			if other.name == "block" then
				return 'slide'
			elseif other.name == "destroy" then
				return 'slide'
			elseif other.name == "player1" then
				return 'slide'
			elseif other.name == "powerup" then
				return 'cross'
			elseif other.name == "boom" then
				return 'cross'
			elseif other.name == "boom2" then
				return 'cross'

			elseif other.name == "bomb"  and
					((item.x - other.x >= 0 and item.x - other.x < 1*25) or
					(item.x - other.x <= 0 and item.x - other.x > -1*25)) and
					((item.y - other.y >= 0 and item.y - other.y < 1*25) or
					(item.y - other.y <= 0 and item.y - other.y > -1*25)) then
					return 'cross'

			elseif other.name == "bomb"  then
				return 'slide'
			elseif other.name == "bomb" then
				return 'cross'

			elseif other.name == "bomb2"  and
				  ((item.x - other.x >= 0 and item.x - other.x < 1*25) or
				  (item.x - other.x <= 0 and item.x - other.x > -1*25)) and
				  ((item.y - other.y >= 0 and item.y - other.y < 1*25) or
					(item.y - other.y <= 0 and item.y - other.y > -1*25)) then
	        return 'cross'

			elseif other.name == "bomb2"  then
				return 'slide'
			elseif other.name == "bomb2"  then
				return 'cross'

			end
		end

		local px2, py2 = 0, 0
		if love.keyboard.isDown("w") then
			 py2 = - player2.speed * dt
			player2.animation = player2.animations.up
		elseif love.keyboard.isDown("s") then
			 py2 =  player2.speed * dt
			player2.animation = player2.animations.down
		elseif love.keyboard.isDown("a") then
			px2 = - player2.speed * dt
			player2.animation = player2.animations.left
		elseif love.keyboard.isDown("d") then
			px2 = player2.speed * dt
		player2.animation = player2.animations.right
		else
		player2.animation = player2.animations.down_move
		end
		if px2 ~= 0 or py2 ~= 0 then
			local newx2, newy2,cols2, cols_len2 = world:move(player2, player2.x + px2, player2.y + py2, Player2Filter)

			if cols_len2 > 0 then
				for i=1,cols_len2 do
					local col2 = cols2[i]
					if col2.other.name == "powerup" then
						 bonusPowerup(col2.other,player2)
					end
				end
			end
			world:update(player2, newx2, newy2)
			player2.x, player2.y = newx2, newy2
		end

	end
