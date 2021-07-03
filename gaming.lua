shell.run('clear')
print("Please put seed in slot 1, potato in slot 2 and carrots in slot 3 and a pickaxe in slot 4")
print("Enter how long your farm is")
local x = io.read()
local seed, potato, carrot, pickaxe = 1, 2, 3, 4;



function bootH()
    turtle.forward()
    -- initial planting
    for i = 1, x do
        turtle.turnLeft()
        turtle.dig()
        turtle.select(seed)
        turtle.place()
        turtle.turnRight()
        turtle.turnRight()
        turtle.dig()
        turtle.select(seed)
        turtle.place()
        turtle.turnLeft()
        turtle.forward()
    end
    turtle.turnLeft()
    turtle.turnLeft()
end

function swapTool()
    turtle.select(pickaxe)
    turtle.equipLeft()
end

function harvest()
    local cropBool, item = turtle.inspect()
    if item.state.age == 7 then
        -- skifte tool. fra hoe til pick
        -- slå med pick
        -- skifte tool igen
        swapTool()
        turtle.dig()
        turtle.suck()
        turtle.select(seed)
        turtle.place()
        swapTool()
    end
end

function startHarves()
    
    for i = 1, x do
        turtle.forward()
        turtle.turnLeft()
        harvest()
        turtle.turnRight()
        turtle.turnRight()
        harvest()
        turtle.turnLeft()
    end
    turtle.forward()
    turtle.turnLeft()
    turtle.turnLeft()
end

bootH()
os.sleep(15)
startHarves()

-- =====Done Command===== 
print("cum dump done........................................................")

