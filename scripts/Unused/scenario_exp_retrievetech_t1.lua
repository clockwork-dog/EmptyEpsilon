-- Name: Exploration Retrieve Tech Tier 1
-- Description: Person in shuttle variant  
-- Type: Basic
-- Variation[Takanami]: This scenario will run on Takanami
-- Variation[Havock]: This scenario will run on Havock

--TO DO LIST--

--finesse comms script (done energy targeting and also retrieval)
--change presets of 'scarab' type ship
--change presets of scarab shuttle and other ships - descriptions and such?
--confirm the ships I should be utilising here
--there's likely a way of doing the energy drain according to factions but i'm just doing something that works atm
--i don't know if it'll cause running issues with EE
--SOMETHING i haven't programmed for: if they lose energy a second time, they cna't currently pick it up again
--change energy drain function to be objects in range rather than distance

--MAKE UCS SCARAB DAMAGED, ADD DESCRIPTIONS AND INFO?
--BRU GUNSHIP, GUNSHIP AND GUNSHIP NEED TO BE ALTERED.

require("utils.lua")

-- defining comms function before it's called

function siphonmenu()
	if siphonaccess == 1 then
		setCommsMessage("Energy Siphon: XX_ES_vendetta")
			addCommsReply("Access control panel", siphoncomms)
	elseif codeattempts == 3 then
		setCommsMessage("Energy Siphon: XX_ES_vendetta\nAccess locked following incorrect attempts.")
	elseif codeattempts == 2 then
		setCommsMessage("Energy Siphon: XX_ES_vendetta\nEnter 3-part access code.\nOne attempt remaining.")
			addCommsReply("Enter code", siphoncode)
	elseif codeattempts == 1 then
		setCommsMessage("Energy Siphon: XX_ES_vendetta\nEnter 3-part access code.\nTwo attempts remaining.")
			addCommsReply("Enter code", siphoncode)
	elseif codeattempts == 0 then
		setCommsMessage("Energy Siphon: XX_ES_vendetta\nEnter 3-part access code.")
			addCommsReply("Enter code", siphoncode)
    end
    end




	--correct code is 'delta omega alpha'

	function siphoncode()
	setCommsMessage("Enter first part of code.")
	addCommsReply("alpha", function()
		setCommsMessage("Access Code incorrect.")
			codeattempts = codeattempts + 1
			addCommsReply("Re-enter code", siphonmenu)
			end)
	addCommsReply("beta", function()
		setCommsMessage("Access Code incorrect.")
			codeattempts = codeattempts + 1
			addCommsReply("Re-enter code", siphonmenu)
			end)
	addCommsReply("gamma", function()
		setCommsMessage("Access Code incorrect.")
			codeattempts = codeattempts + 1
			addCommsReply("Re-enter code", siphonmenu)
			end)
	addCommsReply("delta", function ()
		setCommsMessage("Enter second part of access code.")
			addCommsReply("alpha", function ()
				setCommsMessage("Access Code incorrect.")
					codeattempts = codeattempts + 1
					addCommsReply("Re-enter code", siphonmenu)
					end)
			addCommsReply("beta", function()
				setCommsMessage("Access Code incorrect.")
					codeattempts = codeattempts + 1
					addCommsReply("Re-enter code", siphonmenu)
					end)
			addCommsReply("gamma", function()
				setCommsMessage("Access Code incorrect.")
					codeattempts = codeattempts + 1
					addCommsReply("Re-enter code", siphonmenu)
					end)
			addCommsReply("delta", function ()
				setCommsMessage("Access Code incorrect.")
					codeattempts = codeattempts + 1
					addCommsReply("Re-enter code", siphonmenu)
					end)
			addCommsReply("omega", function ()
				setCommsMessage("Enter third part of access code.")
					addCommsReply("alpha", function ()
						setCommsMessage("Access Code Accepted.")
						siphonaccess = 1
							addCommsReply("View control menu", siphoncomms)
							end)
					addCommsReply("beta", function()
						setCommsMessage("Access Code incorrect.")
							codeattempts = codeattempts + 1
							addCommsReply("Re-enter code", siphonmenu)
							end)
					addCommsReply("gamma", function()
						setCommsMessage("Access Code incorrect.")
							codeattempts = codeattempts + 1
							addCommsReply("Re-enter code", siphonmenu)
							end)
					addCommsReply("delta", function ()
						setCommsMessage("Access Code incorrect.")
							codeattempts = codeattempts + 1
							addCommsReply("Re-enter code", siphonmenu)
							end)
					addCommsReply("omega", function ()
						setCommsMessage("Access Code incorrect.")
							codeattempts = codeattempts + 1
							addCommsReply("Re-enter code", siphonmenu)
							end)
							end)
							end)
	addCommsReply("omega", function ()
		setCommsMessage("Access Code incorrect.")
			codeattempts = codeattempts + 1
			addCommsReply("Re-enter code", siphonmenu)
			end)
end

function siphoncomms()
		setCommsMessage("Access code accepted. Select systems for remote control.")
			addCommsReply("Energy provision.", function()
                    if siphonused == 0 then
					setCommsMessage("Transfer energy to current vessel?")
						addCommsReply("Yes", function()
							setCommsMessage("Energy transfer initiated.")
							player:setEnergyLevel(1500)
                            siphonused = 1
                                addCommsReply("Back to systems menu", siphonmenu)
							end)
						addCommsReply("Back to systems menu", siphonmenu)
                     elseif siphonused == 1 then
                     setCommsMessage("Siphon reserves empty.")
                        addCommsReply("Back to systems menu", siphonmenu)
							end
                            end)
			addCommsReply("Siphon targeting.", function()
                           if UCNsiphoned == 1 and greyhatsiphoned == 1 then
                                setCommsMessage("All ships in range currently targeted.")
                                    addCommsReply("Cease siphoning from UCN ships.", function()
                                        UCNsiphoned = 0
                                            setCommsMessage("Siphoning from UCN ships ceased.")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                        end)
                                    addCommsReply("Cease siphoning from greyhat.ships.", function()
                                        greyhatsiphoned = 0
                                                setCommsMessage("Siphoning from greyhat.ships ceased.")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                        end)
                                        end
                           if UCNsiphoned == 0 and greyhatsiphoned == 1 then
                                setCommsMessage("greyhat.ships currently targeted.\nUCN ships not currently targeted.")
                                    addCommsReply("Cease siphoning from greyhat.ships.", function()
                                        greyhatsiphoned = 0
                                            setCommsMessage("Siphoning from greyhat.ships ceased.")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                    end)
                                    addCommsReply("Siphon energy from UCN ships.", function()
                                        UCNsiphoned = 1
                                            setCommsMessage("Siphoning from UCN ships initiated.")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                    end)
                                    end
                           if UCNsiphoned == 1 and greyhatsiphoned == 0 then
                           	    setCommsMessage("UCN ships currently targeted.\ngreyhat.ships not currently targeted.")
                                   addCommsReply("Cease siphoning from UCN ships.", function()
                                        UCNsiphoned = 0
                                            setCommsMessage("Siphoning from UCN ships ceased.")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                    end)
                                        addCommsReply("Siphon energy from greyhat.ships", function()
                                      greyhatsiphoned = 1
                                            setCommsMessage("Siphoning from greyhat.ships initiated")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                    end)
                                    end
                           if UCNsiphoned == 0 and greyhatsiphoned == 0 then
                                setCommsMessage("Ships in current range not listed as targets are greyhat.ships and UCN ships.")
                                    addCommsReply("Siphon energy from greyhat.ships", function()
                                      greyhatsiphoned = 1
                                        setCommsMessage("Siphoning from greyhat.ships initiated.")
                                            addCommsReply("Back to systems menu", siphonmenu)
                                            end)
                                    addCommsReply("Siphon energy from UCN ships", function()
                                        UCNsiphoned = 1
                                            setCommsMessage("Siphoning from UCN ships initiated.")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                           -- end)
								end)
                                end
				--addCommsReply("Defence systems.", function()
					--setCommsMessage("Select function.")
						--addCommsReply("Heat beams.", function()
							--setCommsMessage("Heat beams initiating.")
								--addCommsReply("Back to systems menu", siphonmenu)
								--end)
								--TURN ON SOME RANDOM FUCKING HEAT BEAMS
					--	addCommsReply("Signal scramblers.", function()
							--setCommsMessage("Signal scramblers initiating.")
								--addCommsReply("Back to systems menu", siphonmenu)
								--end)
								end)
								end


--playerships

player = PlayerSpaceship():setPosition(500,0)
CPUshuttle = CpuShip():setPosition(235575,232398)

--TAKE OUT ENGINEERING PRESETS

player:setActivePresetNumber(0)

--UCN ships

Warspite = CpuShip():setFaction("UCN"):setTemplate("UCS King George Battleship"):setCallSign("UCS Warspite"):setPosition(0, 0):orderIdle():setWeaponStorage("EMP", 22):setDescriptions("King George Class Battleship", "Current orders: Establish Base in Adamas Belt.")
Warspite:addInfos(1,"Fabrication date", "2091")
Warspite:addInfos(2,"Current Commander", "Rear Admiral Bonesteeth")
Warspite:addInfos(3,"Number of Personnel", "1842")
Scarab = CpuShip():setFaction("UCN"):setTemplate("UCS Skirmish Frigate"):setCallSign("UCS Scarab"):setPosition(105582,46109):setHeading(280):orderIdle():setWeaponStorage("Homing", 15):setDescriptions("Skirmish Class Frigate", "Current orders: Return to homebase.")
Scarab:addInfos(1,"Fabrication date", "2177")
Scarab:addInfos(2,"Current Commander", "Leiutenant Commander Lazarus")
Scarab:addInfos(3,"Number of Personnel", "9")
Scarab:setHull(50):setWarpDrive(false):setHull(35):setShields(25,30)

--neutral ships

--enemy ship fighting with SCARAB

CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("CCN85"):setPosition(100000, 46000)

--enemy ships hiding in nebulas

    hacker1 =CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("BR68"):setPosition(300830, 197231):setWeaponStorage("HVLI", 0)
    hacker2 = CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("SS69"):setPosition(297505, 201232):setWeaponStorage("HVLI", 0)
    hacker3 = CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("CSS70"):setPosition(266857, 262398):setWeaponStorage("HVLI", 0)
    hacker4 = CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("CCN71"):setPosition(210445, 269603):setWeaponStorage("HVLI", 0)
    hacker5 = CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("NC72"):setPosition(211464, 261733):setWeaponStorage("HVLI", 0)
    hacker6 = CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("CV73"):setPosition(267135, 264435)
    hacker7 = CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("UTI74"):setPosition(263246, 260546)
    hacker8 = CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("CCN75"):setPosition(290097, 200491)
    hacker9 = CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("VS76"):setPosition(206093, 272658)

--abandoned ships in energy siphon radius

    CpuShip():setFaction("Independent"):setTemplate("BRU Gunship"):setCallSign("BR63"):setPosition(218749, 214270):setWeaponStorage("HVLI", 1):setEnergy(0)
    CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("VS78"):setPosition(222658, 228979):setWeaponStorage("HVLI", 0):setEnergy(0)
    CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("VK77"):setPosition(232096, 225331):setWeaponStorage("HVLI", 0):setEnergy(0)
  
--variations
function setVariations()
    if string.find(getScenarioVariation(), "Havock") then
        	player:setTemplate("UCS Skirmish Class Frigate"):setCallSign("UCS Havock"):setFaction("UCN")
	        CPUshuttle:setTemplate("UCN Shuttle"):setCallSign("UCS Scarab-S"):setFaction("UCN"):setEnergy(0)
    elseif string.find(getScenarioVariation(), "Takanami") then
            player:setTemplate("UCS Hoplite Class Destroyer"):setCallSign("UCS Takanami"):setFaction("UCN")
	        CPUshuttle:setTemplate("UCN Shuttle"):setCallSign("UCS Scarab-S"):setFaction("UCN"):setEnergy(0)
	end
end

--tech items and artifacts

Siphon = SpaceStation():setTemplate("EFS Mining Rig"):setCommsFunction(siphonmenu):setFaction("Independent"):setCallSign("UCS Scarab Shuttle"):setPosition(228379, 224498)

    WarpJammer():setFaction("Independent"):setPosition(228725, 204562)
    WarpJammer():setFaction("Independent"):setPosition(228930, 242513)
    WarpJammer():setFaction("Independent"):setPosition(247911, 224365)
    WarpJammer():setFaction("Independent"):setPosition(206060, 224457)
    WarpJammer():setFaction("Independent"):setPosition(213447, 210117)
    WarpJammer():setFaction("Independent"):setPosition(242429, 210488)
    WarpJammer():setFaction("Independent"):setPosition(213744, 237143)
    WarpJammer():setFaction("Independent"):setPosition(242540, 236957)

    Mine():setPosition(109698, 41544)
    Mine():setPosition(99964, 49803)

--terrain

--planets

    Planet():setPosition(284332, 235056):setPlanetRadius(5000)

--asteroids

    Asteroid():setPosition(-18129, -23353)
    Asteroid():setPosition(-32976, -6932)
    Asteroid():setPosition(-51659, -33088)
    Asteroid():setPosition(-47726, -35644)
    Asteroid():setPosition(32117, -36332)
    Asteroid():setPosition(56404, -20796)
    Asteroid():setPosition(-44087, 36431)
    Asteroid():setPosition(-66801, 10275)
    Asteroid():setPosition(-55199, 8210)
    Asteroid():setPosition(-53527, 7915)
    Asteroid():setPosition(-54117, 10570)
    Asteroid():setPosition(-81157, -4277)
    Asteroid():setPosition(-23832, -43805)
    Asteroid():setPosition(-39663, 27876)
    Asteroid():setPosition(-29928, 30531)
    Asteroid():setPosition(-37696, 36529)
    Asteroid():setPosition(-35140, 42232)
    Asteroid():setPosition(52864, 26204)
    Asteroid():setPosition(37328, 20403)
    Asteroid():setPosition(20416, 16667)
    Asteroid():setPosition(16090, 24828)
    Asteroid():setPosition(29167, 14602)
    Asteroid():setPosition(10092, 6244)
    Asteroid():setPosition(24644, 28269)
    Asteroid():setPosition(30052, 20895)
    Asteroid():setPosition(21203, 21091)
    Asteroid():setPosition(18351, 31514)
    Asteroid():setPosition(34182, 19518)
    Asteroid():setPosition(55716, 1131)
    Asteroid():setPosition(52864, -9882)
    Asteroid():setPosition(24152, -1426)
    Asteroid():setPosition(47161, 11160)
    Asteroid():setPosition(49521, -442)
    Asteroid():setPosition(33690, 7030)
    Asteroid():setPosition(67515, 8407)
    Asteroid():setPosition(80298, -8210)
    Asteroid():setPosition(11468, 41740)
    Asteroid():setPosition(7240, 34169)
    Asteroid():setPosition(-7411, 44100)
    Asteroid():setPosition(28971, 32891)
    Asteroid():setPosition(36345, 48623)
    Asteroid():setPosition(41163, 30334)
    Asteroid():setPosition(27496, 37217)
    Asteroid():setPosition(28971, 27286)
    Asteroid():setPosition(41655, 26499)
    Asteroid():setPosition(23464, 22370)
    Asteroid():setPosition(20613, 37807)
    Asteroid():setPosition(16876, 26794)
    Asteroid():setPosition(36640, 15487)
    Asteroid():setPosition(53454, 20403)
    Asteroid():setPosition(44211, 29351)
    Asteroid():setPosition(34477, 25713)
    Asteroid():setPosition(34575, 25025)
    Asteroid():setPosition(36345, 24041)
    Asteroid():setPosition(33592, 32694)
    Asteroid():setPosition(28381, 25320)
    Asteroid():setPosition(34379, 24435)
    Asteroid():setPosition(19433, 38889)
    Asteroid():setPosition(28676, 31219)
    Asteroid():setPosition(24152, 28171)
    Asteroid():setPosition(27594, 19125)
    Asteroid():setPosition(20121, 30138)
    Asteroid():setPosition(25627, 23058)
    Asteroid():setPosition(24349, 24336)
    Asteroid():setPosition(25627, 18535)
    Asteroid():setPosition(25234, 21091)
    Asteroid():setPosition(25922, 31219)
    Asteroid():setPosition(33887, 14602)
    Asteroid():setPosition(35854, 7817)
    Asteroid():setPosition(45096, 20108)
    Asteroid():setPosition(51488, 6146)
    Asteroid():setPosition(42245, 5261)
    Asteroid():setPosition(51881, 9095)
    Asteroid():setPosition(11468, 46853)
    Asteroid():setPosition(-6231, 38594)
    Asteroid():setPosition(32805, 29351)
    Asteroid():setPosition(27299, 42625)
    Asteroid():setPosition(53159, 44494)
    Asteroid():setPosition(87771, 27483)
    Asteroid():setPosition(23169, 25320)
    Asteroid():setPosition(19728, 46165)
    Asteroid():setPosition(36935, 29253)
    Asteroid():setPosition(32215, 25418)
    Asteroid():setPosition(137328, 40855)
    Asteroid():setPosition(97210, 84513)
    Asteroid():setPosition(153061, 86775)
    Asteroid():setPosition(97210, 96804)
    Asteroid():setPosition(123169, 89921)
    Asteroid():setPosition(99079, 41642)
    Asteroid():setPosition(110386, 48033)
    Asteroid():setPosition(76758, 58260)
    Asteroid():setPosition(78626, 61504)
    Asteroid():setPosition(123857, 32104)
    Asteroid():setPosition(85903, 80285)
    Asteroid():setPosition(265942, 149312)
    Asteroid():setPosition(209305, 168978)
    Asteroid():setPosition(139492, 138791)
    Asteroid():setPosition(144114, 142822)
    Asteroid():setPosition(133691, 147149)
    Asteroid():setPosition(139885, 141052)
    Asteroid():setPosition(472333, 1229)
    Asteroid():setPosition(305470, 135251)
    Asteroid():setPosition(248833, 168781)
    Asteroid():setPosition(230151, 176156)
    Asteroid():setPosition(244310, 184022)
    Asteroid():setPosition(249423, 171534)
    Asteroid():setPosition(261321, 171534)
    Asteroid():setPosition(251291, 167995)
    Asteroid():setPosition(226709, 141053)
    Asteroid():setPosition(205470, 181957)
    Asteroid():setPosition(106552, 136628)
    Asteroid():setPosition(273415, 210079)
    Asteroid():setPosition(287674, 222173)
    Asteroid():setPosition(263681, 235251)
    Asteroid():setPosition(273612, 207621)
    Asteroid():setPosition(294458, 170846)
    Asteroid():setPosition(254045, 203098)
    Asteroid():setPosition(248736, 249902)
    Asteroid():setPosition(207143, 246165)
    Asteroid():setPosition(232511, 196706)
    Asteroid():setPosition(185019, 202016)
    Asteroid():setPosition(292785, 225222)
    Asteroid():setPosition(312943, 228171)
    Asteroid():setPosition(306355, 236529)
    Asteroid():setPosition(309796, 238594)
    Asteroid():setPosition(312353, 234071)
    Asteroid():setPosition(83740, 175959)
    Asteroid():setPosition(311271, 105949)
    Asteroid():setPosition(246178, 118535)
    Asteroid():setPosition(187378, 46657)
    Asteroid():setPosition(274694, 132399)
    Asteroid():setPosition(171153, 75959)
    Asteroid():setPosition(180200, 99361)
    Asteroid():setPosition(211763, 31908)
    Asteroid():setPosition(258387, 71697)
    Asteroid():setPosition(225316, 69354)
    Asteroid():setPosition(229713, 89631)
    Asteroid():setPosition(228580, 65393)
    Asteroid():setPosition(258387, 71697)
    Asteroid():setPosition(225316, 69354)
    Asteroid():setPosition(229713, 89631)
    Asteroid():setPosition(228580, 65393)
    Asteroid():setPosition(258387, 71697)
    Asteroid():setPosition(225316, 69354)
    Asteroid():setPosition(229713, 89631)
    Asteroid():setPosition(228580, 65393)

--nebulas

    Nebula():setPosition(276564, 261408)
    Nebula():setPosition(202866, 260817)
    Nebula():setPosition(262011, 268290)
    Nebula():setPosition(265699, 265537)
    Nebula():setPosition(303900, 196511)
    Nebula():setPosition(273645, 259480)
    Nebula():setPosition(265011, 261604)
    Nebula():setPosition(262358, 255114)
    Nebula():setPosition(223076, 263276)
    Nebula():setPosition(196478, 254327)
    Nebula():setPosition(298396, 200051)
    Nebula():setPosition(292053, 208015)
    Nebula():setPosition(100459, 71731)
    Nebula():setPosition(106112, 78123)
    Nebula():setPosition(95493, 66913)
    Nebula():setPosition(143232, 11259)
    Nebula():setPosition(117324, 9293)
    Nebula():setPosition(195868, 34795)
    Nebula():setPosition(202178, 39530)
    Nebula():setPosition(208744, 48798)
    Nebula():setPosition(199798, 48123)
    Nebula():setPosition(233092, 104786)
    Nebula():setPosition(238741, 95700)
    Nebula():setPosition(241979, 102846)
    Nebula():setPosition(248804, 109106)
    Nebula():setPosition(223956, 101112)
    Nebula():setPosition(205645, 275042)
    Nebula():setPosition(211135, 261928)
    Nebula():setPosition(212905, 274078)
    Nebula():setPosition(210884, 267459)
    Nebula():setPosition(291189, 196823)
    Nebula():setPosition(289578, 201524)
    Nebula():setPosition(291374, 188305)
    Nebula():setPosition(217791, 268674)
    Nebula():setPosition(126384, 8366)
    Nebula():setPosition(109235, 71915)
    Nebula():setPosition(114998, 78068)
    Nebula():setPosition(121302, 15918)
    Nebula():setPosition(134025, 14148)
    Nebula():setPosition(116731, 145243)
    Nebula():setPosition(122662, 150092)


--SpaceStation():setTemplate("Gravitational Anomaly"):setFaction("Independent"):setCallSign("DS506"):setPosition(-971528, 64850)

--automation/functions before or in init?






function init()

--GM buttons setup --

setVariations()
player:commandDock(Warspite)

GMShuttlestart = _("startshutbutton", "Initiate Shuttle")
addGMFunction(GMShuttlestart,triggerGMShuttlestart)

--GMShuttlestop = _("stopshutbutton", "Shutdown Shuttle")
--GMShuttlestop = _("stopshutbutton", "Shutdown Shuttle")
--addGMFunction(GMShuttlestop,triggerGMShuttlestop)


--scenario-specific functions

function autodistress(obj, obj_2, dist, message)
	if autodistresssig == 0 then
	    if distance(player,obj) < dist then
            print("clocked em")
            --have tried globalmessage function but doesn't ever seem to function
            --GlobalMessage("SOS - ASSISTANCE NEEDED - G22")
			obj_2:sendCommsMessage(player,
			_(message))
            print("sent it")
            obj:setCallSign("XX_ES_vendetta")
			autodistresssig = 1
	    end
	end
end

--below has no impact. greened out is the code that will take it down but steadily to zero.

--function energydrain(obj, target, dist, delta)
	--if distance(obj, target) < 15000 then
       -- energycheck = target:getEnergyLevel()
	    --if function() return target:getEnergyLevel() > 100 end then
		   -- if energytimer <= 5 then
		      --  energytimer = energytimer + 1
		--    end
	  --  if energytimer == 5 then
        --    currentenergy = target:getEnergyLevel()
        --    target:setEnergyLevel(currentenergy -1)
         --   energytimer = 0
     --   end
     --   end
 --   end
--end

--this code makes the whole game freeeeeeeze
--took out the second do/while loop
function energydrainplayer(source, target, dist, delta)
        for _, obj_in_range in ipairs(source:getObjectsInRange(dist)) do
            if obj_in_range == target then
                print("locked on")
                    energycheck = target:getEnergyLevel()
                        if energycheck > 150 then  
                            if energytimer < 5 then
                                energytimer = energytimer + 1
                            end
                            if energytimer == 5 then
                                currentenergy = target:getEnergyLevel()
                                target:setEnergyLevel(currentenergy - 1)
                                energytimer = 0
                            end
                        end
                        if energycheck <= 150 then 
                            if energytimer < 20 then
                                energytimer = energytimer + 1
                            end
                            if energytimer == 20 then
                                currentenergy = target:getEnergyLevel()
                                target:setEnergyLevel(currentenergy - 1)
                                energytimer = 0
                            end
                        end
            end
end
end

function energydrainCPU(source, target, dist, delta)
        for _, obj_in_range in ipairs(source:getObjectsInRange(dist)) do
            if obj_in_range == target then
                print("locked on CPU")
                    energycheck = target:getEnergy()
                        if energycheck > 150 then  
                            if energytimer < 5 then
                                energytimer = energytimer + 1
                            end
                            if energytimer == 5 then
                                currentenergy = target:getEnergy()
                                target:setEnergy(currentenergy - 1)
                                energytimer = 0
                            end
                        end
                        if energycheck <= 150 then 
                            if energytimer < 20 then
                                energytimer = energytimer + 1
                            end
                            if energytimer == 20 then
                                currentenergy = target:getEnergy()
                                target:setEnergy(currentenergy - 1)
                                energytimer = 0
                            end
                        end
            end
end
end
                        
--if distance(obj, target) < dist then
        --energycheck = target:getEnergyLevel()
           -- if energycheck > 150 then
               -- if energytimer < 5 then
                --    energytimer = energytimer + 1
               -- end
               -- if energytimer == 5 then
                 --   currentenergy = target:getEnergyLevel()
                  --  target:setEnergyLevel(currentenergy -1)
                  --  energytimer = 0
               -- end
           -- end
           -- if energycheck <= 150 then
                --if energytimer < 20 then
                 --   energytimer = energytimer + 1
               -- end
               -- if energytimer == 20 then
                 --   currentenergy = target:getEnergyLevel()
                 --   target:setEnergyLevel(currentenergy - 1)
                 --   energytimer = 0
              --  end
              --  end
  --  end
--end

--function energydraincpu(obj, target, dist, delta)
	--if distance(obj, target) < dist then
      --  energycheck = target:getEnergy()
          --  if energycheck > 150 then
             --   if energytimer < 5 then
                   -- energytimer = energytimer + 1
               -- end
               -- if energytimer == 5 then
                  --  currentenergy = target:getEnergy()
                   -- target:setEnergy(currentenergy -1)
                   -- energytimer = 0
             --   end
           -- end
           -- if energycheck <= 150 then
               -- if energytimer < 20 then
                --    energytimer = energytimer + 1
              --  end
              --  if energytimer == 20 then
                --    currentenergy = target:getEnergy()
                  --  target:setEnergy(currentenergy - 1)
                  --  energytimer = 0
           --     end
           --     end
  --  end
--end


-- function variables

	energytimer = 0
	autodistresssig = 0
    codeattempts = 0
    siphonaccess = 0
    siphonused = 0
    UCNsiphoned = 1
    greyhatsiphoned = 0



  -- function energysyphon(obj)
     -- if distance(Player, obj) > 15000 then
          --  Player:setEnergyLevel(100)
          ---  print("hahahahahha")
       --end
   --end

end

-------------------
--E.N.D. OF INIT --
-------------------

--GM Buttons functions

--currently having a logic issue with this. figuring it out.
function triggerGMShuttlestart()
	GMShuttlestop = _("stopshutbutton", "Shutdown Shuttle")
	addGMFunction(GMShuttlestop,triggerGMShuttlestop)
		shuttle:setFaction("UCN")
		local plX, plY = player:getPosition(plX - 200, plY - 200):commandDock(player):setEnergyLevel(500)
	removeGMFunction(GMShuttlestart)
	end

function triggerGMShuttlestop()
	GMShuttlestart = _("startshutbutton", "Initiate Shuttle")
	addGMFunction(GMShuttlestart,triggerGMShuttlestart)
		shuttle:commandUndock():setFaction("Independent"):setPosition(-400000, -400000)
	removeGMFunction(GMShuttlestop)
	end

--unknown whether we want to skip and forth with this function. atm I'm destroying it

function triggerGMShuttleplayer()
    GMShuttleplayer = _("shuttleplayerbutton", "CPU shuttle to player")
    addGMFunction(GMShuttleplayer,triggerGMShuttleplayer)
        sx,sy = CPUShuttle:getPosition()
        shuttle:PlayerSpaceship():setPosition(sx,sy):setTemplate("UCN Shuttle"):setCallSign("UCS Scarab-S"):setFaction("UCN")
        CpuShuttle:destroy()
        shuttleshiptype = player
        removeGMFunction(GMShuttleplayer)
    end

---------------------
-- START OF UPDATE --
---------------------

function update(delta)

--CODING ISSUE: CURRENTLY OPENS COMMS IMMEDIATELY ON SPAWNING OF SCENARIO, AND JUST OPENS COMMS RATHER THAN SENTS SPECIFIC MESSAGE. CANNOT TELL WHY--

--if distance(player, Siphon) < 600000 then
  --  if autodistresssig == 0 then   
       -- print("clocked em")
       -- shuttle:sendCommsMessage(player,
          --  _("technicalofficer-incCall", [[SOS - ASSISTANCE NEEDED - CURRENT LOCATION: G22\nREPEAT\nSOS - ASSISTANCE NEEDED - CURRENT LOCATION: G22]])
         --   )
      --  print("sent it")
      --  autodistresssig = 1
  --  end
--end


autodistress(Siphon, CPUshuttle, 80000, "SOS - IMMEDIATE ASSISTANCE NEEDED - SOS\nCURRENT LOCATION: G22\nREPEAT ASSISTANCE NEEDED IN L12")

if UCNsiphoned == 1 then
energydrainplayer(Siphon, player, 20000)
--if shuttleshiptype == player then
--energydrainplayer(Siphon, shuttle, 20000)
--else
--energydrainCPU(Siphon, shuttle, 20000)
--end
end

if greyhatsiphoned == 1 then
energydrainCPU(Siphon, hacker1, 20000)
energydrainCPU(Siphon, hacker2, 20000)
energydrainCPU(Siphon, hacker3, 20000)
energydrainCPU(Siphon, hacker4, 20000)
energydrainCPU(Siphon, hacker5, 20000)
energydrainCPU(Siphon, hacker6, 20000)
energydrainCPU(Siphon, hacker7, 20000)
energydrainCPU(Siphon, hacker8, 20000)
energydrainCPU(Siphon, hacker9, 20000)
end

end
