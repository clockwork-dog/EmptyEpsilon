--[[                  Destroyers
Destroyers are the common large ships. Larger then a frigate, smaller then a Cruiser. Their role is generally to escort larger vessels, or to undertake exploration or policing actions.
They generally have 4 or more shield sections. Run with a crew of 20 to 250.
This class generally has jumpdrives or warpdrives. But lack the manouverbility that is seen in frigates.

----------------------------------------------------------]]

--[[----------------------Destroyers----------------------]]

-- COMMONWEALTH

template = ShipTemplate():setName("Talavaar Destroyer"):setClass("Destroyer", "Talavaar"):setModel("LindwurmFighterBlue"):setRecorded(false)
--template:setDescription([[The Talavaar class destroyer is an excellent escort ship when defending larger ships against multiple smaller enemies.]])
template:setRadarTrace("radar_adv_gunship.png")
template:setHull(100)
template:setShields(200, 200, 200, 200)
template:setWarpSpeed(800)
template:setSpeed(30, 3.5, 5)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,100, -20, 1500.0, 6.0, 8)
template:setBeam(1,100,  20, 1500.0, 6.0, 8)
template:setBeam(2,100, 180, 1500.0, 6.0, 8)
template:setTubes(4, 10.0)
template:setWeaponStorage("HVLI", 20)
template:setWeaponStorage("Homing", 4)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, 0)
template:setTubeDirection(3, 0)
template:setDockClasses("Starfighter", "Frigate")

variation = template:copy("UCS Talavaar Class Destroyer"):setType("playership"):setRecorded(false)
variation:setDescription([[The Talavaar class destroyer is an excellent escort ship when defending larger ships against multiple smaller enemies.]])
variation:setShields(200, 200)
variation:setHull(250)
variation:setSpeed(90, 10, 20)
variation:setCombatManeuver(400, 250)
variation:setWeaponStorage("Homing", 12)
variation:setWeaponStorage("Nuke", 2)
variation:setWeaponStorage("Mine", 8)
variation:setWeaponStorage("EMP", 8)
variation:setTubes(5, 8.0) -- Amount of torpedo tubes, and loading time of the tubes.
variation:weaponTubeDisallowMissle(0, "Mine"):weaponTubeDisallowMissle(1, "Mine")
variation:weaponTubeDisallowMissle(2, "Mine"):weaponTubeDisallowMissle(3, "Mine")
variation:setTubeDirection(4, 180):setWeaponTubeExclusiveFor(4, "Mine")
variation:setEnergyStorage(1500)
variation:setRepairCrewCount(3)

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

variation = template:copy("CNS Talavaar Destroyer"):setRecorded(false)
variation:setDescription([[The Talavaar class destroyer was an excellent escort ship when defending larger ships against multiple smaller enemies.]])

variation = template:copy("UCS Talavaar Destroyer")
variation:setDescription([[The Talavaar class destroyer was an excellent escort ship when defending larger ships against multiple smaller enemies. Talavaar class ships were the mainstay of the Commonwealth fleet and a great many were transferred to service in the UCN on its formation. Those Talavaar class that survive have been extensively refurbished - including a full replacement of the notoriously humid ventillation system that caused the Talavaar class's famous interior metal fatigue problem.]])
variation:setShields(200, 200)
variation:setHull(200)
variation:setSpeed(45, 5, 10)
variation:setWeaponStorage("EMP", 8)
variation:setWeaponStorage("Nuke", 2)
 
--Airlock doors
--variation:addDoor(2, 2, false);
--variation:addDoor(2, 5, false);

--European Federation

template = ShipTemplate():setName("Mirabello Destroyer"):setClass("Destroyer", "Mirabello"):setModel("TorpedoDestroyerGreen"):setRecorded(false)
--template:setDescription([[The Mirabello class Destroyer makes for a phenomenal frontal assault ship. Its low speed makes it difficult to position, but when in the right place at the right time, even the strongest shields can't withstand its assault for long.]])
template:setRadarTrace("radar_adv_gunship.png")
template:setHull(200)
template:setShields(450, 350, 150, 150, 350)
template:setWarpSpeed(800)
template:setSpeed(35, 6, 10)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, -10, 2000.0, 8.0, 11)
template:setBeam(1, 60,  10, 2000.0, 8.0, 11)
template:setBeam(2, 60, -20, 1500.0, 8.0, 11)
template:setBeam(3, 60,  20, 1500.0, 8.0, 11)
template:setTubes(4, 8.0)
template:setWeaponStorage("HVLI", 20)
template:setWeaponStorage("Homing", 20)
template:setWeaponStorage("EMP", 20)
template:weaponTubeDisallowMissle(1, "EMP")
template:weaponTubeDisallowMissle(2, "EMP")
template:setTubeDirection(0, -10)
template:setTubeDirection(1, -20)
template:setTubeDirection(2,  10)
template:setTubeDirection(3,  20)

variation = template:copy("EFS Mirabello Destroyer"):setRecorded(false)
variation:setDescription([[The Mirabello class Destroyer makes for a phenomenal frontal assault ship. Its low speed makes it difficult to position, but when in the right place at the right time, even the strongest shields can't withstand its assault for long.]])

variation = template:copy("UCS Mirabello Destroyer")
variation:setDescription([[The Mirabello class Destroyer was a phenomenal frontal assault ship. Its low speed made it difficult to position, but when in the right place at the right time, even the strongest shields could not withstand its assault for long. UCN refurbished Mirabello class ships significantly upgraded the sub-light propulsion and maneuvering systems, largely solving its strategic problems.]])
variation:setShields(200, 200)
variation:setHull(200)
variation:setSpeed(45, 8, 20)
variation:setWeaponStorage("Nuke", 2)
variation:setModel("TorpedoDestroyerBlue")

template = ShipTemplate():setName("Arquebuse Destroyer"):setClass("Destroyer", "Arquebuse"):setModel("MissileCorvetteGreen"):setRecorded(false)
--template:setDescription([[The Arquebuse class Destroyer is fast for its class. It is designed as a linebreaker and has a powerful broadside. It is, however, poorly armoured for a destroyer.]])
template:setRadarTrace("radar_adv_gunship.png")
template:setHull(150)
template:setShields(200, 350, 200, 350)
template:setWarpSpeed(800)
template:setSpeed(90, 20, 20)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, -45, 2500.0, 8.0, 20)
template:setBeam(1, 60,  45, 2500.0, 8.0, 20)
template:setBeam(2, 60, -135, 2500.0, 8.0, 20)
template:setBeam(3, 60,  135, 2500.0, 8.0, 20)
template:setTubes(2, 14.0)
template:setWeaponStorage("HVLI", 20)
template:setWeaponStorage("Homing", 20)
template:setWeaponStorage("EMP", 20)
template:setTubeDirection(0, -90)
template:setTubeDirection(1, 90)

variation = template:copy("EFS Arquebuse Destroyer"):setRecorded(false)
variation:setDescription([[The Arquebuse class Destroyer was fast for its class. It was designed as a linebreaker and had a powerful broadside. It was, however, poorly armoured for a destroyer.]])

-- Jump Corporation

template = ShipTemplate():setName("Musk Destroyer"):setClass("Destroyer", "Musk"):setModel("MultiGunCorvetteGrey"):setRecorded(false)
--template:setDescription([[The Musk class Destroyer Offsets speed for heavy armour and a large array of weapons.]])
template:setRadarTrace("radar_adv_gunship.png")
template:setHull(300)
template:setShields(200, 200, 150, 150)
template:setWarpSpeed(800)
template:setSpeed(35, 6, 10)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, -20, 2000.0, 8.0, 11)
template:setBeam(1, 60,  20, 2000.0, 8.0, 11)
template:setBeam(2, 40, -40, 1500.0, 8.0, 11)
template:setBeam(3, 40,  40, 1500.0, 8.0, 11)
template:setTubes(2, 10.0)
template:setWeaponStorage("HVLI", 6)
template:setWeaponStorage("Homing", 10)
template:setWeaponStorage("EMP", 10)
template:setTubeDirection(0, 70)
template:setTubeDirection(1, -70)

variation = template:copy("JCS Musk Destroyer"):setRecorded(false)
variation:setDescription([[The Musk class Destroyer Offset speed for heavy armour and a large array of weapons.]])

--Shanghai Pact

template = ShipTemplate():setName("Zhengzhou Destroyer"):setClass("Destroyer", "Zhengzhou"):setModel("small_frigate_4"):setRecorded(false)
--template:setDescription([[The Zhengzhou class Destroyer carries a remarkable punch for its weight class.]])
template:setRadarTrace("radar_adv_gunship.png")
template:setHull(200)
template:setShields(250, 250, 150, 150, 250)
template:setWarpSpeed(800)
template:setSpeed(60, 10, 15)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 120, -20, 1500.0, 4.0, 11)
template:setBeam(1, 120,  20, 1500.0, 4.0, 11)
template:setTubes(1, 20.0)
template:setWeaponStorage("HVLI", 10)
template:setWeaponStorage("Homing", 4)
template:setWeaponStorage("EMP", 2)
template:setWeaponStorage("Nuke", 1)

variation = template:copy("SPS Zhengzhou Destroyer"):setRecorded(false)
variation:setDescription([[The Zhengzhou class Destroyer carried a remarkable punch for its weight class.]])

variation = template:copy("UCS Zhengzhou Destroyer")
variation:setDescription([[The Zhengzhou class Destroyer carried a remarkable punch for its weight class.. UCN refurbished Zhengzhou destroyers significantly upgraded the sub-light propulsion and maneuvering systems which were already quite formidable, creating an impressive vessel out of an aging design.]])
variation:setShields(250, 250)
variation:setHull(250)
variation:setSpeed(75, 20, 25)
variation:setWeaponStorage("Nuke", 2)

template = ShipTemplate():setName("Kursk Destroyer"):setClass("Destroyer", "Kursk"):setModel("small_frigate_1"):setRecorded(false)
--template:setDescription([[The Kursk class Destroyer is a brawler of a ship that specialises in creating a beam weapon fighter screen.]])
template:setRadarTrace("radar_adv_gunship.png")
template:setHull(300)
template:setShields(350, 350, 150, 150, 250)
template:setWarpSpeed(800)
template:setSpeed(40, 8, 10)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 80, -20, 1800.0, 4.0, 11)
template:setBeam(1, 80,  20, 1800.0, 4.0, 11)
template:setBeam(2, 80,  -40, 1800.0, 4.0, 11)
template:setBeam(3, 80,  40, 1800.0, 4.0, 11)
template:setTubes(1, 40.0)
template:setWeaponStorage("HVLI", 10)
template:setWeaponStorage("Homing", 6)
template:setWeaponStorage("EMP", 4)

variation = template:copy("SPS Kursk Destroyer"):setRecorded(false)
variation:setDescription([[The Kursk class Destroyer was a brawler of a ship that specialised in creating a beam weapon fighter screen.]])

--JASA

template = ShipTemplate():setName("Chikuma Stealth Destroyer"):setClass("Destroyer", "Chikuma"):setModel("Anna-V"):setRecorded(false)
--template:setDescription([[The Chikuma class Destroyer operates JASA's legendary stealth technology, rendering it all but invisible to RADAR and LIDAR. However, in order to facilitate this it is unable to carry beam weapon systems.]])
template:setRadarTrace("radar_cloak.png")
template:setHull(250)
template:setShields(250, 250, 250, 250)
template:setWarpSpeed(800)
template:setSpeed(60, 10, 15)

template:setTubes(2, 15.0)
template:setWeaponStorage("HVLI", 30)
template:setWeaponStorage("Homing", 30)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 2)

variation = template:copy("JASA Chikuma Stealth Destroyer"):setRecorded(false)
variation:setDescription([[The Chikuma class Destroyer operated JASA's legendary stealth technology, rendering it all but invisible to RADAR and LIDAR. However, in order to facilitate this it was unable to carry beam weapon systems. None of these vessels returned with the Exodus fleet, and all have been assumed lost, along with their unique stealth technology.]])

--Brutal
template = ShipTemplate():setName("BRU Kraken Destroyer"):setClass("Destroyer", "Kraken"):setModel("ProgenitorDestroyerBlack"):setRecorded(false)
--template:setDescription([[The Kraken class Destroyer is an elegant fusion of Commonwealth and Shanghai Pact inspired tech. A dangerous class of vessel that should not be underestimated]])
template:setRadarTrace("radar_adv_gunship.png")
template:setHull(200)
template:setShields(200, 200, 200, 200)
template:setWarpSpeed(800)
template:setSpeed(60, 10, 15)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 120, -20, 1500.0, 4.0, 11)
template:setBeam(1, 120,  20, 1500.0, 4.0, 11)
template:setTubes(1, 20.0)
template:setWeaponStorage("HVLI", 10)
template:setWeaponStorage("Homing", 4)
template:setWeaponStorage("EMP", 2)
--template:setWeaponStorage("Nuke", 1)



-- UCN

template = ShipTemplate():setName("Hoplite Destroyer"):setClass("Destroyer", "Hoplite"):setModel("HeliconCorpBastionClassDestroyerBlue"):setRecorded(false)
template:setDescription([[The Hoplite class destroyer is an excellent escort ship when defending larger ships against multiple smaller enemies.]])
template:setRadarTrace("radar_adv_gunship.png")
template:setHull(250)
template:setShields(200, 200, 200, 200)
template:setWarpSpeed(1000)
template:setSpeed(100, 10, 20)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,100, -30, 1500.0, 6.0, 8)
template:setBeam(1,100,  30, 1500.0, 6.0, 8)
--template:setBeam(2,120, 0, 1500.0, 6.0, 8)
template:setBeam(3,10, 180, 2000, 1.0, 10)
template:setBeam(4,-10, 180, 2000, 1.0, 10)

template:setBeamStation(0,1)
template:setBeamStation(1,1)
--template:setBeamStation(2,1)
template:setBeamStation(3,2)
template:setBeamStation(4,2)
template:setBeamWeaponDamageType(3,2)
template:setBeamWeaponDamageType(4,3)
template:setTubes(5, 10.0)
template:setWeaponStorage("HVLI", 20)
template:setWeaponStorage("Homing", 4)
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
template:setDockClasses("Drone", "Starfighter", "Frigate")
-- template:setExternalDockClasses("Frigate", "Destroyer")
-- template:setInternalDockClasses("Starfighter")
template:setDocks(2, 1, 1, 1, 1, 3)
template:addDrones("Scout Drone", 1)
template:addDrones("Defence Drone", 2)
template:addDrones("Mine Layer Drone", 2)

variation = template:copy("UCS Hoplite Destroyer")
variation:setBeamWeaponTurret( 3, 360, 0, 1)
variation:setBeamWeaponTurret( 4, 360, 0, 1)

variation = template:copy("UCS Hoplite Class Destroyer"):setType("playership"):setRecorded(false)
variation:setDescription([[The Hoplite class destroyer is an excellent escort ship when defending larger ships against multiple smaller enemies.]])
variation:setShields(200, 200)
variation:setHull(250)
variation:setSpeed(100, 10, 20)
variation:setCombatManeuver(400, 250)
variation:setWeaponStorage("Homing", 12)
variation:setWeaponStorage("Nuke", 2)
variation:setWeaponStorage("Mine", 6)
variation:setWeaponStorage("EMP", 8)
variation:setWeaponStorage("HVLI", 8)
variation:weaponTubeDisallowMissle(0, "Mine"):weaponTubeDisallowMissle(1, "Mine")
variation:weaponTubeDisallowMissle(2, "Mine"):weaponTubeDisallowMissle(3, "Mine")
variation:weaponTubeDisallowMissle(0, "Nuke"):weaponTubeDisallowMissle(1, "Nuke")
variation:weaponTubeDisallowMissle(2, "Nuke"):weaponTubeDisallowMissle(3, "Nuke")
variation:setTubeDirection(4, 180):setWeaponTubeExclusiveFor(4, "Mine")
variation:setEnergyStorage(1500)
--                       Arc, Dir, Rotate speed
variation:setBeamWeaponTurret( 3, 360, 0, 1)
variation:setBeamWeaponTurret( 4, 360, 0, 1)


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

--[[-----------------------Support-----------------------]]

-- The weapons-platform is a stationary platform with beam-weapons. It's extremely slow to turn, but it's beam weapons do a huge amount of damage.
-- Smaller ships can dock to this platform to re-supply.
template = ShipTemplate():setName("Defense platform"):setClass("Defensive Platform", "Support"):setModel("space_station_4")
template:setDescription([[This stationary defense platform operates like a station, with docking and resupply functions, but is armed with powerful beam weapons and can slowly rotate. Larger systems often use these platforms to resupply patrol ships.]])
template:setRadarTrace("radartrace_smallstation.png")
template:setHull(150)
template:setShields(120, 120, 120, 120, 120, 120)
template:setSpeed(0, 0.5, 0)
template:setDockClasses("Starfighter", "Frigate")
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 30,   0, 4000.0, 1.5, 20)
template:setBeam(1, 30,  60, 4000.0, 1.5, 20)
template:setBeam(2, 30, 120, 4000.0, 1.5, 20)
template:setBeam(3, 30, 180, 4000.0, 1.5, 20)
template:setBeam(4, 30, 240, 4000.0, 1.5, 20)
template:setBeam(5, 30, 300, 4000.0, 1.5, 20)

-- The weapons-platform is a stationary platform with beam-weapons. It's extremely slow to turn, but it's beam weapons do a huge amount of damage.
-- Smaller ships can dock to this platform to re-supply.
variation = template:copy("JCS Destiny"):setRecorded(false)
variation:setDescription([[This defense platform operates like a station, with docking and resupply functions, but is armed with powerful weapons and is highly mobile. It is suspected that the Jump Corporation have introduced a new type of propulsion drive to this station.]])
template:setRadarTrace("radartrace_smallstation.png")
template:setHull(500)
template:setShields(120, 120, 120, 120, 120, 120)
template:setSpeed(40, 6, 10)
template:setDockClasses("Starfighter", "Frigate")
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 30,   0, 4000.0, 1.5, 2)
template:setBeam(1, 30,  60, 4000.0, 1.5, 2)
template:setBeam(2, 30, 120, 4000.0, 1.5, 2)
template:setBeam(3, 30, 180, 4000.0, 1.5, 2)
template:setBeam(4, 30, 240, 4000.0, 1.5, 2)
template:setBeam(5, 30, 300, 4000.0, 1.5, 2)

--[[----------------------Freighters----------------------]]

for cnt=1,5 do
    template = ShipTemplate():setName("Personnel Freighter " .. cnt):setClass("Corvette", "Freighter"):setModel("transport_1_" .. cnt)
    template:setDescription([[These freighters are designed to transport armed troops, military support personnel, and combat gear.]])
    template:setHull(100)
    template:setShields(50, 50)
    template:setSpeed(60 - 5 * cnt, 6, 10)
    template:setRadarTrace("radar_transport.png")
	template:setDockClasses("Starfighter", "Frigate", "Destroyer")
    
    if cnt > 2 then
        variation = template:copy("Personnel Jump Freighter " .. cnt)
        variation:setJumpDrive(true)
    end

    template = ShipTemplate():setName("Goods Freighter " .. cnt):setClass("Corvette", "Freighter"):setModel("transport_2_" .. cnt)
    template:setDescription([[Cargo freighters haul large loads of cargo across long distances on impulse power. Their cargo bays include climate control and stabilization systems that keep the cargo in good condition.]])
    template:setHull(100)
    template:setShields(50, 50)
    template:setSpeed(60 - 5 * cnt, 6, 10)
    template:setRadarTrace("radar_transport.png")
	template:setDockClasses("Starfighter", "Frigate", "Destroyer")
    
    if cnt > 2 then
        variation = template:copy("Goods Jump Freighter " .. cnt)
        variation:setJumpDrive(true)
    end
    
    template = ShipTemplate():setName("Garbage Freighter " .. cnt):setClass("Corvette", "Freighter"):setModel("transport_3_" .. cnt)
    template:setDescription([[These freighters are specially designed to haul garbage and waste. They are fitted with a trash compactor and fewer stabilzation systems than cargo freighters.]])
    template:setHull(100)
    template:setShields(50, 50)
    template:setSpeed(60 - 5 * cnt, 6, 10)
    template:setRadarTrace("radar_transport.png")
	template:setDockClasses("Starfighter", "Frigate", "Destroyer")
    
    if cnt > 2 then
        variation = template:copy("Garbage Jump Freighter " .. cnt)
        variation:setJumpDrive(true)
    end

    template = ShipTemplate():setName("Equipment Freighter " .. cnt):setClass("Corvette", "Freighter"):setModel("transport_4_" .. cnt)
    template:setDescription([[Equipment freighters have specialized environmental and stabilization systems to safely carry delicate machinery and complex instruments.]])
    template:setHull(100)
    template:setShields(50, 50)
    template:setSpeed(60 - 5 * cnt, 6, 10)
    template:setRadarTrace("radar_transport.png")
	template:setDockClasses("Starfighter", "Frigate", "Destroyer")
    
    if cnt > 2 then
        variation = template:copy("Equipment Jump Freighter " .. cnt)
        variation:setJumpDrive(true)
    end

    template = ShipTemplate():setName("Fuel Freighter " .. cnt):setClass("Corvette", "Freighter"):setModel("transport_5_" .. cnt)
    template:setDescription([[Fuel freighters have massive tanks for hauling fuel, and delicate internal sensors that watch for any changes to their cargo's potentially volatile state.]])
    template:setHull(100)
    template:setShields(50, 50)
    template:setSpeed(60 - 5 * cnt, 6, 10)
    template:setRadarTrace("radar_transport.png")
	template:setDockClasses("Starfighter", "Frigate", "Destroyer")
    
    if cnt > 2 then
        variation = template:copy("Fuel Jump Freighter " .. cnt)
        variation:setJumpDrive(true)
    end
end

template = ShipTemplate():setName("Jump Carrier"):setClass("Corvette", "Freighter"):setModel("transport_4_2"):setRecorded(false)
template:setDescription([[The Jump Carrier is a specialized Freighter. It does not carry any cargo, as it's cargo bay is taken up by a specialized jump drive and the energy storage required to run this jump drive.
It is designed to carry other ships deep into space. So it has special docking parameters, allowing other ships to attach themselves to this ship.]])
template:setHull(100)
template:setShields(50, 50)
template:setSpeed(50, 6, 10)
template:setRadarTrace("radar_transport.png")
template:setJumpDrive(true)
template:setJumpDriveRange(5000, 100 * 50000) --The jump carrier can jump a 100x longer distance then normal jump drives.
template:setDockClasses("Starfighter", "Frigate", "Destroyer")
--template:setSharesEnergyWithDocked(true)

variation = template:copy("Benedict"):setType("playership"):setClass("Corvette","Freighter/Carrier"):setRecorded(false)
variation:setDescription("Benedict is an improved version of the Jump Carrier")
variation:setShields(70, 70)
variation:setHull(200)
variation:setSpeed(60, 6, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
variation:setBeam(0, 10,   0, 1500.0, 6.0, 4)
variation:setBeam(1, 10, 180, 1500.0, 6.0, 4)
--								 Arc, Dir, Rotate speed
variation:setBeamWeaponTurret( 0, 90,   0, 6)
variation:setBeamWeaponTurret( 1, 90, 180, 6)
variation:setCombatManeuver(400, 250)
variation:setJumpDriveRange(5000, 90000) 
variation:setEnergyStorage(1500)

variation:setRepairCrewCount(6)
variation:addRoomSystem(3,0,2,3, "Reactor")
variation:addRoomSystem(3,3,2,3, "Warp")
variation:addRoomSystem(6,0,2,3, "JumpDrive")
variation:addRoomSystem(6,3,2,3, "MissileSystem")
variation:addRoomSystem(5,2,1,2, "Maneuver")
variation:addRoomSystem(2,2,1,2, "RearShield")
variation:addRoomSystem(0,1,2,4, "Beamweapons")
variation:addRoomSystem(8,2,1,2, "FrontShield")
variation:addRoomSystem(9,1,2,4, "Impulse")

variation:addDoor(3, 3, true)
variation:addDoor(6, 3, true)
variation:addDoor(5, 2, false)
variation:addDoor(6, 3, false)
variation:addDoor(3, 2, false)
variation:addDoor(2, 3, false)
variation:addDoor(8, 2, false)
variation:addDoor(9, 3, false)

var2 = variation:copy("Kiriya"):setRecorded(false)
var2:setDescription("Kiriya is an improved warp drive version of the Jump Carrier")
--                  Arc, Dir, Range, CycleTime, Dmg
var2:setBeam(0, 10,   0, 1500.0, 6.0, 4)
var2:setBeam(1, 10, 180, 1500.0, 6.0, 4)
--								 Arc, Dir, Rotate speed
var2:setBeamWeaponTurret( 0, 90,   0, 6)
var2:setBeamWeaponTurret( 1, 90, 180, 6)
var2:setJumpDrive(false)
var2:setWarpSpeed(750)
