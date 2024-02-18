    -- Name: Playground
	-- Description: Nat's Personal Playground, Read script file for notes. 
	require("utils.lua")

player = PlayerSpaceship():setTemplate("UCS Talavaar Class Destroyer"):setCallSign("Talavaar"):setPosition(-15, -43):setWarpDrive(true):setWarpSpeed(1000.00)
-- this currently all works for just one player, but you can work two-player scenarios into this with simple if/then logic

shuttle = PlayerSpaceship():setTemplate("UCS Havock Shuttle"):setCallSign("Talavaar Shuttle"):setFaction("Independent"):setPosition(-400000, -400000):setWarpDrive(true):setWarpSpeed(1000.00)
-- shuttle fuckery 

	function initiateShuttle()
		shuttle:setFaction("UCN")
		local plX, plY = player:getPosition()
		shuttle:setPosition(plX-200, plY - 200)
		shuttle:commandDock(player)
		shuttle:setEnergyLevel(500)
	end

	function shutdownShuttle()
		shuttle:commandUndock()
		shuttle:setFaction("Independent")
		shuttle:setPosition(-400000,-400000)
	end

	

-- adding a simple GM message
addGMMessage("This can be a place with the first order of business or talking kind of a script for this scenario")

                 -- Warp Jammer with an ajustable range which GM can tweak on the fly
--On  damage, warns you that it will hurt you. On destruction does, in fact, hurt you. 

    bigJammer = WarpJammer():setFaction("Independent"):setPosition(24444, -5000):setRange(1, 1000):onTakingDamage(
	function() 
	bigJammer:setDescriptionForScanState("notscanned", [[Warning! Destruction of this WarpJammer will result in critical damage]])
	end
):onDestruction(
function()
player:takeDamage(150)
player:takeDamage(100, "emp")
end
)

--                    Artifact that will make reactor unfixable, and highly unstable on pick up. 

    Artifact():setPosition(4907, 16481):setModel("artifact8"):allowPickup(true):setSpin(0.8):onPickUp(
	function()
	player:setSystemHealthMax("reactor", 0.7)
	player:setSystemInstabilityFactor("reactor", 2.5)
	player:setSystemInstabilityDifficulty("reactor", 5)
	end
	)

--                                        Sensor Buoy
-- this one and everything below rely on templates that I created.

    buoy = CpuShip():setFaction("Independent"):setTemplate("Sensor Buoy MKI"):setCallSign("Sensor Buoy"):setPosition(2963, -185):setTypeName("Sensor Buoy MK1"):setRotation(0.8):setImpulseMaxSpeed(0.0)

-- sensor buoy activates when you are docked with it and scans everything within rage (satated below)
	function activateBuoy()
		if player:isDocked(buoy) == true then
			player:addToShipLog("Sensor Buoy Activated", "Magenta", "Science")
			for _, obj in ipairs(buoy:getObjectsInRange(2000)) do
			obj:setScanned(true)
			end
		end
	end

                                            -- Shield Generator
									
generator = CpuShip():setFaction("UCN"):setTemplate("Shield Generator"):setCallSign("Shield Generator"):setPosition(-3008, 7482):setImpulseMaxSpeed(0.0)

-- sets shields to 500 and turns them on when you enter its AOE, plus lowers consumption factors for the shields to zero
-- then sets them back to default when you leave
-- function ONLY affects the player ship

defaultPlayerShieldsMax = nil

function generateShield()
    playerIsInRange = false

	for _, obj in ipairs(generator:getObjectsInRange(3000)) do
	    if obj == player then
		   playerIsInRange = true
		end
    end
	if playerIsInRange == true then
        if defaultPlayerShieldsMax == nil then
		  player:addToShipLog("Entering generator zone", "Magenta", "Helms")
		  defaultPlayerShieldsMax = player:getShieldMax()
		  -- this records levels of shields at the moment you enter the generator's AOE
		  frontShield = player:getShieldLevel(0)
		  rearShield = player: getShieldLevel(1)
		end
		player:setShieldsMax(500,500)
		player:setShields(500,500)
		player:setShieldsActive(true)
		player:setSystemPowerUseFactor("frontshield", 0.0)
		player:setSystemPowerUseFactor("rearshield", 0.0)
	else
	    if defaultPlayerShieldsMax ~= nil then
		  player:addToShipLog("Leaving generator zone", "Magenta", "Helms")
		  -- returns shiels to the levels they were when you entered AOE and sets the Max to one declared earlier
		  player:setShieldsMax(defaultPlayerShieldsMax, defaultPlayerShieldsMax)
		  player:setShields(frontShield, rearShield)
		  player:setSystemPowerUseFactor("frontshield", 1.0)
		  player:setSystemPowerUseFactor("rearshield", 1.0)
		  defaultPlayerShieldsMax = nil
		end
	end
end

                                              -- Weird Space Sphere
											  -- operates as a Station						  
-- gives you energy on damage, but if your energy is over 900 it damages your reactor instead										  
											  
sphere = SpaceStation():setTemplate("Sphere"):setFaction("Independent"):setCallSign("Mysterious Space Sphere"):setPosition(1712, 1491)
sphere:onTakingDamage( function()
currentEnergy = player:getEnergy()
if currentEnergy <900 then
player:setEnergy(currentEnergy + 86)
else
player:setSystemHealth("reactor", 0.0)
 player:addToShipLog("Warning! Reactor overload", "Magenta", "Engineering")
end
end)

-- if you destroy the sphere, it will backfire dramatically 

sphere:onDestruction(function()
player:takeDamage(300, "emp")
 player:addToShipLog("Warning! Multiple systems failure", "Magenta", "Engineering")
player:setSystemHealth("reactor", -0.5):setSystemHealth("beamweapons", 0.0):setSystemHealth("missilesystem", 0.0):setSystemHealth("warp", 0.0)
end)

                                   -- Comms Hub

commsHub = SpaceStation():setTemplate("Comms Hub"):setFaction("UCN"):setCallSign("Comms Hub"):setPosition(-7333, -13222):onDestruction(function()
player:addToShipLog("Communications Systems Offline", "Magenta", "Relay")
-- the bit below does not work, IDK why. 
-- TO DO Debug
  if player:isCommsChatOpen() == true then
   player:commandCloseTextComm()
  end
end
)

-- if Comms Hub is destroyed, the comms will no longer open. 
function commsDown()
	if commsHub:isValid() == false and player:isCommsOpening() == true then
		player:commandCloseTextComm()
		player:addToShipLog("Failed to Establish Communication", "Magenta", "Relay")
	end
end 
 
                                        -- Gravitational Anomaly

anomaly = SpaceStation():setTemplate("Gravitational Anomaly"):setFaction("Independent"):setCallSign("Anomaly"):setPosition(-17111, -7111)

-- the AOE of the anomaly makes all ships in range lose speed, and then return to normal when they leave

affectedShipsList = {}
restoredShips = nil

function graviPull()
	for _, obj in ipairs(anomaly:getObjectsInRange(1000)) do
		table.insert(affectedShipsList, obj)
		if string.find(string.lower(obj.typeName), "ship") then
			obj:setRotationMaxSpeed(2.0)
			obj:setImpulseMaxSpeed(10.0)
			if obj:hasWarpDrive(true) == true then
				obj:setWarpSpeed(100)
				if obj == player then
					player:addToShipLog("Entering Gravitational Anomaly Zone", "Magenta", "Helms")
				end
			end
		end
	end

	for _, obj in ipairs(affectedShipsList) do
		if distance(anomaly, obj) > 1000 then
			restoredShips = obj
			restoredShips:setImpulseMaxSpeed(90)
			restoredShips:setRotationMaxSpeed(10)
			if restoredShips:hasWarpDrive(true) == true then
				restoredShips:setWarpSpeed(1000)
				if restoredShips == player then
					player:addToShipLog("Leaving Gravitational Anomaly Zone", "Magenta", "Helms")
				end
			end
			affectedShipsList.remove(restoredShips)
		end
		restoredShips = nil
	end
end

                              --Moving Asteroid Field

-- the function below sets the movement of the asteroids, essentially around the default spawn loaction; this is what the angles and vectors indicate. 
-- we can make that field bigger or smaller if we adjust the numbers; I would not want to play with angles and curves becauase they are VERY well developed. 

function moveAsteroids(delta)
	local movingAsteroidCount = 0
	for aidx, aObj in ipairs(movingAsteroidList) do
		if aObj:isValid() then
			movingAsteroidCount = movingAsteroidCount + 1
			local mAstx, mAsty = aObj:getPosition()
			if mAstx < -150000 or mAstx > 150000 or mAsty < -150000 or mAsty > 150000 then
				aObj.angle = random(0,360)
				local curve = 0
				if random(1,100) < 50 then
					curve = math.random()*.08
				end
				if aObj.angle < 90 then
					aObj:setPosition(random(-150000,-100000),random(-150000,-100000))
					if aObj.angle < 45 then
						aObj.curve = curve
					else
						aObj.curve = -curve
					end
				elseif aObj.angle < 180 then
					aObj:setPosition(random(100000,150000),random(-150000,-100000))
					if aObj.angle < 135 then
						aObj.curve = curve
					else
						aObj.curve = -curve
					end
				elseif aObj.angle < 270 then
					aObj:setPosition(random(100000,150000),random(100000,150000))
					if aObj.angle < 225 then
						aObj.curve = curve
					else
						aObj.curve = -curve
					end
				else
					aObj:setPosition(random(-150000,-100000),random(100000,150000))
					if aObj.angle < 315 then
						aObj.curve = curve
					else
						aObj.curve = -curve
					end
				end
			else
				if aObj.angle == nil then print("aObj.angle is nil") end
				local deltaAstx, deltaAsty = vectorFromAngle(aObj.angle,aObj.travel)
				aObj:setPosition(mAstx+deltaAstx,mAsty+deltaAsty)
				aObj.angle = aObj.angle + aObj.curve
			end
		end
	end
	-- this sets on creating new asteroids if you have run out of those. Delete if you want the finate
	if movingAsteroidCount < 1 then
		setMovingAsteroids()
	end
end

function setMovingAsteroids()
	movingAsteroidList = {}
	-- the one below sets the number. 
	for aidx=1,100 do
		local xAst = random(-100000,100000)
		local yAst = random(-100000,100000)
		local outRange = true
		for p2idx=1,8 do
		--responds to player ship position?
			local p2obj = getPlayerShip(p2idx)
			if p2obj ~= nil and p2obj:isValid() then
				if p2obj == nil then print("p2obj is nil") end
				if xAst == nil then print("xAst is nil") end
				local x1, y1 = p2obj:getPosition()
				if distance(x1,y1,xAst,yAst) < 30000 then
					outRange = false
				end
			end
		end
		if outRange then
			local mAst = Asteroid():setPosition(xAst,yAst)
			mAst.angle = random(0,360)
			mAst.travel = random(40,220)
			if random(1,100) < 50 then
				mAst.curve = 0
			else
				mAst.curve = math.random()*.16 - .08
			end
			table.insert(movingAsteroidList,mAst)
		end
	end
end


-- update function gets called throughout the scenario. If your function loops, it needs to be called here
-- delta argument understands the passage of time

function update(delta)
-- moveAsteroids(delta)
activateBuoy()
generateShield()
commsDown()
graviPull()
end


-- init function sets up the scenario, and is only called once
function init()
-- GM buttons
	-- this one makes visibility non-existent
	addGMFunction(
		"Kill radar",
		function()
			player:setShortRangeRadarRange(1)
			player:setLongRangeRadarRange(1)
			player:setFarRangeRadarRange(1)
		end
	)
	-- this one takes shields down
	addGMFunction(
		"Kill Shields",
		function()
			player:setShieldsMax(0.0, 0.0)
			addGMMessage("Talavaar's shields are down!")
		end
	)
	-- this one restores shiels to regular level
	addGMFunction(
		"Restore Shields",
		function()
			player:setShieldsMax(200, 200)
			player:setShields(200, 200)
			addGMMessage("Talavaar Shields are up!")
		end
	)

	-- respock player coolant
	addGMFunction("Restock Probes",
		function()
			player:setScanProbeCount(8)
			addGMMessage("Probes Restocked")
		end
	)

	-- refuel player ship 
	addGMFunction("Refuel",
		function()
			player:setEnergy(1000)
			addGMMessage("Ship Refueled")
		end
	)

	-- restock missiles on the player ship
	addGMFunction("Restock Missiles",
		function()
			player:setWeaponStorage("Homing", 12)
			player:setWeaponStorage("Nuke", 2)
			player:setWeaponStorage("Mine", 8)
			player:setWeaponStorage("EMP", 8)
			addGMMessage("Missiles Restocked")
		end
	)

	-- partial hull repair
	addGMFunction("Repair Hull",
		function()
			player:setHull(player:getHull() + 35)
			addGMMessage("Hull Partially Repaired")
		end
	)

	-- add button to restock drones 
	-- TO DO 

	-- add buttons to run shuttle functions 
	addGMFunction("Initiate Shuttle", initiateShuttle)
	addGMFunction("Shutdown Shuttle", shutdownShuttle)


	-- setMovingAsteroids()
	print("Hello")
end
