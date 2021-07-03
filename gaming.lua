shell.run('clear')
print("Please put seed in slot 1, potato in slot 2 and carrots in slot 3")
print("Enter how long your farm is")
local x = io.read()
local seed, potato, carrot = 1, 2, 3


-- initial planting
for i = 0, x do
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

--harvest
while true do
    
end