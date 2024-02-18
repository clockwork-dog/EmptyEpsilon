-- Name: Debugged Exploration Retrieve Tech Tier 1
-- Description: Person in shuttle variant - MID FEBRURARY TECH EDIT
-- Type: Basic
-- Variation[Takanami]: This scenario will run on Takanami
-- Variation[Havock]: This scenario will run on Havock

--GMing notes

--Many things are automated or button-based
--One specific manual job is tweaking corsair ships if the energy siphon is targeting them

--TO DO LIST--

--Check ice planet layers and how they render on on-ship comps (DURING TECH)
--Note: the siphon doesn't account for going past max (currently just caps player energy) - doesn't 'still have spare' in this case

--Check how next update with docking affects energy loss for shuttle etc

--Some buttons will be obsolete with the new versions re docking

require("utils.lua")

--defining comms function for siphon

function siphonmenu()
    if siphonlocked == 1 then
        setCommsMessage("ACCESS DENIED TO UCN WANNABE HACKERS")
    else
        if comms_source == player then
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
        else
            if shsiphonaccess == 1 then
		        setCommsMessage("Energy Siphon: XX_ES_vendetta")
			        addCommsReply("Access control panel", siphoncomms)
	        elseif shcodeattempts == 3 then
		        setCommsMessage("Energy Siphon: XX_ES_vendetta\nAccess locked following incorrect attempts.")
	        elseif shcodeattempts == 2 then
		        setCommsMessage("Energy Siphon: XX_ES_vendetta\nEnter 3-part access code.\nOne attempt remaining.")
			        addCommsReply("Enter code", siphoncode)
	        elseif shcodeattempts == 1 then
		        setCommsMessage("Energy Siphon: XX_ES_vendetta\nEnter 3-part access code.\nTwo attempts remaining.")
			        addCommsReply("Enter code", siphoncode)
	        elseif shcodeattempts == 0 then
		        setCommsMessage("Energy Siphon: XX_ES_vendetta\nEnter 3-part access code.")
			        addCommsReply("Enter code", siphoncode)
            end
        end
    end
end

	--correct code for access is 'delta omega alpha'

	function siphoncode()
	setCommsMessage("Enter first part of code.")
	addCommsReply("alpha", function()
		setCommsMessage("Access Code incorrect.")
			if comms_source == player then
                codeattempts = codeattempts + 1
            end
            if comms_source == shuttle then
                shcodeattempts = shcodeattempts + 1
            end
			addCommsReply("Re-enter code", siphonmenu)
			end)
	addCommsReply("beta", function()
		setCommsMessage("Access Code incorrect.")
			if comms_source == player then
                codeattempts = codeattempts + 1
            end
            if comms_source == shuttle then
                shcodeattempts = shcodeattempts + 1
            end
			addCommsReply("Re-enter code", siphonmenu)
			end)
	addCommsReply("gamma", function()
		setCommsMessage("Access Code incorrect.")
			if comms_source == player then
                codeattempts = codeattempts + 1
            end
            if comms_source == shuttle then
                shcodeattempts = shcodeattempts + 1
            end
			addCommsReply("Re-enter code", siphonmenu)
			end)
	addCommsReply("delta", function ()
        setCommsMessage("First part of access code accepted.")
            addCommsReply("Enter second part of access code.", function()
		        setCommsMessage("Enter second part of access code.")
			        addCommsReply("alpha", function ()
				        setCommsMessage("Access Code incorrect.")
					    if comms_source == player then
                            codeattempts = codeattempts + 1
                        end
                        if comms_source == shuttle then
                            shcodeattempts = shcodeattempts + 1
                        end
					        addCommsReply("Re-enter code", siphonmenu)
					end)
			        addCommsReply("beta", function()
				        setCommsMessage("Access Code incorrect.")
					    if comms_source == player then
                            codeattempts = codeattempts + 1
                        end
                        if comms_source == shuttle then
                            shcodeattempts = shcodeattempts + 1
                        end
					        addCommsReply("Re-enter code", siphonmenu)
					end)
			        addCommsReply("gamma", function()
				        setCommsMessage("Access Code incorrect.")
					    if comms_source == player then
                            codeattempts = codeattempts + 1
                        end
                        if comms_source == shuttle then
                            shcodeattempts = shcodeattempts + 1
                        end
					        addCommsReply("Re-enter code", siphonmenu)
					end)
			        addCommsReply("delta", function ()
				        setCommsMessage("Access Code incorrect.")
					    if comms_source == player then
                            codeattempts = codeattempts + 1
                        end
                        if comms_source == shuttle then
                            shcodeattempts = shcodeattempts + 1
                        end
					        addCommsReply("Re-enter code", siphonmenu)
					end)
			        addCommsReply("omega", function ()
                        setCommsMessage("Second part of access code accepted.")
                            addCommsReply("Enter third part of access code.", function()
				                setCommsMessage("Enter third part of access code.")
					                addCommsReply("alpha", function ()
						                setCommsMessage("Access Code Accepted.")
						                if comms_source == player then
                                            siphonaccess = 1
                                        end
                                        if comms_source == shuttle then
                                        shsiphonaccess = 1
                                        end
							            addCommsReply("View control menu", siphoncomms)
							        end)
					addCommsReply("beta", function()
						setCommsMessage("Access Code incorrect.")
					    if comms_source == player then
                            codeattempts = codeattempts + 1
                        end
                        if comms_source == shuttle then
                            shcodeattempts = shcodeattempts + 1
                        end
							addCommsReply("Re-enter code", siphonmenu)
							end)
					addCommsReply("gamma", function()
						setCommsMessage("Access Code incorrect.")
					    if comms_source == player then
                            codeattempts = codeattempts + 1
                        end
                        if comms_source == shuttle then
                            shcodeattempts = shcodeattempts + 1
                        end
							addCommsReply("Re-enter code", siphonmenu)
							end)
					addCommsReply("delta", function ()
						setCommsMessage("Access Code incorrect.")
					    if comms_source == player then
                            codeattempts = codeattempts + 1
                        end
                        if comms_source == shuttle then
                            shcodeattempts = shcodeattempts + 1
                        end
							addCommsReply("Re-enter code", siphonmenu)
							end)
					addCommsReply("omega", function ()
						setCommsMessage("Access Code incorrect.")
					    if comms_source == player then
                            codeattempts = codeattempts + 1
                        end
                        if comms_source == shuttle then
                            shcodeattempts = shcodeattempts + 1
                        end
							addCommsReply("Re-enter code", siphonmenu)
							end)
							end)
							end)
                            end)
                            end)
	addCommsReply("omega", function ()
		setCommsMessage("Access Code incorrect.")
		if comms_source == player then
            codeattempts = codeattempts + 1
        end
        if comms_source == shuttle then
            shcodeattempts = shcodeattempts + 1
        end
			addCommsReply("Re-enter code", siphonmenu)
			end)
end

function siphoncomms()
		setCommsMessage("Access code accepted. Select systems for remote control.")
            addCommsReply("Remote warp jammer control", function()
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
                            addCommsReply("Back to systems menu", siphoncomms)
                            end)
                        addCommsReply("Back to systems menu", siphoncomms)
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
                            addCommsReply("Back to systems menu", siphoncomms)
                            end)
                            addCommsReply("Back to systems menu", siphoncomms)
                end
            end)
			addCommsReply("Energy provision", function()
                print(siphonreserves)
                print(siphonbumpshuttle)
                print("shuttle start "..energystartshuttle)
                print("shuttle end "..energyendshuttle)
                print("player start "..energystartplayer)
                print("player end "..energyendplayer)
                siphonreservesint = math.floor(siphonreserves)
                print(siphonreservesint)
                    if UCNsiphoned == 1 then
                            setCommsMessage("Current stored energy reserves: " ..siphonreservesint.."\n\nEnergy transfer cannot be initiated by actively targeted vessel.")
                    end
                    if UCNsiphoned == 0 then
                        if siphonreserves == 0 then 
                            setCommsMessage("Current stored energy reserves: " ..siphonreservesint.."\n\nNo energy to transfer.")
                        else
                        setCommsMessage("Current stored energy reserves: "..siphonreservesint.."\n\nTransfer energy to current vessel?")
                            addCommsReply("Yes", function()
                                setCommsMessage("Energy transfer initiated.")
                                    if comms_source == player then
                                        currentenergy1 = player:getEnergyLevel()
                                        print(currentenergy1)
                                        newenergy = currentenergy1 + siphonreserves
                                        print(newenergy)
                                        if newenergy > 1000 then
                                            newenergy = 1000
                                        end
                                        print(newenergy)
                                        player:setEnergyLevel(newenergy)
                                        siphonreserves = 0
                                        print(siphonreserves)
                                        print(siphonbumpplayer)
                                        player:addToShipLog("Energy reserves restocked.", "red", "Engineering")
                                        addCommsReply("Back to systems menu", siphoncomms)
                                    end
                                    if comms_source == shuttle then
                                        currentenergy1 = shuttle:getEnergyLevel()
                                        print(currentenergy1)
                                        newenergy = currentenergy1 + siphonreserves
                                        print(newenergy)
                                        if newenergy > 500 then
                                            newenergy = 500
                                        end
                                        print(newenergy)
                                        shuttle:setEnergyLevel(newenergy)
                                        siphonreserves = 0
                                        print(siphonreserves)
                                        print(siphonbumpplayer)
                                        shuttle:addToShipLog("Energy reserves restocked.", "red", "Engineering")
                                        addCommsReply("Back to systems menu", siphoncomms)
                                    end
                            end)
                        end
                    end
                    addCommsReply("Back to systems menu", siphoncomms)
                    end)
			addCommsReply("Siphon targeting", function()
                            if UCNsiphoned == 1 and greyhatsiphoned == 1 then
                                setCommsMessage("All factions within range currently targeted.\n\nFactions identified within range:\nUCN\ngreyhat.ships")
                                    addCommsReply("Cease siphoning from faction: UCN", function()
                                        UCNsiphoned = 0
                                            setCommsMessage("Siphoning from UCN ships ceased.")
                                                addCommsReply("Back to systems menu", siphoncomms)
                                    end)
                                    addCommsReply("Cease siphoning from faction: greyhat.ships.", function()
                                        greyhatsiphoned = 0
                                                addGMMessage("greyhat ships no longer being siphoned")
                                                setCommsMessage("Siphoning from greyhat.ships ceased.")
                                                addCommsReply("Back to systems menu", siphoncomms)
                                    end)
                                        addCommsReply("Back to systems menu", siphoncomms)
                            end
                            if UCNsiphoned == 0 and greyhatsiphoned == 1 then
                                setCommsMessage("Factions in range currently targeted:\ngreyhat.ships\n\nFactions in range not currently targeted:\ngreyhat.ships")
                                    addCommsReply("Cease siphoning from faction: greyhat.ships.", function()
                                        greyhatsiphoned = 0
                                            addGMMessage("greyhat ships no longer being siphoned")
                                            setCommsMessage("Siphoning from greyhat.ships ceased.")
                                                addCommsReply("Back to systems menu", siphoncomms)
                                    end)
                                    addCommsReply("Siphon energy from faction: UCN", function()
                                        UCNsiphoned = 1
                                        energytracktimer = 0
                                        energytracktimers = 0
                                        energystartplayercaptured = 0
                                        energystartshuttlecaptured = 0
                                            setCommsMessage("Siphoning from UCN ships initiated.")
                                                addCommsReply("Back to systems menu", siphoncomms)
                                    end)
                                    addCommsReply("Back to systems menu", siphoncomms)
                            end
                            if UCNsiphoned == 1 and greyhatsiphoned == 0 then
                           	    setCommsMessage("Factions in range currently targeted:\nUCN\n\nFactions in range not currently targeted:\ngreyhat.ships")
                                   addCommsReply("Cease siphoning from faction: UCN", function()
                                        UCNsiphoned = 0
                                            setCommsMessage("Siphoning from UCN ships ceased.")
                                                addCommsReply("Back to systems menu", siphoncomms)
                                    end)
                                    addCommsReply("Siphon energy from faction: greyhat.ships", function()
                                      greyhatsiphoned = 1
                                            addGMMessage("greyhat ships now being siphoned")
                                            setCommsMessage("Siphoning from greyhat.ships initiated")
                                                addCommsReply("Back to systems menu", siphoncomms)
                                    end)
                                    addCommsReply("Back to systems menu", siphoncomms)
                            end
                            if UCNsiphoned == 0 and greyhatsiphoned == 0 then
                                setCommsMessage("No ships in current range listed as targets.\n\nFactions identified within range:\nUCN\nGreyhat.shipsN")
                                    addCommsReply("Siphon energy from faction: greyhat.ships", function()
                                        greyhatsiphoned = 1
                                        addGMMessage("greyhat ships now being siphoned")
                                        setCommsMessage("Siphoning from greyhat.ships initiated.")
                                            addCommsReply("Back to systems menu", siphoncomms)
                                    end)
                                    addCommsReply("Siphon energy from faction: UCN", function()
                                        UCNsiphoned = 1
                                            setCommsMessage("Siphoning from UCN ships initiated.")
                                                addCommsReply("Back to systems menu", siphoncomms)
								    end)
                                addCommsReply("Back to systems menu", siphoncomms)
                            end
			end)
            addCommsReply("Remote destruct protocol", function()
                if comms_source == player and descodeattempts == 1 then
                    setCommsMessage("Incorrect code received. Locked out of destruct protocol.")
                        addCommsReply("Back to systems menu", siphoncomms)
                end
                if comms_source == shuttle and shdescodeattempts == 1 then
                    setCommsMessage("Incorrect code received. Locked out of destruct protocol.")
                        addCommsReply("Back to systems menu", siphoncomms)
                end
                if comms_source == player and descodeattempts == 0 then
                setCommsMessage("Code required for protocol")
                    addCommsReply("Enter destruct protocol code", destructcode)
                    addCommsReply("Back to systems menu", siphoncomms)
                end
                if comms_source == shuttle and shdescodeattempts == 0 then
                setCommsMessage("Code required for protocol")
                    addCommsReply("Enter destruct protocol code", destructcode)
                    addCommsReply("Back to systems menu", siphoncomms)
                end
                    end)
end

-- correct code for destruct option is 'gamma delta beta'

	function destructcode()
        if comms_source == player and dessiphonaccess == 0 then
            setCommsMessage("One attempt remaining before locked out of destruct protocol.\n\nFirst part of access code required")
                addCommsReply("Enter first part of access code", destructcodeentry)
        end
        if comms_source == shuttle and shdessiphonaccess == 0 then
            setCommsMessage("One attempt remaining before locked out of destruct protocol.\n\nFirst part of access code required")
                addCommsReply("Enter first part of access code", destructcodeentry)
        end
        if comms_source == player and dessiphonaccess == 1 then
            setCommsMessage("Destruct protocol code accepted.\n\nWarning: destruction will be instantaneous upon triggering.")
                            addCommsReply("Trigger remote destruct protocol", function()
                                local sx, sy = Siphon:getPosition()
                                artifact = Artifact:setPosition(sx,sy)
                                Siphon:destroy()
                                artifact:explode()
                                end)
                            addCommsReply("Back to systems menu", siphonmenu)
        end
        if comms_source == shuttle and shdessiphonaccess == 1 then
            setCommsMessage("Destruct protocol code accepted.\n\nWarning: destruction will be instantaneous upon triggering.")
                            addCommsReply("Trigger remote destruct protocol", function()
                                local sx, sy = Siphon:getPosition()
                                artifact = Artifact:setPosition(sx,sy)
                                Siphon:destroy()
                                artifact:explode()
                                end)
                            addCommsReply("Back to systems menu", siphonmenu)
        end
    end

    function destructcodeentry()
    setCommsMessage("Enter first part of code.")
	addCommsReply("alpha", function()
		setCommsMessage("Destruct protocol code incorrect.")
            if comms_source == shuttle then
                shdescodeattempts = shdescodeattempts + 1
            end
            if comms_source == player then
			    descodeattempts = descodeattempts + 1
            end
            addCommsReply("Back to systems menu", siphonmenu)
	end)
	addCommsReply("beta", function()
		setCommsMessage("Destruct protocol code incorrect.")
			if comms_source == shuttle then
                shdescodeattempts = shdescodeattempts + 1
            end
            if comms_source == player then
			    descodeattempts = descodeattempts + 1
            end
            addCommsReply("Back to systems menu", siphonmenu)
	end)
	addCommsReply("gamma", function()
        setCommsMessage("First part of access code accepted.")
            addCommsReply("Enter second part of access code.", function()
		        setCommsMessage("Enter second part of access code.")
			        addCommsReply("alpha", function ()
				        setCommsMessage("Destruct protocol code incorrect.")
					        if comms_source == shuttle then
                                shdescodeattempts = shdescodeattempts + 1
                            end
                            if comms_source == player then
			                    descodeattempts = descodeattempts + 1
                            end
		                    addCommsReply("Back to systems menu", siphonmenu)
					end)
			        addCommsReply("beta", function()
				        setCommsMessage("Destruct protocol code incorrect.")
					        if comms_source == shuttle then
                                shdescodeattempts = shdescodeattempts + 1
                            end
                            if comms_source == player then
			                    descodeattempts = descodeattempts + 1
                            end
		                    addCommsReply("Back to systems menu", siphonmenu)
					end)
			        addCommsReply("gamma", function()
				        setCommsMessage("Destruct protocol code incorrect.")
					        if comms_source == shuttle then
                                shdescodeattempts = shdescodeattempts + 1
                            end
                            if comms_source == player then
			                    descodeattempts = descodeattempts + 1
                            end
		                    addCommsReply("Back to systems menu", siphonmenu)
					end)
			        addCommsReply("delta", function ()
                        setCommsMessage("Second part of access code accepted.")
                            addCommsReply("Enter third part of access code.", function()
                                setCommsMessage("Enter third part of access code.")
					                addCommsReply("alpha", function ()
                                        setCommsMessage("Destruct protocol code incorrect.")
									        if comms_source == shuttle then
                                                shdescodeattempts = shdescodeattempts + 1
                                            end
                                            if comms_source == player then
			                                    descodeattempts = descodeattempts + 1
                                            end
			                                    addCommsReply("Back to systems menu", siphonmenu)
							        end)
					                addCommsReply("beta", function()
                                        if comms_source == player then 
                                            dessiphonaccess = 1
                                        end
                                        if comms_source == shuttle then
                                            shdessiphonaccess = 1
                                        end
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
									        if comms_source == shuttle then
                                                shdescodeattempts = shdescodeattempts + 1
                                            end
                                            if comms_source == player then
			                                    descodeattempts = descodeattempts + 1
                                            end
				                            addCommsReply("Back to systems menu", siphonmenu)
							        end)
					                addCommsReply("delta", function ()
						                setCommsMessage("Destruct protocol code incorrect.")
									        if comms_source == shuttle then
                                                shdescodeattempts = shdescodeattempts + 1
                                            end
                                            if comms_source == player then
			                                    descodeattempts = descodeattempts + 1
                                            end
				                            addCommsReply("Back to systems menu", siphonmenu)
							        end)
					                addCommsReply("omega", function ()
						                setCommsMessage("Destruct protocol code incorrect.")
									        if comms_source == shuttle then
                                                shdescodeattempts = shdescodeattempts + 1
                                            end
                                            if comms_source == player then
			                                    descodeattempts = descodeattempts + 1
                                            end
				                            addCommsReply("Back to systems menu", siphonmenu)
							        end)
							end)
                    end)
			addCommsReply("omega", function ()
					setCommsMessage("Destruct protocol code incorrect.")
					    if comms_source == shuttle then
                            shdescodeattempts = shdescodeattempts + 1
                        end
                        if comms_source == player then
			                descodeattempts = descodeattempts + 1
                        end
		            addCommsReply("Back to systems menu", siphonmenu)
			end)
            end)
    end)
	addCommsReply("delta", function ()
    		setCommsMessage("Destruct protocol code incorrect.")
			if comms_source == shuttle then
                shdescodeattempts = shdescodeattempts + 1
            end
            if comms_source == player then
			    descodeattempts = descodeattempts + 1
            end
            addCommsReply("Back to systems menu", siphonmenu)
	end)
	addCommsReply("omega", function ()
		setCommsMessage("Destruct protocol code incorrect.")
			if comms_source == shuttle then
                shdescodeattempts = shdescodeattempts + 1
            end
            if comms_source == player then
			    descodeattempts = descodeattempts + 1
            end
            addCommsReply("Back to systems menu", siphonmenu)
	end)
end

function deadship()
    setCommsMessage("Automated comms system broadcasting.\n\nLast recorded message: Ship energy minimal, support systems failing.")
    end

--playerships

player = PlayerSpaceship():setPosition(500,0)
shuttle = PlayerSpaceship():setPosition(235575,232398)

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

--enemy ships fighting with SCARAB

minifight1 = CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("XX_388"):setPosition(105216, 40144):setRadarSignatureInfo(0.5, 0.9, 0.0):setEnergy(10)
    minifight1:setDescriptionForScanState("notscanned", "Knock knock"):setDescriptionForScanState("simplescan", "Justin"):setDescriptionForScanState("fullscan", "Justin time to get attacked by us")
    minifight1:addInfos(1, "Life signs", "Nil")
minifight2 = CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("XX_958"):setPosition(113040, 45369):setRadarSignatureInfo(0.5, 0.9, 0.0)
    minifight2:setDescriptionForScanState("notscanned", "Knock knock"):setDescriptionForScanState("simplescan", "Will"):setDescriptionForScanState("fullscan", "Will you be smart and leave or stick around and die")
    minifight2:addInfos(1, "Life signs", "Nil")
minifight3 = CpuShip():setFaction("Independent"):setTemplate("Interceptor"):setCallSign("XX_231"):setPosition(100000, 50000):setRadarSignatureInfo(0.5, 0.9, 0.0)
    minifight3:setDescriptionForScanState("notscanned", "Knock knock"):setDescriptionForScanState("simplescan", "Olga"):setDescriptionForScanState("fullscan", "Olga mad if you don't leave me alone")
    minifight3:addInfos(1, "Life signs", "Nil")
   
--enemy ships hiding in nebulas

    hacker1 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_707"):setPosition(300830, 197231):setWeaponStorage("HVLI", 0):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker1:addInfos(1, "Life signs", "Nil"):setDescriptionForScanState("notscanned", "Back off"):setDescriptionForScanState("simplescan", "You should take warnings seriously"):setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")
    
    hacker2 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_146"):setPosition(297505, 201232):setWeaponStorage("HVLI", 0):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker2:addInfos(1, "Life signs", "Nil"):setDescriptionForScanState("notscanned", "Keep your distance"):setDescriptionForScanState("simplescan", "The Adamas is ours"):setDescriptionForScanState("fullscan", "Whether you're overconfident or stupid, it ends the same way")
    
    hacker3 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_252"):setPosition(290097, 200491):setWeaponStorage("HVLI", 0):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker3:addInfos(1, "Life signs", "Nil"):setDescriptionForScanState("notscanned", "Do not approach"):setDescriptionForScanState("simplescan", "Last chance to turn around and run away"):setDescriptionForScanState("fullscan", "Con: you've made an enemy. Pro: you won't be around to worry about it for long")
    
    hacker4 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_491"):setPosition(210445, 269603):setWeaponStorage("HVLI", 0):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker4:addInfos(1, "Life signs", "Nil"):setDescriptionForScanState("notscanned", "Onr word: retreat"):setDescriptionForScanState("simplescan", "A friendly tip: stop scanning. Stop digging. Leave"):setDescriptionForScanState("fullscan", "So you're the bad-decision kind of person.")
    
    hacker5 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_570"):setPosition(211464, 261733):setWeaponStorage("HVLI", 0):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker5:addInfos(1, "Life signs", "Nil"):setDescriptionForScanState("notscanned", "Back off"):setDescriptionForScanState("simplescan", "You won't like what happens if you keep on going"):setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")
    
    hacker6 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_636"):setPosition(206093, 272658):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker6:addInfos(1, "Life signs", "Nil"):setDescriptionForScanState("notscanned", "Keep your distance"):setDescriptionForScanState("simplescan", "I didn't know missile fodder could read"):setDescriptionForScanState("fullscan", "Whether you're overconfident or stupid, it ends the same way")
    
    hacker7 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_899"):setPosition(263246, 260546):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker7:addInfos(1, "Life signs", "Nil"):setDescriptionForScanState("notscanned", "Do not approach"):setDescriptionForScanState("simplescan", "What are you looking for, a haiku?"):setDescriptionForScanState("fullscan", "Con: you've made an enemy. Pro: you won't be around to worry about it for long")
    
    hacker8 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_053"):setPosition(266857, 262398):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker8:addInfos(1, "Life signs", "Nil"):setDescriptionForScanState("notscanned", "One word: retreat"):setDescriptionForScanState("simplescan", "did I stutter?"):setDescriptionForScanState("fullscan", "A friendly tip: stop scanning. Stop digging. Leave")
    
    hacker9 = CpuShip():setFaction("Independent"):setTemplate("Tsunami Frigate"):setCallSign("XX_404"):setPosition(267135, 264435):setRadarSignatureInfo(0.5, 0.9, 0.0)
    hacker9:addInfos(1, "Life signs", "Nil"):setDescriptionForScanState("notscanned", "Back off"):setDescriptionForScanState("simplescan", "this is your last chance for the back off option."):setDescriptionForScanState("fullscan", "Obituary reads: idiot died being an idiot")

--abandoned ships in energy siphon radius

    freighter1 = CpuShip():setFaction("Independent"):setTemplate("Goods Freighter 4"):setCallSign("Freighter: Valley"):setPosition(218749, 214270):orderIdle():setEnergy(0)
    freighter1:addInfos(1, "Life signs", "Nil"):setRadarSignatureInfo(0.5, 0.0, 0.0):setCommsFunction(deadship):setDescriptions("", "Terra Nova Personnel Freighter")
    freighter2 = CpuShip():setFaction("Independent"):setTemplate("Goods Freighter 1"):setCallSign("Freighter: Mountain"):setPosition(222658, 228979):orderIdle():setEnergy(0)
    freighter2:addInfos(1, "Life signs", "Nil"):setRadarSignatureInfo(0.5, 0.0, 0.0):setCommsFunction(deadship):setDescriptions("", "Terra Nova Personnel Freighter")
    freighter3 = CpuShip():setFaction("Independent"):setTemplate("Personnel Freighter 2"):setCallSign("Freighter: Skiff"):setPosition(232096, 225331):orderRoaming():setEnergy(0)
    freighter3:addInfos(1, "Life signs", "Nil"):setRadarSignatureInfo(0.5, 0.0, 0.0):setCommsFunction(deadship):setDescriptions("", "Terra Nova Personnel Freighter")

--variations

function setVariations()
    if string.find(getScenarioVariation(), "Havock") then
        	player:setTemplate("UCS Skirmish Class Frigate"):setCallSign("UCS Havock"):setFaction("UCN")
	        shuttle:setTemplate("UCN Shuttle"):setCallSign("UCS HAVOCK-S"):setFaction("Independent"):setEnergy(500):addInfos(1, "Life signs", "Minimal")
            shipchoice = "HAVOCK"
    elseif string.find(getScenarioVariation(), "Takanami") then
            player:setTemplate("UCS Hoplite Class Destroyer"):setCallSign("UCS Takanami"):setFaction("UCN")
	        shuttle:setTemplate("UCN Shuttle"):setCallSign("UCS TAKANAMI-S"):setFaction("Independent"):setEnergy(500):addInfos(1, "Life signs", "Minimal")
	        shipchoice = "TAKANAMI"
    end
end

--tech items and artifacts

Siphon = SpaceStation():setTemplate("Asteroid Mining Rig"):setCommsFunction(siphonmenu):setFaction("Independent"):setCallSign("UCS Scarab-S"):setPosition(228379, 224498)

--warpjammers

    wj1 = WarpJammer():setFaction("Independent"):setPosition(228725, 204562)
    wj2 = WarpJammer():setFaction("Independent"):setPosition(228708, 244291)
    wj3 = WarpJammer():setFaction("Independent"):setPosition(247911, 224365)
    wj4 = WarpJammer():setFaction("Independent"):setPosition(208727, 224457)
    wj5 = WarpJammer():setFaction("Independent"):setPosition(214447, 210339)
    wj6 = WarpJammer():setFaction("Independent"):setPosition(242429, 210488)
    wj7 = WarpJammer():setFaction("Independent"):setPosition(213744, 237143)
    wj8 = WarpJammer():setFaction("Independent"):setPosition(242873, 237846)

--mines (leftocer from the fight with the Scarab)

    Mine():setPosition(109698, 41544)
    Mine():setPosition(99964, 43803)

--zones

function zonereveal()
siphonscanstate = Siphon:isScannedBy(player)
    if siphonscanstate == true and zone == nil then
           zone = Zone():setPoints(228692, 204750, 236296, 206211, 242287, 210792, 246661, 216680, 248225, 224596, 247026, 231316, 242964, 237929, 237233, 241994, 228640, 244388, 220826, 242619, 214421, 238242, 211190, 231681, 208795, 224595, 210200, 216940, 214473, 210428, 221191, 206211):setColor(255,184,99):setLabel("")
    end
end

--terrain

--planets

    -- if you're sub 16000px away this renders neatly; any further and you get visual glitches. Could trigger a change based on distance but I'm not sure if diff computers at set might handle visuals differently
    Planet():setPosition(284332, 235056):setPlanetRadius(500):setPlanetSurfaceTexture("planets/ice_planet.jpg"):setPlanetCloudTexture("planets/ice_planet_layer.png"):setPlanetAtmosphereTexture("planets/ice_planet_atmos.png")

--asteroids

-- give all asteroids in scenario a randomised property

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

function init()

--GM buttons setup --

--BUTTONS YOU START WITH--

GMScarabAttack = _("Scarab Attack")
addGMFunction(GMScarabAttack,triggerGMScarabAttack)

--BUTTONS THAT ARE CALLED LATER, IN ORDER OF APPEARANCE--

GMSpawnOurShuttle = _("Spawn shuttle")

GMDisappearDocked1 = _("Remove docked shuttle")

GMBackupDistress = _("Distress call backup")

GMCargoBackup = _("Cargo drop backup")

GMShuttlestart = _("Initiate Shuttle")

GMDisappearDocked2 = _("Remove docked shuttle")
--DIFFERENT DISAPPEAR ONES NEEDED SINCE SHUTTLE BECOMES UCS SCARAB SHUTTLE

GMSiphonWave = _("1st Siphon Wave")

GMSiphonLock = _("Lock down siphon")

GMSiphonUnlock = _("Unlock siphon")

GMSiphonWave2 = _("2nd Siphon Wave")

setVariations()
player:commandDock(Warspite)

--scenario-specific functions

--function for automated distress call (type 1)
function autodistress2(obj, obj_2, dist, message)
    if autodistresssig2 == 0 then
	    if distance(player,obj) < dist then
			obj_2:sendCommsMessage(player,
			_(message))
            autodistresssig2 = 1
            addGMMessage("distress call from Scarab sent")
        end
	end
end

-- function for automated distress call (type 2)
function autodistress(obj, obj_2, dist, message)
	if autodistresssig == 0 then
	    if distance(player,obj) < dist then
			obj_2:sendCommsMessage(player,
			_(message))
			autodistresssig = 1
            UCNsiphoned = 1
            shuttle:setFaction("UCN"):setCallSign("UCS Scarab-S"):setEnergyLevel(50)
            addGMMessage("distress call from shuttle sent")
	    end
	end
    if autodistresssig == 1 then
        obj:setCallSign("XX_ES_vendetta")
        autodistresssig = 2
    end
end

--function to make player ships' energy go down when near siphon
function energydrainplayer(source, target, dist, delta)
        for _, obj_in_range in ipairs(source:getObjectsInRange(dist)) do
            if obj_in_range == player then
                removeGMFunction(GMBackupDistress)
            end
            if obj_in_range == target then
		--making sure they get one update at top when drain begins but not constantly during the drain
                if playerlogmessage == 0 then
                    if target == player then
                        target:addToShipLog("Rapid energy loss. Source unknown.", "red", "Engineering")
                        playerlogmessage = 1
                    end
                end
		--doing the same for the shuttle
                if shuttlelogmessage == 0 then
                    if target == shuttle then
                        target:addToShipLog("Rapid energy loss. Source unknown.", "red", "Engineering")
                        shuttlelogmessage = 1
                    end
                end
		--getting a starting reading
                if target == player then
		            if energystartplayercaptured == 0 then
			            energystartplayer = target:getEnergyLevel()
			            energystartplayercaptured = 1
		            end
                end
                if target == shuttle then
                    if energystartshuttlecaptured == 0 then
                        energystartshuttle = target:getEnergyLevel()
                        energystartshuttlecaptured = 1
                    end
                end
        --doing the actual energy loss
            if target == player then
                energycheck = target:getEnergyLevel()
                    if energycheck <=50 then 
                else
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
            if target == shuttle then
                senergycheck = target:getEnergyLevel()
                    if senergycheck <=50 then 
                else
                    if senergycheck > 150 then  
                        if senergytimer < 5 then
                            senergytimer = senergytimer + 1
                        end
                        if senergytimer == 5 then
                            scurrentenergy = target:getEnergyLevel()
                            target:setEnergyLevel(scurrentenergy - 1)
                            senergytimer = 0
                        end
                    end
                    if senergycheck <= 150 then 
                        if senergytimer < 20 then
                            senergytimer = senergytimer + 1
                        end
                        if senergytimer == 20 then
                            scurrentenergy = target:getEnergyLevel()
                            target:setEnergyLevel(scurrentenergy - 1)
                            senergytimer = 0
                        end
                    end
                end
            end
        end
    end
end

--function to track how much energy ships lose, so it can be added to the energy siphon's reserves
function energydraintrack(source,target,dist,delta)
    if distance (source, target) < dist then
        if target == player then
            energytracktimer = energytracktimer + 1
                if energytracktimer == 15 then
                    energyendplayer = player:getEnergyLevel()
                    siphonbumpplayer = energystartplayer - energyendplayer
                    siphonreserves = siphonreserves + siphonbumpplayer
                    energystartplayercaptured = 0
                    energytracktimer = 0
                end
        end
        if target == shuttle then
            energytracktimers = energytracktimers + 1
                if energytracktimers == 15 then
                    energyendshuttle = shuttle:getEnergyLevel()
                    siphonbumpshuttle = energystartshuttle - energyendshuttle
                    siphonreserves = siphonreserves + siphonbumpshuttle
                    energystartshuttlecaptured = 0
                    energytracktimers = 0
                end
        end
    end
end
            
--function to reset variables so re-entering siphon radius will trigger new engineering warning, and energy loss is captured
function energydrainoff(source, target, dist)
       if distance (source, target) > dist then
            if target == player then
                playerlogmessage = 0
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
            print(targetfaction)
            if targetfaction == faction then
                    energyCPUtimer = energyCPUtimer + 1
                    if energyCPUtimer == 5 then
                        siphonreserves = siphonreserves + 1
                        energyCPUtimer = 0
                    end
            end
    end
end
        
-- STARTING VALUES FOR ALL REQUIRED VARIABLES

    playerchat = 0
	energytimer = 0
    senergytimer = 0
	autodistresssig = 0
    autodistresssig2 = 0
    codeattempts = 0
    siphonaccess = 0
    siphonused = 0
    UCNsiphoned = 0
    greyhatsiphoned = 0
    warpjammers = 1
    descodeattempts = 0
    dessiphonaccess = 0
    playerlogmessage = 0
    shuttlelogmessage = 0
    wavebuttonactivated = 0
    siphonreserves = 0
    energystartplayer = 0
    energyendplayer = 0
    siphonbumpplayer = 0
    energystartshuttle = 0
    energyendshuttle = 0
    siphonbumpshuttle = 0
    energystartplayercaptured = 0
    energystartshuttlecaptured = 0
    energytracktimer = 0
    energytracktimers = 0
    energyCPUtimer = 0
    zone = nil
    shcodeattempts = 0
    shsiphonaccess = 0
    backupbutton = 0
    shdescodeattempts = 0
    shdessiphonaccess = 0
    siphonlocked = 0

end

-------------------
--E.N.D. OF INIT --
-------------------

----------------------
--GM BUTTONS LISTING--
----------------------

--OPENING GM BUTTONS--

--Scarab attack

--to automate setting people on scarab and damage scarab
function triggerGMScarabAttack()
    print("going for scarab attack")
    minifight1:setFaction("corsair"):orderAttack(Scarab)
    minifight2:setFaction("corsair"):orderAttack(Scarab)
    minifight3:setFaction("corsair"):orderAttack(Scarab)
    Scarab:setHull(35):setShields(25,20):setSystemHealth("maneuver", 0.4):setSystemHealth("impulse", 0.25):setSystemHealth("frontshield", 0.4):setSystemHealth("rearshield", 0.2)
    removeGMFunction(GMScarabAttack)
    addGMFunction(GMSpawnOurShuttle,triggerGMSpawnOurShuttle)
    addGMFunction(GMCargoBackup,triggerGMCargoBackup)
end

function triggerGMSpawnOurShuttle()
        removeGMFunction(GMSpawnOurShuttle)
        addGMFunction(GMDisappearDocked1,triggerGMDisappearDocked1)
        local plX, plY = player:getPosition()
        shuttle:setFaction("UCN"):setPosition(plX - 200, plY - 200):commandDock(player)
end

--MID-GAME GM BUTTONS--

--Disappear a docked ship
--Backup distress call (triggered by use of shuttle transfer button)
--Hide Scarab-S whenever docked (triggered by use of dock button)
--Launch Scarab-S from Ship (by use of hiding button; also triggers that one in turn)
--Send 1st and 2nd wave of hacker ships (triggered by proximity to shuttle)
--Lock down the siphon (if it makes sense the hackers would)

--disappear the ship shuttle after docking with Scarab (docking to be done manually by performer)

  function triggerGMDisappearDocked1()
        if shuttle:isDocked(Scarab) == true then
        shuttle:commandUndock(Scarab):setPosition(235575,232398):setFaction("Independent"):setCallSign("UCS Scarab-S"):setEnergyLevel(50):commandImpulse(0.0)
        removeGMFunction(GMDisappearDocked1)
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

--this doesn't work for some reason - doesn't spawn and doesn't disappear
function triggerGMCargoBackup()
    cargo = Artifact():setPosition(182000, 152889):setModel("cargo"):setSpin(1.5):allowPickup(true):onPickUp(function() player:addToShipLog("New item in cargo hatch", "Blue", "Helms") end)      
    removeGMFunction(GMCargoBackup)
end

--To disappear the docked Scarab shuttle, hiding it out of sight
function triggerGMDisappearDocked2()
    if shuttle:isDocked(player) == true then
    shuttle:commandUndock():setFaction("Independent"):setPosition(-400000, -400000)
    removeGMFunction(GMDisappearDocked2)
    addGMFunction(GMShuttlestart,triggerGMShuttlestart)
    end
end

-- to bring back the player shuttle (for when it's 'undocked')
function triggerGMShuttlestart()
    removeGMFunction(GMShuttlestart)
    addGMFunction(GMDisappearDocked2,triggerGMDisappearDocked2)
        local plX, plY = player:getPosition()
        shuttle:setFaction("UCN"):setPosition(plX - 200, plY - 200):commandDock(player)
end

--to send waves to the Ship near end
function triggerGMSiphonWave()
    hacker1:setFaction("corsair"):orderAttack(player)
    hacker2:setFaction("corsair"):orderAttack(player)
    hacker3:setFaction("corsair"):orderAttack(player)
    addGMFunction(GMSiphonWave2,triggerGMSiphonWave2)
    removeGMFunction(GMSiphonWave)
    end

function triggerGMSiphonLock()
    siphonlocked = 1
    greyhatsiphoned = 0
    removeGMFunction(GMSiphonLock)
    addGMFunction(GMSiphonUnlock,triggerGMSiphonUnlock)
    end

function triggerGMSiphonUnlock()
    siphonlocked = 0
    removeGMFunction(GMSiphonUnlock)
    addGMFunction(GMSiphonLock,triggerGMSiphonLock)
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

----------------
-- ON DESTRUCTION --
----------------

wj1:onDestruction(function()
    if warpjammers == 1 then
        if distance(player,wj1) < 10000 then
            player:takeDamage(25, "emp", 228725, 204562)
        end
        if distance(shuttle,wj1) < 10000 then
            shuttle:takeDamage(25, "emp", 228725, 204562)
        end
    end
end)

wj2:onDestruction(function()
    if warpjammers == 1 then
        if distance(player,wj2) < 10000 then
            player:takeDamage(25, "emp", 228708, 244291)
        end
        if distance(shuttle,wj2) < 10000 then
            shuttle:takeDamage(25, "emp", 228708, 244291)
        end
    end
end)
wj3:onDestruction(function()
    if warpjammers == 1 then
        if distance(player,wj3) < 10000 then
            player:takeDamage(25, "emp", 247911, 224365)
        end
        if distance(shuttle,wj3) < 10000 then
            shuttle:takeDamage(25, "emp", 247911, 224365)
        end
    end
end)
wj4:onDestruction(function()
    if warpjammers == 1 then
        if distance(player,wj4) < 10000 then
            player:takeDamage(25, "emp", 208727, 224457)
        end
        if distance(shuttle,wj4) < 10000 then
            shuttle:takeDamage(25, "emp", 208727, 224457)
        end
    end
end)
wj5:onDestruction(function()
    if warpjammers == 1 then
        if distance(player,wj5) < 10000 then
            player:takeDamage(25, "emp", 214447, 210339)
        end
        if distance(shuttle,wj5) < 10000 then
            shuttle:takeDamage(25, "emp", 214447, 210339)
        end
    end
end)
wj6:onDestruction(function()
    if warpjammers == 1 then
        if distance(player,wj6) < 10000 then
            player:takeDamage(25, "emp", 242429, 210488)
        end
        if distance(shuttle,wj6) < 10000 then
            shuttle:takeDamage(25, "emp", 242429, 210488)
        end
    end
end)
wj7:onDestruction(function()
    if warpjammers == 1 then
        if distance(player,wj7) < 10000 then
            player:takeDamage(25, "emp", 213744, 237143)
        end
        if distance(shuttle,wj7) < 10000 then
            shuttle:takeDamage(25, "emp", 213744, 237143)
        end
    end
end)
wj8:onDestruction(function()
    if warpjammers == 1 then
        if distance(player,wj8) < 10000 then
           player:takeDamage(25, "emp", 242873, 237846)
        end
        if distance(shuttle,wj8) < 10000 then
            shuttle:takeDamage(25, "emp", 242873, 237846)
        end
    end
end)

--Past attempt at tidying up warpjammer destruction code
--function wjdestruction(jammername, pos1, pos2)
   -- if warpjammers == 1 then
       -- jammername:onDestruction(function()
       -- if distance(player,jammername) < 10000 then
          --  player:takeDamage(25, "emp", pos1, pos2)
           -- print("didthething")
     --   end
     --   if distance(shuttle,jammername) < 10000 then
       --     shuttle:takeDamage(25, "emp", pos1, pos2)
     --   end
  --  end)
--end
--end


--make ship drop cargo crate when destroyed
minifight3:onDestruction(
    function()
        nx,ny = minifight3:getPosition()
            print("spawn cargo")
               cargo = Artifact():setPosition(nx-15,ny-15):setModel("cargo"):setSpin(1.5):allowPickup(true):onPickUp(function() player:addToShipLog("New item in cargo hatch", "Blue", "Helms") end) 
               end)
---------------------
-- START OF UPDATE --
---------------------

function update(delta)

asteroidSizes(0, 0, 1000000)
playerchats(player, shuttle)

--trigger buttons when players near energy siphon
if wavebuttonactivated == 0 then
if distance(player,Siphon) < 20000 then
    print("hello. am here")
    wavebuttonactivated = 1
    print("wave button 1")
    --addGMFunction(GMDockWithPlayer,triggerGMDockWithPlayer)
    print("button")
    addGMFunction(GMSiphonWave,triggerGMSiphonWave)
    addGMFunction(GMSiphonLock,triggerGMSiphonLock)
    --removeGMFunction(GMCargoBackup)
    end
end

--call autodistress function for Scarab and shuttle
autodistress(Siphon, Siphon, 80000,
"SOS - IMMEDIATE ASSISTANCE NEEDED - SOS\nCURRENT LOCATION: L12\nREPEAT ASSISTANCE NEEDED IN L12")
autodistress2(Scarab, Scarab, 80000, "SOS - CURRENTLY UNDER ATTACK - SOS\nCURRENT LOCATION: C6")

--trigger backup distress button in case
if backupbutton == 0 then
    if distance (player,Siphon) < 80000 then
        addGMFunction(GMBackupDistress,triggerGMBackupDistress)
        backupbutton = 1
    end
end

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
energydrainplayer(Siphon, shuttle, 20000)
energydraintrack(Siphon, player, 20000)
energydraintrack(Siphon, shuttle, 20000)
end

--call energy siphoning functions (according to comms script triggers)
if greyhatsiphoned == 1 then
energydrainCPU(Siphon, "corsair", 20000)
end

--call function to reveal effect zone around siphon once scanned
zonereveal()

end

--------------------------------
--E.N.D. OF UPDATE AND SCRIPT --
--------------------------------