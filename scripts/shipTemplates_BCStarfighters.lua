--[[               Starfighters
Starfighters are single to 3 person small ships. These are most commonly used as light firepower roles.
They are common in larger groups. And need a close by station or support ship, as they lack long time life support.
It's rare to see starfighters with more then 1 shield section.

One of the most well known starfighters at earth is the X-Wing.

Starfighters come in 3 subclasses:
* Interceptors: Fast, low on firepower, high on manouverability
* Gunship: Equiped with more weapons, but hands in maneuverbility because of it.
* Bomber: Slowest of all starfighters, but pack a large punch in a small package. Usually come without any lasers, but the largers bombers have been known to deliver nukes.
----------------------------------------------------------]]
template = ShipTemplate():setName("Interceptor"):setClass("Starfighter", "Interceptor"):setModel("small_fighter_1")
template:setRadarTrace("radar_fighter.png")
template:setDescription([[The Interceptor is previous generation snub fighter common amongst pirates and other troublemakers.]])
template:setHull(30)
template:setShields(30)
template:setWarpSpeed(800)
template:setSpeed(120, 30, 25)
template:setDefaultAI('fighter')
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 30, 0, 700.0, 3.0, 5.0)

variation = variation:copy("Interceptor Starfighter"):setType("playership"):setRecorded(false)
variation:setDescription([[The Interceptor is a snub fighter common to most faction's navies.]])
variation:setHull(70)
variation:setShields(60)
variation:setSpeed(125, 32, 40)
variation:setCombatManeuver(600, 0)
variation:setBeam(0, 30, 5, 900.0, 4.0, 2.5)
variation:setEnergyStorage(400)

variation:setRepairCrewCount(1)
variation:addRoomSystem(3, 0, 1, 1, "Maneuver");
variation:addRoomSystem(1, 0, 2, 1, "BeamWeapons");

variation:addRoomSystem(0, 1, 1, 2, "RearShield");
variation:addRoomSystem(1, 1, 2, 2, "Reactor");
variation:addRoomSystem(3, 1, 2, 1, "Warp");
variation:addRoomSystem(3, 2, 2, 1, "JumpDrive");
variation:addRoomSystem(5, 1, 1, 2, "FrontShield");

variation:addRoomSystem(1, 3, 2, 1, "MissileSystem");
variation:addRoomSystem(3, 3, 1, 1, "Impulse");

variation:addDoor(2, 1, true);
variation:addDoor(3, 1, true);
variation:addDoor(1, 1, false);
variation:addDoor(3, 1, false);
variation:addDoor(3, 2, false);
variation:addDoor(3, 3, true);
variation:addDoor(2, 3, true);
variation:addDoor(5, 1, false);
variation:addDoor(5, 2, false);

template = ShipTemplate():setName("Gunship"):setClass("Starfighter", "Gunship"):setModel("space_frigate_6")
template:setRadarTrace("radar_fighter.png")
template:setDescription([[The Gunship is a previous generation space superiority fighter once ubiquitous amongst the various factional stellar navies, now only common amongst troublemakers.]])
template:setHull(40)
template:setShields(40)
template:setWarpSpeed(800)
template:setSpeed(80, 28, 25)
template:setBeam(0, 35, 0, 800, 5.0, 5.0)
template:setBeam(1, 70, 30, 600, 5.0, 5.0)
template:setBeam(2, 70, -35, 600, 5.0, 5.0)
template:setTubes(1, 15.0)
template:setWeaponStorage("HVLI", 8)
template:setDefaultAI('fighter')

variation = template:copy("Gunship Starfighter"):setType("playership"):setRecorded(false)
variation:setHull(90)
variation:setWeaponStorage("HVLI", 8)
variation:setShields(60)
variation:setCombatManeuver(600, 0)
variation:setEnergyStorage(400)

variation:setRepairCrewCount(1)
variation:addRoomSystem(3, 0, 1, 1, "Maneuver");
variation:addRoomSystem(1, 0, 2, 1, "BeamWeapons");

variation:addRoomSystem(0, 1, 1, 2, "RearShield");
variation:addRoomSystem(1, 1, 2, 2, "Reactor");
variation:addRoomSystem(3, 1, 2, 1, "Warp");
variation:addRoomSystem(3, 2, 2, 1, "JumpDrive");
variation:addRoomSystem(5, 1, 1, 2, "FrontShield");

variation:addRoomSystem(1, 3, 2, 1, "MissileSystem");
variation:addRoomSystem(3, 3, 1, 1, "Impulse");

variation:addDoor(2, 1, true);
variation:addDoor(3, 1, true);
variation:addDoor(1, 1, false);
variation:addDoor(3, 1, false);
variation:addDoor(3, 2, false);
variation:addDoor(3, 3, true);
variation:addDoor(2, 3, true);
variation:addDoor(5, 1, false);
variation:addDoor(5, 2, false);

template = ShipTemplate():setName("Bomber"):setClass("Starfighter", "Bomber"):setModel("dark_fighter_6")
template:setRadarTrace("radar_fighter.png")
template:setDescription([[The Bomber is a previous generation starfighter designed to attack capital ships. Its goal is to fly in, destroy its target, and fly out or be destroyed. Bombers were once ubiquitous across all stellar navies, and are now occasionally found operated by pirates with lofty ambitions.]])
template:setHull(30)
template:setShields(60)
template:setWarpSpeed(800)
template:setSpeed(70, 15, 25)
template:setTubes(3, 15.0)
template:setWeaponStorage("HVLI", 12)
template:setWeaponStorage("Homing", 8)
template:setTubeDirection(1, 1):setWeaponTubeExclusiveFor(1, "HVLI")
template:setTubeDirection(2,-1):setWeaponTubeExclusiveFor(2, "HVLI")

variation = template:copy("Bomber Starfighter"):setType("playership"):setRecorded(false)
variation:setHull(75)
variation:setShields(40)
variation:setSpeed(70, 15, 25)
variation:setTubes(3, 10.0)
variation:setWeaponStorage("HVLI", 12)
variation:setWeaponStorage("Homing", 6)
--                  Arc, Dir, Range, CycleTime, Dmg
variation:setBeam(0, 10, 180, 700, 6.0, 5.0)
--								  Arc, Dir, Rotate speed
variation:setBeamWeaponTurret( 0, 270, 180, 4)
variation:setCombatManeuver(250, 150)
variation:setEnergyStorage(400)

variation:setRepairCrewCount(1)
variation:addRoomSystem(0,0,1,3,"RearShield")
variation:addRoomSystem(1,1,3,1,"MissileSystem")
variation:addRoomSystem(4,1,2,1,"Beamweapons")
variation:addRoomSystem(3,2,2,1,"Reactor")
variation:addRoomSystem(2,3,2,1,"Warp")
variation:addRoomSystem(4,3,5,1,"JumpDrive")
variation:addRoomSystem(0,4,1,3,"Impulse")
variation:addRoomSystem(3,4,2,1,"Maneuver")
variation:addRoomSystem(1,5,3,1,"FrontShield")
variation:addRoom(4,5,2,1)

variation:addDoor(1,1,false)
variation:addDoor(1,5,false)
variation:addDoor(3,2,true)
variation:addDoor(4,2,true)
variation:addDoor(3,3,true)
variation:addDoor(4,3,true)
variation:addDoor(3,4,true)
variation:addDoor(4,4,true)
variation:addDoor(3,5,true)
variation:addDoor(4,5,true)

--UCN Starfighters

template = ShipTemplate():setName("UCN Shuttle"):setClass("Starfighter", "Shuttle"):setModel("SpaceshipEscapePodBlue")
template:setRadarTrace("radar_shuttle.png")
template:setDescription([[The UCN Standard Shuttlecraft is the ship-to-shore workhorse of the Navy]])
template:setHull(100)
template:setWarpSpeed(1000)
template:setShields(100, 100)
template:setSpeed(100, 28, 35)
template:setBeam(0, 35, 0, 1200, 5.0, 5.0)
template:setBeam(1, 70, 30, 1200, 5.0, 5.0)
template:setBeam(2, 70, -35, 1200, 5.0, 5.0)
template:setTubes(2, 15.0)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 180)
template:weaponTubeDisallowMissle(0, "Mine")
template:weaponTubeDisallowMissle(1, "HVLI"):weaponTubeDisallowMissle(1, "Homing")
template:setWeaponStorage("Homing", 8)
template:setWeaponStorage("Mine", 8)
template:setDefaultAI('fighter')
--template:setTractorBeam(2000, 100)

variation = template:copy("UCS Havock Shuttle"):setType("playership"):setRecorded(false)
variation:setWeaponStorage("HVLI", 8)
variation:setCombatManeuver(600, 0)
variation:setEnergyStorage(500)

variation:setRepairCrewCount(2)
variation:addRoomSystem(3, 0, 1, 1, "Maneuver");
variation:addRoomSystem(1, 0, 2, 1, "BeamWeapons");

variation:addRoomSystem(0, 1, 1, 2, "RearShield");
variation:addRoomSystem(1, 1, 2, 2, "Reactor");
variation:addRoomSystem(3, 1, 2, 1, "Warp");
variation:addRoomSystem(3, 2, 2, 1, "JumpDrive");
variation:addRoomSystem(5, 1, 1, 2, "FrontShield");

variation:addRoomSystem(1, 3, 2, 1, "MissileSystem");
variation:addRoomSystem(3, 3, 1, 1, "Impulse");

variation:addDoor(2, 1, true);
variation:addDoor(3, 1, true);
variation:addDoor(1, 1, false);
variation:addDoor(3, 1, false);
variation:addDoor(3, 2, false);
variation:addDoor(3, 3, true);
variation:addDoor(2, 3, true);
variation:addDoor(5, 1, false);
variation:addDoor(5, 2, false);

variation = template:copy("UCS Takanami Shuttle"):setType("playership"):setModel("SpaceshipEscapePodRed"):setRecorded(false)
variation:setWeaponStorage("HVLI", 8)
variation:setCombatManeuver(600, 0)
variation:setEnergyStorage(500)

variation:setRepairCrewCount(2)
variation:addRoomSystem(3, 0, 1, 1, "Maneuver");
variation:addRoomSystem(1, 0, 2, 1, "BeamWeapons");

variation:addRoomSystem(0, 1, 1, 2, "RearShield");
variation:addRoomSystem(1, 1, 2, 2, "Reactor");
variation:addRoomSystem(3, 1, 2, 1, "Warp");
variation:addRoomSystem(3, 2, 2, 1, "JumpDrive");
variation:addRoomSystem(5, 1, 1, 2, "FrontShield");

variation:addRoomSystem(1, 3, 2, 1, "MissileSystem");
variation:addRoomSystem(3, 3, 1, 1, "Impulse");

variation:addDoor(2, 1, true);
variation:addDoor(3, 1, true);
variation:addDoor(1, 1, false);
variation:addDoor(3, 1, false);
variation:addDoor(3, 2, false);
variation:addDoor(3, 3, true);
variation:addDoor(2, 3, true);
variation:addDoor(5, 1, false);
variation:addDoor(5, 2, false);


--UCN
template = ShipTemplate():setName("UCS Interceptor"):setClass("Starfighter", "Interceptor"):setModel("HeliconCorpScoutHS9Blue")
template:setRadarTrace("radar_fighter.png")
template:setDescription([[The UCS Interceptor is a modern short-range fighter designed to interdict incoming snub-fighters.]])
template:setHull(40)
template:setShields(40)
template:setWarpSpeed(1400)
template:setSpeed(120, 40, 35)
template:setDefaultAI('fighter')
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 30, 0, 700.0, 2.0, 5.0)


template = ShipTemplate():setName("UCS Gunship"):setClass("Starfighter", "Gunship"):setModel("HeliconCorpFighterHF13Blue")
template:setRadarTrace("radar_fighter.png")
template:setDescription([[The UCS Gunship is a modern space superiority fighter.]])
template:setHull(50)
template:setShields(40)
template:setWarpSpeed(1000)
template:setSpeed(100, 35, 35)
template:setBeam(0, 35, 0, 800, 5.0, 5.0)
template:setBeam(1, 70, 30, 600, 5.0, 5.0)
template:setBeam(2, 70, -35, 600, 5.0, 5.0)
template:setTubes(1, 15.0)
template:setWeaponStorage("HVLI", 12)
template:setDefaultAI('fighter')

template = ShipTemplate():setName("UCS Bomber"):setClass("Starfighter", "Bomber"):setModel("HeliconCorpBomberHB22Blue")
template:setRadarTrace("radar_fighter.png")
template:setDescription([[The UCS Bomber is a modern snub-craft designed to take on capital ships.]])
template:setHull(40)
template:setShields(80)
template:setWarpSpeed(1000)
template:setSpeed(70, 20, 25)
template:setTubes(3, 12.0)
template:setWeaponStorage("HVLI", 20)
template:setWeaponStorage("Homing", 10)
template:setTubeDirection(1, 1):setWeaponTubeExclusiveFor(1, "HVLI")
template:setTubeDirection(2,-1):setWeaponTubeExclusiveFor(2, "HVLI")


--Brutal
template = ShipTemplate():setName("BRU Interceptor"):setClass("Starfighter", "Interceptor"):setModel("ProgenitorScoutBlack"):setRecorded(false)
template:setRadarTrace("radar_fighter.png")
template:setDescription([[The Brutal Interceptor is equivalent to a UCN Interceptor.]])
template:setHull(30)
template:setShields(20)
template:setWarpSpeed(800)
template:setSpeed(120, 30, 25)
template:setDefaultAI('fighter')
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 30, 0, 700.0, 4.0, 2)


template = ShipTemplate():setName("BRU Gunship"):setClass("Starfighter", "Gunship"):setModel("ProgenitorFighterBlack"):setRecorded(false)
template:setRadarTrace("radar_fighter.png")
template:setDescription([[The Brutal Gunship is a space superiority fighter equivalent to the UCN Gunship.]])
template:setHull(50)
template:setShields(30)
template:setWarpSpeed(800)
template:setSpeed(80, 28, 25)
template:setBeam(0, 35, 0, 800, 5.0, 2.0)
template:setBeam(1, 70, 30, 600, 5.0, 2.0)
template:setBeam(2, 70, -35, 600, 5.0, 2.0)
template:setTubes(1, 15.0)
template:setWeaponStorage("HVLI", 4)
template:setDefaultAI('fighter')

template = ShipTemplate():setName("BRU Bomber"):setClass("Starfighter", "Bomber"):setModel("ProgenitorBomberBlack"):setRecorded(false)
template:setRadarTrace("radar_fighter.png")
template:setDescription([[The Brutal Bomber is equivalent to the UCN Bomber.]])
template:setHull(50)
template:setShields(20)
template:setWarpSpeed(800)
template:setSpeed(50, 15, 25)
template:setTubes(3, 15.0)
template:setWeaponStorage("HVLI", 6)
template:setWeaponStorage("Homing", 4)
template:setTubeDirection(1, 1):setWeaponTubeExclusiveFor(1, "HVLI")
template:setTubeDirection(2,-1):setWeaponTubeExclusiveFor(2, "HVLI")