-- Name: Exploration Retrieve Tech Tier 1
-- Description: Person in shuttle variant y'know' 
-- Type: Basic
-- Variation[Takanami]: This scenario will run on Takanami
-- Variation[Havock]: This scenario will run on Havock

--NICE TO HAVE--

--template that's not called EFS mining rig'


--Function to generate a randomised enemy ship complete with apt life signs etc--tables to help with randomisation etc
--there's likely a way of doing the energy drain according to factions but i'm just doing something that works atm
--non-glitch on shuttle's energy but tbh that's while it's docked. Ship now still loses energy with it docked

--HELP NEEDED--

--zone transparency. cannot figure out
--energy readouts don't update, would need a delta update
--update ice planet stuff because it's having a visual glitch
--buggy docking button

--TO DO LIST--

--energy is not being siphoned from enemy ships. I think that might be because I haven't completed the shift o a faction function'
--SOMETHING i haven't programmed for: if they lose energy a second time, they can't currently pick it up again
--get gsub into comms script; don't need GM warning but if there is a way of doing a reminder on shutdown that'll be important
--when hacker voice understood change descriptions
--hackers are number and xx randomised
--give warp jammers a negative impact on destruction?
--locked on CPU running even thoug people dead'
--default comms script needs to depend on friendliness or faction
--WILL current docking buttons meant hat you'd get entirely different local area readouts from docked shuttle and overall ships'

--check siphonshuttleenergy - use of variable
--I need to get people on functions


--TO CHECK


require("utils.lua")
--require("comms_ship.lua")


-- defining comms function before it's called
-- have not used a script for this as don't know how to refer to variables across scripts

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

	--correct code for access is 'delta omega alpha'

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
            addCommsReply("Remote warp jammer control.", function()
                if warpjammers == 1 then
                    setCommsMessage("Warp jammers current status: active")
                        addCommsReply("Deactivate warp jammers", function()
                            wj1:setRange(0)
                            wj2:setRange(0)
                            wj3:setRange(0)
                            wj4:setRange(0)
                            wj5:setRange(0)
                            wj6:setRange(0)
                            wj7:setRange(0)
                            wj8:setRange(0)
                            warpjammers = 0
                            setCommsMessage("Warp jammers deactivated.")
                            addCommsReply("Back to systems menu", siphonmenu)
                            end)
                        addCommsreply("Back to systems menu", siphonmenu)
                end
                if warpjammers == 0 then
                    setCommsMessage("Warp jammers current status: inactive")
                        addCommsReply("Activate warp jammers", function()
                            wj1:setRange(7000)
                            wj2:setRange(7000)
                            wj3:setRange(7000)
                            wj4:setRange(7000)
                            wj5:setRange(7000)
                            wj6:setRange(7000)
                            wj7:setRange(7000)
                            wj8:setRange(7000) 
                            warpjammers = 1
                            setCommsMessage("Warp jammers activated")
                            addCommsReply("Back to systems menu", siphonmenu)
                            end)
                            addCommsReply("Back to systems menu", siphonmenu)
                end
            end)
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
                                setCommsMessage("All ships within range currently targeted. Factions identified within range:\nUCN\ngreyhat.ships")
                                    addCommsReply("Cease siphoning from faction: UCN", function()
                                        UCNsiphoned = 0
                                            setCommsMessage("Siphoning from UCN ships ceased.")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                        end)
                                    addCommsReply("Cease siphoning from faction: greyhat.ships.", function()
                                        greyhatsiphoned = 0
                                                setCommsMessage("Siphoning from greyhat.ships ceased.")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                        end)
                                        end
                           if UCNsiphoned == 0 and greyhatsiphoned == 1 then
                                setCommsMessage("Factions in range currently targeted:\ngreyhat.ships\n\nFactions in range not currently targeted:\nUCN")
                                    addCommsReply("Cease siphoning from faction: greyhat.ships.", function()
                                        greyhatsiphoned = 0
                                            setCommsMessage("Siphoning from greyhat.ships ceased.")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                    end)
                                    addCommsReply("Siphon energy from faction: UCN", function()
                                        UCNsiphoned = 1
                                            setCommsMessage("Siphoning from UCN ships initiated.")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                    end)
                                    end
                           if UCNsiphoned == 1 and greyhatsiphoned == 0 then
                           	    setCommsMessage("Factions in range currently targeted:\nUCN\n\nFactions in range not currently targeted:\ngreyhat.ships")
                                   addCommsReply("Cease siphoning from faction: UCN", function()
                                        UCNsiphoned = 0
                                            setCommsMessage("Siphoning from UCN ships ceased.")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                    end)
                                        addCommsReply("Siphon energy from faction: greyhat.ships", function()
                                      greyhatsiphoned = 1
                                            setCommsMessage("Siphoning from greyhat.ships initiated")
                                                addCommsReply("Back to systems menu", siphonmenu)
                                    end)
                                    end
                           if UCNsiphoned == 0 and greyhatsiphoned == 0 then
                                setCommsMessage("No ships in current range listed as targets.\n\nFactions identified within range:\nUCN\nGreyhat.shipsN")
                                    addCommsReply("Siphon energy from faction: greyhat.ships", function()
                                      greyhatsiphoned = 1
                                         setCommsMessage("Siphoning from greyhat.ships initiated.")
                                            addCommsReply("Back to systems menu", siphonmenu)
                                            end)
                                    addCommsReply("Siphon energy from faction: UCN", function()
                                        UCNsiphoned = 1
                                            setCommsMessage("Siphoning from UCN ships initiated.")
                                                addCommsReply("Back to systems menu", siphonmenu)
								end)
                                end



								end)
            addCommsReply("Remote destruct protocol", function()
                if descodeattempts == 1 then
                    setCommsMessage("Incorrect code received. Locked out of destruct protocol.")
                        addCommsReply("Back to systems menu", siphonmenu)
                end
                if descodeattempts == 0 then
                setCommsMessage("Code required for protocol")
                    addCommsReply("Enter destruct protocol code", destructcode)
                    addCommsReply("Back to systems menu", siphonmenu)
                    end
                    end)
								end


-- correct code for destruct option is 'gamma delta beta'

	function destructcode()
        if dessiphonaccess == 1 then
            setCommsMessage("Destruct protocol code accepted.\n\nWarning: destruction will be instantaneous upon triggering.")
                            addCommsReply("Trigger remote destruct protocol", function()
                                local sx, sy = Siphon:getPosition()
                                artifact = Artifact:setPosition(sx,sy):setCanBeDestroyed(false)
                                Siphon:destroy()
                                artifact:explode()
                                end)
                            addCommsReply("Back to systems menu", siphonmenu)
        end
        if dessiphonaccess == 0 then
	setCommsMessage("One attempt remaining before locked out of destruct protocol.\n\nEnter first part of code.")
	addCommsReply("alpha", function()
		setCommsMessage("Destruct protocol code incorrect.")
			descodeattempts = descodeattempts + 1
            addCommsReply("Back to systems menu", siphonmenu)
			end)
	addCommsReply("beta", function()
		setCommsMessage("Destruct protocol code incorrect.")
			descodeattempts = descodeattempts + 1
            addCommsReply("Back to systems menu", siphonmenu)
			end)
	addCommsReply("gamma", function()
		setCommsMessage("Enter second part of access code.")
			addCommsReply("alpha", function ()
				setCommsMessage("Destruct protocol code incorrect.")
					descodeattempts = descodeattempts + 1
		            addCommsReply("Back to systems menu", siphonmenu)
					end)
			addCommsReply("beta", function()
				setCommsMessage("Destruct protocol code incorrect.")
					descodeattempts = descodeattempts + 1
		            addCommsReply("Back to systems menu", siphonmenu)
					end)
			addCommsReply("gamma", function()
				setCommsMessage("Destruct protocol code incorrect.")
					descodeattempts = descodeattempts + 1
		            addCommsReply("Back to systems menu", siphonmenu)
					end)
			addCommsReply("delta", function ()
            setCommsMessage("Enter third part of access code.")
					addCommsReply("alpha", function ()
                        setCommsMessage("Destruct protocol code incorrect.")
                      		descodeattempts = descodeattempts + 1
			                addCommsReply("Back to systems menu", siphonmenu)
							end)
					addCommsReply("beta", function()
                      dessiphonaccess = 1
						setCommsMessage("Destruct protocol code accepted.\n\nWarning: destruction will be instantaneous upon triggering.")
                            addCommsReply("Trigger remote destruct protocol", function()
                                local sx, sy = Siphon:getPosition()
                                print("gotposition")
                                Siphon:destroy()
                                print("destroyed1")
                                ExplosionEffect():setPosition(sx,sy):setSize(300)
                                print("exploded")
                                end)
                            addCommsReply("Back to systems menu", siphonmenu)
                    end)
					addCommsReply("gamma", function()
						setCommsMessage("Destruct protocol code incorrect.")
							descodeattempts = descodeattempts + 1
				            addCommsReply("Back to systems menu", siphonmenu)
							end)
					addCommsReply("delta", function ()
						setCommsMessage("Destruct protocol code incorrect.")
							descodeattempts = descodeattempts + 1
				            addCommsReply("Back to systems menu", siphonmenu)
							end)
					addCommsReply("omega", function ()
						setCommsMessage("Destruct protocol code incorrect.")
							descodeattempts = descodeattempts + 1
				            addCommsReply("Back to systems menu", siphonmenu)
							end)
							end)
			addCommsReply("omega", function ()
					setCommsMessage("Destruct protocol code incorrect.")
					descodeattempts = descodeattempts + 1
		            addCommsReply("Back to systems menu", siphonmenu)
					end)
                    end)
                    end
	addCommsReply("delta", function ()
    		setCommsMessage("Destruct protocol code incorrect.")
			descodeattempts = descodeattempts + 1
            addCommsReply("Back to systems menu", siphonmenu)
			end)
	addCommsReply("omega", function ()
		setCommsMessage("Destruct protocol code incorrect.")
			descodeattempts = descodeattempts + 1
            addCommsReply("Back to systems menu", siphonmenu)
			end)
end

function deadship()
    setCommsMessage("Automated backup response broadcast.")
    end

 -- defining energyreadouts variables before they're called

 --function energyreadouts(siphonedship)
       -- beenscanned = siphonedship:isScannedBy(player)
       -- if beenscanned == true then
          --  while siphonedship:isValid() do
              --  return siphonedship:getEnergy()
               -- end
       -- end
 --end

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
Warspite:addInfos(4, "Life signs", "Strong")
Warspite:setScanned(true)
Scarab = CpuShip():setFaction("UCN"):setTemplate("UCS Skirmish Frigate"):setCallSign("UCS Scarab"):setPosition(105582,46109):setHeading(280):setCanBeDestroyed(true):orderIdle():setWeaponStorage("Homing", 15):setDescriptions("Skirmish Class Frigate", "Current orders: Return to homebase.")
Scarab:addInfos(1,"Fabrication date", "2177")
Scarab:addInfos(2,"Current Commander", "Leiutenant Commander Lazarus")
Scarab:addInfos(3,"Number of Personnel", "9")
Scarab:addInfos(4, "Life signs", "Moderate")
Scarab:setHull(50):setWarpDrive(false)

--neutral ships

--enemy ship fighting with SCARAB

--hackershipList = {}
--sizeSet = false
--hackernames = {"HALO", "COD", "DDLC", "RDR", "RCTYCOON", "MKN64", "DK64", "MASSEFFECT"}
--hackerunscanned = {"BACK OFF", "KEEP YOUR DISTANCE", "DO NOT APPROACH", "RETREAT"}
--hackerpartscanned = {"YOU SHOULD TAKE WARNINGS SERIOUSLY", "THE ADAMAS IS OURS", "LAST CHANCE TO TURN BACK", "STOP DIGGING", "YOU WON'T LIKE WHAT YOU FIND"}
--hackerfullscanned = {"HOPE YOU HAVE AN OBITUARY READY", "WHETHER YOU'RE OVERCONFIDENT OR STUPID, IT ENDS THE SAME WAY", "YOU'VE MADE AN ENEMY HERE BUT AT LEAST YOU WON'T BE AROUND TO HAVE ENEMIES SOON", "BAD DECISION", "HOPE IT WAS WORTH THE TROUBLE THIS WILL BRING YOU"}
--function hackerInfo()
  --  if sizeSet == true then
   --     return
  --  end
  --  for _, obj in ipairs(getObjectsInRadius(0,0,100000)) do
     --   if obj.Faction == "Independent" then
      --      table.insert(hackershipList, obj)
    --    end
    --end

minifight1 = CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("Dialup noises"):setPosition(105216, 40144):setRadarSignatureInfo(0.5, 0.9, 0.0):setEnergy(10)
    minifight1:setDescriptionForScanState("notscanned", "Knock knock")
    minifight1:setDescriptionForScanState("simplescan", "Justin")
    minifight1:setDescriptionForScanState("fullscan", "Justin time to get fucked by us")
    minifight1:addInfos(1, "Life signs", "Nil")
minifight2 = CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("Beep Boop"):setPosition(113040, 45369):setRadarSignatureInfo(0.5, 0.9, 0.0)
    minifight2:setDescriptionForScanState("notscanned", "Knock knock")
    minifight2:setDescriptionForScanState("simplescan", "Will")
    minifight2:setDescriptionForScanState("fullscan", "Will you be smart and leave or stick around and die")
    minifight2:addInfos(1, "Life signs", "Nil")
    minifight2:addInfos(2, "Energy readout", string.gsub("Energyread", "Energyread", minifight2:getEnergy()))
minifight3 = CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("Whirr whirr"):setPosition(100000, 50000):setRadarSignatureInfo(0.5, 0.9, 0.0)
    minifight3:setDescriptionForScanState("notscanned", "Knock knock")
    minifight3:setDescriptionForScanState("simplescan", "Go fuck yourself")
    minifight3:setDescriptionForScanState("fullscan", "This isn't a joke. Go fuck yourself.")
    minifight3:addInfos(1, "Life signs", "Nil")
    minifight3:addInfos(2, "Energy readout", string.gsub("Energyread", "Energyread", minifight3:getEnergy()))
   
--enemy ships hiding in nebulas

    hacker1 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_halo"):setPosition(300830, 197231):setWeaponStorage("HVLI", 0):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker1:addInfos(1, "Life signs", "Nil")
    hacker1:addInfos(2, "Energy readout", string.gsub("Energyread", "Energyread", hacker1:getEnergy()))
    hacker1:setDescriptionForScanState("notscanned", "Fuck off")
    hacker1:setDescriptionForScanState("simplescan", "if you can read this you've already fucked up")
    hacker1:setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")
    hacker2 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_COD"):setPosition(297505, 201232):setWeaponStorage("HVLI", 0):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker2:addInfos(1, "Life signs", "Nil")
    hacker2:addInfos(2, "Energy readout", string.gsub("Energyread", "Energyread", hacker2:getEnergy()))
    hacker2:setDescriptionForScanState("notscanned", "Fuck off")
    hacker2:setDescriptionForScanState("simplescan", "my other spaceship is a planet")
    hacker2:setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")
    hacker3 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_RDR"):setPosition(290097, 200491):setWeaponStorage("HVLI", 0):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker3:addInfos(1, "Life signs", "Nil")
    hacker3:addInfos(2, "Energy readout", string.gsub("Energyread", "Energyread", hacker3:getEnergy()))
    hacker3:setDescriptionForScanState("notscanned", "Fuck off")
    hacker3:setDescriptionForScanState("simplescan", "that's not what fucking off looks like friendo")
    hacker3:setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")
    hacker4 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_4TNITE"):setPosition(210445, 269603):setWeaponStorage("HVLI", 0):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker4:addInfos(1, "Life signs", "Nil")
    hacker4:addInfos(2, "Energy readout", string.gsub("Energyread", "Energyread", hacker4:getEnergy()))
    hacker4:setDescriptionForScanState("notscanned", "Fuck off")
    hacker4:setDescriptionForScanState("simplescan", "threats in your ship screens may be closer than they appear")
    hacker4:setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")
    hacker5 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_LEISURESUITLARRY"):setPosition(211464, 261733):setWeaponStorage("HVLI", 0):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker5:addInfos(1, "Life signs", "Nil")
    hacker5:addInfos(2, "Energy readout", string.gsub("Energyread", "Energyread", hacker5:getEnergy()))
    hacker5:setDescriptionForScanState("notscanned", "Fuck off")
    hacker5:setDescriptionForScanState("simplescan", "or die. Usually it's 'fuck off and die' but hey I'll give you a choice.")
    hacker5:setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")
    hacker6 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_DDLC"):setPosition(206093, 272658):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker6:addInfos(1, "Life signs", "Nil")
    hacker6:addInfos(2, "Energy readout", string.gsub("Energyread", "Energyread", hacker6:getEnergy()))
    hacker6:setDescriptionForScanState("notscanned", "Fuck off")
    hacker6:setDescriptionForScanState("simplescan", "I didn't know missile fodder could read")
    hacker6:setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")
    hacker7 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_GOLDENEYE"):setPosition(263246, 260546):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker7:addInfos(1, "Life signs", "Nil")
    hacker7:addInfos(2, "Energy readout", string.gsub("Energyread", "Energyread", hacker7:getEnergy()))
    hacker7:setDescriptionForScanState("notscanned", "Fuck off")
    hacker7:setDescriptionForScanState("simplescan", "What the fuck do you want, a haiku?")
    hacker7:setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")
    hacker8 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_RCTYCOON"):setPosition(266857, 262398):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker8:addInfos(1, "Life signs", "Nil")
    hacker8:addInfos(2, "Energy readout", string.gsub("Energyread", "Energyread", hacker8:getEnergy()))
    hacker8:setDescriptionForScanState("notscanned", "Fuck off")
    hacker8:setDescriptionForScanState("simplescan", "did I stutter?")
    hacker8:setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")
    hacker9 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_DEADBYDAYLIGHT"):setPosition(267135, 264435):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker9:addInfos(1, "Life signs", "Nil")
    hacker9:addInfos(2, "Energy readout", string.gsub("Energyread", "Energyread", hacker9:getEnergy()))
    hacker9:setDescriptionForScanState("notscanned", "Fuck off")
    hacker9:setDescriptionForScanState("simplescan", "this is your last chance for the fuck off option.")
    hacker9:setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")

--abandoned ships in energy siphon radius

    freighter1 = CpuShip():setFaction("Independent"):setTemplate("Goods Freighter 4"):setCallSign("Freighter: Valley"):setPosition(218749, 214270):orderIdle():setEnergy(0)
    freighter1:addInfos(1, "Life signs", "Nil"):setRadarSignatureInfo(0.5, 0.0, 0.0):setCommsFunction(deadship)
    freighter2 = CpuShip():setFaction("Independent"):setTemplate("Goods Freighter 1"):setCallSign("Freighter: Mountain"):setPosition(222658, 228979):orderIdle():setEnergy(0)
    freighter2:addInfos(1, "Life signs", "Nil"):setRadarSignatureInfo(0.5, 0.0, 0.0):setCommsFunction(deadship)
    freighter3 = CpuShip():setFaction("Independent"):setTemplate("Personnel Freighter 2"):setCallSign("Freighter: Skiff"):setPosition(232096, 225331):orderRoaming():setEnergy(0)
    freighter3:addInfos(1, "Life signs", "Nil"):setRadarSignatureInfo(0.5, 0.0, 0.0):setCommsFunction(deadship)

--variations
function setVariations()
    if string.find(getScenarioVariation(), "Havock") then
        	player:setTemplate("UCS Skirmish Class Frigate"):setCallSign("UCS Havock"):setFaction("UCN")
	        CPUshuttle:setTemplate("UCN Shuttle"):setCallSign("UCS Scarab-S"):setFaction("Independent"):setEnergy(0):addInfos(1, "Life signs", "Minimal")
            shipchoice = "HAVOCK"
    elseif string.find(getScenarioVariation(), "Takanami") then
            player:setTemplate("UCS Hoplite Class Destroyer"):setCallSign("UCS Takanami"):setFaction("UCN")
	        CPUshuttle:setTemplate("UCN Shuttle"):setCallSign("UCS Scarab-S"):setFaction("Independent"):setEnergy(0):addInfos(1, "Life signs", "Minimal")
	        shipchoice = "TAKANAMI"
    end
end

--tech items and artifacts

Siphon = SpaceStation():setTemplate("Commonwealth Mining Rig"):setCommsFunction(siphonmenu):setFaction("Independent"):setCallSign("UCS Scarab-S"):setPosition(228379, 224498)

    wj1 = WarpJammer():setFaction("Independent"):setPosition(228725, 204562)
    wj2 = WarpJammer():setFaction("Independent"):setPosition(228708, 244291)
    wj3 = WarpJammer():setFaction("Independent"):setPosition(247911, 224365)
    wj4 = WarpJammer():setFaction("Independent"):setPosition(208727, 224457)
    wj5 = WarpJammer():setFaction("Independent"):setPosition(214447, 210339)
    wj6 = WarpJammer():setFaction("Independent"):setPosition(242429, 210488)
    wj7 = WarpJammer():setFaction("Independent"):setPosition(213744, 237143)
    wj8 = WarpJammer():setFaction("Independent"):setPosition(242873, 237846)

    Mine():setPosition(109698, 41544)
    Mine():setPosition(99964, 43803)

--zones

zone = nil
function zonereveal()
siphonscanstate = Siphon:isScannedBy(player)
    if siphonscanstate == true and zone == nil then
           zone = Zone():setPoints(228692, 204750, 236296, 206211, 242287, 210792, 246661, 216680, 248225, 224596, 247026, 231316, 242964, 237929, 237233, 241994, 228640, 244388, 220826, 242619, 214421, 238242, 211190, 231681, 208795, 224595, 210200, 216940, 214473, 210428, 221191, 206211):setColor(255, 255, 0):setLabel("")
    end
end

--terrain

--planets

    Planet():setPosition(284332, 235056):setPlanetRadius(500):setPlanetSurfaceTexture("planets/ice_planet.jpg"):setPlanetCloudTexture("planets/ice_planet_layer.png"):setPlanetAtmosphereTexture("planets/ice_planet_atmos.png")

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

--BUTTONS YOU START WITH--

GMScarabAttack = _("scarabattackbutton", "Scarab Attack")
addGMFunction(GMScarabAttack,triggerGMScarabAttack)

--BUTTONS THAT ARE CALLED LATER--

GMBackupDistress = _("backupdistressbutton", "Distress Call")

GMShuttlestart = _("startshutbutton", "Initiate Shuttle")

GMShuttlestop = _("stopshutbuttonnew", "Shutdown Shuttle")

GMSiphonWave = _("siphonwavebutton", "1st Siphon Wave")

GMSiphonWave2 = _("siphonwavebutton2", "2nd Siphon Wave")

GMShuttletransfer = _("shuttletransferbutton", "Shuttle transfer")

GMDockWithPlayer = _("shuttledockwithplayer", "Dock Scarab-S")

GMDisappearDocked = _("disappeardocked", "Remove docked shuttle")

GMDisappearDockednew = _("disappeardocked2", "Remove docked shuttle")

setVariations()
player:commandDock(Warspite)

--scenario-specific functions

--function autocommsswitch()
    --if GMoncomms is 0 then
     --  commsSwitchToGM
     --  end
    --if GMoncomms is 1 then
        --SOMEHOW GO TO AUTOMATED COMMS
    

function autodistress2(obj, obj_2, dist, message)
    if autodistresssig2 == 0 then
	    if distance(player,obj) < dist then
            print("clocked em")
            --have tried globalmessage function but doesn't ever seem to function
            --GlobalMessage("SOS - ASSISTANCE NEEDED - G22")
			obj_2:sendCommsMessage(player,
			_(message))
            print("sent it")
            autodistresssig2 = 1
            end
	    end
end


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
            CPUshuttle:setFaction("UCN")
            print("factionchanged")
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
                --energysiphontriggered = 1
                if playerlogmessage == 0 then
                    if target == player then
                    target:addToShipLog("Rapid energy loss initiated outside ship's systems", "red", "Engineering")
                    playerlogmessage = 1
                    end
                end
                if shuttlelogmessage == 0 then
                    if target == shuttle then
                    target:addToShipLog("Rapid energy loss initiated outside ship's systems", "red", "Engineering")
                    shuttlelogmessage = 1
                    end
                end
            removeGMFunction(GMBackupDistress)
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

--function to reset variables so re-entering siphon radius will trigger new engineering warning
function energydrainoff(source, target, dist)
       if distance (source, target) > dist then
            if target == player then
            playerlogmessage = 0
        print("variable updated")
        end
            if target == shuttle then
            shuttlelogmessage = 0
        end
        end
  end

--function to drain energy from enemy ships if comms script used aptly
function energydrainCPU(source, faction, dist, delta)
        for _, obj_in_range in ipairs(source:getObjectsInRange(dist)) do
         targetfaction = obj_in_range:getFaction()
              if targetfaction == faction then
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
                                printenergy = hacker1:getEnergy()
                                print(printenergy)
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
                        
-- STARTING VALUES FOR ALL REQUIRED VARIABLES

	energytimer = 0
	autodistresssig = 0
    autodistresssig2 = 0
    codeattempts = 0
    siphonaccess = 0
    siphonused = 0
    UCNsiphoned = 1
    greyhatsiphoned = 0
    GMoncomms = 1
    logmessage = 0
    shuttlespawn = 0
    warpjammers = 1
    descodeattempts = 0
    dessiphonaccess = 0
    siphonshuttleenergy = 0
    playerlogmessage = 0
    shuttlelogmessage = 0
    wavebuttonactivated = 0

    --energysiphontriggered = 0

end

-------------------
--E.N.D. OF INIT --
-------------------

----------------------
--GM BUTTONS LISTING--
----------------------

--OPENING GM BUTTONS--

--Scarab attack

--to automate setting people on scarab
function triggerGMScarabAttack()
    print("going for scarab attack")
    minifight1:setFaction("corsair"):orderAttack(Scarab)
    minifight2:setFaction("corsair"):orderAttack(Scarab)
    minifight3:setFaction("corsair"):orderAttack(Scarab)
    addGMFunction(GMShuttletransfer,triggerGMShuttletransfer)
    removeGMFunction(GMScarabAttack)
    end

--MID-GAME GM BUTTONS--

--Transfer shuttle to the Scarab
--Disappear a docked ship
--Backup distress call (triggered by use of shuttle transfer button)
--Dock Scarab-S with Ship (triggered by proximity to shuttle)
--Destroy CPU shuttle once docked
--Launch Scarab-S from Ship (triggered by use of above dock button; afterwards triggered by on/off of launch button)
--Redock Scarab-S (triggered by on/off of launch button)
--Send 1st and 2nd wave of hacker ships (triggered by proximity to shuttle)

-- to send Takanami/Havock shuttle to Scarab and trigger next likely button
function triggerGMShuttletransfer()
   tx,ty = player:getPosition()
   tempshuttle = CpuShip():setTemplate("UCN Shuttle"):setFaction("UCN"):setPosition(tx,ty)
   if shipchoice == "HAVOCK" then
    tempshuttle:setCallSign("UCS Havock-S"):orderDock(Scarab)
    end
   if (shipchoice == "TAKANAMI") then
    tempshuttle:setCallSign("UCS Takanami-S"):orderDock(Scarab)
    end
    removeGMFunction(GMShuttletransfer)
    addGMFunction(GMDisappearDocked,triggerGMDisappearDocked)
    addGMFunction(GMBackupDistress,triggerGMBackupDistress)
    end

--disappear the ship shuttle after docking with Scarab
  function triggerGMDisappearDocked()
        if tempshuttle:isDocked(Scarab) == true then
        tempshuttle:destroy()
        removeGMFunction(GMDisappearDocked)
        end
    end

--to send a fake Scarab-S distress call if they don't answer the first
function triggerGMBackupDistress()
    Siphon:setCallSign("UCS Scarab-S")
    Siphon:sendCommsMessage(player,
    _("SOS - IMMEDIATE ASSISTANCE NEEDED - SOS\nCURRENT LOCATION: L12\nREPEAT ASSISTANCE NEEDED IN L12"))
    Siphon:setCallSign("XX_ES_vendetta")
    addGMMessage("backup distress signal sent")
    end

--to get the CPUShuttle to dock with the player, using just mouse clicks is a problem so requires automation
function triggerGMDockWithPlayer()
    CPUshuttle:orderDock(player)
    removeGMFunction(GMDockWithPlayer)
    addGMFunction(GMDisappearDockednew)
end

--To disappear the docked Scarab shuttle
function triggerGMDisappearDockednew()
    if CPUshuttle:isDocked(player) == true then
    CPUshuttle:destroy()
    removeGMFunction(GMDisappearDockednew)
    addGMFunction(GMShuttlestart,triggerGMShuttlestart)
    end
end


-- to bring back the player shuttle (for when it's 'undocked')
function triggerGMShuttlestart()
    removeGMFunction(GMShuttlestart)
    addGMFunction(GMShuttlestop,triggerGMShuttlestop)
        if shuttlespawn == 0 then
        shuttle = PlayerSpaceship():setTemplate("UCN Shuttle"):setCallSign("UCS Scarab-S"):setFaction("UCN")
		local plX, plY = player:getPosition()
        shuttle:setPosition(plX - 200, plY - 200):commandDock(player):setEnergyLevel(500)
        shuttlespawn = 1
        end
        if shuttlespawn == 1 then
        local plX, plY = player:getPosition()
        shuttle:setPosition(plX - 200, plY - 200):commandDock(player)
        end
	end

--to remove the player shuttle and hide it out of player sight (for when it's 'docked')
function triggerGMShuttlestop()
    removeGMFunction(GMShuttlestop)
    addGMFunction(GMShuttlestart,triggerGMShuttlestart)
        player:commandUndock()
        shuttle:commandUndock():setFaction("Independent"):setPosition(-400000, -400000)
    end
       
--to send waves to the Ship near end
function triggerGMSiphonWave()
    hacker1:setFaction("corsair"):orderAttack(player)
    hacker2:setFaction("corsair"):orderAttack(player)
    hacker3:setFaction("corsair"):orderAttack(player)
    addGMFunction(GMSiphonWave2,triggerGMSiphonWave2)
    removeGMFunction(GMSiphonWave)
    end

function triggerGMSiphonWave2()
    hacker4:setFaction("corsair"):orderAttack(player)
    hacker5:setFaction("corsair"):orderAttack(player)
    hacker6:setFaction("corsair"):orderAttack(player)
    removeGMFunction(GMSiphonWave2)
    end

----------------------------
---E.N.D. OF GM FUNCTIONS---
----------------------------

---------------------
-- START OF UPDATE --
---------------------

function update(delta)

--damage scarab when players approach scene of fight
if distance(player,Scarab) < 30000 then
  Scarab:setHull(35):setShields(25,30):setSystemHealth("maneuver", 0.5):setSystemHealth("impulse", 0.75):setSystemHealth("frontshield", 0.4)
  end

--trigger buttons when players near energy siphon
if wavebuttonactivated == 0 then
if distance(player,Siphon) < 20000 then
    wavebuttonactivated = 1
    addGMFunction(GMDockWithPlayer,triggerGMDockWithPlayer)
    addGMFunction(GMSiphonWave,triggerGMSiphonWave)
    end
end

--make ship drop cargo crate when destroyed
minifight3:onDestruction(
    function()
        nx,ny = minifight3:getPosition()
           print("i'd do a thing with a bit o cargo here")
               Artifact():setPosition(nx,ny):setCanBeDestroyed(false):setModel("cargo"):setSpin(1.5):allowPickup(true):onPickUp(function() player:addToShipLog("New item in cargo hatch", "Blue", "Helms") end) 
               end)

--call autodistress function for Scarab and shuttle
autodistress(Siphon, CPUshuttle, 80000, "SOS - IMMEDIATE ASSISTANCE NEEDED - SOS\nCURRENT LOCATION: L12\nREPEAT ASSISTANCE NEEDED IN L12")
autodistress2(Scarab, Scarab, 80000, "SOS - CURRENTLY UNDER ATTACK - SOS\nCURRENT LOCATION: C6")

--call engineering log that flags energy loss function
if playerlogmessage == 1 then
energydrainoff(Siphon, player, 20000)
end

--same but for shuttle
if shuttlelogmessage == 1 then
energydrainoff(Siphon, shuttle, 20000)
end

--call energy siphoning functions (according to comms script triggers)
if UCNsiphoned == 1 then
energydrainplayer(Siphon, player, 20000)
if siphonshuttleenergy == 1 then
energydrainplayer(Siphon, shuttle, 20000)
else
energydrainCPU(Siphon, CPUshuttle, 20000)
end
end

--call energy siphoning functions (according to comms script triggers)
if greyhatsiphoned == 1 then
energydrainCPU(Siphon, "Independent", 20000)
--energydrainCPU(Siphon, hacker1, 20000)
--energydrainCPU(Siphon, hacker2, 20000)
--energydrainCPU(Siphon, hacker3, 20000)
--energydrainCPU(Siphon, hacker4, 20000)
--energydrainCPU(Siphon, hacker5, 20000)
--energydrainCPU(Siphon, hacker6, 20000)
--energydrainCPU(Siphon, hacker7, 20000)
--energydrainCPU(Siphon, hacker8, 20000)
--energydrainCPU(Siphon, hacker9, 20000)
end

--call function to reveal effect zone around siphon once scanned
--zonereveal()

end

--------------------------------
--E.N.D. OF UPDATE AND SCRIPT --
--------------------------------