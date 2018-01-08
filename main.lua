io.stdout:setvbuf ("no")
io.stdout:setvbuf ("no")

bump = require "codes/libraries/bump"
world = bump.newWorld(32)
cellsize=32
anim8 = require "codes/libraries/anim8"

require "codes/function/menu"
require "codes/function/fase1"
require "codes/function/reset"
require "codes/function/reset2"
require "codes/function/tutorial"

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end

function love.load()
  gamestate = "menu"
  menu_load()
end

function love.update(dt)
  if gamestate == "menu" then
    menu_update(dt)
  elseif gamestate == "instruction" then 
    instruction_update(dt)
  elseif gamestate == "fase1" then
    fase1_update(dt)
  elseif gamestate == "reset" then 
    reset_update(dt)
  elseif gamestate == "reset2" then 
    reset2_update(dt)
  end

end

function love.draw()
  if gamestate == "menu" then
    menu_draw()
  elseif gamestate == "instruction" then 
    instruction_draw()
  elseif gamestate == "fase1" then
    fase1_draw()
  elseif gamestate == "reset" then 
    reset_draw()
  elseif gamestate == "reset2" then 
    reset2_draw()
  end
end
