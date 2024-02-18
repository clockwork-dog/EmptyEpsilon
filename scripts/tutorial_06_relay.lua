-- Name: Relay
-- Description: 
--- -------------------
--- [Relay and Navigation Info]
--- -------------------
--- Overview:
--- It is important that Science and Operations officers familiarise themselves with this station.
---
--- Sector Map: 
--- - The Relay station can view a map of the sector, including space hazards and ships within short-range scanner range (5U). It can also see the short-range sensor data around probes and other UCN ships and stations, potentially spotting distant threats before the science station does. The Relay officer cannot scan ships, however.
--- - Navigation officer will be able to see this strategic map.
---
--- Probes: 
--- - Relay and strategic screens can launch up to 8 high-speed probes to any point in the sector. These probes fly toward a location and transmit short-range sensor data to the ship for 10 minutes. Probes work inside nebulae, and thus are powerful tools when faced with an area blocked by nebula. 
--- - Science officer at the Navigation screen can also link a probe's sensors to the Science station, which lets the Science officer scan ships within the probe's sensor range even if the probe is beyond the ship's long-range scanners. Probes cannot be retrieved and can be destroyed by enemies; your ship's stock of probes can be ressuplied by UCS Warspite.
---
--- Waypoints: 
--- - The Relay and Navigation officers can set waypoints. These waypoints appear on the Helms officer's short-range scanner and can guide the ship toward a destination or on a specific route through space. Waypoints are also necessary when requesting aid.
---
--- Communications: 
--- - The Relay officer can open communications with stations and other ships, and in some cases request to open audio or video communication channel. 
--- - Please remember to maintain a steady, polite tone when communicating with other vessels.
-- Type: Basic
require("utils.lua")

function init()
    --Create the player ship
    player = PlayerSpaceship():setFaction("UCN"):setTemplate("UCS Hoplite Class Destroyer")
    tutorial:setPlayerShip(player)

    tutorial:showMessage([[Welcome to the bridge tutorial.
    Note that this tutorial is designed to give you a quick overview of the basic operations, but does not cover every single aspect.
    
    Press "Next" to continue]], true)
    tutorial_list = {
        relayTutorial,
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

relayTutorial = createSequence()
addToSequence(relayTutorial, function()
    tutorial:switchViewToScreen(4)
    tutorial:setMessageToBottomPosition()
    resetPlayerShip()
end)
addToSequence(relayTutorial, [[Welcome to Relay and Navigation screens!

Operation officers among you will be responsible for managing communications with other vessels, while Science officers will have advantage have access to short-range radar data from friendly ships and stations, and can place navigational waypoints and launch scanning probes.]])
addToSequence(relayTutorial, [[First, let us look at ship's communications.

You can target any station or ship and attempt to communicate with it. Other ships can also attempt to contact you.]])
addToSequence(relayTutorial, function()
    prev_object = SpaceStation():setTemplate("Medium Station"):setFaction("UCN"):setPosition(3000, -15000)
    prev_object:setCommsFunction(function()
        setCommsMessage("You successfully opened communications. Congratulations.");
        addCommsReply("Tell me more!", function()
            setCommsMessage("Sorry, there's nothing more to tell you.")
        end)
        addCommsReply("Continue with the tutorial.", function()
            setCommsMessage("The tutorial will continue when you close communications with this station.")
        end)
    end)
end)
addToSequence(relayTutorial, [[Open communications with the station near you to continue the tutorial.]], function() return player:isCommsScriptOpen() end)
addToSequence(relayTutorial, function() tutorial:setMessageToTopPosition() end)
addToSequence(relayTutorial, [[Now finish conversing with the station.]], function() return not player:isCommsScriptOpen() end)
addToSequence(relayTutorial, function() tutorial:setMessageToBottomPosition() end)
addToSequence(relayTutorial, function() prev_object:destroy() end)
addToSequence(relayTutorial, [[While you may be greeted with an automatic message, you will always have an option to be patched through to the crew. Video and audio communcations are handled on a separate screen.]])
addToSequence(relayTutorial, function() prev_object = CpuShip():setFaction("UCN"):setTemplate("King George Battleship"):setPosition(20000, -20000):orderIdle():setCallSign("UCS Warspite"):setScanned(true) end)
addToSequence(relayTutorial, function() prev_object2 = CpuShip():setFaction("UCN"):setTemplate("UCS Gunship"):setPosition(-24000, 2500):orderIdle():setCallSign("Iron two"):setScanned(true) end)
addToSequence(relayTutorial, function() prev_object3 = CpuShip():setFaction("UCN"):setTemplate("Skirmish Frigate"):setPosition(-17000, -7500):setCallSign("UCS Havock"):orderIdle():setScanned(true) end)
addToSequence(relayTutorial, function() prev_object4 = CpuShip():setFaction("UCN"):setTemplate("Colony Battlecruiser"):setCallSign("UCS Hood"):setPosition(5400, 7500):orderIdle():setScanned(false) end)
addToSequence(relayTutorial, [[Navigation and Relay stations also include this radar map.

On this map, you can detect objects within 5u of all allied ships and stations. Everything else is invisible to you. This gives you a different view from the science screens, because you can scan the contents of nebulae.]])
addToSequence(relayTutorial, [[Other responsibility of the Navigation and Relay officers is setting and removing waypints, and communicating those to the rest of the crew. Try setting a waypoint now.]])
addToSequence(relayTutorial, function() return player:getWaypointCount() > 0 end)
addToSequence(relayTutorial, [[Finally, you control your ship's probes. Probes can expand your radar view. Launch a probe to the top right, toward UCS Warspite.]], function()
    for _, obj in ipairs(getObjectsInRadius(20000, -20000, 5000)) do
        if obj.typeName == "ScanProbe" then
            return true
        end
    end
end)
addToSequence(relayTutorial, function() prev_object:destroy() end)
addToSequence(relayTutorial, function() prev_object2:destroy() end)
addToSequence(relayTutorial, function() prev_object3:destroy() end)
addToSequence(relayTutorial, function() prev_object4:destroy() end)
addToSequence(relayTutorial, [[Probes can expand your sensory capabilities beyond your normal range and explore nebulae. However, you have a limited supply of eight and can't easily replenish them if you run out.]])

endOfTutorial = createSequence()
addToSequence(endOfTutorial, function() tutorial:switchViewToMainScreen() end)
addToSequence(endOfTutorial, _([[This concludes the Relay and Navigation screens tutorial, there is plenty more for you to learn on the job about your ship's Operations.
Please don't press anything else on your screen, and let the officer taking you through the tutorial know that you have finished training.]]))

