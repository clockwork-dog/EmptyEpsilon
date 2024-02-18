-- Name: Science
-- Description: 
--- -------------------
--- [Science Screens Info]
--- -------------------
--- Long-range Radar: 
--- - The Science station has a long-range radar that can locate ships and objects at a distance of up to 25U. The Science officer's most important task is to report the sector's status and any changes within it. On the edge of the radar are colored bands of signal interference that can vaguely suggest the presence of objects or space hazards even further from the ship. It's up to the Science team to interpret them.
---
--- Scanning: 
--- - You can scan ships to get more information about them. The Science officer must align two of the ship's scanning frequencies with a target to complete the scan. Scanning a ship, or any object, will reveal their IFF as well as other valuable information.
---
--- Deep Scans: 
--- - A second, more difficult scan yields more information about the ship, including its shield and beam frequencies. The Operations team can also see the firing arcs of deep-scanned ships, but they cannot see relevant frequencies, and you will have to relay this information to them.
--- - Link the scanned vessel or object to Analysis, to view all information about it on the same screen.
---
--- Nebulae: 
--- - Nebulae block the ship's long-range scanner. The Science officer cannot see what's inside or behind them, and while in a nebula the ship's radars cannot detect what's outside of it.
---
--- Probe View: 
--- - You can launch probes from Relay and Navigation screens, and those can be linked Science station, as well as have their own view screen. 
--- - The Science officer can view the probe's short-range sensor data to scan ships within its range, even if the probe is far from the ship's long-range scanners or in a nebula.
---
--- Database: 
--- - The Science officer can access the ship's database of all known ships, as well as data about weapons and space hazards. This can be vital when assessing a ship's capabilities without a deep scan, or for help navigating hazardous terrain.
-- Type: Basic
require("utils.lua")

function init()
    --Create the player ship
    player = PlayerSpaceship():setFaction("UCN"):setTemplate("UCS Skirmish Class Frigate")
    tutorial:setPlayerShip(player)

    tutorial:showMessage([[Welcome to the bridge tutorial.
    Note that this tutorial is designed to give you a quick overview of the basic operations, but does not cover every single aspect.
    
    Press "Next" to continue]], true)
    tutorial_list = {
        scienceTutorial,
        endOfTutorial
    }
    tutorial:onNext(function()
        tutorial_list_index = 1
        startSequence(tutorial_list[tutorial_list_index])
    end)
end

-- TODO: Need to refactor this region into a utility (*Need help LUA hates me)
--[[ Assist function in creating tutorial sequences --]]
function startSequence(sequence)
    current_sequence = sequence
    current_index = 1
    runNextSequenceStep()
end

function runNextSequenceStep()
    local data = current_sequence[current_index]
    current_index = current_index + 1
    if data == nil then
        tutorial_list_index = tutorial_list_index + 1
        if tutorial_list[tutorial_list_index] ~= nil then
            startSequence(tutorial_list[tutorial_list_index])
        else
            tutorial:finish()
        end
    elseif data["message"] ~= nil then
        tutorial:showMessage(data["message"], data["finish_check_function"] == nil)
        if data["finish_check_function"] == nil then
            update = nil
            tutorial:onNext(runNextSequenceStep)
        else
            update = function(delta)
                if data["finish_check_function"]() then
                    runNextSequenceStep()
                end
            end
            tutorial:onNext(nil)
        end
    elseif data["run_function"] ~= nil then
        local has_next_step = current_index <= #current_sequence
        data["run_function"]()
        if has_next_step then
            runNextSequenceStep()
        end
    end
end

function createSequence()
    return {}
end

function addToSequence(sequence, data, data2)
    if type(data) == "string" then
        if data2 == nil then
            table.insert(sequence, {message = data})
        else
            table.insert(sequence, {message = data, finish_check_function = data2})
        end
    elseif type(data) == "function" then
        table.insert(sequence, {run_function = data})
    end
end

function resetPlayerShip()
    player:setJumpDrive(false)
    player:setWarpDrive(false)
    player:setImpulseMaxSpeed(1)
    player:setRotationMaxSpeed(1)
    for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}) do
        player:setSystemHealth(system, 1.0)
        player:setSystemHeat(system, 0.0)
        player:setSystemPower(system, 1.0)
        player:commandSetSystemPowerRequest(system, 1.0)
        player:setSystemCoolant(system, 0.0)
        player:commandSetSystemCoolantRequest(system, 0.0)
    end
    player:setPosition(0, 0)
    player:setRotation(0)
    player:commandImpulse(0)
    player:commandWarp(0)
    player:commandTargetRotation(0)
    player:commandSetShields(false)
    player:setWeaponStorageMax("homing", 0)
    player:setWeaponStorageMax("nuke", 0)
    player:setWeaponStorageMax("mine", 0)
    player:setWeaponStorageMax("emp", 0)
    player:setWeaponStorageMax("hvli", 0)
end
--End Region Tut Utils


scienceTutorial = createSequence()
addToSequence(scienceTutorial, function()
    tutorial:switchViewToScreen(3)
    tutorial:setMessageToBottomPosition()
    resetPlayerShip()
end)
addToSequence(scienceTutorial, [[As member of the Science team, you are the eyes of the ship. 
Your job is to discover and distribute information about all happenstance outside of your ship. From the Science station, you can detect and scan objects at a range of up to 30u.]])
addToSequence(scienceTutorial, function() prev_object = SpaceStation():setTemplate("Medium Station"):setCallSign("Phoenix"):setFaction("UCN"):setPosition(3000, -15000) end)
addToSequence(scienceTutorial, function() prev_object2 = CpuShip():setFaction("UCN"):setTemplate("King George Battleship"):setCallSign("UCS Warspite"):setPosition(5000, -17000):setDescriptions(
    "King George Class Battleship", "Current orders: Establish Base in Adamas Belt."):addInfos(1, "Fabrication date", "2091"):addInfos(2, "Current Commander", "Captain TBD"):addInfos(3, "Number of Personnel", "182"):addInfos(4, "Life signs", "Strong"):orderIdle():setScanned(true) end)
addToSequence(scienceTutorial, [[On this radar, you can select objects to get information about them.
I've added a UCN ship and a station for you to examine. Select them and notice how much information you can observe.]])
addToSequence(scienceTutorial, function() prev_object:destroy() end)
addToSequence(scienceTutorial, function() prev_object = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setPosition(3000, -15000):orderIdle() end)
addToSequence(scienceTutorial, [[I've replaced the friendly station with an unknown ship. Once you select it, notice that you know nothing about this ship.
To learn about it, you must scan it. Scanning requires you to match your scanner's frequency bands to your target's.
Scan this ship now.]], function() return prev_object:isScannedBy(player) end)
addToSequence(scienceTutorial, [[Good. Notice that you now know this ship is unfriendly. It might have been a friendly or neutral ship as well, but until you scanned it, you do not know.]])
addToSequence(scienceTutorial, [[Note that you have less information about this ship than the friendly ship. You must perform a deep scan of this ship to acquire more information.
A deep scan takes more effort and requires you to align 2 different frequency bands simultaneously.
Deep scan the enemy now.]], function() return prev_object:isFullyScannedBy(player) end)
addToSequence(scienceTutorial, [[Excellent. Notice that this took more time and concentration than the simple scan, so be careful to perform deep scans only when necessary or you could run out of time.]])
addToSequence(scienceTutorial, function() prev_object:destroy() end)
addToSequence(scienceTutorial, function() prev_object2:destroy() end)
addToSequence(scienceTutorial, function() tutorial:setMessageToTopPosition() end)
addToSequence(scienceTutorial, [[Next to the long-range radar, the science station can also access the science database.

In this database, you can look up details on things like ship types, weapons, and other objects.]])
addToSequence(scienceTutorial, [[Remember, that the Science team's job is to supply information. Knowing the location and status of other ships is vital to your vessel's operation.

Without you, the crew is flying blind.]])

endOfTutorial = createSequence()
addToSequence(endOfTutorial, function() tutorial:switchViewToMainScreen() end)
addToSequence(endOfTutorial, _([[This concludes the Science screen tutorial, there is plenty more for you to learn on the job about your ship's Operations.
Please don't press anything else on your screen, and let the officer taking you through the tutorial know that you have finished training.]]))

