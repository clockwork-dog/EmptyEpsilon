-- Name: Functions Workshop
-- Description: this is wheere I workshop further actionable functions 
-- Variation[Takanami]: This scenario will run on Takanami 
-- Variation[Havock]: This scenario will run on Havock
require("utils_bc.lua")

player = PlayerSpaceship():setPosition(5801, 6039):setWarpDrive(true):setWarpSpeed(1000.00)
shuttle = PlayerSpaceship():setPosition(6100, 6300):setWarpDrive(true):setWarpSpeed(1000.00)


-- function insideDock(spaceship)
--     for _, obj in ipairs(spaceship:getObjectsInRange(300)) do
--         --print("Something is close!")
--         if obj:isDocked(spaceship) then
--             print("It is docked")
--             dockedOne = obj
--             print("Catalogued it")
--             print(obj:getTypeName())
--             if obj:getTypeName() == "UCS Takanami Shuttle" then
--             --if obj:getTypeName() == "Starfighter" or obj:getTypeName()== "Drone" then
--                 print("I know what it is!")
--                 obj:setRadarTrace("radar_invisible.png")
--                 print("Magic cloak activated")
--             end
--         else
--             if dockedOne:getTypeName() == "UCS Takanami Shuttle" then
--                 dockedOne:setRadarTrace("radar_shuttle.png")
--             else
--                 dockedOne:setRadarTrace("radar_fighter.png")
--             end
--         end
--     end
-- end

Warspite = CpuShip():setFaction("UCN"):setTemplate("UCS King George Battleship"):setCallSign("ucs warspite"):setPosition(5254, 5331):setWeaponStorage("EMP", 22):setScanned(true):setRepairDocked(true):setDescriptions("King George Class Battleship", "Current orders: Establish Base in Adamas Belt.")
Warspite:addInfos(1,"Fabrication date", "2091")
Warspite:addInfos(2,"Current Commander", "Captain TBD")
Warspite:addInfos(3,"Number of Personnel", "182")
Warspite:addInfos(4, "Life signs", "Strong")
Warspite:setCommsScript("comms_Warspite_sup.lua")



-- ASTEROIDS

Asteroid():setPosition(34123, -115790)
Asteroid():setPosition(40567, -113790)
Asteroid():setPosition(45789, -108123)
Asteroid():setPosition(43678, -105345)
Asteroid():setPosition(36345, -111012)
Asteroid():setPosition(35234, -115457)
Asteroid():setPosition(23678, -121234)
Asteroid():setPosition(17123, -119457)
Asteroid():setPosition(27012, -110901)
Asteroid():setPosition(37123, -108012)
Asteroid():setPosition(43456, -98234)
Asteroid():setPosition(52456, -94123)
Asteroid():setPosition(59900, -86123)
Asteroid():setPosition(65123, -77568)
Asteroid():setPosition(77234, -68790)
Asteroid():setPosition(76234, -86457)
Asteroid():setPosition(65900, -89123)
Asteroid():setPosition(52123, -76901)
Asteroid():setPosition(49678, -73901)
Asteroid():setPosition(46234, -78123)
Asteroid():setPosition(58012, -91123)
Asteroid():setPosition(67567, -95901)
Asteroid():setPosition(59012, -94790)
Asteroid():setPosition(51123, -87901)
Asteroid():setPosition(45012, -87568)
Asteroid():setPosition(44123, -88012)
Asteroid():setPosition(55345, -96790)
Asteroid():setPosition(58012, -102012)
Asteroid():setPosition(44123, -99790)
Asteroid():setPosition(29456, -89568)
Asteroid():setPosition(22345, -90345)
Asteroid():setPosition(45234, -95790)
Asteroid():setPosition(49678, -100234)
Asteroid():setPosition(48567, -107679)
Asteroid():setPosition(30567, -104901)
Asteroid():setPosition(35123, -99123)
Asteroid():setPosition(44123, -100568)
Asteroid():setPosition(56900, -100679)
Asteroid():setPosition(59123, -96568)
Asteroid():setPosition(55123, -85012)
Asteroid():setPosition(63456, -78123)
Asteroid():setPosition(64012, -67234)
Asteroid():setPosition(67678, -66457)
Asteroid():setPosition(74456, -70901)
Asteroid():setPosition(82789, -70568)
Asteroid():setPosition(71234, -80012)
Asteroid():setPosition(74123, -86790)
Asteroid():setPosition(69789, -93679)
Asteroid():setPosition(59345, -90790)
Asteroid():setPosition(58234, -96345)
Asteroid():setPosition(50345, -104568)
Asteroid():setPosition(45012, -107568)
Asteroid():setPosition(38567, -113457)
Asteroid():setPosition(29345, -121901)
Asteroid():setPosition(24567, -122679)
Asteroid():setPosition(19234, -122457)
Asteroid():setPosition(16345, -122234)
Asteroid():setPosition(5012, -125901)
Asteroid():setPosition(13012, -117901)
Asteroid():setPosition(18789, -104679)
Asteroid():setPosition(37012, -94901)
Asteroid():setPosition(26900, -105457)
Asteroid():setPosition(25012, -107345)
Asteroid():setPosition(40789, -117568)
Asteroid():setPosition(36456, -128012)
Asteroid():setPosition(40123, -130457)
Asteroid():setPosition(47678, -132457)
Asteroid():setPosition(70234, -127568)
Asteroid():setPosition(76123, -108901)
Asteroid():setPosition(66789, -97123)
Asteroid():setPosition(59123, -94234)
Asteroid():setPosition(58234, -101568)
Asteroid():setPosition(73456, -112901)
Asteroid():setPosition(70567, -118345)
Asteroid():setPosition(67567, -108568)
Asteroid():setPosition(64789, -103679)
Asteroid():setPosition(73900, -99790)
Asteroid():setPosition(81234, -114679)
Asteroid():setPosition(81012, -126123)
Asteroid():setPosition(71567, -135901)
Asteroid():setPosition(57567, -140012)
Asteroid():setPosition(51234, -136012)
Asteroid():setPosition(40123, -125901)
Asteroid():setPosition(36012, -122568)
Asteroid():setPosition(38345, -118345)
Asteroid():setPosition(55900, -116568)
Asteroid():setPosition(72567, -121012)
Asteroid():setPosition(68789, -135790)
Asteroid():setPosition(67123, -137457)
Asteroid():setPosition(51012, -124679)
Asteroid():setPosition(36678, -105457)
Asteroid():setPosition(11234, -97012)
Asteroid():setPosition(7789, -93457)
Asteroid():setPosition(20123, -93679)
Asteroid():setPosition(23345, -106457)
Asteroid():setPosition(20567, -115901)
Asteroid():setPosition(25456, -124679)
Asteroid():setPosition(35234, -132568)
Asteroid():setPosition(28567, -108901)
Asteroid():setPosition(34900, -104234)
Asteroid():setPosition(32234, -98123)
Asteroid():setPosition(29900, -95679)
Asteroid():setPosition(46567, -97012)
Asteroid():setPosition(44345, -93234)
Asteroid():setPosition(49789, -92123)
Asteroid():setPosition(53456, -87457)
Asteroid():setPosition(52012, -94679)
Asteroid():setPosition(46234, -98012)
Asteroid():setPosition(40345, -109568)
Asteroid():setPosition(35345, -113234)
Asteroid():setPosition(31789, -114679)
Asteroid():setPosition(41234, -100345)
Asteroid():setPosition(43345, -89790)
Asteroid():setPosition(54234, -79345)
Asteroid():setPosition(70345, -60012)
Asteroid():setPosition(81789, -55901)
Asteroid():setPosition(100234, -70123)
Asteroid():setPosition(76900, -84457)
Asteroid():setPosition(90012, -99679)
Asteroid():setPosition(98234, -110568)
Asteroid():setPosition(97678, -125012)
Asteroid():setPosition(88456, -137234)
Asteroid():setPosition(63789, -139790)
Asteroid():setPosition(41456, -140568)
Asteroid():setPosition(14012, -142568)
Asteroid():setPosition(42234, -146679)
Asteroid():setPosition(39456, -145457)
Asteroid():setPosition(40234, -136457)
Asteroid():setPosition(62678, -141457)
Asteroid():setPosition(74345, -140901)
Asteroid():setPosition(58345, -114345)
Asteroid():setPosition(53789, -114345)
Asteroid():setPosition(65345, -104901)
Asteroid():setPosition(77456, -97234)
Asteroid():setPosition(84900, -87568)
Asteroid():setPosition(93456, -75457)
Asteroid():setPosition(96456, -97790)
Asteroid():setPosition(81123, -105679)
Asteroid():setPosition(82123, -123123)
Asteroid():setPosition(68234, -103345)
Asteroid():setPosition(61678, -103679)
Asteroid():setPosition(53012, -121345)
Asteroid():setPosition(43234, -111234)
Asteroid():setPosition(27012, -97901)
Asteroid():setPosition(29789, -91790)
Asteroid():setPosition(49789, -86568)
Asteroid():setPosition(50900, -83012)
Asteroid():setPosition(59456, -89457)
Asteroid():setPosition(47900, -97123)
Asteroid():setPosition(38234, -106234)
Asteroid():setPosition(23678, -122012)
Asteroid():setPosition(30678, -124901)
Asteroid():setPosition(33678, -102457)
Asteroid():setPosition(45234, -105790)
Asteroid():setPosition(43678, -101123)
Asteroid():setPosition(58012, -101234)
Asteroid():setPosition(57234, -93901)
Asteroid():setPosition(68678, -90345)
Asteroid():setPosition(68123, -85012)
Asteroid():setPosition(77789, -69345)
Asteroid():setPosition(69345, -82012)
Asteroid():setPosition(65900, -82234)
Asteroid():setPosition(51789, -91123)
Asteroid():setPosition(41234, -94012)
Asteroid():setPosition(21123, -102123)
Asteroid():setPosition(19345, -112790)
Asteroid():setPosition(7123, -123790)
Asteroid():setPosition(20456, -138012)
Asteroid():setPosition(23567, -119457)
Asteroid():setPosition(37678, -117790)
Asteroid():setPosition(27234, -109457)
Asteroid():setPosition(49345, -106345)
Asteroid():setPosition(46456, -99012)
Asteroid():setPosition(57123, -85457)
Asteroid():setPosition(42345, -92234)
Asteroid():setPosition(52900, -101568)
Asteroid():setPosition(47234, -102345)
Asteroid():setPosition(47567, -103679)
Asteroid():setPosition(36900, -101901)
Asteroid():setPosition(61345, -118123)
Asteroid():setPosition(57456, -121345)
Asteroid():setPosition(59789, -103568)
Asteroid():setPosition(76345, -102790)
Asteroid():setPosition(83456, -112790)
Asteroid():setPosition(84678, -124790)
Asteroid():setPosition(82678, -128457)
Asteroid():setPosition(81234, -135679)
Asteroid():setPosition(58012, -142457)
Asteroid():setPosition(52281, -116348)
Asteroid():setPosition(52170, -111793)
Asteroid():setPosition(69170, -116237)
Asteroid():setPosition(64948, -126459)
Asteroid():setPosition(67170, -120348)
Asteroid():setPosition(57837, -130459)
Asteroid():setPosition(44614, -131126)
Asteroid():setPosition(47170, -124015)
Asteroid():setPosition(44392, -118459)
Asteroid():setPosition(55948, -119793)
Asteroid():setPosition(60503, -129570)
Asteroid():setPosition(51837, -143904)
Asteroid():setPosition(45948, -148570)
Asteroid():setPosition(24392, -147459)
Asteroid():setPosition(71837, -144459)
Asteroid():setPosition(78725, -127904)
Asteroid():setPosition(83170, -114570)
Asteroid():setPosition(110170, -107904)
Asteroid():setPosition(88503, -111015)
Asteroid():setPosition(96281, -125904)
Asteroid():setPosition(92725, -102126)
Asteroid():setPosition(96837, -86459)
Asteroid():setPosition(90948, -75015)
Asteroid():setPosition(83837, -79015)
Asteroid():setPosition(62595, -134475)
Asteroid():setPosition(55595, -147586)
Asteroid():setPosition(50373, -154586)
Asteroid():setPosition(66817, -149475)
Asteroid():setPosition(64373, -141586)
Asteroid():setPosition(80928, -135142)
Asteroid():setPosition(80150, -131031)
Asteroid():setPosition(105706, -126809)
Asteroid():setPosition(92817, -116475)
Asteroid():setPosition(114261, -103586)
Asteroid():setPosition(93595, -157475)
Asteroid():setPosition(92039, -117586)
Asteroid():setPosition(95706, -99920)
Asteroid():setPosition(68039, -100809)
Asteroid():setPosition(73373, -97475)
Asteroid():setPosition(94817, -92475)
Asteroid():setPosition(56484, -89475)
Asteroid():setPosition(54039, -101697)
Asteroid():setPosition(50261, -110031)
Asteroid():setPosition(41039, -110364)
Asteroid():setPosition(42261, -104697)
Asteroid():setPosition(36595, -116253)
Asteroid():setPosition(28706, -111475)
Asteroid():setPosition(31928, -107920)
Asteroid():setPosition(31373, -122031)
Asteroid():setPosition(22150, -122142)
Asteroid():setPosition(29595, -118475)
Asteroid():setPosition(22817, -114586)
Asteroid():setPosition(33595, -119586)
Asteroid():setPosition(29928, -121475)
Asteroid():setPosition(27373, -120586)
Asteroid():setPosition(56595, -106253)
Asteroid():setPosition(63595, -91364)
Asteroid():setPosition(84039, -79920)
Asteroid():setPosition(88261, -73031)
Asteroid():setPosition(77595, -91809)
Asteroid():setPosition(78595, -100920)
Asteroid():setPosition(67817, -90142)
Asteroid():setPosition(62373, -96475)
Asteroid():setPosition(74373, -106697)
Asteroid():setPosition(90706, -110475)
Asteroid():setPosition(88373, -98475)
Asteroid():setPosition(84817, -92142)


-- asteroidElements = { "Cadmium", "Nickel", "Aluminum", "Lithium", "Iron", "Hydrogen", "Silicon", "Carbon", "Oxygen" }
-- asteroidBase = "More Information Available When Scanned"
-- -- centreX and centreY is your point of origin of the function, radius is the radius you want to set for it
-- -- example of calling from update (0, 0, 1000000) to the effect of "within 500 squares around the central spot
-- -- but you can also do this to smaller areas. Foe neatness. 
-- function asteroidInfo(centreX, centreY, radius)
--     if baseSet == true then
--         return
--     end
--     -- this gets astreoids in radius of 50 grids (1mil pixels) within starting point (0.0). Change values as needed
--     for _, obj in ipairs(getObjectsInRadius(centreX, centreY, radius)) do
--         if obj.typeName == "Asteroid" then
--             obj:setSize(random(50, 500)):setRadarSignatureInfo(0.8, 0.0, 0.0)
--             obj:setDescriptions(tostring(asteroidBase),
--                 tostring(math.random(1, 30) .. "% " .. asteroidElements[math.random(#asteroidElements)]))
--         end
--     end
--     baseSet = true
-- end
--- WORKSHOP

-- TODO 

-- trying to set variations 
function setVariations()
	if string.find(getScenarioVariation(),"Havock") then
        player:setTemplate("UCS Skirmish Class Frigate"):setCallSign("UCS Havock"):setFaction("UCN")
        shuttle:setTemplate("UCS Havock Shuttle"):setCallSign("UCS Havock Shuttle"):setFaction("UCN")
	elseif string.find(getScenarioVariation(),"Takanami") then
        player:setTemplate("UCS Hoplite Class Destroyer"):setCallSign("UCS Takanami"):setFaction("UCN")
        shuttle:setTemplate("UCS Takanami Shuttle"):setCallSign("UCS Takanami Shuttle"):setFaction("UCN")
	end
end

zone = Zone():setPoints(80000, 80000, 80000, 40000, 40000, 40000, 40000, 80000):setColor(233, 29, 29):setLabel("Big Red Zone tm")

function zoneFuckery()
    if zone:isInside(player) then
        blackhole = BlackHole():setPosition(70000, 61867):setDescriptions("it's a black hole!", "lol"):setRadarSignatureInfo(1.0, 0.0, 0.0)
        --player:setFarRangeRadarRange(2000)
        --player:addToShipLog("Entered the zone", "Magenta", "Helms")   
    end
end

CpuShuttle = CpuShip():setPosition(4000, 4000):setTemplate("UCN Shuttle"):setCallSign("Other Ship Shuttle"):setFaction("UCN")

function shuttleToPlayer()
    sx, sy = CpuShuttle:getPosition()
    shuttle:setPosition(sx, xy):setTemplate("UCN Shuttle"):setCallSign("Other Ship Shuttle"):setFaction("UCN")
    CpuShuttle:destroy()
end

-- system instability function (call from update)
function Instability(delta)
    warpStability = player:getSystemInstabilityLevel("warp")
    if warpStability >= 0.8 then
        player:setSystemHeat("warp", player:getSystemHeat("warp") + (0.1 * (delta / 3)))
        if warpStability >= 1.0 then
            player:setSystemHealth("warp", player:getSystemHealth("warp") - (0.1 * (delta / 3)))
        end
    end
    reactorStability = player:getSystemInstabilityLevel("reactor")
    if reactorStability >= 0.8 then
        player:setSystemHeat("reactor", player:getSystemHeat("reactor") + (0.1 * (delta / 3)))
        if reactorStability >= 1.0 then
            player:setSystemHealth("reactor", player:getSystemHealth("reactor") - (0.1 * (delta / 3)))
            player:setCanBeDestroyed(false)
        end
    end
end

testShip = CpuShip():setPosition(0,0):setTemplate("Gunship"):setFaction("Independent"):setCallSign("Test Ship")
testShip:orderFlyTowards(0, 1000)
function patrol()
    x, y = testShip:getPosition()
    if (x >= -5 and x <= 5) and (y >= 995 and y <= 1005) then
        testShip:orderFlyTowards(1000, 1000)
    end
end

function infoTest()
    testShip:addInfos(1, "Warp Drive Status", tostring(testShip:getSystemHealth("warp")))
end

-- probes telling you what to do 
-- call from update
probeList = {}
function advancedProbes()
    for _, obj in ipairs(player:getObjectsInRange(100)) do
        if obj.typeName == "ScanProbe" then
            table.insert(probeList, obj)
        end
    end

    for _, obj in ipairs(probeList) do
        obj:onExpiration(function() player:addToShipLog("Probe Expired", "Magenta", "Relay") end)
        obj:onDestruction(function() player:addToShipLog("Probe Destroyed", "Magenta", "Relay") end)
    end
end

--looking at cargo
testShip:onDestruction(
    function()
        dx, dy = testShip:getPosition()
        Artifact():setPosition(dx, dy):setModel("cargo"):setSpin(1.5):allowPickup(true):onPickUp(function() player:addToShipLog("New Item in the cargo hatch", "Blue", "Helms") end)
    end
)

-- new cargo 
Artifact():setPosition(0, 0):setModel("cargo-scanned"):setSpin(1.5)

--- looking at wrecks
Artifact():setPosition(8053, 6175):setModel("vanguard-wreck"):setCallSign("Vanguard Frigate Wreck"):setSpin(3.0)
Artifact():setPosition(7423, 6748):setModel("cassard-wreck"):setCallSign("Cassard Frigate Wreck"):setSpin(3.0)
Artifact():setPosition(7389, 5691):setModel("shuttle-wreck"):setCallSign("Shuttle Wreck"):setSpin(3.0)
Artifact():setPosition(7805, 5016):setModel("hoplite-wreck"):setCallSign("Hoplite Destroyer Wreck"):setSpin(3.0)

-- little loop that refuses dock from a ship we don't want players to dock with 

-- lists for ships we want to be able to dock with shuttle and player, respectively. 
-- to add more, drop defined ships after a comma, like so: shuttlePertm = {player, ship1, ship2}
shuttlePerm = {player}
playerPerm = {Warspite}

-- will have to make a table of targets, otherwise EE does not know what "target" means =(
targetPerm = {shuttle, player, Warspite, testShip, CpuShuttle}

-- function itself, initiate from udpate
function dockingPerm()
    for _, target in ipairs(targetPerm) do
        if shuttle:commandDock(target) then
            for _, obj in ipairs(shuttlePerm) do
                if target ~= obj then
                    shuttle:commandAbortDock()
                    shuttle:addToShipLog("Docking Request Denied", "Red", "Helms")
                end
            end
        end
        if player:commandDock(target) then
           print("dock requested")
           for _, obj in ipairs(playerPerm) do
             if target ~= obj then
                player:commandAbortDock()
                   player:addToShipLog("Docking Request Denied", "Red", "Helms")
                   print("dock denied")
               end
           end
        end
    end
end

--- rationalision comms function
playerchat = 0
-- function playerchats()
--     if player:isCommsChatOpenToPlayer() == true and shuttle:isCommsChatOpenToPlayer() == true then
--         if playerchat == 0 then
--             addGMMessage("The two player ships are on comms together")
--             playerchat = 1
--         end
--     elseif playerchat == 1 then
--         addGMMessage("The two player ships have ceased comms")
--         playerchat = 0
--     end
-- end



--- INIT 
function init()
    setVariations()
    --shuttleToCpu()

    addGMFunction("Playership Shuttle", shuttleToPlayer)

-- initiate shuttle
addGMFunction("Initiate/Shutdown Shuttle",
function()
    if shuttle:isDocked(player) then
        shuttle:commandUndock():setFaction("Independent"):setPosition(-400000, -400000)
    else
    shuttle:setFaction("UCN")
    local plX, plY = player:getPosition()
    shuttle:setPosition(plX - 200, plY - 200):commandDock(player):setEnergyLevel(500)
    end
end
)

addGMFunction("Enable Nukes",
    function()
        if player == Takanami then
            player:weaponTubeAllowMissle(1, "Nuke"):weaponTubeAllowMissle(0, "Nuke")
        elseif player == Havock then
            player:weaponTubeAllowMissle(0, "Nuke"):weaponTubeAllowMissle(1, "Nuke")
            player:weaponTubeAllowMissle(2, "Nuke"):weaponTubeAllowMissle(3, "Nuke")
        end
        player:addToShipLog("Nuclear Warhead Enabled", "Magenta", "Weapons")
        addGMMessage("Nukes Enabled")
    end
)

addGMFunction("Hack Player",
    function()
        player:setSystemHealth("warp", player:getSystemHealth("Warp") - 0.4)
        player:setSystemHealth("maneuver", player:getSystemHealth("maneuver") - 0.6)
        player:setSystemHealth("missilesystem", player:getSystemHealth("missilesystem") - 0.35)
        player:addToShipLog("Firewall Breeched \nSystems Compromised", "Magenta", "Engineering")
    end
)
    addGMFunction("Repair Hull",
        function()
            player:setHull(player:getHull() + 35)
            addGMMessage("Hull Partially Repaired")
        end
    )

    addGMFunction("set Instability",
        function()
            player:setSystemInstabilityFactor("warp", 0.1):setSystemInstabilityDifficulty("warp", 2)
                :setSystemInstabilityLabel("warp", 2, "Electromagnetic Stability"):setSystemInstabilityLabel("warp", 1,
                "Gravitational Stability")
            player:setSystemInstabilityFactor("reactor", 0.1):setSystemInstabilityDifficulty("reactor", 2):setSystemInstabilityLabel("reactor", 1, "Fission Stability"):setSystemInstabilityLabel("reactor", 2, "Thermal Stability")
                addGMMessage("Instability Set")
        end
    )
    specificAsteroids(testShip, 40, 10000, "Magic Mushrooms")
end



--- UPDATE 
baseSet = 0
playerchat = 0
function update(delta)
asteroidSizes(0, 0, 500000)
playerchats()
end