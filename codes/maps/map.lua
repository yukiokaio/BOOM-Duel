map_x = 14
map_y = 12
maps = {}
cellsize=32
map = {block = love.graphics.newImage("res/img/bloco.png"),
		 destroy = love.graphics.newImage("res/img/blocos1.png"),
		 ground = love.graphics.newImage("res/img/piso.jpg"),
		}

map.blocks = {}
map.destroys = {}

function LoadMap()

 for i=1, #map.destroys do
  		if map.destroys[i] then
  			world:remove(map.destroys[i])
  			map.destroys[i]=nil
  		end
  	end

	for i=0,map_x do
		newBlock = {x=i*cellsize,y=0,w=cellsize,h=cellsize,name="block"}
		table.insert(map.blocks, newBlock)
		world:add(newBlock,newBlock.x,newBlock.y,cellsize,cellsize)
		newBlock = {x=i*cellsize,y=map_y*cellsize,w=cellsize,h=cellsize,name="block"}
		table.insert(map.blocks, newBlock)
		world:add(newBlock,newBlock.x,newBlock.y,cellsize,cellsize)
	end

	for i=1,map_y-1 do
		newBlock = {x=0,y=i*cellsize,w=cellsize,h=cellsize,name="block"}
		table.insert(map.blocks, newBlock)
		world:add(newBlock,newBlock.x,newBlock.y,cellsize,cellsize)
		newBlock = {x=map_x*cellsize,y=i*cellsize,w=cellsize,h=cellsize,name="block"}
		table.insert(map.blocks, newBlock)
		world:add(newBlock,newBlock.x,newBlock.y,cellsize,cellsize)
	end

	for i = 2, map_x-2, 2 do
		for j = 2, map_y-2, 2 do
			newBlock = {x=i*cellsize,y=j*cellsize,w=cellsize,h=cellsize,name="block"}
			table.insert(map.blocks, newBlock)
			world:add(newBlock,newBlock.x,newBlock.y,cellsize,cellsize)
		end
	end

  while #map.destroys < 70 do
		newdestroy = {x=math.random(1,map_x-1)*cellsize,y=math.random(1,map_y-1)*cellsize,name="destroy", id = #map.destroys + 1}
		items, n_items = world:queryRect(newdestroy.x,newdestroy.y,cellsize,cellsize)
		if n_items == 0 and not(newdestroy.x <= 2*cellsize and newdestroy.y <= 2*cellsize) and 
		not(newdestroy.x >= (map_x-2)*cellsize and newdestroy.y >= (map_y-2)*cellsize) then -- esse if vai permitir deixar um espaço de um bloco do lado, em cima ou embaixo do player para que ele possa se movimentar. 
			map.destroys[newdestroy.id] = newdestroy
			world:add(newdestroy,newdestroy.x,newdestroy.y,cellsize,cellsize)
		end
		table.remove(newdestroy)
	end
end


































































function blockDraw()

  for i=64, 400, 64 do
		love.graphics.draw(bloco,i,64)
		love.graphics.draw(bloco,i,128)
		love.graphics.draw(bloco,i,192)
		love.graphics.draw(bloco,i,256)
		love.graphics.draw(bloco,i,320)
		for i=0,480,32 do
			love.graphics.draw(bloco,i,0)
			love.graphics.draw(bloco,i,384)
		end
			for i=0,416,32 do
				love.graphics.draw(bloco,0,i)
				love.graphics.draw(bloco,448,i)
			end
	end
end
