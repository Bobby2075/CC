shell.run('clear')
print("Please put seed in slot 1, potato in slot 2 and carrots in slot 3 and a pickaxe in slot 4")
print("Enter how long your farm is")
local x = io.read()
os.setComputerLabel("PotatoCollector")
local seed, potato, carrot, pickaxe = 1, 2, 3, 4;
local drop = (x*2)+1

local stackCounter = 1
local potatoStackWSpace = 1

-- Tobsi
-- Stack the crops


function canStack()
    stackCounter = 1
    local stopStackingC = true
    while stopStackingC do
        if stackCounter > 16 then
            stopStackingC = false
        else

            local curItem = turtle.getItemDetail(stackCounter)
            if curItem ~= nil then
                if curItem.name == "minecraft:potato" then
                    local curStack = turtle.getItemCount(stackCounter)
                    if (curStack%64) == 0 then
                        stackCounter = stackCounter + 1 -- Why do i need to do this Lua?!
                    else
                        potatoStackWSpace = stackCounter
                        stopStackingC = false
                    end
                else
                    stackCounter = stackCounter + 1
                end
            else
                stackCounter = stackCounter + 1
            end
        end
    end
end

function nextPotatoStack()
    local stopStackFinder = true
    stackCounter = stackCounter + 1
    while stopStackFinder do
        if stackCounter > 16 then
            stopStackFinder = false
        else
            local curItemE = turtle.getItemDetail(stackCounter)
            if curItemE ~= nil then
                if curItemE.name == "minecraft:potato" then
                    local currentStack = turtle.getItemCount(stackCounter)
                    
                    turtle.select(stackCounter)
                    turtle.transferTo(potatoStackWSpace, 64)
    
                    stopStackFinder = false
    
                else
                    stackCounter = stackCounter + 1
                end
            else
                stackCounter = stackCounter + 1
            end
        end
    end
    
end

function endstackingCrops()
    print("INIT: STACKING CROPS")
    local stopStacking = true

    while stopStacking do
        if stackCounter <= 16 then
            canStack()
            nextPotatoStack()
        else
            stopStacking = false
        end
    end

end

-- endstackingCrops() is the function to run. It works, but there is something 
-- with the last one if there is more than 64 items in the last stack.
-- It stops where the last stack is located, and skips over non-potatoie items.
-- 
-- Try it out, with more than 1 stack of 64 potatoes spread around in it.

-- Stack the crops END

function harvestCheck()
    
    local harvestBool, fuckywucky = turtle.inspect()
    if fuckywucky == nil then
        else
            if fuckywucky.state.age == 7 then
                harvest()
                turtle.turnLeft()
                turtle.turnLeft()
                startHarves()
            end
    end
    
end

function refuel()
    local fuelLevel = turtle.getFuelLevel()
    local gotFuel = false

    if fuelLevel < 69 then
        for i = 1, 16 do
            turtle.select(i)
            local cumDump = turtle.getItemDetail(i)

            if cumDump ~= nil then
                if cumDump.name == "minecraft:coal" or cumDump.name == "minecraft:coal_block" then
                    turtle.refuel(cumDump.count)
                    print("Slurping all your yoummy cummy up daddy ;)")
                    gotFuel = true
                end
            end
            
        end
        if gotFuel == false then
            print("No fuel)")
            os.sleep(30)
        end
    else
        print("Im all stuffed up daddy ( .3.)")
    end

end

function chest()

    local ischest, dataBuddy = turtle.inspectDown()
    if dataBuddy.name == "minecraft:chest" then
        print("There is a Cum Dump bellow me daddy ;)")
        for i = 1, 16 do
            turtle.select(i)
            local potatoCum = turtle.getItemDetail(i)

            if potatoCum ~= nil then
                if potatoCum.name == "minecraft:potato" then
                    local cumCount = (potatoCum.count - drop)
                    print(cumCount)
                    if cumCount >= 0 then 
                        print("IM INSIDE THE FUCKING IF STATEMENT")
                        turtle.dropDown(cumCount)
                        print("Came in the chest daddy ;)")
                    end
                    gotFuel = true
                end
            end
            
        end
        print("Cummistake END")
    end
end

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
    -- PLANT CHECK STARTHERE
    turtle.select(seed)
    turtle.place()
    -- PLANT CHECK END
    
    --turtle.turnLeft()
    --turtle.turnLeft()
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
    -- PLANT CHECK STARTHERE
    turtle.select(seed)
    turtle.place()
    -- PLANT CHECK END
    chest()
    turtle.turnLeft()
    turtle.turnLeft()

    -- Moves back to it's checking spot
    for i = 0, x do
        turtle.forward()
    end
end

local booting = true

while booting do
    refuel()
    local fuelLevelCC = turtle.getFuelLevel()
    if fuelLevelCC > 69 then
        bootH()
        booting = false
    end
end

local fuelLevelC = turtle.getFuelLevel()
while true do
    
    if fuelLevelC <= 69 then
        refuel()
    elseif fuelLevelC > 69 then
        harvestCheck()
    else
        print("THERE IS A BIG WOPSIE DADDY")
    end
end

-- =====Done Command===== 
print("cum dump done........................................................")

-- 
