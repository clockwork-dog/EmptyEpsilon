-- Name: Utils
-- Description: taking developed BC2 functions out of scenarios anf into utilities

-- function to randomizes size of asteroids. 
-- example of calling it:
-- state this somewhere in the body of your script
-- baseSet = 0 
-- to set info for asteroids within 20 grids are around 0,0 position do place asteroidSizes(0, 0, 400000) within update:

-- baseSet = 0
-- function update(delta)
-- asteroidSizes(0, 0, 400000)
-- end 
              -- x and y are starting position (int), radius is radius you want to target (int)
function asteroidSizes(x, y, radius)
    asteroidElements = { "Cadmium", "Nickel", "Aluminum", "Lithium", "Iron", "Hydrogen", "Silicon", "Carbon", "Oxygen" }
    asteroidBase = "More Information Available When Scanned"
    if baseSet == 1 then
        return
    end
    for _, obj in ipairs(getObjectsInRadius(x, y, radius)) do
        if obj.typeName == "Asteroid" then
            obj:setSize(random(50, 500)):setRadarSignatureInfo(0.8, 0.0, 0.0):setPositionZ(random(-100, 100))
            obj:setDescriptions(tostring(asteroidBase),
                tostring(math.random(1, 30) .. "% " .. asteroidElements[math.random(#asteroidElements)]))
        end
        baseSet = 1
    end
end

-- to create a field of specific asteroids of a set size with specific properties around a specific object 
-- needs to be called from init function
-- for example to set 60 Uranium asteroids within 1 grid of a miningRig, call specificAsteroids(miningRig, 60, 20000, "Uranium") as follows:

-- function init()
-- specificAsteroids(miningRig, 60, 20000, "Uranium")
-- end

function specificAsteroids(obj,n, rad, value)
    for aidx=1,n do
        local ox, oy = obj:getPosition()
        ax = math.random(ox - rad, ox + rad)
        ay = math.random(oy - rad, oy + rad)
        Asteroid():setPosition(ax, ay):setSize(random(50, 500)):setPositionZ(math.random(-100, 100)):setRadarSignatureInfo(0.8, 0.0, 0.0)
        :setDescriptions("More Information Available When Scanned", tostring(math.random(1, 30).."%"..value))
    end
end

-- playerchats lets GM know when player and shuttle have opened comms with each other 

-- declare playerchat elsewhere in script:
-- playerchat = 0
-- assign player as obj1 and shuttle as obj2 as call from update as so:

-- function update(delta)
-- playerchats(player, shuttle)
-- end  
function playerchats(obj1, obj2)
    if obj1:isCommsChatOpenToPlayer() == true and obj2:isCommsChatOpenToPlayer() == true then
        if playerchat == 0 then
            addGMMessage("The two player ships are on comms together")
            playerchat = 1
        end
    elseif playerchat == 1 then
        addGMMessage("The two player ships have ceased comms")
        playerchat = 0
    end
end
