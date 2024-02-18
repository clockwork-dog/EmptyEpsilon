-- Name: Bridge Command Moving CPU Test
-- Description: Test setting multiple courses for cpu ship
testShip = CpuShip():setFaction("UCN"):setTemplate("Equipment Freighter 1"):setCallSign("VS1"):setPosition(-0, -0)
:setWarpDrive(true)
testShip:orderFlyTowards(0, -10000)
function patrol()
    x, y = testShip:getPosition()
    if (x >= -250 and x <= 250) and (y >= 9750 and y <= 10250) then
        testShip:orderFlyTowards(10000, 10000)
    end
end

function update(delta)
    patrol()
end
