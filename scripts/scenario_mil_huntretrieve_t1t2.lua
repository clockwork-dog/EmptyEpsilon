-- Military Hunt The Thing and Stop The Thief
-- Description: Both missions take place at Sca Fell Mining Rig. Hunt The Thing can run for tier 1/2, Stop The Thief is a Tier 2 only mission. 
-- Type: Basic
-- Variation[Takanami]: This scenario will run on Takanami 
-- Variation[Havock]: This scenario will run on Havock

require("utils.lua")

    Zone():setPoints(0,0, 0, 280000, 160000,280000, 160000, 0):setColor(97, 113, 149):setLabel("Sca Fell Operation")
-- playerships
--TODO THURSDAY CHAT -- settle on spawn order/protocol 
	player = PlayerSpaceship():setPosition(5801, 6039):setWarpDrive(true):setWarpSpeed(1000.00):setWeaponStorage("Nuke", 2)
    shuttle = PlayerSpaceship():setPosition(6101, 6400):setWarpDrive(true):setWarpSpeed(1000.00):setFaction("UCN")

    --- BASE MAP
-- UCN ships
    Warspite = CpuShip():setFaction("UCN"):setTemplate("UCS King George Battleship"):setCallSign("ucs warspite"):setPosition(5254, 5331):setWeaponStorage("EMP", 22):setScanned(true):setRepairDocked(true):setDescriptions("King George Class Battleship", "Current orders: Establish Base in Adamas Belt.")
    Warspite:addInfos(1,"Fabrication date", "2091")
    Warspite:addInfos(2,"Current Commander", "Captain TBD")
    Warspite:addInfos(3,"Number of Personnel", "182")
    Warspite:addInfos(4, "Life signs", "Strong")
    miningStation = SpaceStation():setTemplate("Asteroid Mining Station"):setFaction("UCN"):setCallSign("Sca Fell Mining Station"):setPosition(70999, 257077):setDescriptions("Sca Fell Mining Station", "Current Population 472"):addInfos(1, "Life signs", "Strong")
    miningRig = SpaceStation():setTemplate("Asteroid Mining Rig"):setFaction("UCN"):setCallSign("Sca Fell Nickel mine"):setPosition(71747, 255204):setDescriptions("Sca Fell Mining Rig", "Nickel Mining Rig\nContact duty manager A. stephenson for further details"):addInfos(1, "Life signs", "Strong")
    silver1 = CpuShip():setFaction("UCN"):setTemplate("UCS Gunship"):setCallSign("Silver One"):setPosition(68088, 255720):orderFlyTowards(68995, 255129):setWarpDrive(true):setWarpSpeed(1000.00):setWeaponStorage("HVLI", 3):addInfos(0, "Fabrication date", "2179"):addInfos(1, "Life signs", "Low"):addInfos(2, "Squadron", "1st Defence"):addInfos(3, "Flight", "Silver"):setDescriptions("Improved Gunship", "Current orders: Sca Fell Defence")
    silver2 = CpuShip():setFaction("UCN"):setTemplate("UCS Gunship"):setCallSign("Silver Two"):setPosition(69653, 254414):orderFlyTowards(70561, 253824):setWarpDrive(true):setWarpSpeed(1000.00):setWeaponStorage("HVLI", 3):addInfos(0, "Fabrication date", "2179"):addInfos(1, "Life signs", "Low"):addInfos(2, "Squadron", "1st Defence"):addInfos(3, "Flight", "Silver"):setDescriptions("Improved Gunship", "Current orders: Sca Fell Defence")
   
    -- SCENARIO ONE: HUNT THE THING
    -- declaring local names for freighters
    Hummingbird = nil
    Canary = nil
    Magpie = nil
    Peacock = nil
    Sparrow = nil
    Swallow = nil

function spawnHuntThing()
    addGMFunction("Hack Player - 1", hackPlayer1)
    addGMFunction("Hack Player - 2", hackPlayer2)
    removeGMFunction("Hunt The Thing")
    removeGMFunction("Stop The Thief")
    --- UCN SHIPS
    Sparrow = CpuShip():setFaction("UCN"):setTemplate("Fuel Freighter 4"):setCallSign("Sparrow"):setPosition(24921, 100739):orderFlyTowards(0,0):setDescriptions("Sca Fell Fuel Freighter 2", "Supplies Fuel For the Sca Fell Operation. \nUnder command of captain Richardson"):addInfos(0, "Fabrication Date", "2167"):addInfos(1, "Life signs", "Moderate")
    Magpie = CpuShip():setFaction("UCN"):setTemplate("Goods Freighter 2"):setCallSign("magpie"):setPosition(71109, 254828)
    :setDescriptions("Sca Fell Distribution Freighter 1", "In charge of ferrying goods within Sca Fell Operation. Under command of captain Well"):addInfos(0, "Fabrication Date", "2166"):addInfos(1, "Life signs", "Moderate")
    Canary = CpuShip():setFaction("UCN"):setTemplate("Goods Freighter 3"):setCallSign("canary"):setPosition(72607, 255175)
    :setDescriptions("Sca Fell Distribution Freighter 2", "Under command of captain Zarins"):addInfos(0, "Fabrication Date", "2168"):addInfos(1, "Life signs", "Moderate")
    Swallow = CpuShip():setFaction("UCN"):setTemplate("Equipment Freighter 2"):setCallSign("swallow"):setPosition(70055,
    257025):setDescriptions("Sca Fell Equipment Freighter 1", "Under command of captain Pesci \nContact Sca Fell Mine for Futher Details"):addInfos(0, "Fabrication Date", "2167"):addInfos(1, "Life signs",
    "Moderate")
    -- neutral ships
    CpuShip():setFaction("Independent"):setTemplate("Thunder Frigate"):setCallSign("Aquarius"):setPosition(47180, 144314)
        :setWeaponStorage("Nuke", 0):setWeaponStorage("EMP", 0):setDescriptions("", "Terra Nova defence vessel"):addInfos(
        1, "Life signs", "Moderate")
    CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("gale"):setPosition(42592, 150270)
        :setWeaponStorage("HVLI", 1):setDescriptions("", "Terra Nova trading vessel"):setWarpDrive(true):setWarpSpeed(1000.00)
        :addInfos(1, "Life signs", "Low")
    CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("wind"):setPosition(48254, 150187)
        :setWeaponStorage("HVLI", 1):setDescriptions("", "Terra Nova trading vessel"):setWarpDrive(true):setWarpSpeed(1000.00)
        :addInfos(1, "Life signs", "Low")
    CpuShip():setFaction("Independent"):setTemplate("Kursk Destroyer"):setCallSign("sky"):setPosition(-50780, 190350)
        :setDescriptions("", "Terra Nova trading vessel"):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1,
        "Life signs", "Moderate")
    CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("waves"):setPosition(-49921, 189904)
        :setWeaponStorage("HVLI", 1):setDescriptions("", "Terra Nova trading vessel"):setWarpDrive(true):setWarpSpeed(1000.00)
        :addInfos(1, "Life signs", "Low")
    CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("viking"):setPosition(-49967, 191003)
        :setWeaponStorage("HVLI", 1):setDescriptions("", "Terra Nova trading vessel"):setWarpDrive(true):setWarpSpeed(1000.00)
        :addInfos(1, "Life signs", "Low")
    CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("salem"):setPosition(-50084, 188834)
        :setDescriptions("", "Terra Nova support vessel"):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1,
        "Life signs", "Low")
    CpuShip():setFaction("Independent"):setTemplate("Personnel Freighter 1"):setCallSign("starchild"):setPosition(-61254,
        187199):orderRoaming():setDescriptions("", "Terra Nova Crew Relief Vessel"):addInfos(1, "Life signs", "Strong")
    -- bad guys
    CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("xx39"):setPosition(156380, 64248)
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1, "Life signs", "Low")
    CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("xx19"):setPosition(156560, 62143)
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1, "Life signs", "Low")
    CpuShip():setFaction("corsair"):setTemplate("Arquebuse Destroyer"):setCallSign("xx02"):setPosition(186987, 6496)
        :setWeaponStorage("EMP", 14):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1, "Life signs", "Moderate")
    CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("xx20"):setPosition(160196, 15036)
        :setWeaponStorage("HVLI", 3):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1, "Life signs", "Nil")
    CpuShip():setFaction("corsair"):setTemplate("EFS Cassard Frigate"):setCallSign("xx41"):setPosition(166264, 8502)
        :setWeaponStorage("Homing", 10):setWeaponStorage("EMP", 0):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1,
        "Life signs", "Low")
    CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("xx05"):setPosition(159976, 13654)
        :setWeaponStorage("HVLI", 2):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1, "Life signs", "Nil")
    CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("xx12"):setPosition(161624, 16115)
        :setWeaponStorage("HVLI", 2):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1, "Life signs", "Nil")
    CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("xx06"):setPosition(126366, 115131)
        :setWeaponStorage("HVLI", 2):setWarpDrive(true):setWarpSpeed(1000.00):addInfos(1, "Life signs", "Nil")
    bigBad = CpuShip():setFaction("corsair"):setTemplate("JCS Destiny"):setCallSign("xx_darkness"):setPosition(172141,
            10742):setWarpDrive(true):setWarpSpeed(1000.00):setWeaponStorageMax("EMP", 50):setWeaponStorage("EMP", 30)
        :addInfos(1, "Life signs", "Nil")
    bigBad:setAI("fighter"):setBeamWeaponDamageType(0, 3):setBeamWeaponDamageType(1, 3):setBeamWeaponDamageType(2, 3)
        :setBeamWeaponDamageType(3, 3):setBeamWeaponDamageType(4, 3):setBeamWeaponDamageType(5, 3):setRotationMaxSpeed(30)
    --stolen ships
    Hummingbird = CpuShip():setFaction("Independent"):setTemplate("Fuel Freighter 2"):setCallSign("Hummingbird")
        :setPosition(156414, 71329):orderIdle():setDescriptions("Sca Fell Fuel Freighter 1",
            "Under command of captain Matsuoka. /n Last recorded message: Comms down, life support systems failing")
        :setRadarSignatureInfo(0, 8, 0.0, 0.0):addInfos(0, "Fabrication Date", "2165"):addInfos(1, "Life signs", "Nil")
    Hummingbird:setSystemRepair("impulse", 0.0):setSystemHealthMax("impulse", -0.8):setSystemHealth("impulse", -1.0)
        :setSystemRepair("frontshield", 0.0):setSystemHealthMax("frontshield", -0.9):setSystemHealth("frontshield", -1.0)
        :setSystemHealth("rearshield", -1.0):setSystemRepair("rearshield", 0.0)
    Hummingbird:setReactor(false):setEnergy(0):setSystemHealthMax("rearshield", -1.0):setSystemHealth("rearshield", -1.0)
        :setSystemHealthMax("maneuver", -0, 7):setSystemHealth("maneuver", -0.7):addInfos(1, "Life signs", "Nil")
    Peacock = CpuShip():setFaction("Independent"):setTemplate("Equipment Freighter 3"):setCallSign("Peacock")
        :setPosition(184701, 10408):orderIdle():setDescriptions("Sca Fell Equipment Freighter 1",
            "Under command of captain Bennett."):addInfos(0, "Fabrication Date", "2168"):addInfos(1, "Life signs", "Low")
    Peacock:setReactor(false):setEnergy(0):addInfos(1, "Life signs", "Low")
    Forest = CpuShip():setFaction("corsair"):setTemplate("Tsunami Frigate"):setCallSign("Forest"):setPosition(165728,
        9122):setDescriptions("", "Ground Keepers trading vessel"):addInfos(1, "Life signs", "Low")
        --- orders, buttons, etc 
        Swallow:orderDock(miningStation)
        Magpie:orderDock(miningRig)
        Canary:orderDock(miningRig)
        player:commandDock(Warspite)
        shuttle:commandDock(player)
        sparrow:orderFlyTowards(0,0)
end
function spawnStopTheThief()
    -- changing the field
    removeGMFunction("Hunt The Thing")
    removeGMFunction("Stop The Thief")
    addGMFunction("Spawn Stolen Cargo", spawnCargo)
    addGMFunction("Small Fight", smallFight)
    addGMFunction("Send Magpie", sendMagpie)
    Warspite:setPosition(62699, 122553)
    player:setPosition(62899, 122753):commandDock(Warspite)
    shuttle:commandDock(player)
    silver1:destroy()
    silver2:destroy()
    Hummingbird = CpuShip():setTemplate("Fuel Freighter 2"):setCallSign("Hummingbird"):setFaction("UCN"):setPosition(
        59858, 121996):orderIdle():setDescriptions("", "Sca Fell freighter\nUnder command of captain Dennison"):addInfos(
    1, "Life signs", "Moderate")
    Sparrow = CpuShip():setFaction("UCN"):setTemplate("Fuel Freighter 4"):setCallSign("Sparrow"):setPosition(69965,
        254605):orderDock(miningStation):setDescriptions("", "Sca Fell freighter\nUnder command of captain Richardson")
    :addInfos(1, "Life signs", "Moderate")
    Magpie = CpuShip():setFaction("UCN"):setTemplate("Goods Freighter 2"):setCallSign("magpie"):setPosition(71592, 259429)
    :orderDock(miningStation):setDescriptions("", "Sca Fell freighter\nUnder command of captain Well"):addInfos(1,
        "Life signs", "Low")
    Canary = CpuShip():setFaction("UCN"):setTemplate("Goods Freighter 3"):setCallSign("canary"):setPosition(72607, 255175)
    :orderDock(miningRig):setDescriptions("", "Sca Fell freighter\nUnder command of captain Zarins"):addInfos(1,
        "Life signs", "Moderate")
    Peacock = CpuShip():setFaction("UCN"):setTemplate("Equipment Freighter 3"):setCallSign("Peacock"):setPosition(69493,
        256040):orderDock(miningStation):setDescriptions("", "Sca Fell freighter\nUnder command of captain Bennett.")
    :addInfos(1, "Life signs", "Moderate")

    -- Mercs
    merc1 = CpuShip():setFaction("Independent"):setTemplate("Bomber"):setCallSign("GS Thirteen"):setPosition(125470, 304605):setWeaponStorage("Homing", 10):setWeaponStorage("HVLI", 5)
    :setDescriptions("", "Gliese Syndicate workforce. Engage at your own risk"):addInfos(1, "Life signs", "Low")
    merc2 = CpuShip():setFaction("Independent"):setTemplate("SPS Orlov Frigate"):setCallSign("GS Nine"):setPosition(128483, 305956)
    :setDescriptions("", "Gliese Syndicate workforce. Engage at your own risk"):addInfos(1, "Life signs", "Medium")
    merc3 = CpuShip():setFaction("Independent"):setTemplate("Bomber"):setCallSign("GS Three"):setPosition(127377, 303183):setWeaponStorage("Homing", 10):setWeaponStorage("HVLI", 5)
    :setDescriptions("", "Gliese Syndicate workforce. Engage at your own risk"):addInfos(1, "Life signs", "Low")

    -- Fake Mercs
    fake1 = CpuShip():setFaction("Independent"):setTemplate("Bomber"):setCallSign("GS Prey"):setPosition(69577, 296768):setWeaponStorage("Homing", 5):setWeaponStorage("HVLI", 5)
    :setDescriptions("Some call us Mercenary", "We prefer freelance"):addInfos(1, "Life signs", "Low"):addInfos(2, "Reset", "Flying with Neutralizer"):addInfos(3, "Reset", "Ugly Prey")
    fake2 = CpuShip():setFaction("Independent"):setTemplate("Bomber"):setCallSign("GS Fort"):setPosition(67557, 295656):setWeaponStorage("Homing", 5):setWeaponStorage("HVLI", 5)
    :setDescriptions("Some call us Mercenary", "We prefer freelance"):addInfos(1, "Life signs", "Low"):addInfos(2, "Reset", "Flying with Neutralizer"):addInfos(3, "Reset", "Metal Fort")
    fake3 = CpuShip():setFaction("Independent"):setTemplate("EFS Cassard Frigate"):setCallSign("GS Cannon"):setPosition(67753, 297925):setWeaponStorage("EMP", 5)
    :setDescriptions("Some call us Mercenary", "We prefer freelance"):addInfos(1, "Life signs", "Moderate"):addInfos(2, "Reset", "Flying with Neutralizer"):addInfos(3, "Reset", "Crossbones Cannon")
    -- Pirates
    smallFight1 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Iconic"):setPosition(-5717, 272038):setWeaponStorage("HVLI", 7)
    :setDescriptions("", "Flying with Neutralizer"):addInfos(1, "Life signs", "Low")
    smallFight2 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Hothead"):setPosition(-4498, 271861):setWeaponStorage("HVLI", 7)
    :setDescriptions("", "Flying with Neutralizer"):addInfos(1, "Life signs", "Low")
    smallFight3 = CpuShip():setFaction("corsair"):setTemplate("JCS Ballmer Frigate"):setCallSign("Junk Driver"):setPosition(-7308, 273244):setWeaponStorage("EMP", 0)
    :setDescriptions("", "Flying with Neutralizer"):addInfos(1, "Life signs", "Moderate")
    bigFight1 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Blue Bones"):setPosition(-19134, 255612):setWeaponStorage("HVLI", 3)
    :setDescriptions("", "Flying with Neutralizer"):addInfos(1, "Life signs", "Low")
    bigFight2 = CpuShip():setFaction("corsair"):setTemplate("Thunder Frigate"):setCallSign("Killer Whale"):setPosition(-21311, 257646):setWeaponStorage("EMP", 0)
    :setDescriptions("", "Flying with Neutralizer"):addInfos(1, "Life signs", "Medium")
    bigFight3 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Grey Bones"):setPosition(-19130, 257385):setWeaponStorage("HVLI", 3)
    :setDescriptions("", "Flying with Neutralizer"):addInfos(1, "Life signs", "Low")
    bigFight4 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setCallSign("Metal Tooth"):setPosition(-17305, 258171):setWeaponStorage("HVLI", 7)
    :setDescriptions("", "Flying with Neutralizer"):addInfos(1, "Life signs", "Low")
    bigFight5 = CpuShip():setFaction("corsair"):setTemplate("SPS Kursk Destroyer"):setCallSign("Neutralizer"):setPosition(-23374, 257744):setWeaponStorage("EMP", 3)
    :setDescriptions("", "Flying with Neutralizer"):addInfos(1, "Life signs", "Medium")
end


-- function below undocks Magpie and sends her on her journey. It also makes cargo spawn on damage for all freighters 
function sendMagpie()
    freighterList = {Hummingbird, Sparrow, Magpie, Canary, Peacock}
    removeGMFunction("Send Magpie")
    for _, obj in ipairs(freighterList) do
        obj:onDestruction(function()
            dx, dy = obj:getPosition()
            Artifact():setPosition(dx, dy):setModel("cargo"):setSpin(1.5):allowPickup(true):onPickUp(function()
                player:addToShipLog("New Item in the cargo hatch", "Blue", "Helms")
            end)
        end)
    end
    Magpie:orderFlyTowards(79597, 299405):addInfos(2, "Warning", "Unexpected Cargo Detected"):addInfos(3, "Warning", "Classified Files Detected"):addInfos(4, "Warning", "Unrecognised Personnel on Board"):addInfos(5, "Warning", "No authorisation given")
end

-- first attack
function smallFight()
    smallFight1:orderAttack(Sparrow)
    smallFight2:orderAttack(Sparrow)
    smallFight3:orderAttack(Sparrow)
    removeGMFunction("Small Fight")
    addGMFunction("Send True Mercs", sendMercs)
    addGMFunction("Big Fight", bigFight)
    addGMFunction("End Mission", returnSilver)
end

function sendMercs()
    x, y = Magpie:getPosition()
    merc1:orderFlyTowards(x, y)
    merc2:orderFlyTowards(x, y)
    merc3:orderFlyTowards(x, y)
    removeGMFunction("Send True Mercs")
end


-- big attack 
function bigFight()
    bigFight1:orderAttack(Sparrow)
    bigFight2:orderAttack(Canary)
    bigFight3:orderAttack(Canary)
    bigFight4:orderAttack(Peacock)
    bigFight5:orderAttack(Peacock)
    removeGMFunction("Big Fight")
end

-- Silver Flight returns home -- end mission 
function returnSilver()
    silver1 = CpuShip():setFaction("UCN"):setTemplate("Gunship"):setCallSign("Silver One"):setPosition(-57222, 191667):orderFlyTowards(68111, 255222):setWarpDrive(true):setWarpSpeed(1000.00):setWeaponStorage("HVLI", 3):addInfos(0, "Fabrication date", "2179"):addInfos(1, "Life signs", "Low"):addInfos(2, "Squadron", "1st Defence"):addInfos(3, "Flight", "Silver"):setDescriptions("Improved Gunship", "Current orders: Sca Fell Defence")
    silver2 = CpuShip():setFaction("UCN"):setTemplate("Gunship"):setCallSign("Silver Two"):setPosition(-57778, 193222):orderFlyTowards(68000, 255667):setWarpDrive(true):setWarpSpeed(1000.00):setWeaponStorage("HVLI", 3):addInfos(0, "Fabrication date", "2179"):addInfos(1, "Life signs", "Low"):addInfos(2, "Squadron", "1st Defence"):addInfos(3, "Flight", "Silver"):setDescriptions("Improved Gunship", "Current orders: Sca Fell Defence")

   
end

-- Spawn Stolen Cargo into the world
MagpieCargoDropped = false
function spawnCargo()
    if (MagpieCargoDropped == true) then
        x, y = player:getPosition()
        addGMMessage("Player Sent Cargo")
    else
        x, y = Magpie:getPosition()
        addGMMessage("Magpie Sent Cargo")
        MagpieCargoDropped = true
    end
    Artifact():setPosition(x + 400, y - 400):setModel("cargo"):setSpin(1.5):allowPickup(true):onPickUp(function()
        player:addToShipLog("New Item in the cargo hatch", "Blue", "Helms")
    end)
end

-- terrain
    Asteroid():setPosition(74755, 253801):setSize(354)
    Asteroid():setPosition(72755, 253134)
    Asteroid():setPosition(73477, 255893)
    Asteroid():setPosition(71820, 257736):setSize(450)
    Asteroid():setPosition(64961, 260526)
    Asteroid():setPosition(66567, 263638)
    Asteroid():setPosition(69243, 257917)
    Asteroid():setPosition(77205, 249118):setSize(256)
    Asteroid():setPosition(72288, 242427):setSize(170)
    Asteroid():setPosition(71920, 248483):setSize(260)
    Asteroid():setPosition(67872, 250958)
    Asteroid():setPosition(59876, 254973)
    Asteroid():setPosition(71083, 259523):setSize(80)
    Asteroid():setPosition(70080, 265444)
    Asteroid():setPosition(66032, 268121)
    Asteroid():setPosition(83796, 258385):setSize(176)
    Asteroid():setPosition(77473, 260426):setSize(139)
    Asteroid():setPosition(81922, 245806):setSize(240)
    Asteroid():setPosition(79480, 238780):setSize(323)
    Asteroid():setPosition(55672, 263004):setSize(156)
    Asteroid():setPosition(48820, 273375)
    Asteroid():setPosition(48913, 282172):setSize(319)
    Asteroid():setPosition(62339, 268931)
    Asteroid():setPosition(47431, 260412):setSize(150)
    Asteroid():setPosition(26968, 273838)
    Asteroid():setPosition(26135, 284394)
    Asteroid():setPosition(35209, 286709)
    Asteroid():setPosition(40672, 264486):setSize(320)
    Asteroid():setPosition(89005, 230040)
    Asteroid():setPosition(91320, 240874)
    Asteroid():setPosition(102616, 229392)
    Asteroid():setPosition(84283, 221616):setSize(410)
    Asteroid():setPosition(80764, 229300)
    Asteroid():setPosition(69283, 289950)
    Asteroid():setPosition(32339, 255597)
    Asteroid():setPosition(81320, 213281):setSize(294)
    Asteroid():setPosition(64468, 212540)
    Asteroid():setPosition(77431, 225133)
    Asteroid():setPosition(75301, 238003):setSize(145)
    Asteroid():setPosition(42061, 219670)
    Asteroid():setPosition(21690, 232818)
    Asteroid():setPosition(33635, 246800):setSize(284)
    Asteroid():setPosition(63542, 241337):setSize(74)
    Asteroid():setPosition(111783, 246338)
    Asteroid():setPosition(87246, 264671)
    Asteroid():setPosition(98357, 282542)
    Asteroid():setPosition(94005, 256430):setSize(403)
    Asteroid():setPosition(80579, 257356)
    Asteroid():setPosition(83264, 275690):setSize(304)
    Asteroid():setPosition(102801, 253838)
    Asteroid():setPosition(127524, 263838)
    Asteroid():setPosition(116505, 282079)
    Asteroid():setPosition(125950, 236892)
    VisualAsteroid():setPosition(71751, 255595)
    VisualAsteroid():setPosition(71195, 255845)
    VisualAsteroid():setPosition(71760, 254762)
    VisualAsteroid():setPosition(72232, 254382)
    Nebula():setPosition(45149, 144959)
    Nebula():setPosition(43760, 135700)
    Nebula():setPosition(157095, 73200)
    Nebula():setPosition(126446, 108293)
    Nebula():setPosition(162280, 63663)
    Nebula():setPosition(183854, 13293)
    Nebula():setPosition(154132, 62181)
    Nebula():setPosition(158855, 16164)
    Nebula():setPosition(162558, 8015)
    Nebula():setPosition(164040, 22738)
    Nebula():setPosition(-65036, 191349)
    Nebula():setPosition(-62444, 179775)
    Nebula():setPosition(-59666, 184960)
    Nebula():setPosition(152928, 68755)
    Nebula():setPosition(187188, 7830)
    Nebula():setPosition(-48740, 194219)
    Nebula():setPosition(203575, -58837)
    Nebula():setPosition(201538, -65967)
    Nebula():setPosition(-49953, 189647)
    Nebula():setPosition(47371, 151996)
    Nebula():setPosition(43853, 162089)
    Nebula():setPosition(39594, 152182)
    Nebula():setPosition(116816, 126997)
    Nebula():setPosition(130612, 117275)
    Nebula():setPosition(149780, 78292)
    Nebula():setPosition(120798, 117923)
    Nebula():setPosition(175243, 16071)
    Nebula():setPosition(173114, 7089)
    Nebula():setPosition(138887, 401512)
    Nebula():setPosition(144350, 408364)
    Nebula():setPosition(156850, 409846)
    Nebula():setPosition(168609, 403549)
    Nebula():setPosition(157406, 402809)
    Nebula():setPosition(149906, 412160)
    Nebula():setPosition(189535, -79136)
    Asteroid():setPosition(-44817, 181698):setSize(349)
    Asteroid():setPosition(-34910, 174754)
    Asteroid():setPosition(-21669, 193365):setSize(204)
    Asteroid():setPosition(-33058, 198365)
    Asteroid():setPosition(-49539, 254753)
    Asteroid():setPosition(60924, 115216)
    Asteroid():setPosition(60646, 134753):setSize(302)
    Asteroid():setPosition(78146, 120401)
    Asteroid():setPosition(115461, 102346):setSize(420)
    Asteroid():setPosition(148425, 90494)
    Asteroid():setPosition(137961, 108457):setSize(100)
    Asteroid():setPosition(153517, 90494)
    Asteroid():setPosition(140647, 66883):setSize(59)
    Asteroid():setPosition(163517, 65586)
    Asteroid():setPosition(121758, 412994):setSize(230)

    -- Automation 

    -- probes 
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

    -- asteroids 
asteroidList = {}
sizeSet = false
asteroidElements = { "Cadmium", "Nickel", "Aluminum", "Lithium", "Iron", "Hydrogen", "Silicon", "Carbon", "Oxygen" }
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
            tostring(math.random(1, 30) .. "% " .. asteroidElements[math.random(#asteroidElements)]))
    end
    -- spefic unique element for the mining rig/specific object. Edit or delete where appropriate --
    for _, obj in ipairs(miningRig:getObjectsInRange(18000)) do
        obj:setDescriptions(tostring(asteroidBase), tostring(math.random(1, 70) .. "% Nickel"))
    end
    -------
    sizeSet = true
end

-- variations
function setVariations()
    if string.find(getScenarioVariation(), "Havock") then
        player:setTemplate("UCS Skirmish Class Frigate"):setCallSign("UCS Havock"):setFaction("UCN")
        shuttle:setTemplate("UCS Havock Shuttle"):setCallSign("UCS Havock Shuttle")
    elseif string.find(getScenarioVariation(), "Takanami") then
        player:setTemplate("UCS Hoplite Class Destroyer"):setCallSign("UCS Takanami"):setFaction("UCN")
        shuttle:setTemplate("UCS Takanami Shuttle"):setCallSign("UCS Takanami Shuttle")
    end
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

    ---- END OF BODY 

    --- INIT
function init()
    player:setActivePresetNumber(0)
    shuttle:setActivePresetNumber(0)
    setVariations()
    addGMFunction("Hunt The Thing", spawnHuntThing)
    addGMFunction("Stop The Thief", spawnStopTheThief)

-- initiate shuttle TODO to go
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
-- enable nukes 
    addGMFunction("Enable Nukes",
        function()
            player:weaponTubeAllowMissle(0, "Nuke"):weaponTubeAllowMissle(1, "Nuke")
            player:weaponTubeAllowMissle(2, "Nuke"):weaponTubeAllowMissle(3, "Nuke")
            player:addToShipLog("Nuclear Warhead Enabled", "Magenta", "Weapons")
            addGMMessage("Nukes Enabled")
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
    advancedProbes()
    asteroidInfo()
end

    -- BEAT SHEET FOR "STOP THE THIEF"
            -- Orders:
    -- The station is now under attack! And it has no protection, Silver squadron is escorting Swallow to Kalgoorlie mine. 
    -- Go in, defend the mine! 

            -- Part 1. First combat.
    -- as soon as you arrive, Magpie undocks and leaves. 
    -- the station pings you to let you know what they have not authorised them to leave. They left with someone system have not recognised and are carrying classified files detailing mine construction. 
    -- Capatin Wells refuses to open comms with the mine. Pursue, find out what is going on, return the documents!
            
            -- Part 2. Trap
    -- Magpie is having a randez-vous with pirates disguised as Syndicate Mercs, here to protect them as they go to the ICM base.
    -- Stand-off. Mercs are being VERY AGGRESSIVE WITH YOU. 
   -- Captain Well, the thief, will get in touch with you on video comms. They ask you to please leave them alone.
    -- They want to leave! They want to work for this independent mine, and they can help them with the new tech.
    -- This tech is schematic for mining drone dockers
    -- Wells is of lightly conspiratorial disposition of now not believing in UCTCN after people were discovered here + "UCTCN does now do enough", a bit of Robin Hood character + altruistic desire to help the independent factions
    -- They want to change ships
    -- THE MERCS ARE NOT THE MERCS

             -- Part 3. Negotiaiton.
    -- Real Mercs arrive at the best moment for the pacing. 
    -- Help destroy pirates (make a decision who you belive if true here)
    -- At the end, the station will ping you arain saying that the even bigger attack is incoming. They are worried about it because they will be left completely unprotected

            -- Part 3. Resolution
    -- If/when Wells they learn about the attack, they are horrified. When they told Mercs that the mine will have no protection, they didn't think it will go out. 
    -- You CAN talk them into giving up, in which case they will come onboard and will willingly brig themselves up. You can engage with them to learn The Lore. 
    -- It will also be up to you as to what you tell the UCN about this person prior to their tribunal.
    -- You can convince them into releasing the cargo, which they will be very much into doing if you let them go. 
    -- As for the mercs, you can fight them, which is fair, BUT you can also stall them as you negotiate the situation
    -- If you do this well, and/or if you talked Captain Well into returning, you can also convince Mercs that protecting their mark = fighting with you against pirates. 
    -- You can sweaten the deal by offering them nickel to bring back to their employers. 
            -- Part 4. Big Fight. 
    -- The attack begind at the end of those negotiations. 
    -- Defend the mine! 
    -- The squadron returns to and the scenario 

    ---- I HAVE TO TIME IT 