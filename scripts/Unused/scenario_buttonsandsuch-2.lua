-- Name: Buttons and such
-- Description: Experimenting with GM buttons and some other custom code
-- Type: Fuckabout

require("ee.lua")
--require("generate_call_sign_scenario_utility.lua")
--require("utils2.lua")
--require("utils_customElements.lua")

-- Init is run when the scenario is started. Create your initial world

function init()

--Set up for GM buttons--

GMHailcustom = _("buttonGM", "Hail as nebula")
addGMFunction(GMHailcustom,triggercustomhail)
GMDeusEx = _("buttonGM", "Deus Ex")
addGMFunction(GMDeusEx,triggerdeusex)
GMHack = _("buttonGM", "hack")
addGMFunction(GMHack,triggerHack)

--Create the main ship for the players.--

player = PlayerSpaceship():setTemplate("UCS Bastion Class Destroyer"):setPosition(-1814, 2763):setWarpDrive(true):setWarpSpeed(1000.00):setBeamWeapon(15, 342, 96, 0, 0.0, 0.0):setBeamWeaponDamageType(15, 3):setBeamWeaponTurret(15, 360, 0, 10)

--Define objects in space and spawn in position--

--Planets--

 Magrathea = Planet():setPosition(2111, -65556):setPlanetRadius(3000):setDistanceFromMovementPlane(-2000):setPlanetSurfaceTexture("planets/planet-2.png"):setPlanetCloudTexture("planets/clouds-1.png"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.2, 0.2, 1.0)
    Magrathea = Planet():setPosition(5000, 0):setPlanetRadius(1000):setDistanceFromMovementPlane(-2000.00):setPlanetAtmosphereColor(1.00,1.00,1.00):setDistanceFromMovementPlane(-2000.00)
 
 --Asteroids, nebulas, wormholes, etc--
 
 asteroid1 = Asteroid():setPosition(-20222, -20111)
		asteroid1:addInfos(1, "origin", "constructed")
		asteroid1:addInfos(2, "composition", "organic carbon life")
		asteroid1:addInfos(3, "danger", "high")
		asteroid1:setScanningParameters(1, 2)
		asteroid1:setDescriptionForScanState("notscanned", [[]])
		--currently cannot view the above - unable to get a simple-scan state on this
		              -- NB Descriptions for scan state do not exist for asteroids I believe 
		asteroid1:setDescriptionForScanState("simplescan", [[Don't continue]])
		asteroid1:setDescriptionForScanState("fullscan", [[You were warned. Your location is known. We are coming.]])
    --sensor1 = sensorbuoy():setPosition(-111, -20333):setModel("sensor-buoy")
    visasteroid1 = VisualAsteroid():setPosition(-10111, -19889)
	
		nebula1 = Nebula():setPosition(-20000, 20000)
		
		--a wormhole that tanks your engines upon entry and also disappears after teleportation--
		
		   missile_wormhole = WormHole():setPosition(-566, 10778):setTargetPosition(0, 30778)
    missile_wormhole:onTeleportation(
        function(self, object)
            print(object.typeName)
            if string.find(string.lower(object.typeName), "ship") then -- yes, ugly but don't know how to get every ship type
				                                     -- ironically, this is exactly why diad EE has "ship" as an additional class for all ships 
                if(object:hasJumpDrive()) then
                    object:setSystemHealth("jumpdrive", -0.5)
                end
                if(object:hasWarpDrive()) then
                    object:setSystemHealth("warp", -0.5)
                end
            end
			missile_wormhole:destroy()
        end
    )

 --Artifacts, Buoys, Jammers, etc--
	
	artifact1 = Artifact():setPosition(20000, -19778):setModel("artifact7")
    artifact2 = Artifact():setPosition(20222, 0):setModel("ammo_box")
	artifact3 = Artifact():setPosition(20100, 0):setModel("artifact3")
	sensorbuoy = Artifact():setPosition(20000, -20000):setModel("SensorBuoyMKII"):setFaction("Brutal")

	MagWarn1 = CpuShip():setFaction("Independent"):setTemplate("Sensor Buoy MKI"):setCallSign("MD1"):setPosition(-5556, -12333):setTypeName("Sensor Buoy MK1"):setRotation(0.8):setImpulseMaxSpeed(0.0)
	MagWarn2 = CpuShip():setFaction("Independent"):setTemplate("Sensor Buoy MKI"):setCallSign("MD2"):setPosition(-7222, -18889):setTypeName("Sensor Buoy MK1"):setRotation(0.8):setImpulseMaxSpeed(0.0)
	MagWarn3 = CpuShip():setFaction("Independent"):setTemplate("Sensor Buoy MKI"):setCallSign("MD3"):setPosition(-8222, -25111):setTypeName("Sensor Buoy MK1"):setRotation(0.8):setImpulseMaxSpeed(0.0)
	
	MagAttack1 = CpuShip():setTemplate("Gunship"):setFaction("Independent"):setPosition(-16556, -39333):orderIdle()
    MagAttack2 = CpuShip():setTemplate("Gunship"):setFaction("Independent"):setPosition(-222, -40000):orderIdle()
    MagAttack3 = CpuShip():setTemplate("Gunship"):setFaction("Independent"):setPosition(-16444, -53000):orderIdle()
    MagAttack4 = CpuShip():setTemplate("Gunship"):setFaction("Independent"):setPosition(-444, -53556):orderIdle()
	

-- automatically scans every object within range

	function ScanEverything()
	for _, obj in ipairs(buoy:getObjectsInRange(2000)) do
		obj:setScanned(true)
		end
    end
	
 --Non-player Ships--
	
    ship1 = CpuShip():setFaction("Brutal"):setTemplate("Defense platform"):setCallSign("BR1"):setPosition(20111, 20222):orderRoaming()
    --sgen1 = SGenerator():setPosition(-19889, 0):setModel("shield_generator")

end

--Write up/enter any functions for this specific scenario--

--GM functions

function triggercustomhail()
	nebula1:sendCommsMessage(player, "You are intruding.")
	globalMessage("You are intruding.")
	    Asteroid():setPosition(-295, 20195)
	Asteroid():setPosition(-6889, 18778)
    Asteroid():setPosition(-12889, 25778)
    Asteroid():setPosition(-14444, 8667)
    Asteroid():setPosition(-21000, 7556)
    Asteroid():setPosition(-8333, 11556)
    Asteroid():setPosition(-24778, 12444)
    Asteroid():setPosition(-10570, 19959)
	removeGMFunction(GMPhase2)
end

autoruns = 0

--NOTES ON BELOW function
--currently ship log updates don't show. changing order of commands to try and assist this often breaks function
--have tried to get the below to trigger a global message rather than hail but globalMessage function not working
--if used more than once in a scenario, current coding requires things be triggered in sequence (can explain if 
--needed why/how this has come about)


--- NB changed officer parameter to "Relay" rather than "Comms"
	
--function autohail(hailer, range, message, logmessage, colour, officer, autorunnum)
	--playerIsInRange = false

	--for _, obj in ipairs(hailer:getObjectsInRange(range)) do
		--if obj == player then
			--playerIsInRange = true
			--print("Player in range")
		--end
--	end
	--if playerIsInRange == true then
	--	print("got this far")
	--	if autoruns == autorunnum then
		--	print("Trying to send comms")
		--	autoruns = autoruns + 1
		--	hailer:sendCommsMessage(player, message)
			--player:addToShipLog(logmessage, colour, officer)
		--	print("changed var")
	--	end
--	else
	--	if autoruns ~= autorunnum then
	--	end
--	end
--end
function autofire(firing, range, target, logmessage, colour, officer)
	playerIsInRange = false

	--this code currently repeats the function ad infinitum when players are in range.
	--any update would need to allow for this function running on multiple firing points at once (autohail works
	--a little differently)

	for _, obj in ipairs(firing:getObjectsInRange(range)) do
		if obj == player then
			playerIsInRange = true
			print("Player in range")
		end
		if playerIsInRange == true then
			firing:getOrder()
			if order == idle then
				print("they're idle")
				firing:orderAttack(target)
				--player:addToShipLog(logmessage, colour, officer)
				print("attacking")
			end
			if order == attack then
			firing:orderIdle()
			end
		end
	end
end


function triggerdeusex()
	print("Deus Ex triggered")
	addGMMessage("Deus Ex triggered")
	player:setHullMax(500)
	player:setHull(250)
	--note: must set Max before setting current or it will automatically go to Max, even if current is lower
	player:setShieldsActive(true)
	player:setShields(200, 200)
	player:setShieldsMax(500,500)
	player:setEnergyLevelMax(2000)
	player:setEnergyLevel(1000)
	--as above, max must be set first
	player:setMaxCoolant(20)
	--unclear what absolute max you can put coolant to is, above is double the standard
	player:commandSetAutoRepair(true)
	player:setAutoCoolant(true)
	player:setSpeed(250, 35, 2000)
	--above are the typical maxes - impulse, turn, acceleration
	--player:setRepairCrewCount(6)
	--struggling to get above to work, though also hard to see where to check for changes
	end

function triggerHack()
	--player:commandActivateSelfDestruct()
	--above line noted to make other functions easier to check while testing
	--currently it only brings up the Self Destruct code entry rather than pushing it through
	addGMMessage("Hack triggered")
	player:setCanScan(false)
	player:setCanLaunchProbe(false)
	player:setCanCombatManeuver(false)
	player:setCanHack(false)
	player:setFarRangeRadarRange(0,30)
	player:setLongRangeRadarRange(0,30)
	player:setShortRangeRadarRange(0,30)
	--player:setControlCode(255255)
	--above line noted just because it makes going back and forth during testing a hassle!
	player:commandUnloadTube(0)
	player:commandUnloadTube(1)
	player:commandUnloadTube(2)
	player:commandUnloadTube(3)
	player:commandUnloadTube(4)
	player:commandImpulse(80,100)
	player:setHeading(280,300)
	player:setWarpDrive(false)
	--player:setHasReactor(false)
	--above line not currently having impact
	
	
	end
	
--Enter all newly-written functions in below bracket so they run during the game (GM buttons don't require this as they are manually triggered)--
	
	function update(delta)
	
if autoruns == 0 then
	autohail(MagWarn1, 3000, "Oops! You shouldn't be here. Turn around and we'll forget all about it.", "Forewarned about consequences of entering Magrathean space", "Magenta", "Relay", 0)
	end
if autoruns == 1 then
	autohail(MagWarn2, 3000, "We have warned you. You don't get many warnings, darling.", "Given a chance to leave unharmed.", "Magenta", "Relay", 1)
	end
if autoruns == 2 then
	autohail(MagWarn3, 3000, "Okay, we'll be firing super friendly missiles at you now.", "Decided to enter missile zone of own free will.", "Magenta", "Relay", 2)
	end
	
autofire(MagAttack1, 3000, player, "automated defence systems triggered", "Magenta", "Relay")
autofire(MagAttack2, 3000, player, "automated defence systems triggered", "Magenta", "Relay")
autofire(MagAttack3, 3000, player, "automated defence systems triggered", "Magenta", "Relay")
autofire(MagAttack4, 3000, player, "automated defence systems triggered", "Magenta", "Relay")

end