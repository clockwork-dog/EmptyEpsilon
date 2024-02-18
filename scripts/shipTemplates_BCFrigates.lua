--[[                  Frigates
Frigates are 1 size up from starfighters. They require a crew from 3 to 20 people.
Think, Firefly, millennium falcon, slave I (Boba fett's ship).

They generally have 2 or more shield sections, but hardly ever more than 4.

This class of ships is normally not fitted with jump or warp drives. But in some cases ships are modified to include these, or for certain roles it is build in.

They are divided in 3 different sub-classes:
* Cruiser: Weaponized frigates, focused on combat. These come in various roles.
* Light transport: Small transports, like transporting up to 50 soldiers in spartan conditions or a few diplomats in luxury. Depending on the role can have some weaponry.
* Support: Support types come in many variaties. They are simply a frigate hull fitted with whatever was needed. Anything from mine-layers to science vessels.
----------------------------------------------------------]]

--Commonwealth

template = ShipTemplate():setName("Tribal Frigate"):setClass("Frigate", "Tribal"):setModel("WespeScoutBlue"):setRecorded(false)
--template:setDescription([[The Tribal Class Frigate is the workhorse of the Commonwealth Stellar Navy. It has a good all-round mix of armaments and is suited to most situations that a ship of its size can reasonably expect to find itself in.]])
template:setRadarTrace("radar_cruiser.png")
template:setHull(70)
template:setShields(50, 40)
template:setWarpSpeed(800)
template:setSpeed(60, 10, 10)
template:setBeamWeapon(0, 90, -15, 1200, 8, 6)
template:setBeamWeapon(1, 90,  15, 1200, 8, 6)
template:setTubes(2, 60.0)
template:setWeaponStorage("HVLI", 6)
template:setWeaponStorage("Homing", 20)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setDockClasses("Starfighter", "Frigate", "Destroyer")


variation = template:copy("CNS Tribal Frigate"):setRecorded(false)
variation:setDescription([[The Tribal Class Frigate was the workhorse of the Commonwealth Stellar Navy. It has a good all-round mix of armaments and is suited to most situations that a ship of its size can reasonably expect to find itself in.]])
variation:setShields(50, 40)
variation:setHull(70)
variation:setSpeed(60, 10, 10)
variation:setTubes(2, 60.0)
variation:setWeaponStorage("Homing", 20)
variation:setWeaponStorage("HVLI", 6)


variation = template:copy("UCS Tribal Frigate")
variation:setDescription([[The Tribal Class Frigate was the workhorse of the Commonwealth Stellar Navy. When the UCN was formed, the bulk of the Commonwealth fleet was transferred to UCN control where it was refurbished. Those Tribal frigates in UCN service have beem up-armoured and up-gunned to keep pace with more modern ships in their weight class.]])
variation:setShields(100, 100)
variation:setHull(150)
variation:setSpeed(80, 10, 20)
variation:setCombatManeuver(400, 250)
variation:setTubes(2, 40.0)
variation:setWeaponStorage("Homing", 20)
variation:setWeaponStorage("HVLI", 6)
variation:setWeaponStorage("EMP", 4)


variation = template:copy("Tribal Class Frigate"):setType("playership"):setRecorded(false)
variation:setDescription([[The Tribal Class Frigate is the workhorse of the Commonwealth Stellar Navy. It has a good all-round mix of armaments and is suited to most situations that a ship of its size can reasonably expect to find itself in.]])
variation:setShields(100, 100)
variation:setHull(150)
variation:setSpeed(80, 10, 20)
variation:setCombatManeuver(400, 250)
variation:setTubes(2, 40.0)
variation:setWeaponStorage("Homing", 10)
variation:setWeaponStorage("Nuke", 1)
variation:setWeaponStorage("HVLI", 6)
variation:setWeaponStorage("EMP", 4)
variation:setEnergyStorage(1500)

variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
variation:addRoom(2, 2, 2, 1);

variation:addRoomSystem(0, 3, 1, 2, "RearShield");
variation:addRoomSystem(1, 3, 2, 2, "Reactor");
variation:addRoomSystem(3, 3, 2, 2, "Warp");
variation:addRoomSystem(5, 3, 1, 2, "JumpDrive");
variation:addRoom(6, 3, 2, 1);
variation:addRoom(6, 4, 2, 1);
variation:addRoomSystem(8, 3, 1, 2, "FrontShield");

variation:addRoom(2, 5, 2, 1);
variation:addRoomSystem(1, 6, 2, 1, "MissileSystem");
variation:addRoomSystem(1, 7, 2, 1, "Impulse");

variation:addDoor(1, 1, true);
variation:addDoor(2, 2, true);
variation:addDoor(3, 3, true);
variation:addDoor(1, 3, false);
variation:addDoor(3, 4, false);
variation:addDoor(3, 5, true);
variation:addDoor(2, 6, true);
variation:addDoor(1, 7, true);
variation:addDoor(5, 3, false);
variation:addDoor(6, 3, false);
variation:addDoor(6, 4, false);
variation:addDoor(8, 3, false);
variation:addDoor(8, 4, false);
 
--Airlock doors
--variation:addDoor(2, 2, false);
--variation:addDoor(2, 5, false);

--Shanghai Pact

template = ShipTemplate():setName("Orlov Frigate"):setClass("Frigate", "Orlov"):setModel("small_frigate_3"):setRecorded(false) -- TODO: Better 3D model selection
--template:setDescription([[The Orlov is the standard Frigate of the Shanghai Pact.]])
template:setRadarTrace("radar_cruiser.png")
template:setBeamWeapon(0, 90, -15, 1200, 3, 4)
template:setBeamWeapon(1, 90,  15, 1200, 3, 4)
template:setBeamWeapon(2, 90,  50, 1200, 3, 4)
template:setBeamWeapon(3, 90, -50, 1200, 3, 4)
template:setHull(70)
template:setShields(50, 40)
template:setWarpSpeed(800)
template:setSpeed(70, 15, 10)
template:setDockClasses("Starfighter", "Frigate", "Destroyer")

variation = template:copy("SPS Orlov Frigate"):setRecorded(false)
variation:setDescription([[The Orlov was the standard Frigate of the Shanghai Pact]])
variation:setBeamWeapon(0, 90, -15, 1200, 2.9, 4)
variation:setBeamWeapon(1, 90,  15, 1200, 2.9, 4)
variation:setBeamWeapon(2, 90,  50, 1200, 2.9, 4)
variation:setBeamWeapon(3, 90, -50, 1200, 2.9, 4)
variation:setSpeed(70, 15, 10)

variation = template:copy("UCS Orlov Frigate")
variation:setDescription([[The Orlov was the standard Frigate of the Shanghai Pact. When the UCN was formed, the bulk of the Shanghai Pact fleet was transferred to UCN control where it was refurbished. Those Orlov frigates in UCN service have beem up-armoured and up-gunned to keep pace with more modern ships in their weight class.]])
variation:setShields(100, 100)
variation:setHull(120)
variation:setSpeed(90, 25, 20)
variation:setBeamWeapon(0, 90, -15, 1200, 2.9, 4)
variation:setBeamWeapon(1, 90,  15, 1200, 2.9, 4)
variation:setBeamWeapon(2, 90,  50, 1200, 2.9, 4)
variation:setBeamWeapon(3, 90, -50, 1200, 2.9, 4)
variation:setWeaponStorage("EMP", 5)
variation:setWeaponStorage("HVLI", 15)
template:setTubes(4, 15.0)


--European Federation

template = ShipTemplate():setName("Cassard Frigate"):setClass("Frigate", "Cassard"):setModel("FlakDestroyerGreen"):setRecorded(false)	--Yellow, Green, Blue, White, Red
--template:setDescription([[The Cassard class Frigate fires salvos of missiles from forward facing tubes but is poorly shielded and under-armoured. It is something of a glass cannon.]])
template:setRadarTrace("radar_cruiser.png")
template:setBeamWeapon(0, 90, 0, 1200, 3.0, 5.0)
template:setHull(50)
template:setShields(30, 30)
template:setWarpSpeed(800)
template:setSpeed(40, 6, 8)
template:setTubes(5, 15.0)
template:setWeaponStorage("HVLI", 15)
template:setWeaponStorage("Homing", 15)
template:setWeaponStorage("EMP", 5)
template:setTubeDirection(0,  0)
template:setTubeDirection(1, -1)
template:setTubeDirection(2,  1)
template:setTubeDirection(3, -2)
template:setTubeDirection(4,  2)
template:setDefaultAI('missilevolley')
template:setDockClasses("Starfighter", "Frigate", "Destroyer")

variation = template:copy("EFS Cassard Frigate"):setRecorded(false)
variation:setDescription([[The Cassard class Frigate fires salvos of missiles from forward facing tubes but is poorly shielded and under-armoured. It is something of a glass cannon.]])

variation = template:copy("UCS Cassard Frigate")
variation:setDescription([[The Cassard class Frigate fires salvos of missiles from forward facing tubes but is poorly shielded and under-armoured. It is something of a glass cannon. When the UCN was formed, the bulk of the European Federation fleet was transferred to UCN control where it was refurbished. Those Cassard frigates in UCN service have had their notorious coolant systems entirely replaced ensuring they are no longer a threat to life and limb for UCN Engineers.]])
variation:setShields(60, 60)
variation:setHull(120)
variation:setSpeed(90, 35, 30)
variation:setModel("FlakDestroyerBlue")

--JASA

template = ShipTemplate():setName("Thunder Frigate"):setClass("Frigate", "Thunder"):setModel("CobraBomber"):setRecorded(false)
--template:setDescription([[The Thunder class frigate, or Ikazuchi class in Japanese, packs a hard punch with quadruple forward facing missile tubes and powerful point-defence beam weapons]])
template:setRadarTrace("radar_cruiser.png")
--						Arc, Dir, Range, CycleTime, Dmg
template:setBeamWeapon(0, 60,   0, 1400.0, 6.0, 6)
template:setBeamWeapon(1, 60,   50, 1200.0, 6.0, 4)
template:setBeamWeapon(2, 60,  -50, 1200.0, 6.0, 4)
template:setBeamWeapon(3, 120,  180, 1200.0, 6.0, 4)
template:setHull(80)
template:setShields(50, 50)
template:setWarpSpeed(800)
template:setSpeed(50, 8, 8)
template:setTubes(4, 12.0)
template:setWeaponStorage("HVLI", 8)
template:setWeaponStorage("Homing", 12)
template:setWeaponStorage("EMP", 4)
variation:setWeaponStorage("Nuke", 1)

variation = template:copy("JASA Thunder Frigate"):setRecorded(false)

variation = template:copy("UCS Thunder Frigate")
variation:setDescription([[The Thunder class frigate, or Ikazuchi class in Japanese, packs a hard punch with quadruple forward facing missile tubes and powerful point-defence beam weapons. It was the most numerous of the JASA Frigates and of the small number of JASA ships that returned to earth, many were transferred into the UCN where they underwent extensive refurbishment]])
variation:setShields(80, 80)
variation:setHull(100)
variation:setSpeed(80, 15, 20)


template = ShipTemplate():setName("Tsunami Frigate"):setClass("Frigate", "Tsunami"):setModel("CobraInterceptor"):setRecorded(false)
template:setDescription([[The Tsunami class frigate carries powerful forward-facing beams but lacks adequate armour and shielding, relying on its speed to get it out of difficult situations]])
template:setRadarTrace("radar_cruiser.png")
--						Arc, Dir, Range, CycleTime, Dmg
template:setBeamWeapon(0, 30,   0, 1800.0, 6.0, 10)
template:setBeamWeapon(1, 60,   0, 1200.0, 6.0, 6)
template:setBeamWeapon(2, 90,  0, 1000.0, 6.0, 4)
template:setHull(50)
template:setShields(50, 50)
template:setWarpSpeed(800)
template:setSpeed(100, 12, 8)

variation = template:copy("JASA Tsunami Frigate"):setRecorded(false)

template = ShipTemplate():setName("Monsoon Frigate"):setClass("Frigate", "Monsoon"):setModel("CobraFighter"):setRecorded(false)
--template:setDescription([[The Monsoon class frigate acted as a well-defended minelayer and was commonly deployed in a defensive role]])
template:setRadarTrace("radar_cruiser.png")
--						Arc, Dir, Range, CycleTime, Dmg
template:setBeamWeapon(0, 60,   0, 1400.0, 6.0, 6)
template:setBeamWeapon(1, 60,   50, 1200.0, 6.0, 4)
template:setBeamWeapon(2, 60,  -50, 1200.0, 6.0, 4)
template:setBeamWeapon(3, 120,  180, 1200.0, 6.0, 4)
template:setHull(80)
template:setShields(50, 50)
template:setWarpSpeed(800)
template:setSpeed(50, 8, 8)
template:setTubes(3, 12.0)
template:setTubeDirection(2, 180)
template:setWeaponStorage("HVLI", 8)
template:setWeaponStorage("Homing", 12)
template:setWeaponStorage("EMP", 4)
variation:setWeaponStorage("Mine", 20)
variation:setDefaultAI ("Minelayer")

variation = template:copy("JASA Monsoon Frigate"):setRecorded(false)
variation:setDescription([[The Monsoon class frigate acted as a well-defended minelayer and was commonly deployed in a defensive role]])

--Jump Corporation

template = ShipTemplate():setName("Ballmer Frigate"):setClass("Frigate", "Ballmer"):setModel("LightCorvetteGrey"):setRecorded(false)
--template:setDescription([[The Jump Corporation's standard Frigate is equipped with a long range narrow beam and some point defense beams. Tough and agile for a frigate]])
template:setRadarTrace("radar_cruiser.png")
--						Arc, Dir, Range, CycleTime, Dmg
template:setBeamWeapon(0, 4,   0, 1400.0, 6.0, 4)
template:setBeamWeapon(1,20,   0, 1200.0, 6.0, 4)
template:setBeamWeapon(2,60,   0, 1000.0, 6.0, 4)
template:setBeamWeapon(3,90,   0,  800.0, 6.0, 4)
template:setHull(120)
template:setShields(70, 70)
template:setWarpSpeed(800)
template:setSpeed(50, 15, 8)
template:setTubes(2, 15.0)
template:setCombatManeuver(200, 150)
template:setWeaponStorage("HVLI", 8)
template:setWeaponStorage("Homing", 8)
template:setWeaponStorage("EMP", 2)

variation = template:copy("JCS Ballmer Frigate"):setRecorded(false)
variation:setDescription([[The Jump Corporation's standard Frigate is equipped with a long range narrow beam and some point defense beams. Tough and agile for a frigate]])

template:setRepairCrewCount(2)
--	(H)oriz, (V)ert	   HC,VC,HS,VS, system    (C)oordinate (S)ize
template:addRoomSystem( 0, 0, 1, 4, "Reactor")
template:addRoomSystem( 1, 0, 1, 1, "JumpDrive")
template:addRoomSystem( 1, 3, 1, 1, "Warp")
template:addRoomSystem( 2, 0, 1, 1, "FrontShield")
template:addRoomSystem( 2, 3, 1, 1, "RearShield")
template:addRoomSystem( 3, 0, 1, 1, "MissileSystem")
template:addRoomSystem( 3, 3, 1, 1, "Impulse")
template:addRoomSystem( 3, 1, 2, 1, "Maneuver")
template:addRoom( 3, 2, 2, 1)
template:addRoomSystem( 5, 1, 2, 2, "Beamweapons")

--(H)oriz, (V)ert H, V, true = horizontal
template:addDoor( 1, 0, false)
template:addDoor( 1, 3, false)
template:addDoor( 2, 0, false)
template:addDoor( 2, 3, false)
template:addDoor( 3, 0, false)
template:addDoor( 3, 3, false)
template:addDoor( 3, 3, true)
template:addDoor( 3, 2, true)
template:addDoor( 5, 1, false)


-- UCN
template = ShipTemplate():setName("UCS Vanguard Frigate"):setClass("Frigate", "Vanguard"):setModel("HeliconCorpBruteClassFrigateBlue")
template:setDescription([[The Vanguard Class Frigate is the workhorse of the UCN. It has a good all-round mix of armaments and is suited to most situations that a ship of its size can reasonably expect to find itself in.]])
template:setRadarTrace("radar_cruiser.png")
template:setHull(100)
template:setShields(100, 100)
template:setWarpSpeed(1000)
template:setSpeed(120, 10, 10)
template:setBeamWeapon(0, 90, -90, 1200, 8, 6)
template:setBeamWeapon(1, 90,  90, 1200, 8, 6)
template:setBeamWeapon(2, 10,  0, 2000, 3, 10)
template:setBeamWeapon(3, 10,  0, 2000, 3, 10)
template:setBeamWeaponDamageType(2,2)
template:setBeamWeaponDamageType(3,3)
template:setTubes(3, 20.0)
template:setWeaponStorage("HVLI", 6)
template:setWeaponStorage("Homing", 20)
template:setTubeDirection(0, 90)
template:setTubeDirection(1, -90)
template:setTubeDirection(2, 0)
template:setTractorBeam(2000, 100)
-- template:setExternalDockClasses("Frigate", "Destroyer")
-- template:setInternalDockClasses("Starfighter")

variation = template:copy("UCS Vanguard Class Frigate"):setType("playership"):setRecorded(false)
variation:setDescription([[The Vanguard Class Frigate is the workhorse of the UCN. It has a good all-round mix of armaments and is suited to most situations that a ship of its size can reasonably expect to find itself in.]])
variation:setShields(150, 150)
variation:setHull(150)
variation:setSpeed(120, 10, 20)
variation:setCombatManeuver(400, 250)
variation:setTubes(2, 40.0)
variation:setWeaponStorage("Homing", 10)
variation:setWeaponStorage("Nuke", 1)
variation:setWeaponStorage("HVLI", 6)
variation:setWeaponStorage("EMP", 4)
variation:setEnergyStorage(1500)

variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
variation:addRoom(2, 2, 2, 1);

variation:addRoomSystem(0, 3, 1, 2, "RearShield");
variation:addRoomSystem(1, 3, 2, 2, "Reactor");
variation:addRoomSystem(3, 3, 2, 2, "Warp");
variation:addRoomSystem(5, 3, 1, 2, "JumpDrive");
variation:addRoom(6, 3, 2, 1);
variation:addRoom(6, 4, 2, 1);
variation:addRoomSystem(8, 3, 1, 2, "FrontShield");

variation:addRoom(2, 5, 2, 1);
variation:addRoomSystem(1, 6, 2, 1, "MissileSystem");
variation:addRoomSystem(1, 7, 2, 1, "Impulse");

variation:addDoor(1, 1, true);
variation:addDoor(2, 2, true);
variation:addDoor(3, 3, true);
variation:addDoor(1, 3, false);
variation:addDoor(3, 4, false);
variation:addDoor(3, 5, true);
variation:addDoor(2, 6, true);
variation:addDoor(1, 7, true);
variation:addDoor(5, 3, false);
variation:addDoor(6, 3, false);
variation:addDoor(6, 4, false);
variation:addDoor(8, 3, false);
variation:addDoor(8, 4, false);
 
--Airlock doors
--variation:addDoor(2, 2, false);
--variation:addDoor(2, 5, false);

template = ShipTemplate():setName("Skirmish Frigate"):setClass("Frigate", "Skirmish"):setModel("HeliconCorpBulkClassFrigateBlue"):setRecorded(false)
template:setDescription([[The Skirmish Class Frigate is the workhorse of the UCN. It has a good all-round mix of armaments and is suited to most situations that a ship of its size can reasonably expect to find itself in.]])
template:setRadarTrace("radar_cruiser.png")
template:setHull(200)
template:setShields(200, 200)
template:setWarpSpeed(1000)
template:setSpeed(125, 14, 25)
template:setBeamWeapon(0, 90, -25, 1500, 6, 8)
template:setBeamWeapon(1, 90,  25, 1500, 6, 8)
template:setBeamWeapon(2, 10,  10, 2000, 3, 10)
template:setBeamWeapon(3, 10,  -10, 2000, 3, 10)
template:setBeamWeaponDamageType(2,2)
template:setBeamWeaponDamageType(3,3)
template:setBeamStation(0,2)
template:setBeamStation(1,2)
template:setBeamStation(2,1)
template:setBeamStation(3,1)
template:setTubes(5, 20.0)
template:setWeaponStorage("HVLI", 6)
template:setWeaponStorage("Homing", 20)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, 0)
template:setTubeDirection(3, 0)
template:setTubeDirection(4, 180)
template:setTubeStation(0,2)
template:setTubeStation(1,2)
template:setTubeStation(2,2)
template:setTubeStation(3,2)
template:setTubeStation(4,2)
template:setTractorBeam(2000, 100)
template:setDockClasses("Starfighter", "Drone", "Frigate")
-- template:setExternalDockClasses("Frigate", "Destroyer")
-- template:setInternalDockClasses("Starfighter")
template:setDocks(2, 1, 1, 1, 1, 3)
template:addDrones("Scout Drone", 1)
template:addDrones("Defence Drone", 2)
template:addDrones("Mine Layer Drone", 2)

variation = template:copy("UCS Skirmish Frigate")
variation:setBeamWeaponTurret(2, 360, 0, 2)
variation:setBeamWeaponTurret(3, 360, 0, 2)

variation = template:copy("UCS Skirmish Class Frigate"):setType("playership"):setRecorded(false)
variation:setDescription([[The Skirmish Class Frigate is the workhorse of the UCN. It has a good all-round mix of armaments and is suited to most situations that a ship of its size can reasonably expect to find itself in.]])
variation:setHull(200)
variation:setSpeed(125, 14, 25)
variation:setCombatManeuver(400, 250)
variation:setWeaponStorage("Homing", 12)
variation:setWeaponStorage("Nuke", 2)
variation:setWeaponStorage("HVLI", 6)
variation:setWeaponStorage("EMP", 6)
variation:setWeaponStorage("Mine", 6)
variation:setEnergyStorage(1500)

variation:weaponTubeDisallowMissle(0, "Mine"):weaponTubeDisallowMissle(1, "Mine")
variation:weaponTubeDisallowMissle(2, "Mine"):weaponTubeDisallowMissle(3, "Mine")
variation:setTubeDirection(4, 180):setWeaponTubeExclusiveFor(4, "Mine")
variation:weaponTubeDisallowMissle(0, "Nuke"):weaponTubeDisallowMissle(1, "Nuke")
variation:weaponTubeDisallowMissle(2, "Nuke"):weaponTubeDisallowMissle(3, "Nuke")
--                       Arc, Dir, Rotate speed
variation:setBeamWeaponTurret(2, 360, 0, 2)
variation:setBeamWeaponTurret(3, 360, 0, 2)


variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
variation:addRoom(2, 2, 2, 1);

variation:addRoomSystem(0, 3, 1, 2, "RearShield");
variation:addRoomSystem(1, 3, 2, 2, "Reactor");
variation:addRoomSystem(3, 3, 2, 2, "Warp");
variation:addRoomSystem(5, 3, 1, 2, "JumpDrive");
variation:addRoom(6, 3, 2, 1);
variation:addRoom(6, 4, 2, 1);
variation:addRoomSystem(8, 3, 1, 2, "FrontShield");

variation:addRoom(2, 5, 2, 1);
variation:addRoomSystem(1, 6, 2, 1, "MissileSystem");
variation:addRoomSystem(1, 7, 2, 1, "Impulse");

variation:addDoor(1, 1, true);
variation:addDoor(2, 2, true);
variation:addDoor(3, 3, true);
variation:addDoor(1, 3, false);
variation:addDoor(3, 4, false);
variation:addDoor(3, 5, true);
variation:addDoor(2, 6, true);
variation:addDoor(1, 7, true);
variation:addDoor(5, 3, false);
variation:addDoor(6, 3, false);
variation:addDoor(6, 4, false);
variation:addDoor(8, 3, false);
variation:addDoor(8, 4, false);
 
--Airlock doors
--variation:addDoor(2, 2, false);
--variation:addDoor(2, 5, false);


--Support: mine layer
--Support: mine sweeper
--Support: science vessel
--Support: deep space recon
--Support: light repair
--Support: resupply

--Brutal Ships

template = ShipTemplate():setName("BRU Ottoia Frigate"):setClass("Frigate", "Ottoia"):setModel("ProgenitorFrigateABlack"):setRecorded(false)	--Black, Grey, Blue, Purple, Red, White
--template:setDescription([[The Ottoia Class Frigate is the most common Brutal Frigate in service, and appears to be loosely based on an old Jump hull fused with some Commonwealth inspired drive systems and Shanghai Pact derived weapons.]])
template:setRadarTrace("radar_cruiser.png")
template:setBeamWeapon(0, 90, 0, 1200, 3, 5)
template:setHull(80)
template:setShields(50, 50)
template:setWarpSpeed(800)
template:setSpeed(60, 8, 10)
template:setTubes(5, 15.0)
template:setWeaponStorage("HVLI", 15)
template:setWeaponStorage("Homing", 15)
template:setWeaponStorage("EMP", 5)
template:setTubeDirection(0,  0)
template:setTubeDirection(1, -1)
template:setTubeDirection(2,  1)
template:setTubeDirection(3, -2)
template:setTubeDirection(4,  2)
template:setDefaultAI('missilevolley')
template:setDockClasses("Starfighter", "Frigate", "Destroyer")
-- template:setExternalDockClasses("Frigate", "Destroyer")
-- template:setInternalDockClasses("Starfighter")

template = ShipTemplate():setName("BRU Ebirah Frigate"):setClass("Frigate", "Ebirah"):setModel("ProgenitorFrigateBBlack"):setRecorded(false)	--Black, Grey, Blue, Purple, Red, White
--template:setDescription([[The Ebirah Class Frigates seem to carry elite fanatical crews who relish risking their lives in borderline suicidal assaults. Their hulls owe a lot to old Shanghai Pact designs, with an apparent JASA technological influence.]])
template:setRadarTrace("radar_cruiser.png")
template:setBeamWeapon(0, 90, 0, 1200, 3, 5)
template:setHull(80)
template:setShields(50, 50)
template:setWarpSpeed(800)
template:setSpeed(60, 8, 10)
template:setTubes(5, 15.0)
template:setWeaponStorage("HVLI", 15)
template:setWeaponStorage("Homing", 15)
template:setWeaponStorage("EMP", 5)
template:setTubeDirection(0,  0)
template:setTubeDirection(1, -1)
template:setTubeDirection(2,  1)
template:setTubeDirection(3, -2)
template:setTubeDirection(4,  2)
template:setDefaultAI('missilevolley')
template:setDockClasses("Starfighter", "Frigate", "Destroyer")
-- template:setExternalDockClasses("Frigate", "Destroyer")
-- template:setInternalDockClasses("Starfighter")