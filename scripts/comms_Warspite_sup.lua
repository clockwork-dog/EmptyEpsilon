-- Script to be used for Warspite  to send a supply dop to tehe player 
-- ripped and edited from other scripts

-- @script comms_Warspite_sup

function mainMenu()
    setCommsMessage("Good day officer,\nWhat can we do for you today?")
    if player:isDocked(comms_target) then
        addCommsReply("Do you have spare homing missiles for us?", function()
            if player:getWeaponStorage("Homing") >= player:getWeaponStorageMax("Homing") then
                setCommsMessage("Sorry officer, but you are fully stocked with homing missiles.")
                addCommsReply("Back", mainMenu)
            else
                player:setWeaponStorage("Homing", player:getWeaponStorageMax("Homing"))
                setCommsMessage("Filled up your missile supply.")
                addCommsReply("Back", mainMenu)
            end
        end)
        addCommsReply("Please re-stock our mines.)", function()
            if player:getWeaponStorage("Mine") >= player:getWeaponStorageMax("Mine") then
                setCommsMessage("Comms,\nYou have all the mines you can fit in that ship.")
                addCommsReply("Back", mainMenu)
            else
                player:setWeaponStorage("Mine", player:getWeaponStorageMax("Mine"))
                setCommsMessage("We have restocked your mines.")
                addCommsReply("Back", mainMenu)
            end
        end)
        addCommsReply("Can you supply us with some nukes.", function()
            if player:getWeaponStorage("Nuke") >= player:getWeaponStorageMax("Nuke") then
                setCommsMessage("You already have the regulated amount of Nukes on board.")
                addCommsReply("Back", mainMenu)
            else
                player:setWeaponStorage("Nuke", player:getWeaponStorageMax("Nuke"))
                setCommsMessage("You are fully loaded,\nuse them with care.")
                addCommsReply("Back", mainMenu)
            end
        end)
        addCommsReply("Please re-stock our EMP Missiles.", function()
            if player:getWeaponStorage("EMP") >= player:getWeaponStorageMax("EMP") then
                setCommsMessage("All storage for EMP missiles is filled.")
                addCommsReply("Back", mainMenu)
            else
                player:setWeaponStorage("EMP", player:getWeaponStorageMax("EMP"))
                setCommsMessage("Recallibrated the electronics and\nfitted you with all the EMP missiles you can carry.")
                addCommsReply("Back", mainMenu)
            end
        end)
        addCommsReply("Establish a Direct Link With The Warspite Crew", function() commsSwitchToGM() end)
    else
        addCommsReply("Can you send a supply drop?", function()
            if player:getWaypointCount(0) < 1 then
                setCommsMessage("You need to set a waypoint before you can request supplies.")
            else
                setCommsMessage("Where do we need to drop off your supplies?")
                for n = 1, player:getWaypointCount(0) do
                    addCommsReply("WP" .. n, function()
                        local position_x, position_y = comms_target:getPosition()
                        local target_x, target_y = player:getWaypoint(n, 0)
                        local script = Script()
                        script:setVariable("position_x", position_x):setVariable("position_y", position_y)
                        script:setVariable("target_x", target_x):setVariable("target_y", target_y)
                        script:setVariable("pCallsign", player:getCallSign())
                        script:setVariable("faction_id", comms_target:getFactionId()):run("supply_drop.lua")
                        print("running script")
                        setCommsMessage("We have dispatched a supply drone towards WP" .. n)
                        addCommsReply("Back", mainMenu)
                    end)
                end
            end
            addCommsReply("Back", mainMenu)
        end)
        addCommsReply("Establish a Direct Link With The Warspite Crew", function() commsSwitchToGM() end)
    end
    return true
end

mainMenu()