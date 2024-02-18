-- Name: Zones and functions for Ewan
-- Description: Nat's third workshop 
-- Variation[Takanami]: This scenario will run on Takanami 
-- Variation[Havock]: This scenario will run on Havock


player= PlayerSpaceship():setPosition(5801, 6039):setWarpDrive(true):setWarpSpeed(1000.00)
shuttle = PlayerSpaceship():setPosition(-400000, -400000):setWarpDrive(true):setWarpSpeed(1000.00)

function setVariations()
	if string.find(getScenarioVariation(),"Havock") then
        player:setTemplate("UCS Skirmish Class Frigate"):setCallSign("UCS Havock"):setFaction("UCN")
        shuttle:setTemplate("UCS Havock Shuttle"):setCallSign("UCS Havock Shuttle"):setFaction("Independent")
	elseif string.find(getScenarioVariation(),"Takanami") then
        player:setTemplate("UCS Hoplite Class Destroyer"):setCallSign("UCS Takanami"):setFaction("UCN")
        shuttle:setTemplate("UCS Takanami Shuttle"):setCallSign("UCS Takanami Shuttle"):setFaction("Independent")
	end
end

-- the two zones without a label don't have labels because those have been spaffing in random places
-- "Why is that?", You ask. No fucking clue, is the answer. 

whiteZone = Zone():setPoints(-40000, -40000, -40000, 40000, 40000, 40000, 40000, -40000):setLabel("White Zone"):setColor(255, 255, 255)
redZone = Zone():setPoints(20000, -120000, 20000, -40000, 120000, -40000, 120000, - 120000):setColor(255, 6, 6)
yellowZone = Zone():setPoints(-100000, 20000, -40000, 20000, -40000, 100000, -100000, 100000):setLabel("Yelow Zone"):setColor(255, 255, 0)
greenZone = Zone():setPoints(-80000, -80000, -80000, -160000, -160000, -160000, -160000, -80000):setColor(51, 153, 51)
blueZone = Zone():setPoints(40000, 80000, 140000, 80000, 140000, 160000, 40000, 160000):setColor(96, 96, 96):setLabel("Blue Zone")

-- Terrain "appears" when you enter zone

hiddenSpawned = false
function spawnHidden()
    if hiddenSpawned == true then
        return
    end
    if redZone:isInside(player) then 
        Nebula():setPosition(73111, -94111)
        Nebula():setPosition(62000, -100000)
        BlackHole():setPosition(84111, -75222)
        Nebula():setPosition(89222, -69444)
        Nebula():setPosition(54889, -96111)
        Asteroid():setPosition(78111, -70000)
        BlackHole():setPosition(48000, -91889)
        Nebula():setPosition(79778, -59333)
        Asteroid():setPosition(48000, -77778)
        Asteroid():setPosition(47778, -86667)
        Asteroid():setPosition(57667, -81111)
        Asteroid():setPosition(56778, -88111)
        Asteroid():setPosition(56778, -71889)
        Asteroid():setPosition(67333, -59000)
        Asteroid():setPosition(66444, -62889)
        Asteroid():setPosition(85222, -54111)
        Asteroid():setPosition(88111, -69222)
        Asteroid():setPosition(76222, -65556)   
        message = "Test message"
        jcsDestiny:sendCommsMessage(player,_(message)) 
        hiddenSpawned = true
    end
end

-- function which will be called when Destiny takes damage.
-- black holes are created relative to player position
jcsDestiny = CpuShip():setFaction("Independent"):setTemplate("JCS Destiny"):setCallSign("JCS Destiny MKII")
        :setPosition(70222, -81667):orderIdle():setShieldsMax(0, 0, 0, 0, 0, 0)

jcsDestiny:onTakingDamage(
    function()
        local px, py = player:getPosition()
        hx = px - random(-12000, 12000)
        hy = py - random(1200, 15000)
        BlackHole():setPosition(hx, hy)
    end
)

----------

function init()
    setVariations()
end

function update(delta)
    spawnHidden()
end