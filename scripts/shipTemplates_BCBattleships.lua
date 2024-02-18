--[[               Battleships
The Largest of the Large. 


----------------------------------------------------------]]

template = ShipTemplate():setName("King George Battleship"):setClass("Battleship", "King George"):setModel("AtlasHeavyFighterBlue"):setRecorded(false)
template:setDescription([[The King George class Battleship is the pinnacle of Commonwealth naval power. The handful in service are deployed sparingly.]])
template:setRadarTrace("radar_battleship.png")
template:setHull(800)
template:setShields(600, 600, 600, 600, 600, 600)
template:setWarpSpeed(800)
template:setSpeed(30, 2.5, 3)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,100, -20, 3000.0, 6.0, 20)
template:setBeam(1,100,  20, 3000.0, 6.0, 20)
template:setBeam(2,100, 60, 2500.0, 6.0, 15)
template:setBeam(3,100, -60, 2500.0, 6.0, 15)
template:setBeam(4,100, 100, 2000.0, 6.0, 12)
template:setBeam(5,100, -100, 2000.0, 6.0, 12)
template:setTubes(8, 10.0)
template:setWeaponStorage("HVLI", 30)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 30)
template:setWeaponStorage("Nuke", 8)
template:setTubeDirection(0, -10)
template:setTubeDirection(1, -10)
template:setTubeDirection(2,  10)
template:setTubeDirection(3,  10)
template:setTubeDirection(4,  40)
template:setTubeDirection(5, -40)
template:setTubeDirection(6,  5)
template:setTubeDirection(7, -5)
template:setDockClasses("Starfighter", "Frigate", "Destroyer", "Cruiser")
-- template:setExternalDockClasses("Frigate", "Destroyer", "Cruiser")
-- template:setInternalDockClasses("Starfighter")
template:setSharesEnergyWithDocked(true)

variation = template:copy("CNS King George Battleship"):setRecorded(false)
variation:setDescription([[The King George class Battleship was the pinnacle of Commonwealth naval power. The handful in service were deployed sparingly.]])

variation = template:copy("UCS King George Battleship")
variation:setDescription([[The King George class Battleship was the pinnacle of Commonwealth naval power. On the formation of the UCN, all surviving vessels of this class were transferred to its control. By the start of the Brutal war, all had been mothballed, and the most venerable of this class - the Warspite - had been turned into a museum ship. They were quickly put back into service when it was realised that the UCN would require their substantial combat presence as fleet command vessels. ]])
variation:setShields(750, 750, 750, 750)
variation:setHull(850)
variation:setSpeed(40, 4, 5)


variation = template:copy("UCS King George Class Battleship"):setType("playership"):setRecorded(false)
variation:setDescription([[The King George class Battleship wass the pinnacle of Commonwealth naval power. On the formation of the UCN, all surviving vessels of this class were transferred to its control. By the start of the Brutal war, all had been mothballed, and the most venerable of this class - the Warspite - had been turned into a museum ship. They were quickly put back into service when it was realised that the UCN would require their substantial combat presence as fleet command vessels. ]])
variation:setCombatManeuver(400, 250)
variation:setShields(750, 750, 750, 750)
variation:setHull(850)
variation:setSpeed(40, 4, 5)
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


template = ShipTemplate():setName("Centurion Battleship"):setClass("Battleship", "Centurion"):setModel("HeliconCorpHaydronClassBattleshipBlue"):setRecorded(false)
template:setDescription([[The Centurion class Battleship is the first of the Battleship-scale vessels to be constructed by the UCN. Its capabilities far outmatch any other vessel of its weight class.]])
template:setRadarTrace("radar_battleship.png")
template:setHull(1000)
template:setShields(750, 750, 750, 700, 700, 700)
template:setWarpSpeed(1000)
template:setSpeed(60, 6, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,100, -90, 3000.0, 3.0, 25)
template:setBeam(1,100,  90, 3000.0, 3.0, 25)
template:setBeam(2,150, -90, 4000.0, 1.0, 25)
template:setBeam(3,150,  90, 4000.0, 1.0, 25)
template:setBeam(4,10, 0, 5000.0, 3.0, 30)
template:setBeam(5,10, -180, 5000.0, 3.0, 30)
template:setBeamWeaponDamageType(2,2)
template:setBeamWeaponDamageType(3,2)
template:setBeamWeaponDamageType(4,2)
template:setBeamWeaponDamageType(5,3)
template:setBeamStation(0,1)
template:setBeamStation(1,1)
template:setBeamStation(2,1)
template:setBeamStation(3,1)
template:setBeamStation(4,2)
template:setBeamStation(5,2)
template:setTubes(8, 10.0)
template:setWeaponStorage("HVLI", 60)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 40)
template:setWeaponStorage("Nuke", 20)
template:setTubeStation(0,2)
template:setTubeStation(1,2)
template:setTubeStation(2,2)
template:setTubeStation(3,2)
template:setTubeStation(4,2)
template:setTubeStation(5,2)
template:setTubeStation(6,2)
template:setTubeStation(7,2)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, 90)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, 90)
template:setTubeDirection(6, 180)
template:setTubeDirection(7, 180)
template:setDockClasses("Starfighter", "Frigate", "Destroyer", "Cruiser")
-- template:setExternalDockClasses("Frigate", "Destroyer", "Cruiser")
-- template:setInternalDockClasses("Starfighter")
template:setSharesEnergyWithDocked(true)
template:setTractorBeam(5000, 100)



variation = template:copy("UCS Centurion Battleship")
variation:setBeamWeaponTurret( 4, 360, 0, 1)
variation:setBeamWeaponTurret( 5, 360, 0, 1)


variation = template:copy("UCS Centurion Class Battleship"):setType("playership"):setRecorded(false)
variation:setCombatManeuver(400, 250)
variation:setSpeed(60, 8, 10)
variation:setBeamWeaponTurret( 4, 360, 0, 1)
variation:setBeamWeaponTurret( 5, 360, 0, 1)
variation:weaponTubeDisallowMissle(0, "Mine"):weaponTubeDisallowMissle(1, "Mine")
variation:weaponTubeDisallowMissle(2, "Mine"):weaponTubeDisallowMissle(3, "Mine")
variation:weaponTubeDisallowMissle(4, "Mine"):weaponTubeDisallowMissle(5, "Mine")
variation:setWeaponTubeExclusiveFor(6, "Mine")
variation:setWeaponTubeExclusiveFor(7, "Mine")

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

template = ShipTemplate():setName("President Carrier"):setClass("Carrier", "President"):setModel("HeliconCorpValenClassCarrierBlue"):setRecorded(false)
template:setDescription([[The President class Carrier is the first of the Carrier-scale vessels to be constructed by the UCN. Its capabilities far outmatch any other vessel of its weight class.]])
template:setRadarTrace("radar_ktlitan_destroyer")
template:setHull(900)
template:setShields(750, 750, 750, 700, 700, 700)
template:setWarpSpeed(1000)
template:setSpeed(60, 6, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,100, -90, 3000.0, 4.0, 25)
template:setBeam(1,100,  90, 3000.0, 4.0, 25)
template:setBeam(2,10, 0, 2500.0, 3.0, 25)
template:setBeam(3,10, -180, 2500.0, 3.0, 25)
template:setBeamStation(0,1)
template:setBeamStation(1,1)
template:setBeamStation(2,2)
template:setBeamStation(3,2)
template:setBeamWeaponDamageType(0,2)
template:setBeamWeaponDamageType(1,2)
template:setTubes(5, 10.0)
template:setWeaponStorage("HVLI", 60)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 40)
template:setWeaponStorage("Nuke", 20)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, 90)
template:setTubeDirection(4, 180)
template:setTubeStation(0,2)
template:setTubeStation(1,2)
template:setTubeStation(2,2)
template:setTubeStation(3,2)
template:setTubeStation(4,2)
template:setEnergyStorage(1500)

template:setDockClasses("Starfighter", "Frigate", "Destroyer", "Cruiser")
template:setSharesEnergyWithDocked(true)
template:setTractorBeam(5000, 100)



variation = template:copy("UCS President Carrier")
variation:setBeamWeaponTurret( 2, 120, -90, 1)
variation:setBeamWeaponTurret( 3, 120, 90, 1)


variation = template:copy("UCS President Class Carrier"):setType("playership"):setRecorded(false)
variation:setCombatManeuver(400, 250)
variation:setShields(750, 750, 750, 750)
variation:setHull(850)
variation:setSpeed(60, 8, 10)
variation:weaponTubeDisallowMissle(0, "Mine"):weaponTubeDisallowMissle(1, "Mine")
variation:weaponTubeDisallowMissle(2, "Mine"):weaponTubeDisallowMissle(3, "Mine")
variation:setWeaponTubeExclusiveFor(4, "Mine")
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


template = ShipTemplate():setName("Merkel Battleship"):setClass("Battleship", "Merkel"):setModel("HeavyDestroyerGreen"):setRecorded(false)
template:setDescription([[The Merkel Battleship is the pinnacle of European Federation ship design. Its technology base is unrivalled, yet it requires an experienced captain to get the best out of it.]])
template:setRadarTrace("radar_battleship.png")
template:setHull(750)
template:setShields(650, 400, 650, 400)
template:setWarpSpeed(800)
template:setSpeed(35, 3, 3.5)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 100, -10, 3000.0, 8.0, 12)
template:setBeam(1, 100,  10, 3000.0, 8.0, 12)
template:setBeam(2, 45, -20, 2500.0, 8.0, 15)
template:setBeam(3, 45,  20, 2500.0, 8.0, 15)
template:setBeam(4, 20, -10, 3500.0, 8.0, 18)
template:setBeam(5, 20,  10, 3500.0, 8.0, 18)
template:setTubes(6, 8.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 40)
template:setWeaponStorage("Nuke", 6)
template:weaponTubeDisallowMissle(0, "EMP")
template:weaponTubeDisallowMissle(2, "EMP")
template:setTubeDirection(0, -10)
template:setTubeDirection(1, -20)
template:setTubeDirection(2,  10)
template:setTubeDirection(3,  20)
template:setDockClasses("Starfighter", "Frigate", "Destroyer", "Cruiser")
template:setSharesEnergyWithDocked(true)

variation = template:copy("EFS Merkel Battleship"):setRecorded(false)
variation:setDescription([[The Merkel Battleship was the pinnacle of European Federation ship design. Its technology base was unrivalled, yet it required an experienced captain to get the best out of it.]])

variation = template:copy("UCS Merkel Battleship")
variation:setDescription([[The European Merkel class was always eclipsed by the Commonwealth King George Class and the Shanghai Pact Putin Class. Despite an excellent technological base, it never excelled in any particular area. UCN refurbished vessels have largely been deployed with the home fleet during the Brutal war, as Earth's last line of defence. ]])
variation:setShields(750, 550, 750, 550)
variation:setHull(800)
variation:setSpeed(40, 4, 5)
variation:setModel("HeavyDestroyerBlue")

template = ShipTemplate():setName("Bezos Battleship"):setClass("Battleship", "Bezos"):setModel("HeavyCorvetteGrey"):setRecorded(false)
template:setDescription([[The Bezos class Battleship is a heavy linebreaker, designed to punch a hole through a defensive formation with its powerful broadsides.]])
template:setRadarTrace("radar_battleship.png")
template:setHull(700)
template:setShields(400, 350, 400, 350)
template:setWarpSpeed(800)
template:setSpeed(35, 5, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 80, -20, 3000.0, 8.0, 15)
template:setBeam(1, 80,  20, 3000.0, 8.0, 15)
template:setBeam(2, 120, -90, 2500.0, 6.0, 12)
template:setBeam(3, 120,  90, 2500.0, 6.0, 12)
template:setBeam(4, 100, -90, 3500.0, 6.0, 20)
template:setBeam(5, 100,  90, 3500.0, 6.0, 20)
template:setTubes(6, 10.0)
template:setWeaponStorage("HVLI", 32)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 30)
template:setWeaponStorage("Nuke", 4)
template:setTubeDirection(0, 90)
template:setTubeDirection(1, -90)
template:setTubeDirection(2, -40)
template:setTubeDirection(3, 40)
template:setTubeDirection(2, -90)
template:setTubeDirection(3, 90)
template:setDockClasses("Starfighter", "Frigate", "Destroyer", "Cruiser")
template:setSharesEnergyWithDocked(true)

variation = template:copy("JCS Bezos Battleship"):setRecorded(false)
variation:setDescription([[The Bezos class Battleship was a heavy linebreaker, designed to punch a hole through a defensive formation with its powerful broadsides. None have been seen since the departure of Jump for deep space.]])


template = ShipTemplate():setName("Lenin Battleship"):setClass("Battleship", "Putin"):setModel("small_frigate_2"):setRecorded(false)
template:setDescription([[The Lenin class Battleship is a devestating war machine capable of crippling a fleet on its own. It will close quickly, and unleash the full power of its short range beam weaponry. ]])
template:setRadarTrace("radar_battleship.png")
template:setHull(850)
template:setShields(500, 500, 500, 500, 500, 500)
template:setWarpSpeed(800)
template:setSpeed(40, 6, 10)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, -20, 3500.0, 4.0, 25)
template:setBeam(1, 60,  20, 3500.0, 4.0, 25)
template:setBeam(2, 100, -20, 3000.0, 3.0, 18)
template:setBeam(3, 100,  20, 3000.0, 3.0, 18)
template:setBeam(4, 120, -90, 2500.0, 3.0, 18)
template:setBeam(5, 120,  90, 2500.0, 3.0, 18)
template:setTubes(4, 15.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 4)
template:setDockClasses("Starfighter", "Frigate", "Destroyer", "Cruiser")
template:setSharesEnergyWithDocked(true)

variation = template:copy("SPS Lenin Battleship"):setRecorded(false)
variation:setDescription([[The Lenin class Battleship was a devestating war machine capable of crippling a fleet on its own. It would close quickly, and unleash the full power of its short range beam weaponry.]])

variation = template:copy("UCS Lenin Battleship")
variation:setDescription([[The Lenin class Battleship was a devestating war machine capable of crippling a fleet on its own. It would close quickly, and unleash the full power of its short range beam weaponry. Sadly the majority of those that survived the Exodus were in too poor a state of repair to be useable by the UCN. Those that were refurbished were intitially mothballed, but were sent straight to the front line at the onset of the Brutal war. They formed the point of the spear in the action at Darwin Station and dealt a heavy blow to the enemy, but sadly only a couple of these magnificent vessels survived and both were heavily damaged.]])
variation:setShields(750, 550, 750, 550)
variation:setHull(800)
variation:setSpeed(40, 4, 5)

template = ShipTemplate():setName("Washington Battleship"):setClass("Battleship", "Washington"):setModel("Eris"):setRecorded(false)
template:setDescription([[The Washington class Battleship is remarkable engine of war, yet it also fulfils an important support role for civilian and scientific vessels, readily acting as a mobile base for a variety of combat and non-combat roles. ]])
template:setRadarTrace("radar_battleship.png")
template:setHull(750)
template:setShields(500, 500, 500, 500, 500, 500)
template:setWarpSpeed(800)
template:setSpeed(60, 7, 10)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, -20, 3500.0, 4.0, 20)
template:setBeam(1, 60,  20, 3500.0, 4.0, 20)
template:setBeam(2, 100, -20, 3000.0, 3.0, 18)
template:setBeam(3, 100,  20, 3000.0, 3.0, 18)
template:setBeam(4, 160, 180, 2500.0, 3.0, 15)
template:setBeam(5, 160,  0, 2500.0, 3.0, 15)
template:setTubes(6, 12.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 6)
template:setDockClasses("Starfighter", "Frigate", "Destroyer", "Cruiser")
template:setSharesEnergyWithDocked(true)

variation = template:copy("JASA Washington Battleship"):setRecorded(false)
variation:setDescription([[The Washington class Battleship was remarkable engine of war, yet it also fulfiled an important support role for civilian and scientific vessels, readily acting as a mobile base for a variety of combat and non-combat roles.]])

variation = template:copy("UCS Washington Battleship")
variation:setDescription([[The Washington class was a highly versatile vessel. Only a couple returned from the Exodus, but they have been put to good use as long range fleet command vessels on a par with the King George Class. Where they have the advantage over the commonwealth capital ship is their extensive research and fabrication suites making them well suited for exploration and research deployments. Hence they have largely been kept away from the front lines in the Brutal war.]])
variation:setShields(650, 650, 650, 650)
variation:setHull(800)
variation:setSpeed(65, 10, 15)


--Brutal

template = ShipTemplate():setName("BRU Jormungandr Battleship"):setClass("Battleship", "Jormungandr"):setModel("ProgenitorBattleshipBlack"):setRecorded(false)
template:setDescription([[The Jormungandr class Battleship is the largest Brutal ship encountered to date. It has a fearsome array of weaponsystems and the overall design appears to be inspired by the old Shanghai Pact Battleship designs. ]])
template:setRadarTrace("radar_battleship.png")
template:setHull(750)
template:setShields(500, 500, 500, 500, 500, 500)
template:setWarpSpeed(800)
template:setSpeed(25, 4, 6)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, -20, 3500.0, 4.0, 20)
template:setBeam(1, 60,  20, 3500.0, 4.0, 20)
template:setBeam(2, 100, -20, 3000.0, 3.0, 18)
template:setBeam(3, 100,  20, 3000.0, 3.0, 18)
template:setBeam(4, 160, 180, 2500.0, 3.0, 15)
template:setBeam(5, 160,  0, 2500.0, 3.0, 15)
template:setTubes(6, 12.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 20)
template:setWeaponStorage("Nuke", 6)
template:setDockClasses("Starfighter", "Frigate", "Destroyer", "Cruiser")
-- template:setExternalDockClasses("Frigate", "Destroyer", "Cruiser")
-- template:setInternalDockClasses("Starfighter")
template:setSharesEnergyWithDocked(true) 

template = ShipTemplate():setName("BRU Leviathan Carrier"):setClass("Carrier", "Leviathan"):setModel("ProgenitorCarrierBlack"):setRecorded(false)
template:setDescription([[The Leviathan class Carrier operates as a base-ship for smaller fighter-sized craft. It is the only Brutal design so far that appears to be heavily influenced by European Federation technology, and may indeed be based on a never-built EF design for a vessel to fulfil a carrier-like role. ]])
template:setRadarTrace("radar_piranha.png")
template:setHull(650)
template:setShields(650, 600, 600, 600, 600, 600)
template:setWarpSpeed(800)
template:setSpeed(25, 4, 6)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, -20, 3500.0, 4.0, 20)
template:setBeam(1, 60,  20, 3500.0, 4.0, 20)
template:setBeam(2, 100, -20, 3000.0, 3.0, 18)
template:setBeam(3, 100,  20, 3000.0, 3.0, 18)
template:setBeam(4, 160, 180, 2500.0, 3.0, 15)
template:setBeam(5, 160,  0, 2500.0, 3.0, 15)
template:setTubes(6, 12.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 20)
--template:setWeaponStorage("Nuke", 6)
template:setDockClasses("Starfighter", "Frigate", "Destroyer", "Cruiser")
-- template:setExternalDockClasses("Frigate", "Destroyer", "Cruiser")
-- template:setInternalDockClasses("Starfighter")
template:setSharesEnergyWithDocked(true) 


template = ShipTemplate():setName(""):setModel("Mjolnir Titan"):setRecorded(false)
--template:setDescription([[ ]])
template:setRadarTrace("radar_ktlitan_destroyer.png")
template:setHull(1000)
template:setShields(500, 500, 500, 500, 500, 500)
template:setWarpSpeed(1500)
template:setSpeed(60, 7, 10)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, -20, 3500.0, 4.0, 20)
template:setBeam(1, 60,  20, 3500.0, 4.0, 20)
template:setBeam(2, 100, -20, 3000.0, 3.0, 18)
template:setBeam(3, 100,  20, 3000.0, 3.0, 18)
template:setBeam(4, 160, 180, 2500.0, 3.0, 15)
template:setBeam(5, 160,  0, 2500.0, 3.0, 15)
template:setTubes(6, 12.0)
template:setWeaponStorage("HVLI", 40)
template:setWeaponStorage("Homing", 60)
template:setWeaponStorage("EMP", 40)
template:setWeaponStorage("Nuke", 20)
template:setDockClasses("Starfighter", "Frigate", "Destroyer", "Cruiser", "Battleship")
-- template:setExternalDockClasses("Frigate", "Destroyer", "Cruiser", "Battleship")
-- template:setInternalDockClasses("Starfighter")
template:setSharesEnergyWithDocked(true)

--template = ShipTemplate():setName("Lancelot"):setClass("Battleship", "Lancelot"):setModel("Lancelot")
--template:setDescription([[Star Trek Lancelot Starship.]])
--template:setRadarTrace("radar_battleship.png")
--template:setHull(800)
--template:setShields(600, 600, 600, 600, 600, 600)
--template:setSpeed(30, 2.5, 3)
--                  Arc, Dir, Range, CycleTime, Dmg
--template:setBeam(0,100, -20, 3000.0, 6.0, 20)
--template:setBeam(1,100,  20, 3000.0, 6.0, 20)
--template:setBeam(2,100, 60, 2500.0, 6.0, 15)
--template:setBeam(3,100, -60, 2500.0, 6.0, 15)
--template:setBeam(4,100, 100, 2000.0, 6.0, 12)
--template:setBeam(5,100, -100, 2000.0, 6.0, 12)
--template:setTubes(8, 10.0)
--template:setWeaponStorage("HVLI", 30)
--template:setWeaponStorage("Homing", 60)
--template:setWeaponStorage("EMP", 30)
--template:setWeaponStorage("Nuke", 8)
--template:setTubeDirection(0, -10)
--template:setTubeDirection(1, -10)
--template:setTubeDirection(2,  10)
--template:setTubeDirection(3,  10)
--template:setTubeDirection(4,  40)
--template:setTubeDirection(5, -40)
--template:setTubeDirection(6,  5)
--template:setTubeDirection(7, -5)
--template:setDockClasses("Starfighter", "Frigate", "Destroyer", "Cruiser")
--template:setSharesEnergyWithDocked(true)

--variation = template:copy("Lancelot"):setType("playership")
--variation:setDescription([[Star Trek Lancelot Starship.]])
--variation:setCombatManeuver(400, 250)


--variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
--variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
--variation:addRoom(2, 2, 2, 1);

--variation:addRoomSystem(0, 3, 1, 2, "RearShield");
--variation:addRoomSystem(1, 3, 2, 2, "Reactor");
--variation:addRoomSystem(3, 3, 2, 2, "Warp");
--variation:addRoomSystem(5, 3, 1, 2, "JumpDrive");
--variation:addRoom(6, 3, 2, 1);
--variation:addRoom(6, 4, 2, 1);
--variation:addRoomSystem(8, 3, 1, 2, "FrontShield");

--variation:addRoom(2, 5, 2, 1);
--variation:addRoomSystem(1, 6, 2, 1, "MissileSystem");
--variation:addRoomSystem(1, 7, 2, 1, "Impulse");

--variation:addDoor(1, 1, true);
--variation:addDoor(2, 2, true);
--variation:addDoor(3, 3, true);
--variation:addDoor(1, 3, false);
--variation:addDoor(3, 4, false);
--variation:addDoor(3, 5, true);
--variation:addDoor(2, 6, true);
--variation:addDoor(1, 7, true);
--variation:addDoor(5, 3, false);
--variation:addDoor(6, 3, false);
--variation:addDoor(6, 4, false);
--variation:addDoor(8, 3, false);
--variation:addDoor(8, 4, false);
