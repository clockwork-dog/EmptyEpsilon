-- Name: Tech Weeks Scenario
-- Description: Wave combat with random GM-initiated events and Q2Q GM Buttons
-- Type: Basic
-- Variation[Takanami]: This scenario will run on Takanami 
-- Variation[Havock]: This scenario will run on Havock

            -- REQUIRE UTILITIES
require("utils.lua")

            -- SET ZONE (if using)

            -- PLAYERSHIPS

                   -- set your position        
player = PlayerSpaceship():setPosition(5801, 6039):setWarpDrive(true):setWarpSpeed(1000.00):setWeaponStorage("Nuke", 2)

shuttle = PlayerSpaceship():setPosition(6101, 6339):setWarpDrive(true):setWarpSpeed(1000.00):setFaction("UCN")

            -- UCN CPU SHIPS 
-- drop UCN CPU ships       
Station = SpaceStation():setFaction("UCN"):setTemplate("Medium Station"):setCallSign("Home"):setPosition(5254, 5331):setScanned(true):setRepairDocked(true)

            -- TERRAIN 
Nebula():setPosition(-55111, 41333)
Nebula():setPosition(-56778, 34444)
Nebula():setPosition(-53556, 26111)
Nebula():setPosition(-68111, 19333)
Nebula():setPosition(-57000, 36889)
Nebula():setPosition(-39333, 36889)
Nebula():setPosition(-43778, 40222)
Nebula():setPosition(-46222, 31000)
Nebula():setPosition(-67778, 29111)
Nebula():setPosition(-60889, 30889)
Nebula():setPosition(37889, 20111)
Nebula():setPosition(40333, 29667)
Nebula():setPosition(46444, 32000)
Nebula():setPosition(51889, 32778)
Nebula():setPosition(53111, 17889)
Nebula():setPosition(46778, 40667)
Nebula():setPosition(47778, 21889)
Nebula():setPosition(43111, -63889)
Nebula():setPosition(55667, -59445)
Nebula():setPosition(60556, -52445)
Nebula():setPosition(49333, -71111)
Nebula():setPosition(51333, -64778)
Nebula():setPosition(-34333, -46444)
Nebula():setPosition(-40333, -54667)
Nebula():setPosition(-55000, -62111)
Nebula():setPosition(-51111, -64111)
Nebula():setPosition(-37333, -89000)
Nebula():setPosition(-46222, -69889)
Nebula():setPosition(-43556, -64000)
Nebula():setPosition(-46000, -56778)
Nebula():setPosition(-52000, -51778)
Nebula():setPosition(-43778, -39222)
Nebula():setPosition(-42778, -43889)
Asteroid():setPosition(24778, -19444)
Asteroid():setPosition(-5444, -25778)
Asteroid():setPosition(-29556, -9667)
Asteroid():setPosition(-13333, 16444)
Asteroid():setPosition(29778, -5333)
Asteroid():setPosition(20889, 12889)
Asteroid():setPosition(15000, 26000)
Asteroid():setPosition(-4333, 35111)
Asteroid():setPosition(16889, 38444)
Asteroid():setPosition(44111, 13222)
Asteroid():setPosition(89444, -23222)
Asteroid():setPosition(69333, -40778)
Asteroid():setPosition(50444, -20556)
Asteroid():setPosition(73778, -3667)
Asteroid():setPosition(64556, 15000)
Asteroid():setPosition(35333, -27222)
Asteroid():setPosition(22222, -43667)
Asteroid():setPosition(48444, -20778)
Asteroid():setPosition(46333, -5444)
Asteroid():setPosition(56556, -12778)
Asteroid():setPosition(56444, -25444)
Asteroid():setPosition(45778, -35556)
Asteroid():setPosition(-20111, -29667)
Asteroid():setPosition(-48556, -10556)
Asteroid():setPosition(-41778, 9778)
Asteroid():setPosition(-36333, 22000)
Asteroid():setPosition(-40444, 28222)
Asteroid():setPosition(-14889, 27333)
Asteroid():setPosition(-26778, 8667)
Asteroid():setPosition(-46556, 13111)
Asteroid():setPosition(-63333, 4000)
Asteroid():setPosition(-43111, -13333)
Asteroid():setPosition(-24222, -31444)
Asteroid():setPosition(-12778, -46667)
Asteroid():setPosition(3111, -42111)
Asteroid():setPosition(14000, -52000)
Asteroid():setPosition(39778, -47222)
Asteroid():setPosition(55111, -46556)
Asteroid():setPosition(64333, -33333)
Asteroid():setPosition(34667, -27222)
Asteroid():setPosition(45444, -11556)
Asteroid():setPosition(26889, -7222)
Asteroid():setPosition(18444, 21556)
Asteroid():setPosition(-10222, 25222)
Asteroid():setPosition(-34556, 25111)
Asteroid():setPosition(-34444, -18778)
Asteroid():setPosition(-26333, 17556)
Asteroid():setPosition(11333, 30667)
Asteroid():setPosition(33889, 19667)
Asteroid():setPosition(44111, 8889)
Asteroid():setPosition(59667, 2000)
Asteroid():setPosition(26444, -22111)
Asteroid():setPosition(5000, -18667)
Asteroid():setPosition(29111, 6000)
Asteroid():setPosition(38778, 19333)
Asteroid():setPosition(-889, 24444)
Asteroid():setPosition(-27444, 7556)
Asteroid():setPosition(-15667, -4778)
Asteroid():setPosition(-50778, -79111)
Asteroid():setPosition(-17000, -69889)
Asteroid():setPosition(-37556, -52000)
Asteroid():setPosition(-69111, -32556)
Asteroid():setPosition(49000, -68667)
Asteroid():setPosition(79333, -65222)
Asteroid():setPosition(80222, -35000)
Asteroid():setPosition(70222, 36889)
Asteroid():setPosition(34111, 64556)
Asteroid():setPosition(-12111, 52333)
Asteroid():setPosition(-35778, 52556)


             -- AUTOMATION 
-- tables             
-- four "boxes" the attacks come out of
originA = {30000, 40000, 30000, 40000}
originB = {30000, 40000, -40000, -30000}
originC = {-40000, -30000, -40000, -30000}
originD = {-40000, -30000, 30000, 40000}
originTable = {originA, originB, originC, originD}

-- templates lists
smallShip = {"Gunship", "Interceptor", "Bomber"}
mediumShip = {"Tribal Frigate", "Orlov Frigate", "Cassard Frigate", "Ballmer Frigate", "Monsoon Frigate"}
largeShip = {"Thunder Frigate", "Talavaar Destroyer", "Mirabello Destroyer", "Arquebuse Destroyer", "Zhengzhou Destroyer", "Kursk Destroyer"}

-- callsign lists
nameAdjective = {"Fallen ", "Dark ", "Doom ", "Burning ", "Flaming ", "Grey ", "Nuclear ", "Golden ", "Ruthless ", "Angry ", "Killer ", "Total ", "Iron ", "Cursed ", "Heavy ", "Metal ", "Spiked ", "Cracked ", "Phantom ", "Fighting ", "Adamas ", "Melting ", "Flying ", "Icy ", "Fire ", "Rusty ", "Avenging ", "Striking ", "Stalking ", "Eternal "}
nameNoun = {"Shark", "Ray", "Serpent", "Bullet", "Fate", "Death", "Titan", "Storm", "Fire", "Star", "Bones", "Skull", "Desolation", "Tears", "Moon", "Dragon", "Dutchman", "Revenge", "Phantom", "King", "Queen", "Monarch", "Menace", "Lava", "Hunt", "Warrior", "Gauntlet", "Chain", "Spark", "Saber"}
fullNameTable = {}

-- our libraries don't have table.find so adding it here 
function table.find(t, s, o)
    o = o or 1
    assert(s ~= nil, "second argument cannot be nil")
    for i = o, #t do
        if t[i] == s then
            return i
        end
    end
end

-- function to assign name
function assignName()
        fullName = (tostring(nameAdjective[math.random(#nameAdjective)] .. nameNoun[math.random(#nameNoun)]))
        check = table.find(fullNameTable, fullName)
        while check ~= nil do
            fullName = (tostring(nameAdjective[math.random(#nameAdjective)] .. nameNoun[math.random(#nameNoun)]))
            check = table.find(fullNameTable, fullName)
        end
        table.insert(fullNameTable, fullName)
end

-- returns a single corsair ship. template => smallShip, mediumShip, largeShip
function createPirate(template)
    x = math.random(placeOfOrigin[1], placeOfOrigin[2])
    y = math.random(placeOfOrigin[3], placeOfOrigin[4])
    return
    CpuShip():setFaction("corsair"):setCallSign(fullName)
    :setTemplate(template[math.random(#template)])
    :setPosition(x, y):orderAttack(player)
end

-- create a small wave > 1 to 4 random small starships 
function smallWave()
    smallNumberMax = math.random(1, 4)
    smallNumber = 0
    placeOfOrigin = originTable[math.random(1, 4)]
    while smallNumber < smallNumberMax do
        assignName()
        createPirate(smallShip)
        smallNumber = smallNumber + 1
    end
    addGMMessage("Small Wave Sent")
end

-- medium wave = 3 to 6 ships total, of which 1 or 2 will be Frigates
function mediumWave()
    totalNumberMax = math.random(3, 6)
    mediumNumberMax = math.random(1, 2)
    totalNumber = 0
    mediumNumber = 0
    placeOfOrigin = originTable[math.random(1, 4)]
    while mediumNumber < mediumNumberMax do
        assignName()
        createPirate(mediumShip)
        mediumNumber = mediumNumber + 1
        totalNumber = totalNumber + 1
    end
    while totalNumber < totalNumberMax do
       assignName()
       createPirate(smallShip)
        totalNumber = totalNumber + 1
    end
    addGMMessage("Medium Wave Sent")
end

-- spawn a larger frigate or a Destroyer. It drops cargo when destroyed
function spawnBoss()
    placeOfOrigin = originTable[math.random(1, 4)]
    assignName()
    createPirate(largeShip):onDestruction(
        function()
            dx, dy = boss:getPosition()
            Artifact():setPosition(dx, dy):setModel("cargo"):setSpin(1.5):allowPickup(true):onPickUp(function() player
                    :addToShipLog("New Item in the cargo hatch", "Blue", "Helms") end)
        end
    )
    addGMMessage("Boss Spawned")
end

-- spawn Cargo
function spawnCargo()
    cx, cy = player:getPosition()
    newx = cx + math.random(300, 5000)
    newy = cy + math.random(300, 5000)
    Artifact():setPosition(newx, newy):setModel("cargo"):setSpin(1.5):allowPickup(true):onPickUp(function() player
            :addToShipLog("New Item in the cargo hatch", "Blue", "Helms") end)
end

-- spawn Jammer
function spawnJammer()
    local x, y = player:getPosition()
    warpjammer = WarpJammer():setPosition(x - 1000, y - 1000)
    removeGMFunction("Spawn Warp Jammer")
    addGMFunction("Destroy Warp Jammer",
    function()
        warpjammer:destroy()
        removeGMFunction("Destroy Warp Jammer")
        addGMFunction("Spawn Warp Jammer", spawnJammer)
    end
    )
end

-- Q2Q 
function openShipQ2Q()
    removeGMFunction("Open Ship Q2Q")
    addGMFunction("Close Ship Q2Q", closeShipQ2Q)
    addGMFunction("Strip of Energy", function() player:setEnergyLevel(150) end)
    addGMFunction("Small Damage", function() player:takeDamage(15) end)
    addGMFunction("Big Damage", function() player:takeDamage(30) end)
    addGMFunction("Front Shield Damage", function() player:takeDamage(15, "EMP") end)
    addGMFunction("Rear Shield Damage", function() player:takeDamage(15, "rearshield") end)
    addGMFunction("Break Reactor", function() player:setSystemHealth("reactor", -0.5) end)
    addGMFunction("Break Beams", function() player:setSystemHealth("beamweapons", -0.5) end)
    addGMFunction("Break Missiles", function() player:setSystemHealth("missilesystem", -0.5) end)
    addGMFunction("Break Maneuver", function() player:setSystemHealth("maneuver", -0.5) end)
    addGMFunction("Break Impulse", function() player:setSystemHealth("impulse", -0.5) end)
    addGMFunction("Break Warp", function() player:setSystemHealth("warp", -0.5) end)
    addGMFunction("Break Front Shield", function() player:setSystemHealth("frontshield", -0.5) end)
    addGMFunction("Break Rear Shield", function() player:setSystemHealth("rearshield", -0.5) end)
    addGMFunction("Hack Reactor", function() player:setSystemHackedLevel("reactor", 0.5) end)
    addGMFunction("Hack Beams", function() player:setSystemHackedLevel("beamweapons", 0.5) end)
    addGMFunction("Hack Missiles", function() player:setSystemHackedLevel("missilesystem", 0.5) end)
    addGMFunction("Hack Maneuver", function() player:setSystemHackedLevel("maneuver", 0.5) end)
    addGMFunction("Hack Impulse", function() player:setSystemHackedLevel("impulse", 0.5) end)
    addGMFunction("Hack Warp", function() player:setSystemHackedLevel("warp", 0.5) end)
    addGMFunction("Hack Front Shield", function() player:setSystemHackedLevel("frontshield", 0.5) end)
    addGMFunction("Hack Rear Shield", function() player:setSystemHackedLevel("rearshield", 0.5) end)
end

function closeShipQ2Q()
    removeGMFunction("Close Ship Q2Q")
    addGMFunction("Open Ship Q2Q", openShipQ2Q)
    removeGMFunction("Strip of Energy")
    removeGMFunction("Small Damage")
    removeGMFunction("Big Damage")
    removeGMFunction("Front Shield Damage")
    removeGMFunction("Rear Shield Damage")
    removeGMFunction("Break Reactor")
    removeGMFunction("Break Beams")
    removeGMFunction("Break Missiles")
    removeGMFunction("Break Maneuver")
    removeGMFunction("Break Impulse")
    removeGMFunction("Break Warp")
    removeGMFunction("Break Front Shield")
    removeGMFunction("Break Rear Shield")
    removeGMFunction("Hack Reactor")
    removeGMFunction("Hack Beams")
    removeGMFunction("Hack Missiles")
    removeGMFunction("Hack Maneuver")
    removeGMFunction("Hack Impulse")
    removeGMFunction("Hack Warp")
    removeGMFunction("Hack Front Shield")
    removeGMFunction("Hack Rear Shield")

end

function openShuttleQ2Q()
    removeGMFunction("Open Shuttle Q2Q")
    addGMFunction("Close Shuttle Q2Q", closeShuttleQ2Q)
    addGMFunction("Strip Shuttle of Energy", function() shuttle:setEnergyLevel(100) end)
    addGMFunction("Small Damage to Shuttle", function() shuttle:takeDamage(5) end)
    addGMFunction("Big Damage to Shuttle", function() shuttle:takeDamage(30) end)
    addGMFunction("EMP Damage to Shuttle", function() shuttle:takeDamage(35, "EMP") end)
    addGMFunction("Break Shuttle Reactor", function() shuttle:setSystemHealth("reactor", -0.5) end)
    addGMFunction("Break Shuttle Beams", function() shuttle:setSystemHealth("beamweapons", -0.5) end)
    addGMFunction("Break Shuttle Missiles", function() shuttle:setSystemHealth("missilesystem", -0.5) end)
    addGMFunction("Break Shuttle Maneuver", function() shuttle:setSystemHealth("maneuver", -0.5) end)
    addGMFunction("Break Shuttle Impulse", function() shuttle:setSystemHealth("impulse", -0.5) end)
    addGMFunction("Break Shuttle Warp", function() shuttle:setSystemHealth("warp", -0.5) end)
    addGMFunction("Break Shuttle Front Shield", function() shuttle:setSystemHealth("frontshield", -0.5) end)
    addGMFunction("Break Shuttle Rear Shield", function() shuttle:setSystemHealth("rearshield", -0.5) end)
    addGMFunction("Hack Shuttle Reactor", function() shuttle:setSystemHackedLevel("reactor", 0.5) end)
    addGMFunction("Hack Shuttle Beams", function() shuttle:setSystemHackedLevel("beamweapons", 0.5) end)
    addGMFunction("Hack Shuttle Missiles", function() shuttle:setSystemHackedLevel("missilesystem", 0.5) end)
    addGMFunction("Hack Shuttle Maneuver", function() shuttle:setSystemHackedLevel("maneuver", 0.5) end)
    addGMFunction("Hack Shuttle Impulse", function() shuttle:setSystemHackedLevel("impulse", 0.5) end)
    addGMFunction("Hack Shuttle Warp", function() shuttle:setSystemHackedLevel("warp", 0.5) end)
    addGMFunction("Hack Shuttle Front Shield", function() shuttle:setSystemHackedLevel("frontshield", 0.5) end)
    addGMFunction("Hack Shuttle Rear Shield", function() shuttle:setSystemHackedLevel("rearshield", 0.5) end)
end

function closeShuttleQ2Q()
    removeGMFunction("Close Shuttle Q2Q")
    addGMFunction("Open Shuttle Q2Q", openShuttleQ2Q)
    removeGMFunction("Strip Shuttle of Energy")
    removeGMFunction("Small Damage to Shuttle")
    removeGMFunction("Big Damage to Shuttle")
    removeGMFunction("EMP Damage to Shuttle")
    removeGMFunction("Break Shuttle Reactor")
    removeGMFunction("Break Shuttle Beams")
    removeGMFunction("Break Shuttle Missiles")
    removeGMFunction("Break Shuttle Maneuver")
    removeGMFunction("Break Shuttle Impulse")
    removeGMFunction("Break Shuttle Warp")
    removeGMFunction("Break Shuttle Front Shield")
    removeGMFunction("Break Shuttle Rear Shield")
    removeGMFunction("Hack Shuttle Reactor")
    removeGMFunction("Hack Shuttle Beams")
    removeGMFunction("Hack Shuttle Missiles")
    removeGMFunction("Hack Shuttle Maneuver")
    removeGMFunction("Hack Shuttle Impulse")
    removeGMFunction("Hack Shuttle Warp")
    removeGMFunction("Hack Shuttle Front Shield")
    removeGMFunction("Hack Shuttle Rear Shield")
end



            -- SET VARIATION    
function setVariations()
    if string.find(getScenarioVariation(), "Havock") then
        player:setTemplate("UCS Skirmish Class Frigate"):setCallSign("UCS Havock"):setFaction("UCN")
        shuttle:setTemplate("UCS Havock Shuttle"):setCallSign("UCS Havock Shuttle")
    elseif string.find(getScenarioVariation(), "Takanami") then
        player:setTemplate("UCS Hoplite Class Destroyer"):setCallSign("UCS Takanami"):setFaction("UCN")
        shuttle:setTemplate("UCS Takanami Shuttle"):setCallSign("UCS Takanami Shuttle")
    end
end


-- --- shuttle function in a single button 
-- function InitiateShuttle()
--     if shuttle:isDocked(player) then
--         shuttle:commandUndock():setFaction("Independent"):setPosition(-400000, -400000)
--     else
--         shuttle:setFaction("UCN")
--         local plX, plY = player:getPosition()
--         shuttle:setPosition(plX - 200, plY - 200):commandDock(player):setEnergyLevel(500)
--     end
-- end
   
                                         ---- END OF BODY 

    --- INIT FUNCTION
-- this is where docking, buttons, function initiations go

function init()
    setVariations()
    player:setActivePresetNumber(0)
    shuttle:setActivePresetNumber(0)
    player:commandDock(Station)

    -- WAVES
    addGMFunction("Send Small Wave", smallWave)
    addGMFunction("Send Medium Wave", mediumWave)
    addGMFunction("Send Boss", spawnBoss)
    addGMFunction("Spawn Cargo", spawnCargo)
    addGMFunction("Spawn Warp Jammer", spawnJammer)

    -- RESTOCK
    addGMFunction("Restock",
    function()
        pCallsign = player:getCallSign()
        shuttle:setWeaponStorage("HVLI", 8):setWeaponStorage("EMP", 8):setWeaponStorage("Mine", 8)
        if pCallsign == "UCS Havock" then
        player:setWeaponStorage("Homing", 12):setWeaponStorage("HVLI", 6):setWeaponStorage("Mine", 6)
            :setWeaponStorage("EMP", 6):setWeaponStorage("Nuke", 2)
        elseif pCallsign == "UCS Takanami" then
            player:setWeaponStorage("Homing", 12):setWeaponStorage("HVLI", 8):setWeaponStorage("Mine", 6)
            :setWeaponStorage("EMP", 8):setWeaponStorage("Nuke", 2)
        else
            print("Incorrect template")
        end
        addGMMessage("Playership restocked")
    end
)

    addGMFunction("Open Ship Q2Q", openShipQ2Q)
    addGMFunction("Open Shuttle Q2Q", openShuttleQ2Q)


end


function update(delta)
end
