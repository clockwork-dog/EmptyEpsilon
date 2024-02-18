-- Name: Military Routine Partol Tier 1
-- Description: Military Mission
-- Type: Basic
-- Variation[Takanami]: This scenario will run on Takanami 
-- Variation[Havock]: This scenario will run on Havock

-- Zone

zone = Zone():setPoints(40000, 80000, 140000, 80000, 140000, 160000, 40000, 160000):setColor(96, 96, 96):setLabel("Area of Operations")

-- playerships
player = PlayerSpaceship():setPosition(7979, 10343):setWarpDrive(true):setWarpSpeed(1000.00)
shuttle = PlayerSpaceship():setFaction("UCN"):setPosition(8279, 13343):setWarpDrive(true):setWarpSpeed(1000.00)

-- UCN ships 
Warspite = CpuShip():setFaction("UCN"):setTemplate("UCS King George Battleship"):setCallSign("ucs warspite"):setPosition(7805, 10565):setWeaponStorage("EMP", 22):setScanned(true):setRepairDocked(true):setDescriptions("King George Class Battleship", "Current orders: Establish Base in Adamas Belt.")
Warspite:addInfos(1,"Fabrication date", "2091")
Warspite:addInfos(2,"Current Commander", "Captain TBD")
Warspite:addInfos(3,"Number of Personnel", "182")
Warspite:addInfos(4, "Life signs", "Strong")
stationD = SpaceStation():setTemplate("Small Station"):setFaction("UCN"):setCallSign("Kal-delta \nLogistics"):setHull(300):setPosition(111168, 129873):setDescriptions("Kalgoorlie-delta", "Logistics of Kalgoorlie mining operation"):addInfos(1, "Life signs", "Strong")
stationB = SpaceStation():setTemplate("Medium Station"):setFaction("UCN"):setCallSign("Kal-beta \nPersonnel"):setPosition(87201, 94273):setDescriptions("Kalgoorlie-beta", "Home for Personnel of Kalgoolie mining operation. \n Contact Personnel Manager Officer Higgins for further details."):addInfos(1, "Life signs", "Strong")
stationC = SpaceStation():setTemplate("Medium Station"):setFaction("UCN"):setCallSign("Kal-gamma \nWarehouse"):setPosition(61881, 132448):setDescriptions("Kalgoorlie-gamma", "Warehouse"):addInfos(1, "Life signs", "Moderate")
stationA = SpaceStation():setTemplate("Medium Station"):setFaction("UCN"):setCallSign("Kal-alpha \nOperations"):setPosition(92401, 113201):setDescriptions("Kalgoorlie-alpha", "Heart of Kalgoorlie mining operation, proud to be the first mine established at Adamas Belt in 2179. \n Biggest supplier of Uranimum across the Adamas Belt."):addInfos(1, "Life signs", "Strong")
miningRig = SpaceStation():setTemplate("Asteroid Mining Rig"):setFaction("UCN"):setCallSign("Kalgoorlie Mining Rig"):setHull(300):setPosition(110671, 131389):setDescriptions("Kalgoorlie Mining Rig", "Total number of personnel: 136"):addInfos(1, "Life signs", "Strong")
Goods = CpuShip():setFaction("UCN"):setTemplate("Goods Freighter 2"):setCallSign("Kal-Goods 3"):setPosition(63833, 132000):orderIdle():setWarpDrive(false):setDescriptions("Kalgoorlie Goods Freighter 3", "Transports Uranium between Kalgoorlie mine and stations \n contact Kal-D for futher information"):addInfos(0, "Fabrication Date", "2164"):addInfos(1, "Life signs", "Moderate")
Fuel = CpuShip():setFaction("UCN"):setTemplate("Fuel Freighter 5"):setCallSign("Kal-Fuel 6"):setPosition(63833, 133481):orderIdle():setWarpDrive(false):setDescriptions("Kalgoorlie Fuel Freighter 6", "Supplies fuses, power cells and fuel within the Kalgoorlie Operation"):addInfos(0, "Fabrication Date", "2162"):addInfos(1, "Life signs", "Moderate")
Iron1 = CpuShip():setFaction("UCN"):setTemplate("Gunship"):setCallSign("Iron One"):setPosition(90870, 111907):setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(0, "Fabrication date", "2178"):addInfos(1, "Life signs", "Low"):addInfos(2, "Squadron", "1st Defence"):addInfos(3, "Flight", "Iron"):setDescriptions("Improved Gunship", "Current orders: Kalgoorlie Defence")
Iron2 = CpuShip():setFaction("UCN"):setTemplate("Gunship"):setCallSign("Iron Two"):setPosition(90685, 114315):setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(0, "Fabrication date", "2178"):addInfos(1, "Life signs", "Low"):addInfos(2, "Squadron", "1st Defence"):addInfos(3, "Flight", "Iron"):setDescriptions("Improved Gunship", "Current orders: Kalgoorlie Defence")

-- Bad Guys (Pirates)

function spawnPirates()
    firstBad1 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Black Wave"):setPosition(92805, 66666):addInfos(1, "Life signs", "Low")
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang")
    firstBad2 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Thunder Sky"):setPosition(97039, 68888):addInfos(1, "Life signs", "Low")
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang")
    secondBad1 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Blue Siren"):setPosition(112653, 62581):addInfos(1, "Life signs", "Low")
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang")
    secondBad2 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Unforgivable"):setPosition(114988, 60780):addInfos(1, "Life signs", "Low")
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang")
    secondBad3 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Hacksaw"):setPosition(111452, 64316):addInfos(1, "Life signs", "Low")
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang")
    freightBad1 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Grey Wasp"):setPosition(119992, 64383):addInfos(1, "Life signs", "Low")
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang")
    freightBad2 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Cheetah"):setPosition(121260, 63582):addInfos(1, "Life signs", "Low")
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang")
    freightBad3 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Red Serpent"):setPosition(121526, 64983):addInfos(1, "Life signs", "Low")
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang")
    rigBad1 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Golden Slug"):setPosition(107865, 65253):addInfos(1, "Life signs", "Low")
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang")
    rigBad2 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Neon Star"):setPosition(106063, 65186):addInfos(1, "Life signs", "Low")
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang")
    rigBad3 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Fatal Error"):setPosition(105197, 65453):addInfos(1, "Life signs", "Low")
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang")
    rigBad4 = CpuShip():setFaction("corsair"):setTemplate("SPS Orlov Frigate"):setCallSign("Doom Machine"):setPosition(106530, 65387)
        :setWarpDrive(true):setWarpSpeed(1000.00):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang"):addInfos(1, "Life signs", "Moderate")
    bigBad1 = CpuShip():setFaction("corsair"):setTemplate("EFS Arquebuse Destroyer"):setCallSign("Lightning"):setPosition(134372, 75201):setShields(200.00, 193.85, 200.00, 350.00):setWeaponStorage("EMP", 17):setDescriptions("Self-proclaimed pirate", "Flying with the Death Fire gang"):addInfos(1, "Life signs", "Moderate")
    bigBad2 = CpuShip():setFaction("corsair"):setTemplate("Talavaar Destroyer"):setCallSign("Death fire"):setPosition(131734, 74229):setWeaponStorage("EMP", 2):setDescriptions("Adam Belt is out Highway", "Leader is the Death Fire gang")
    removeGMFunction("Spawn Pirates")
    removeGMFunction("Spawn Jackers")
    addGMFunction("First Wave", firstWave)
    addGMFunction("Second Wave", secondWave)
    addGMFunction("Boss Fight", bossFight)
    Fuel:orderFlyTowards(110671, 131389)
    Goods:orderFlyTowards(110671, 131389)
end

-- Bad Guys (Jackers)

function spawnJackers()
    buoy =  CpuShip():setFaction("corsair"):setTemplate("Sensor Buoy MKI"):setCallSign("xx037"):setPosition(20641, 78964):orderRoaming():setTypeName("Sensor Buoy MK1"):addInfos(1, "Life signs", "Nil")
    firstWaveJ1 = CpuShip():setFaction("corsair"):setTemplate("JASA Monsoon Frigate"):setCallSign("xx016"):setPosition(9859, 111465):setWeaponStorage("EMP", 3):setBeamWeaponDamageType(0, 3, 1, 3):addInfos(1, "Life signs", "Moderate")
    firstWaveJ2 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("xx018"):setPosition(12655, 112132):setWeaponStorage("HVLI", 3):addInfos(1, "Life signs", "Low")
    whWaveJ1 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("xx019"):setPosition(24415, 146691):setWeaponStorage("EMP", 3):setBeamWeaponDamageType(0, 1):addInfos(1, "Life signs", "Low")
    whWaveJ2 = CpuShip():setFaction("corsair"):setTemplate("Interceptor"):setCallSign("xx021"):setPosition(32526, 148132):setBeamWeaponDamageType(0, 3):addInfos(1, "Life signs", "Low")
    whWaveJFreight= CpuShip():setFaction("Independent"):setTemplate("Jump Carrier"):setCallSign("xx014"):setPosition(31926, 143984):setJumpDrive(false):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1, "Life signs", "Moderate")
    whWaveJ3 = CpuShip():setFaction("corsair"):setTemplate("Interceptor"):setCallSign("xx020"):setPosition(31859, 146021):setBeamWeaponDamageType(0, 3):addInfos(1, "Life signs", "Low")
    rigWaveJ1 = CpuShip():setFaction("corsair"):setTemplate("Interceptor"):setCallSign("xx124"):setPosition(157273, 128849):setBeamWeaponDamageType(0, 3):addInfos(1, "Life signs", "Low")
    rigWaveJ2 = CpuShip():setFaction("corsair"):setTemplate("Interceptor"):setCallSign("xx023"):setPosition(158448, 132395):addInfos(1, "Life signs", "Low")
    rigWaveJFreight = CpuShip():setFaction("Independent"):setTemplate("Personnel Freighter 1"):setCallSign("xx026"):setPosition(160526, 133687):orderIdle():setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1, "Life signs", "Moderate")
    bigBagJ1 = CpuShip():setFaction("corsair"):setTemplate("CNS Talavaar Destroyer"):setCallSign("xx025"):setPosition(4671, 94016):setWeaponStorage("Homing", 4):addInfos(1, "Life signs", "Moderate")
    bigBadJ2 = CpuShip():setFaction("corsair"):setTemplate("EFS Arquebuse Destroyer"):setCallSign("xx217"):setPosition(2970, 95910):setWeaponStorage("EMP", 8):setBeamWeaponDamageType(0, 3, 1, 3):addInfos(1, "Life signs", "Moderate")
    removeGMFunction("Spawn Pirates")
    removeGMFunction("Spawn Jackers")
    addGMFunction("Jacker Trap", jackerTrap)
    addGMFunction("Jacker Raid", jackerRaid)
    addGMFunction("Jacker Boss Fight", jackerBoss)
    addGMFunction("Hack Player - 1", hackPlayer1)
    addGMFunction("Hack Player - 2", hackPlayer2)
    Fuel:orderDock(stationC)
    Goods:orderDock(stationC)
end

-- Terrain 
Nebula():setPosition(78022, 35571)
Nebula():setPosition(82374, 41497)
Nebula():setPosition(84782, 31126)
Nebula():setPosition(-29848, 57145)
Nebula():setPosition(-28737, 65293)
Nebula():setPosition(-23922, 58256)
Nebula():setPosition(-21237, 46774)
Nebula():setPosition(17930, 107237)
Nebula():setPosition(9319, 101034)
Nebula():setPosition(14782, 96774)
Nebula():setPosition(144319, 76959)
Nebula():setPosition(134967, 76682)
Nebula():setPosition(137652, 84182)
Nebula():setPosition(144319, 88163)
Nebula():setPosition(152004, 81682)
Nebula():setPosition(50893, 141034)
Nebula():setPosition(51356, 145571)
Nebula():setPosition(38115, 134737)
Nebula():setPosition(42837, 144922)
Nebula():setPosition(135060, 129552)
Nebula():setPosition(139134, 140571)
Nebula():setPosition(149041, 126959)
Nebula():setPosition(139134, 133719)
Nebula():setPosition(141726, 138163)
Nebula():setPosition(151541, 136496)
Nebula():setPosition(142615, 123275)
Nebula():setPosition(94504, 65941)
Nebula():setPosition(94967, 65663)
Nebula():setPosition(99041, 71682)
Asteroid():setPosition(77189, 77237)
Asteroid():setPosition(60337, 87978)
Asteroid():setPosition(55152, 105663)
Asteroid():setPosition(70152, 92700)
Asteroid():setPosition(107467, 89459)
Asteroid():setPosition(94136, 95300)
Asteroid():setPosition(97004, 90571)
Asteroid():setPosition(75985, 107422)
Asteroid():setPosition(58022, 117885)
Asteroid():setPosition(57282, 129552)
Asteroid():setPosition(75615, 128256)
Asteroid():setPosition(74782, 140756)
Asteroid():setPosition(102837, 155108)
Asteroid():setPosition(114689, 146404)
Asteroid():setPosition(91819, 148996)
Asteroid():setPosition(109134, 137515)
Asteroid():setPosition(128208, 116774)
Asteroid():setPosition(147560, 108163)
Asteroid():setPosition(131819, 93163)
Asteroid():setPosition(119689, 79830)
Asteroid():setPosition(134411, 108904)
Asteroid():setPosition(114319, 101682)
Asteroid():setPosition(112837, 112330)
Asteroid():setPosition(114041, 127330)
Asteroid():setPosition(113393, 131867)
Asteroid():setPosition(104319, 119367)
Asteroid():setPosition(106911, 124459)
Asteroid():setPosition(104319, 131126)
Asteroid():setPosition(84228, 111503)
Asteroid():setPosition(67930, 123626)
Asteroid():setPosition(86911, 96589)
Asteroid():setPosition(69689, 101867)
Asteroid():setPosition(111634, 119367)
Asteroid():setPosition(106356, 109737)
Asteroid():setPosition(95803, 109559)
Asteroid():setPosition(87099, 103077)
Asteroid():setPosition(80895, 108170)
Asteroid():setPosition(83948, 132515)
Asteroid():setPosition(78948, 141126)
Asteroid():setPosition(93856, 143626)
Asteroid():setPosition(100152, 132793)
Asteroid():setPosition(110615, 127422)
Asteroid():setPosition(93117, 115670)
Asteroid():setPosition(98395, 117244)
Asteroid():setPosition(107745, 131959)
Asteroid():setPosition(127837, 130941)
Asteroid():setPosition(94308, 124485)
Asteroid():setPosition(91808, 116245)
Asteroid():setPosition(99043, 101596)
Asteroid():setPosition(92747, 104003)
Asteroid():setPosition(85988, 110114)
Asteroid():setPosition(79874, 124552)
Asteroid():setPosition(71356, 114737)
Asteroid():setPosition(69226, 137237)
Asteroid():setPosition(67282, 152145)
Asteroid():setPosition(132745, 152330)
Asteroid():setPosition(113763, 138256)
Asteroid():setPosition(117467, 124737)
Asteroid():setPosition(109041, 122978)
Asteroid():setPosition(106448, 116682)
Asteroid():setPosition(95988, 113911)
Asteroid():setPosition(91914, 106318)
Asteroid():setPosition(88858, 115392)
Asteroid():setPosition(76171, 119182)
Asteroid():setPosition(75893, 132052)
Asteroid():setPosition(87004, 138163)
Asteroid():setPosition(107189, 128256)
Asteroid():setPosition(84504, 128441)
Asteroid():setPosition(99041, 137793)
Asteroid():setPosition(104967, 137422)
Asteroid():setPosition(104967, 142515)
Asteroid():setPosition(68300, 77608)
Asteroid():setPosition(80615, 59922)
Asteroid():setPosition(36356, 93626)
Asteroid():setPosition(35985, 109922)
Asteroid():setPosition(51356, 81774)
Asteroid():setPosition(36171, 73441)
Asteroid():setPosition(53393, 53626)
Asteroid():setPosition(64597, 59645)
Asteroid():setPosition(93485, 78163)
Asteroid():setPosition(108300, 71867)
Asteroid():setPosition(109411, 55015)
Asteroid():setPosition(19689, 117515)
Asteroid():setPosition(23022, 127885)
Asteroid():setPosition(47097, 127052)
Asteroid():setPosition(77374, 158719)
Asteroid():setPosition(51634, 156959)
Asteroid():setPosition(92559, 156682)
Asteroid():setPosition(81171, 168348)
Asteroid():setPosition(113300, 174645)
Asteroid():setPosition(132282, 170756)
Asteroid():setPosition(120152, 150941)
Asteroid():setPosition(148948, 151589)
Asteroid():setPosition(145708, 180478)
Asteroid():setPosition(102745, 183904)
Asteroid():setPosition(70152, 177052)
Asteroid():setPosition(52189, 172237)

-- AUTOMATION

-- randomising asteroid sizes and descriptions
asteroidList = {}
sizeSet = false
asteroidElements =  {"Cadmium", "Nickel", "Aluminum", "Lithium", "Iron", "Hydrogen", "Silicon", "Carbon", "Oxygen"}
asteroidBase = "More Information Available When Scanned"
function asteroidInfo()
    if sizeSet == true then
        return
    end
    -- this gets astreoids in radius of 50 grids (1mil pixels) within starting point (0.0). Change values as needed
    for _, obj in ipairs(getObjectsInRadius(0, 0, 1000000)) do
        if obj.typeName == "Asteroid" then
            table.insert(asteroidList, obj)
        end
    end
    for _, obj in ipairs(asteroidList) do
        obj:setSize(random(50, 500)):setRadarSignatureInfo(0.8, 0.0, 0.0)
        obj:setDescriptions(tostring(asteroidBase),
            tostring(math.random(1, 30).."% "..asteroidElements[math.random(#asteroidElements)]))
    end
    -- spefic unique element for the mining rig/specific object. Edit or delete where appropriate --
    for _, obj in ipairs(miningRig:getObjectsInRange(18000)) do
        obj:setDescriptions(tostring(asteroidBase), tostring(math.random(1, 70) .. "% Uranium"))
    end
    -------
    sizeSet = true
end

-- sending Pirate waves on a button click 

function firstWave()
    firstBad1:orderAttack(player)
    firstBad2:orderAttack(player)
    removeGMFunction("First Wave")
end

function secondWave()
    secondBad1:orderAttack(player)
    secondBad2:orderAttack(player)
    secondBad3:orderAttack(player)
    freightBad1:orderAttack(Fuel)
    freightBad2:orderAttack(Fuel)
    freightBad3:orderAttack(Goods)
    rigBad1:orderAttack(miningRig)
    rigBad2:orderAttack(miningRig)
    rigBad3:orderAttack(stationD)
    rigBad4:orderAttack(stationD)
    removeGMFunction("Second Wave")
end

function bossFight()
    bigBad1:orderAttack(player):setPersonalityId(2)
    if string.find(getScenarioVariation(), "Takanami") then
        bigBad2:orderAttack(player):setPersonalityId(2)
    end
    removeGMFunction("Boss Fight")
end


-- freighters will start moving when player is docked to its first destination 
-- commenting out to elliminate errors
-- function moveFreighters()
--     if player:isDocked(stationB) then
--         Fuel:orderFlyTowards(110671, 131389)
--         Goods:orderFlyTowards(110671, 131389)
--     end
--     for _, obj in ipairs(miningRig:getObjectsInRange(500)) do
-- if obj == Fuel then
--             Fuel:orderDock(miningRig)
--         elseif obj == Goods then
--             Goods:orderDock(miningRig)
--         elseif Fuel:isDocked(miningRig) == true and Goods:isDocked(miningRig) == true then
--             break
--         end
--     end
-- end

-- making probes tell players if they have been destroyed 
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

-- setting Variations
function setVariations()
    if string.find(getScenarioVariation(), "Havock") then
        player:setTemplate("UCS Skirmish Class Frigate"):setCallSign("UCS Havock"):setFaction("UCN")
        shuttle:setTemplate("UCS Havock Shuttle"):setCallSign("UCS Havock Shuttle")
    elseif string.find(getScenarioVariation(), "Takanami") then
        player:setTemplate("UCS Hoplite Class Destroyer"):setCallSign("UCS Takanami"):setFaction("UCN")
        shuttle:setTemplate("UCS Takanami Shuttle"):setCallSign("UCS Takanami Shuttle")
    end
end

-- AUTOMATION FOR HACKING VARIATION

function jackerTrap()
WarpJammer():setFaction("Independent"):setPosition(44222, 75333):setCallSign("Warp Jammer")
WarpJammer():setFaction("Independent"):setPosition(54000, 67667):setCallSign("Warp Jammer")
firstWaveJ1:orderAttack(player)
firstWaveJ2:orderAttack(player)
removeGMFunction("Jacker Trap")
end

function jackerRaid()
    whWaveJ1:orderFlyTowards(61781, 132348)
    whWaveJ2:orderFlyTowards(61781, 132348)
    whWaveJ3:orderFlyTowards(61781, 132348)
    whWaveJFreight:orderDock(stationC)
    rigWaveJ1:orderFlyTowards(110671, 131389)
    rigWaveJ2:orderFlyTowards(110671, 131389)
    rigWaveJFreight:orderDock(stationD)
    removeGMFunction("Jacker Raid")
end

function jackerBoss()
    bigBagJ1:orderAttack(player)
    if string.find(getScenarioVariation(), "Takanami") then
        bigBadJ2:orderAttack(player)
    end
    removeGMFunction("Jacker Boss Fight")
end

function hackPlayer1()
    player:setSystemHackedLevel("frontshield", 0.8)
    player:setSystemHackedLevel("impulse", 0.3)
    player:setSystemHeat("beamweapons", player:getSystemHeat("beamweapons") + 0,5)
    player:setSystemHeat("maneuver", player:getSystemHeat("maneuver") + 0.7)
    addGMMessage("Player Hacked")
end

function hackPlayer2()
    player:setSystemHackedLevel("reactor", 0.6)
    player:setSystemHackedLevel("rearshield", 0.4)
    player:setSystemHeat("missilesystem", player:getSystemHeat("missilesystem") + 0.5)
    player:setSystemHeat("warp", player:getSystemHeat("warp") + 0.3)
    addGMMessage("Player Hacked")
    end

--- INIT 
function init()
    player:setActivePresetNumber(0)
    shuttle:setActivePresetNumber(0)
    setVariations()

    Fuel:orderDock(stationC)
    Goods:orderDock(stationC)
    
    -- load-out orders 
    shuttle:commandDock(player)
    player:commandDock(Warspite)
    Iron1:orderDock(stationA)
    Iron2:orderDock(stationA)

    -- spawning Pirate or Jacker mission
    addGMFunction("Spawn Pirates", spawnPirates)
    addGMFunction("Spawn Jackers", spawnJackers)
    
    -- initiate shuttles
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

    -- restock missiles 
    addGMFunction("Restock The Player",
        function()
            pCallsign = player:getCallSign()
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

end

-- UPDATE

function update(delta)
    -- moveFreighters()
    advancedProbes()
    asteroidInfo()
end

-- Jackers variation beat-sheet

-- for not first-timers OR large groups 
-- Frist orders:
-- sent to deliver an officer to Kal-alpha, where they are meant to start the shift flying Iron One, then remain patrolling the area. 
-- en route you will trigger a sensor buoy and it spawns warpjammers
-- there, you are you are jumped by a couple of hostiles
-- AT THE SAME TIME Jackers launch two attacks: one on the mining rig and one on Kal-gamma. 
-- Their plan for their two attack groups is to come in, dock their freighters, take stuff and leave
-- The flight commander on board tells you a bit about who this group is, and tells you they can provide support on their gunship but they need to get to their station first
-- they suggest someone comes with them on a shuttle, drops them off, and then comes support them via the same shuttle (if they want to) or reunites with the main crew
-- the crew MAY be able to defend both things, but once the freighters are loaded they and their convous will start running away
-- (catching them or not if your judgement)
-- if boos fight is still needed: after the raid is over, two destoryers will come in to take you and your squadron buddies down. 