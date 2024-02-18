--[[                 Cruisers
Cruisers are ships of the line. They are the mainstay of the fleet.
They are so large and uncommon that every type is pretty much their own subclass.
They usually come with 4 or more shield sections, require a crew of 50+

Think: Enterprise
----------------------------------------------------------]]

--Commonwealth
template = ShipTemplate():setName("Mohondas Cruiser"):setClass("Cruiser", "Mohondas"):setModel("AdlerLongRangeScoutBlue"):setRecorded(false)
--template:setDescription([[The Mohondas class cruiser is the mainstay of the commonwealth fleet and a solid ship of the line. Most bridge officers are likely to spend at least some time on a Mohondas over the course of their career.]])
template:setRadarTrace("radar_blockade.png")
template:setHull(500)
template:setShields(450, 450, 450, 450)
template:setWarpSpeed(800)
template:setSpeed(30, 3, 4)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,100, -20, 2500.0, 6.0, 15)
template:setBeam(1,100,  20, 2500.0, 6.0, 15)
template:setBeam(2,100, 160, 2000.0, 6.0, 12)
template:setBeam(3,100, -160, 2000.0, 6.0, 12)
template:setTubes(6, 10.0)
template:setWeaponStorage("HVLI", 20)
template:setWeaponStorage("Homing", 40)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 4)
template:setTubeDirection(0, -10)
template:setTubeDirection(1, -10)
template:setTubeDirection(2,  10)
template:setTubeDirection(3,  10)
template:setTubeDirection(4,  40)
template:setTubeDirection(5, -40)
template:setDockClasses("Starfighter", "Frigate", "Destroyer")
template:setSharesEnergyWithDocked(true)

variation = template:copy("CNS Mohondas Cruiser"):setRecorded(false)
variation:setDescription([[The Mohondas class cruiser was the mainstay of the commonwealth fleet and a solid ship of the line. Most bridge officers were likely to spend at least some time on a Mohondas over the course of their career.]])

variation = template:copy("UCS Mohondas Cruiser")
variation:setDescription([[The Mohondas class cruiser was the main Commonwealth ship of the line. UCN refurbished Mohondas Cruisers made an already solid ship even better, creating an impressive vessel out of an aging design.]])
variation:setShields(500, 500)
variation:setHull(600)
variation:setSpeed(40, 5, 8)


variation = template:copy("CNS Mohondas Class Cruiser"):setType("playership"):setRecorded(false)
variation:setDescription([[The Mohondas class cruiser is the mainstay of the commonwealth fleet and a solid ship of the line. Most bridge officers are likely to spend at least some time on a Mohondas over the course of their career.]])
variation:setCombatManeuver(400, 250)
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

--European Federation

template = ShipTemplate():setName("Seydlitz Cruiser"):setClass("Cruiser", "Seydlitz"):setModel("LightDestroyerGreen"):setRecorded(false)
--template:setDescription([[The Seydlitz class Cruiser is a formidable ship of the line. Made with the finest European Federation technology, its design is unrivalled. In the right hands it is a devestating weapon.]])
template:setRadarTrace("radar_blockade.png")
template:setHull(550)
template:setShields(400, 350, 400, 350)
template:setWarpSpeed(800)
template:setSpeed(35, 4, 4.5)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 100, -10, 2000.0, 8.0, 12)
template:setBeam(1, 100,  10, 2000.0, 8.0, 12)
template:setBeam(2, 45, -20, 2500.0, 8.0, 15)
template:setBeam(3, 45,  20, 2500.0, 8.0, 15)
template:setTubes(4, 8.0)
template:setWeaponStorage("HVLI", 30)
template:setWeaponStorage("Homing", 40)
template:setWeaponStorage("EMP", 30)
template:setWeaponStorage("Nuke", 2)
template:weaponTubeDisallowMissle(1, "EMP")
template:weaponTubeDisallowMissle(2, "EMP")
template:setTubeDirection(0, -10)
template:setTubeDirection(1, -20)
template:setTubeDirection(2,  10)
template:setTubeDirection(3,  20)
template:setDockClasses("Starfighter", "Frigate", "Destroyer")
template:setSharesEnergyWithDocked(true)

variation = template:copy("EFS Seydlitz Cruiser"):setRecorded(false)
variation:setDescription([[The Seydlitz class Cruiser was a formidable ship of the line. Made with the finest European Federation technology, its design was unrivalled. In the right hands it was a devestating weapon.]])

variation = template:copy("UCS Seydlitz Cruiser")
variation:setDescription([[The Seydlitz class Cruiser was a formidable ship of the line. Made with the finest European Federation technology, in the right hands it was a devestating weapon. Those that were transferred to the UCN only required minor upgrades to keep pace with technological change - a testament to the original design.]])
variation:setShields(500, 500)
variation:setHull(600)
variation:setSpeed(40, 6, 8)
variation:setModel("LightDestroyerBlue")


--Jump Corporation

template = ShipTemplate():setName("Zuckerberg Cruiser"):setClass("Cruiser", "Zuckerberg"):setModel("LaserCorvetteGrey"):setRecorded(false)
--template:setDescription([[The Zuckerberg class Cruiser can go toe-to-toe with any other ship of its class, but has little that makes it stand out from the crowd. It is a solid ship of the line, but is unlikely to cover itself in glory on its own.]])
template:setRadarTrace("radar_blockade.png")
template:setHull(450)
template:setShields(400, 350, 400, 350)
template:setWarpSpeed(800)
template:setSpeed(35, 5, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 80, -20, 2000.0, 8.0, 15)
template:setBeam(1, 80,  20, 2000.0, 8.0, 15)
template:setBeam(2, 120, -90, 2500.0, 6.0, 12)
template:setBeam(3, 120,  90, 2500.0, 6.0, 12)
template:setTubes(4, 10.0)
template:setWeaponStorage("HVLI", 12)
template:setWeaponStorage("Homing", 40)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 2)
template:setTubeDirection(0, 90)
template:setTubeDirection(1, -90)
template:setTubeDirection(2, -40)
template:setTubeDirection(3, -40)
template:setDockClasses("Starfighter", "Frigate", "Destroyer")
template:setSharesEnergyWithDocked(true)

variation = template:copy("JCS Zuckerberg Cruiser"):setRecorded(false)
variation:setDescription([[The Zuckerberg class Cruiser could go toe-to-toe with any other ship of its class, but had little to makes it stand out from the crowd. It was a solid ship of the line, but was unlikely to cover itself in glory on its own.]])


--Shanghai Pact

template = ShipTemplate():setName("Zedong Cruiser"):setClass("Cruiser", "Zedong"):setModel("small_frigate_5"):setRecorded(false)
--template:setDescription([[The Zedong class Cruisers are a powerful ship of the line, combining exceptional speed for their class with formidable close-range firepower.]])
template:setRadarTrace("radar_blockade.png")
template:setHull(550)
template:setShields(400, 400, 400, 400, 400, 400)
template:setWarpSpeed(800)
template:setSpeed(40, 8, 12)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, -20, 2500.0, 4.0, 18)
template:setBeam(1, 60,  20, 2500.0, 4.0, 18)
template:setBeam(2, 100, -20, 2000.0, 3.0, 12)
template:setBeam(3, 100,  20, 2000.0, 3.0, 12)
template:setTubes(2, 15.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 2)
template:setDockClasses("Starfighter", "Frigate", "Destroyer")
template:setSharesEnergyWithDocked(true)

variation = template:copy("SPS Zedong Cruiser"):setRecorded(false)
variation:setDescription([[The Zedong class Cruisers are a powerful ship of the line, combining exceptional speed for their class with formidable close-range firepower.]])

variation = template:copy("UCS Zedong Cruiser")
variation:setDescription([[The Zedong class Cruiser suited the fighting style of the Shanghai Pact Admiralty very well. It was designed to close quickly and deal immense amounts of close range damage. Those transferred to the UCN have retained their speed and close range punch, but have a few more long-range options to suit a more cautious approach.]])
variation:setShields(500, 500)
variation:setHull(600)
variation:setSpeed(50, 12, 18)
variation:setWeaponStorage("Homing", 20)

--JASA
template = ShipTemplate():setName("Shasta Cruiser"):setClass("Cruiser", "Shasta"):setModel("Ghost"):setRecorded(false)
--template:setDescription([[Named after a formidable Mountain, the Shasta class Crusier is an unassailable foe.]])
template:setRadarTrace("radar_blockade.png")
template:setHull(500)
template:setShields(450, 450, 450, 450)
template:setWarpSpeed(800)
template:setSpeed(40, 6, 4)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,100, -20, 2500.0, 6.0, 15)
template:setBeam(1,100,  20, 2500.0, 6.0, 15)
template:setBeam(2,100, 160, 2000.0, 6.0, 12)
template:setBeam(3,100, -160, 2000.0, 6.0, 12)
template:setTubes(4, 10.0)
template:setWeaponStorage("HVLI", 10)
template:setWeaponStorage("Homing", 40)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 4)
template:setDockClasses("Starfighter", "Frigate", "Destroyer")
template:setSharesEnergyWithDocked(true)

variation = template:copy("JASA Shasta Cruiser"):setRecorded(false)
variation:setDescription([[Named after a formidable Mountain, the Shasta class Crusier is an unassailable foe.]])

variation = template:copy("UCS Shasta Cruiser")
variation:setDescription([[Only a handful of Shasta Class Cruisers returned from the Exodus, and most were in poor condition. The UCN salvaged the few they could and returned them to service, but they are notorious for problems with their internal systems. Most were consigned to rear echelon duties before being mothballed.]])
variation:setShields(500, 500)
variation:setHull(600)
variation:setSpeed(45, 8, 5)


template = ShipTemplate():setName("Mississippi Stealth Cruiser"):setClass("Cruiser", "Mississippi"):setModel("Morena"):setRecorded(false)
--template:setDescription([[The Mississippi class Cruiser is one of JASA's stealth ships. Largely able to avoid RADAR and LIDAR detection. its aim is to deliver a deadly missile payload from close range.]])
template:setRadarTrace("radar_cloak.png")
template:setHull(300)
template:setShields(250, 250, 250, 250)
template:setWarpSpeed(800)
template:setSpeed(60, 10, 15)
template:setTubes(3, 8.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("Homing", 40)
template:setWeaponStorage("EMP", 30)
template:setWeaponStorage("Nuke", 4)

variation = template:copy("JASA Mississippi Cruiser"):setRecorded(false)
variation:setDescription([[The limited records that survived the exodus indicate that only a handful of the Mississippi class Cruiser were ever built. One of JASA's fabled stealth ships, it was largely able to avoid RADAR and LIDAR detection. None are believed to have survived.]])

--Brutal
template = ShipTemplate():setName("BRU Scylla Cruiser"):setClass("Cruiser", "Scylla"):setModel("ProgenitorCruiserBlack"):setRecorded(false)
template:setDescription([[The Scylla class cruiser is the mainstay of the Brutal fleet. Scyllas have remarkable destructive power and appear to be based on a fusion of Jasa and Shanghai Pact technology with some Commonwealth influences.]])
template:setRadarTrace("radar_blockade.png")
template:setHull(500)
template:setShields(450, 450, 450, 450)
template:setWarpSpeed(800)
template:setSpeed(35, 5, 6)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,100, -20, 2500.0, 6.0, 15)
template:setBeam(1,100,  20, 2500.0, 6.0, 15)
template:setBeam(2,100, 160, 2000.0, 6.0, 12)
template:setBeam(3,100, -160, 2000.0, 6.0, 12)
template:setTubes(4, 9.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 2)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, 0)
template:setTubeDirection(3, 0)

template:setDockClasses("Starfighter", "Frigate", "Destroyer")
template:setSharesEnergyWithDocked(true)


template = ShipTemplate():setName("BRU Charybdis Battlecruiser"):setClass("Cruiser", "Charybdis"):setModel("ProgenitorBattlecruiserBlack"):setRecorded(false)
template:setDescription([[The Charybdis class Battlecruiser does not appear to have been built in large numbers, which is fortunate for the UCN as it is a powerhouse of destruction. It has the speed and maneuverability of the smaller Scylla class, with armaments akin to the heavier Jormungandr class. Thankfully it is rare to see more than one at a time.]])
template:setRadarTrace("radar_battlecruiser.png")
template:setHull(500)
template:setShields(450, 450, 450, 450)
template:setWarpSpeed(800)
template:setSpeed(35, 4, 6)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,100, -20, 2500.0, 6.0, 15)
template:setBeam(1,100,  20, 2500.0, 6.0, 15)
template:setBeam(2,100, 160, 2000.0, 6.0, 12)
template:setBeam(3,100, -160, 2000.0, 6.0, 12)
template:setTubes(6, 8.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 4)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, 0)
template:setTubeDirection(3, 0)
template:setTubeDirection(4, 45)
template:setTubeDirection(5, -45)
template:setDockClasses("Starfighter", "Frigate", "Destroyer")
-- template:setExternalDockClasses("Frigate", "Destroyer")
-- template:setInternalDockClasses("Starfighter")
template:setSharesEnergyWithDocked(true)

--UCN
template = ShipTemplate():setName("Sword Cruiser"):setClass("Cruiser", "Sword"):setModel("HeliconCorpNorasClassCruiserBlue"):setRecorded(false)
template:setDescription([[The Sword class cruiser is the mainstay of the confederation fleet and a solid ship of the line. Most bridge officers are likely to spend at least some time on a Sword over the course of their career.]])
template:setRadarTrace("radar_blockade.png")
template:setHull(500)
template:setShields(450, 450, 450, 450)
template:setSpeed(60, 8, 10)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,120, -90, 2500.0, 3.0, 10)
template:setBeam(1,120,  90, 2500.0, 3.0, 10)
template:setBeam(2,10, 90, 2000.0, 6.0, 15)
template:setBeam(3,10, -90, 2000.0, 6.0, 15)
template:setBeam(4,120, -90, 2000.0, 6.0, 15)
template:setBeam(5,120,  90, 2000.0, 6.0, 15)
template:setBeamStation(0,1)
template:setBeamStation(1,1)
template:setBeamStation(2,2)
template:setBeamStation(3,2)
template:setBeamStation(4,1)
template:setBeamStation(5,1)
template:setBeamWeaponDamageType(0,2)
template:setBeamWeaponDamageType(1,2)
template:setTubes(6, 8.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 6)
template:setTubeStation(0,2)
template:setTubeStation(1,2)
template:setTubeStation(2,2)
template:setTubeStation(3,2)
template:setTubeStation(4,2)
template:setTubeStation(5,2)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, 0)
template:setTubeDirection(3, 0)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, -90)
template:setDockClasses("Starfighter", "Frigate", "Destroyer")
-- template:setExternalDockClasses("Frigate", "Destroyer")
-- template:setInternalDockClasses("Starfighter")
template:setSharesEnergyWithDocked(true)
template:setDefaultAI('missilevolley')

variation = template:copy("UCS Sword Cruiser")
template:setWarpSpeed(1000)


variation = template:copy("UCS Sword Class Cruiser"):setType("playership"):setRecorded(false)
variation:setWarpSpeed(1000)
variation:setDescription([[The Sword class cruiser is the mainstay of the confederation fleet and a solid ship of the line. Most bridge officers are likely to spend at least some time on a Sword class over the course of their career.]])
variation:setCombatManeuver(400, 250)
variation:setBeamWeaponTurret( 2, 120, 90, 1)
variation:setBeamWeaponTurret( 3, 120, -90, 1)
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

template = ShipTemplate():setName("Colony Battlecruiser"):setClass("Cruiser", "Colony"):setModel("HeliconCorpChroneClassBattlecruiserBlue"):setRecorded(false)
template:setDescription([[The Colony class Battlecruiser is a fast, heavy hitting beast of a ship. It has the speed and maneuverability of a modern cruiser coupled with the punch of a battleship. While it may not have the shielding or durability to go toe-to-toe with battleship sized vessels, it can deliver a knock-out punch to an unprepared foe.]])
template:setRadarTrace("radar_battlecruiser.png")
template:setHull(500)
template:setShields(450, 450, 450, 450)
template:setSpeed(40, 6, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,120, -90, 2500.0, 3.0, 15)
template:setBeam(1,120,  90, 2500.0, 3.0, 15)
template:setBeam(2,10, 90, 2000.0, 6.0, 20)
template:setBeam(3,10, -90, 2000.0, 6.0, 20)
template:setBeam(4,120, -90, 2000.0, 6.0, 15)
template:setBeam(5,120,  90, 2000.0, 6.0, 15)
template:setBeamStation(0,1)
template:setBeamStation(1,1)
template:setBeamStation(2,2)
template:setBeamStation(3,2)
template:setBeamStation(4,1)
template:setBeamStation(5,1)
template:setBeamWeaponDamageType(0,2)
template:setBeamWeaponDamageType(1,2)
template:setTubes(6, 8.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 6)
template:setTubeStation(0,2)
template:setTubeStation(1,2)
template:setTubeStation(2,2)
template:setTubeStation(3,2)
template:setTubeStation(4,2)
template:setTubeStation(5,2)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, 0)
template:setTubeDirection(3, 0)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, -90)
template:setDockClasses("Starfighter", "Frigate", "Destroyer")
-- template:setExternalDockClasses("Frigate", "Destroyer")
-- template:setInternalDockClasses("Starfighter")
template:setSharesEnergyWithDocked(true)
template:setDefaultAI('missilevolley')

variation = template:copy("UCS Colony Battlecruiser")
template:setWarpSpeed(1000)


variation = template:copy("UCS Colony Class Battlecruiser"):setType("playership"):setRecorded(false)
variation:setWarpSpeed(1000)
variation:setDescription([[The Colony class Battlecruiser is a fast, heavy hitting beast of a ship. It has the speed and maneuverability of a modern cruiser coupled with the punch of a battleship. While it may not have the shielding or durability to go toe-to-toe with battleship sized vessels, it can deliver a knock-out punch to an unprepared foe.]])
variation:setCombatManeuver(400, 250)
variation:setBeamWeaponTurret( 2, 120, 90, 1)
variation:setBeamWeaponTurret( 3, 120, -90, 1)
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