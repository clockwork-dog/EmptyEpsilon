-- Name: Exploration Anomaly Tier 2
-- Description: First draft of Anomaly Mission based on pitches by Chloe; a cross between Survive Space and Bermuda Triangle)
-- Type: Basic
-- Variation[Takanami]: This scenario will run on Takanami
-- Variation[Havock]: This scenario will run on Havock

require("utils.lua")
-- Player Ships

player = PlayerSpaceship():setPosition(-62522, -72811)

shuttle = PlayerSpaceship():setPosition(-62522, -72434):setWarpDrive(true):setWarpSpeed(1000.00):setFaction("UCN")

-- UCN Ships
Warspite = CpuShip():setFaction("UCN"):setTemplate("UCS King George Battleship"):setCallSign("ucs warspite"):setPosition(
-63089, -73178):setWeaponStorage("EMP", 22):setScanned(true):setRepairDocked(true):setDescriptions(
"King George Class Battleship", "Current orders: Establish Base in Adamas Belt.")
Warspite:addInfos(1, "Fabrication date", "2091")
Warspite:addInfos(2, "Current Commander", "Captain TBD")
Warspite:addInfos(3, "Number of Personnel", "182")
Warspite:addInfos(4, "Life signs", "Strong")

-- IMC ships
T3 = CpuShip():setFaction("Independent"):setTemplate("CNS Talavaar Destroyer"):setCallSign("IMC Talavaar Three"):setHeading(30)
:setPosition(61430, -116425):setWeaponStorage("Homing", 0):setCanBeDestroyed(false)
T3:addInfos(1, "Life signs", "Low"):addInfos(2, "Command", "Captain Fletcher"):addInfos(3, "Assigned to", "Sygun Mine"):setDescriptions("", "Independed Mining Co-operative Ship")
CpuShip():setFaction("Independent"):setTemplate("CNS Tribal Frigate"):setCallSign("IMC Tri Thirteen"):setPosition(76111,
    -96000):setWeaponStorage("Homing", 10):addInfos(1, "Life signs", "Medium"):addInfos(2, "Current Command", "Captain Jain"):addInfos(3, "Assigned to", "Sygun Mine")
    :setDescriptions("", "Independed Mining Co-operative Ship")
CpuShip():setFaction("Independent"):setTemplate("Cassard Frigate"):setCallSign("IMC Cas Five"):setPosition(74222, -95667)
    :setWeaponStorage("EMP", 0):addInfos(1, "Life signs", "Medium"):addInfos(2, "Current Command", "Captain Bradbury"):addInfos(3, "Assigned to", "Sygun Mine")
    :setDescriptions("", "Independed Mining Co-operative Ship")

-- Wrecks
Artifact():setPosition(52802, -115126):setModel("hoplite-wreck"):setCallSign("UCS Effingham"):setSpin(3.0)
:setDescriptions("Hoplite Class Destroyer", "Current Orders: Investigate Area Between BG4 and BF4"):setRadarSignatureInfo(0.0, 0.2, 0.0)
:addInfos(0, "System Status", "Nil"):addInfos(1, "Life signs", "Nil"):addInfos(2, "Hull integrity", "Compromised"):addInfos(3, "Life support", "Off")
Artifact():setPosition(45592, -106594):setModel("shuttle-wreck"):setCallSign("UCS Effingham Shuttle"):setSpin(3.0)
:setDescriptions("UCN Shuttle", "Current Orders: Investigate Area Between BG4 and BF4"):setRadarSignatureInfo(0.0, 0.2, 0.0)
:addInfos(0, "System Status", "Nil"):addInfos(1, "Life signs", "Nil"):addInfos(2, "Hull integrity", "Compromised"):addInfos(3, "Life support", "Off")


-- TERRAIN
-- Planetoids
centreNebula = Nebula():setPosition(65503, -122126)
planetoid1 = Planet():setPosition(60062, -117987):setPlanetRadius(700):setDistanceFromMovementPlane(200.00)
:setPlanetSurfaceTexture("planets/crateres-1.png"):setDescriptions("Cerean Type Planetoid", "Sylicates: 53% \n Iron:12% \nNickel:14% \n Gravium:21%"):setRadarSignatureInfo(0.1, 0.0, 0.0)
:addInfos(0, "Analysis", "Preliminary"):addInfos(1, "Origin", "Unknown"):addInfos(2, "Age", "6.2 billion"):addInfos(3, "Gravity", "Anomalous"):addInfos(4, "Bio signs", "Nil"):addInfos(5, "Orbit", "Failing")
planetoid2 = Planet():setPosition(68581, -127970):setPlanetRadius(700):setDistanceFromMovementPlane(200.00)
:setPlanetSurfaceTexture("planets/ceres_fictional.jpg"):setDescriptions("Cerean Type Planetoid", "Sylicates: 47% \n Iron:18% \nNickel:19% \n Gravium:16%"):setRadarSignatureInfo(0.1, 0.0, 0.0)
:addInfos(0, "Analysis", "Preliminary"):addInfos(1, "Origin", "Unknown"):addInfos(2, "Age", "6.2 billion"):addInfos(3, "Gravity", "Anomalous"):addInfos(4, "Bio signs", "Nil"):addInfos(5, "Orbit", "Failing")

orbit = 100
planetoid2:setOrbit(planetoid1, orbit)
planetoid1:setOrbit(planetoid2, orbit)

-- Asteroids
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
Asteroid():setPosition(28233, -124194)
Asteroid():setPosition(25456, -124679)
Asteroid():setPosition(28411, -126239)
Asteroid():setPosition(30678, -124901)
Asteroid():setPosition(16767, -129350)
Asteroid():setPosition(17478, -126239)
Asteroid():setPosition(23967, -126594)
Asteroid():setPosition(30633, -127394)
Asteroid():setPosition(25744, -127839)
Asteroid():setPosition(23522, -124106)
Asteroid():setPosition(22011, -126239)
Asteroid():setPosition(20856, -127661)
Asteroid():setPosition(21567, -129972)
Asteroid():setPosition(20944, -131394)
Asteroid():setPosition(22100, -128017)
Asteroid():setPosition(23344, -130328)
Asteroid():setPosition(25122, -133439)
Asteroid():setPosition(27078, -131394)
Asteroid():setPosition(26278, -127928)
Asteroid():setPosition(30100, -129528)
Asteroid():setPosition(19522, -128194)
Asteroid():setPosition(18100, -131839)
Asteroid():setPosition(36678, -105457)
Asteroid():setPosition(37123, -108012)
Asteroid():setPosition(38234, -106234)
Asteroid():setPosition(36345, -111012)
Asteroid():setPosition(31513, -109963)
Asteroid():setPosition(28706, -111475)
Asteroid():setPosition(27012, -110901)
Asteroid():setPosition(30073, -106603)
Asteroid():setPosition(27753, -107243)
Asteroid():setPosition(34073, -106283)
Asteroid():setPosition(34900, -104234)
Asteroid():setPosition(31928, -107920)
Asteroid():setPosition(31967, -103128)
Asteroid():setPosition(30722, -102861)
Asteroid():setPosition(29389, -101706)
Asteroid():setPosition(33678, -102457)
Asteroid():setPosition(36900, -101901)
Asteroid():setPosition(25300, -104639)
Asteroid():setPosition(26900, -105457)
Asteroid():setPosition(25211, -102683)
Asteroid():setPosition(27700, -103572)
Asteroid():setPosition(30633, -104461)
Asteroid():setPosition(30567, -104901)
Asteroid():setPosition(26473, -109723)
Asteroid():setPosition(27234, -109457)
Asteroid():setPosition(29211, -104639)
Asteroid():setPosition(29211, -102683)
Asteroid():setPosition(27878, -102239)
Asteroid():setPosition(25012, -107345)
Asteroid():setPosition(23345, -106457)
Asteroid():setPosition(28567, -108901)
Asteroid():setPosition(23433, -110523)
Asteroid():setPosition(30633, -100994)
Asteroid():setPosition(29833, -100461)



Nebula():setPosition(47266, -105844)
Nebula():setPosition(47266, -105844)
Nebula():setPosition(44711, -112955)
Nebula():setPosition(44711, -112955)
Nebula():setPosition(59392, -124348)
Nebula():setPosition(56948, -115126)
Nebula():setPosition(44725, -117015)
Nebula():setPosition(52281, -119904)
Nebula():setPosition(50281, -133459)
Nebula():setPosition(40392, -128682)
Nebula():setPosition(47948, -126126)
Nebula():setPosition(58948, -136682)
Nebula():setPosition(57614, -128904)
Nebula():setPosition(70281, -131570)
Nebula():setPosition(65503, -126793)
Nebula():setPosition(76725, -121015)
Nebula():setPosition(63170, -117904)
Nebula():setPosition(74392, -107682)
Nebula():setPosition(65503, -109793)
Nebula():setPosition(72392, -117126)
Nebula():setPosition(66837, -111459)
Nebula():setPosition(60837, -105348)
Nebula():setPosition(53392, -112237)
Nebula():setPosition(38948, -124237)
Nebula():setPosition(45948, -140126)
Nebula():setPosition(33614, -136126)
Nebula():setPosition(91170, -104904)
Nebula():setPosition(77392, -103348)
Nebula():setPosition(82392, -97348)
Nebula():setPosition(81889, -113222)
Nebula():setPosition(92667, -117111)
Nebula():setPosition(86333, -122667)
Nebula():setPosition(82556, -130333)
Nebula():setPosition(90889, -135222)
Nebula():setPosition(93444, -128111)
Nebula():setPosition(92667, -117111)





--- AUTOMATION

-- setting asteroid stuff
-- asteroids
baseSet = false
asteroidElements = { "Cadmium", "Nickel", "Aluminum", "Lithium", "Iron", "Hydrogen", "Silicon", "Carbon", "Oxygen" }
asteroidBase = "More Information Available When Scanned"
--centreX = 63844
--centreY = -121407
--radius = 1000000
function asteroidInfo(centreX, centreY)
    if baseSet == true then
        return
    end
    -- this gets astreoids in radius of 50 grids (1mil pixels) within starting point (0.0). Change values as needed
    for _, obj in ipairs(getObjectsInRadius(centreX, centreY, 100000)) do
        if obj.typeName == "Asteroid" then
            obj:setSize(random(50, 500)):setRadarSignatureInfo(0.8, 0.0, 0.0):setPositionZ(math.random(-100, 100))
            obj:setDescriptions(tostring(asteroidBase),
                tostring(math.random(1, 30) .. "% " .. asteroidElements[math.random(#asteroidElements)]))
        end
    end
    for _, obj in ipairs(getObjectsInRadius(centreX, centreY, 25000)) do
        if obj.typeName == "Asteroid" then
            table.insert(asteroidElements, "Gravium")
            obj:setDescriptions(tostring(asteroidBase),
                tostring(math.random(1, 30) .. "% " .. asteroidElements[math.random(#asteroidElements)]))
        end
    end
    baseSet = true
end

-- decaying orbit

dOrb = 0
decay = 11000
-- 40 steps = 1 second.
-- 2000 steps = 1 minute (ish)
-- 11000 = approx. 5 minutes
-- 22000 == aprox. 10 minutes
function decayOrbit()
    if dOrb == 1 then
        x1, y1 = planetoid1:getPosition()
        x2, y2 = planetoid2:getPosition()
        local distance = distance(planetoid1, planetoid2)
        local angleA = math.deg(math.atan(y1 - y2, x1 - x2)) % 360
        nx, ny = vectorFromAngle(angleA, distance / decay)
        x1 = x1 - nx
        y1 = y1 - ny
        planetoid1:setPosition(math.floor(x1), math.floor(y1))
        local angleB = math.deg(math.atan(y2 - y1, x2 - x1)) % 360
        mx, my = vectorFromAngle(angleB, distance / decay)
        x2 = x2 - mx
        y2 = y2 - my
        planetoid2:setPosition(x2, y2)
        -- if the adjustment step is too large, the orbit-resetting will compensate
        -- and move planets away from each other. Bit below counter-acts that. 
        if distance == 1300 then
            decay = 2000
        end
        -- resetting orbit every time the loop runs makes this whole thing possible
        planetoid1:setOrbit(planetoid2, orbit)
        planetoid2:setOrbit(planetoid1, orbit)
    end
    if distance(planetoid1, planetoid2) < 800 then
        print("BOOM!")
        for _, obj in ipairs(planetoid1:getObjectsInRange(8000)) do
            if obj ~= player then
                ExplosionEffect():setPosition(x1, y1):setSize(800)
                ExplosionEffect():setPosition(x2, y2):setSize(800)
                obj:destroy()
                ExplosionEffect():setPosition(x1, y1):setSize(3000)
                ExplosionEffect():setPosition(x2, y2):setSize(3000)
                movingAsteroidList = nil
                moveLevel = 0
                removeGMFunction("Pause Decay")
                removeGMFunction("Restart Decay")
                removeGMFunction("Speed Up Decay")
                removeGMFunction("Moving Asteroids Low")
                removeGMFunction("Moving Asteroids Med")
                removeGMFunction("Moving Asteroids High")
                dOrb = 0
            end
        end
    end
end

-- moving asteroids

-- Asteroid variables etc
movingAsteroidList = {}
asteroidRadius = 0
viewPadding = 0
set = 0
moveLevel = 0

-- set them
aMax = nil
-- this one just makes a number of moving asteroids. Is not currently in use
-- function createMovingAsteroids()
--     for aidx = 1, aMax do
--         setMovingAsteroids(65503, -122126)
--     end
-- end
-- function to create ONE moving asteroid (plugged into the movement function)
function setMovingAsteroids(centreX, centreY)
    -- for aidx = 1, aMax do
        local r = random(0, 360)
        local distance = math.random(100, asteroidRadius)
        local x = centreX + math.cos(r / 180 * math.pi) * distance
        local y = centreY + math.sin(r / 180 * math.pi) * distance
        local mAst = Asteroid():setPosition(x, y):setPositionZ(math.random(-100, 100)):setSize(math.random(30, 300)):setRadarSignatureInfo(0.8, 0.0, 0.0):setDescriptions(
            tostring(asteroidBase), tostring(math.random(1, 30) .. "% Gravium"))
        mAst.angle = random(0, 360)
        mAst.travel = random(40, 220)
        if random(1, 100) < 50 then
            mAst.curve = 0
        else
            mAst.curve = math.random() * .16 - .08
        end
        table.insert(movingAsteroidList, mAst)
        -- print("making asteroids")
end

-- make them move

function moveAsteroids(delta, centreX, centreY)
    if moveLevel == 1 then
        local asteroidCount = 0
        local radius = asteroidRadius + viewPadding
        for idx, aObj in ipairs(movingAsteroidList) do
            if aObj:isValid() then
                asteroidCount = asteroidCount + 1
                mAstx, mAsty = aObj:getPosition()
                if mAstx < (centreX - radius) or mAstx > (centreX + radius) or mAsty < (centreY - radius) or mAsty > (centreY + radius) then
                    -- if distance(aObj, centreNebula) < (radius) then
                    aObj.angle = random(0, 360)
                    local curve = 0
                    if random(1, 100) < 50 then
                        curve = math.random() * .08
                    end
                    if aObj.angle < 90 then
                        aObj:setPosition(
                            random(centreX - radius, centreX - radius),
                            random(centreY - radius, centreY - radius))
                        if aObj.angle < 45 then
                            aObj.curve = curve
                        else
                            aObj.curve = -curve
                        end
                    elseif aObj.angle < 180 then
                        aObj:setPosition(
                            random(centreX + radius, centreX + radius),
                            random(centreY - radius, centreY - radius))
                        if aObj.angle < 135 then
                            aObj.curve = curve
                        else
                            aObj.curve = -curve
                        end
                    elseif aObj.angle < 270 then
                        aObj:setPosition(
                            random(centreX + radius, centreX + radius),
                            random(centreY + radius, centreY + radius))
                        if aObj.angle < 225 then
                            aObj.curve = curve
                        else
                            aObj.curve = -curve
                        end
                    else
                        aObj:setPosition(
                            random(centreX - radius, centreX - radius),
                            random(centreY + radius, centreY + radius))
                        if aObj.angle < 315 then
                            aObj.curve = curve
                        else
                            aObj.curve = -curve
                        end
                    end
                else
                    -- if aObj.angle == nil then print("aObj.angle is nil") end
                    deltaAstx, deltaAsty = vectorFromAngle(aObj.angle, aObj.travel)
                    aObj:setPosition(mAstx + deltaAstx, mAsty + deltaAsty)
                    aObj.angle = aObj.angle + aObj.curve
                end
            end
        end
        if asteroidCount < aMax then
            setMovingAsteroids(63844, -121407)
        end
    end
end

-- damaged IMC Ship
function poorUnfortunateShip()
    local x, y = planetoid1:getPosition()
    T3:setPosition(x + 1300, y + 800):setSystemHealth("reactor",-0.6):setSystemHealth("beamweapons", 0.3):setSystemHealth("missilesystem", -0.3):setSystemHealth("maneuver", - 1.0)
    :setSystemHealth("impulse", -1.0):setSystemHealth("warp", -1.0):setSystemHealth("frontshield", -0.4):setSystemHealth("rearshield", -0.2)
    if T3:getHull() <= 10 then
        T3:setHull(10)
    end
end

-- setting Variations
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

-- INIT

--- MIDSHOW BUTONS
function startDecay()
    dOrb = 1
    addGMMessage("Orbit decays in 5 minutes")
    addGMFunction("Speed Up Decay", speedDecay)
    addGMFunction("Pause Decay", pauseDecay)
    removeGMFunction("Decay Orbit")
end

function pauseDecay()
    dOrb = 0
    addGMMessage("Decay Paused")
    addGMFunction("Restart Decay", restartDecay)
    removeGMFunction("Pause Decay")
end

function restartDecay()
    dOrb = 1
    addGMMessage("Decay Restarted")
    removeGMFunction("Restart Decay")
    addGMFunction("Pause Decay", pauseDecay)
end

function speedDecay()
    decay = decay - 400
    addGMMessage("Sped up decay by 10 seconds.")
    if decay <= 400 then
        removeGMFunction("Speed Up Decay")
    end
end

function astLow()
    aMax = 30
    asteroidRadius = 16000
    viewPadding = 2000
    setMovingAsteroids(63844, -121407)
    moveLevel = 1
end

function astMed()
    moveLevel = 1
    asteroidRadius = 14000
    viewPadding = 2000
    aMax = 60
end

function astHigh()
    moveLevel = 1
    asteroidRadius = 12000
    viewPadding = 1000
    aMax = 80
end

function crewSafe()
    T3:setCanBeDestroyed(true)
    removeGMFunction("IMC Crew Safe")
    addGMFunction("Respawn Damaged Ship", respawnShip)
end

function respawnShip()
    T3 = CpuShip():setFaction("Independent"):setTemplate("CNS Talavaar Destroyer"):setCallSign("IMC Talavaar Three")
    :setPosition(61430, -116425):setWeaponStorage("Homing", 0):setCanBeDestroyed(false):setHull(10)
    removeGMFunction("Respawn Damaged Ship")
    addGMFunction("IMC Crew Safe", crewSafe)
end

function stopAst()
    moveLevel = 0
end

function init()
    setVariations()
    player:setActivePresetNumber(0)
    shuttle:setActivePresetNumber(0)
    player:commandDock(Warspite)
    -- shuttle:commandDock(player)

    addGMFunction("Decay Orbit", startDecay)
    addGMFunction("Moving Asteroids Low", astLow)
    addGMFunction("Moving Asteroids Med", astMed)
    addGMFunction("Moving Asteroids High", astHigh)
    addGMFunction("Stop Asteroids", stopAst)
    addGMFunction("IMC Crew Safe", crewSafe)
end

-- UPDATE
function update(delta)
    asteroidInfo(63844, -121407)
    moveAsteroids(delta, 63844, -121407)
    decayOrbit()
    poorUnfortunateShip()
end


--- BEAT SHEET
-- PREAMBULE 
-- We are currently in close proximity to a strange nebula which we believe contains at least one small body resembling a planet,
-- or, in other words, planetoid. 
-- Such things exist withing Gliese 667 systemm, but they are uncommon
-- We are also detecting gravitation anomalies coming out of there
-- We have reasons to believe that that area contains gravium, a extremely rare mineral which we use in energy generation, for such things as the teleporter you took to get here
-- We have sent a Hoplite class destroyer, UCS Effingham there to investigate and they dissapeared from out radars in the area. 

-- ORDERS
-- area of interest is BG3 to BF4, on the heading of approximately 60 degrees. 
-- Last known signting of Effingham was in BG3 
-- Find out what happened to them and rescue if possible
-- Continue their research, scan planetoids and asteroids in the area, return findings. 

-- PART ONE
-- Road there is rough with asteroids 
-- BG3 contains very dead hulks of Effingam and their shuttle, suggesting that the crew tried to escape in that shuttle
-- There are also flying asteroids. A lot of. As you are in a nebula, so you need to get much closer to the planetoid to scan it

-- PART TWO 
-- ICM Talavaar Three will hail you, with Captain Fletcher asking for voice comms. 
-- They are an independent mining ship, caught with dead engines within the gravity of one of the planetoids.
-- Their crew is gone (TBD if escaped or dead), their ship is very broken, and they think the orbit of those planetoids is failing fast
-- They think it's going to collapse completely in five minutes or so. 
-- Please rescue them. 

-- PART THREE 
-- RESCUE MISSION! 
-- If timed well, their ship will be hit by an asteroid and explode just at they are coming aboard
-- The explosing will happen just as you escape
-- If you are fast, Captain Fletcher might ask to watch the collapse, they have never seen anything like this.
-- They will find it emotional, partially because this was an emotional day, and partially because Beauty Of Space 

-- PART FOUR
-- Captain Fletcher will engage with you, ask to compare findings. They will ask you about Gravium and its uses: they have onyl heard a little about it.
-- What will you tell them?
-- (If you contact UCN they would NOT want you to divulge much)
-- They will tell you about their community and what they were doing here:
-- They came here in hope to find resources. Their mines have been around for a very long while - 50 years now - and Cooperative is actively looking to find new ones and trying to establish new mines
-- They are kind of assesing you during this. Their community has a bad history with Commonwealth, but they may be changing their opinions on the Navy based on how you interact with them.

-- PART FIVE 
-- Before their ship exploded they saw a couple of other miners approaching from BH4. Could you head there and see if you can find them?
-- They would like to go home
-- The miners will hail you first. They will be a bit brash, and very worried. Fletcher will calm them down for you, and change their tone to more amicable
-- You can unload your guest so they can go home. 
-- (Or not! You can brig them and go murder hobo on their mates, that's valid)

-- Return to Warspite for debrief. 
