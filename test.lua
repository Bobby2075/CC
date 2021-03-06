shell.run('clear')
print("Please put dirt in slot 1, saplings in slot 2, and a log in slot 3.")
print("Number of trees to plant?")
local x = io.read()
local dirt, sapling, log = 1, 2, 3

-- get into position
turtle.up()
turtle.turnLeft()
turtle.turnLeft()
turtle.back()
turtle.back()
turtle.back()

-- initial planting
for i = 0, x do
    turtle.digDown()
    turtle.select(dirt)
    turtle.placeDown()
    turtle.back()
    turtle.select(sapling)
    turtle.place()
    turtle.back()
    turtle.back()
    turtle.back()
end
turtle.turnLeft()
turtle.forward()
turtle.turnRight()

--chop trees
while true do
    --sleep for 30 seconds
    os.sleep(30)
    --check for grown trees
    for i = 0, x do
        turtle.forward()
        turtle.forward()
        turtle.forward()
        turtle.forward()
        turtle.turnRight()
        turtle.select(log)
        -- if the tree has grown
        if turtle.compare() then
            turtle.dig()
            turtle.forward()
            --harvest the tree
            while turtle.detectUp() do
                turtle.digUp()
                turtle.up()
            end
            while not turtle.detectDown() do
                turtle.down()
            end
            --plant a new tree
            turtle.back()
            turtle.select(sapling)
            turtle.place()
        end
        turtle.turnLeft()
    end
    -- round the corner
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
end