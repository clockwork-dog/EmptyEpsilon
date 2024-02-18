-- Name: Basics and Captain (Main Screen / Radar)
-- Description:
--- ------------------
--- [Main Screen and Radar Info]
--- -------------------
--- This tutorial covers not only the Command team's tasks, but also basics of some of the ship's operations.
--- Without direct control of the ship, Command team keeps the crew focused on their goal and helps the crew make crucial decisions. 
--- 
--- The Command tasks include:
--- - Planning the next actions
--- - Setting priorities
--- - Coordinating combat tactics
-- Type: Basic
require("utils.lua")

function init()
    --Create the player ship
    player = PlayerSpaceship():setFaction("UCN"):setTemplate("UCS Hoplite Class Destroyer")
    tutorial:setPlayerShip(player)

    tutorial:showMessage(_([[Welcome to the bridge tutorial.
Note that this tutorial is designed to give you a quick overview of the basic operations, but does not cover every single aspect.

Press "Next" to continue]]), true)
    tutorial_list = {
        mainscreenTutorial,
		radarTutorial,
        endOfTutorial
    }
    tutorial:onNext(function()
        tutorial_list_index = 1
        startSequence(tutorial_list[tutorial_list_index],tutorial)
    end)
end
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

--[[ Radar explanation tutorial ]]
mainscreenTutorial = createSequence()
addToSequence(mainscreenTutorial, function() tutorial:switchViewToMainScreen() end)
addToSequence(mainscreenTutorial, _([[This is the main screen, which renders surrounding space from on-board cameras.]]))

radarTutorial = createSequence()
addToSequence(radarTutorial, function() tutorial:switchViewToLongRange() end)
addToSequence(radarTutorial, _([[Welcome to the long-range radar. This radar can detect objects up to 30u from your ship, depicted at the radar's center. This radar allows you to quickly identify distant objects.]]))
addToSequence(radarTutorial, function() prev_object = Asteroid():setPosition(5000, 0) end)
addToSequence(radarTutorial, _([[To the right of your ship is a yellow dot. This is an asteroid.
On impact, Asteroid will damage your ship, so avoid hitting them.]]))
addToSequence(radarTutorial, function() prev_object:destroy() end)
addToSequence(radarTutorial, function() prev_object = Mine():setPosition(5000, 0) end)
addToSequence(radarTutorial, _([[The white dot is a mine. When you move near a mine, it explodes with a powerful 1u-radius blast. Striking a mine while your shields are down will surely destroy your ship.]]))
addToSequence(radarTutorial, function() prev_object:destroy() end)
addToSequence(radarTutorial, function() prev_object = SpaceStation():setTemplate("Medium Station"):setFaction("corsair"):setPosition(5000, 0) end)
addToSequence(radarTutorial, function() prev_object2 = SpaceStation():setTemplate("Large Station"):setFaction("Independent"):setPosition(5000, 5000) end)
addToSequence(radarTutorial, function() prev_object3 = SpaceStation():setTemplate("Huge Station"):setFaction("UCN"):setPosition(5000, -5000) end)
addToSequence(radarTutorial, _([[Those large objects are space stations, distinguishable by their respective sizes. The colour here indicates whether the station's IFF identifies it as UCN (blue), Independent (white), or Corsair (red). 
While it is not a given that one identifying as a Corsair will be immediately hostile to you, we have had several run-ins with pirates in recent months.]]))
addToSequence(radarTutorial, function() prev_object:destroy() end)
addToSequence(radarTutorial, function() prev_object2:destroy() end)
addToSequence(radarTutorial, function() prev_object3:destroy() end)
addToSequence(radarTutorial, function() prev_object = Nebula():setPosition(8000, 0) end)
addToSequence(radarTutorial, _([[The rainbow-colored cloud is a nebula. Nebulae block long-range sensors, preventing ships from detecting what is inside of them at distances of more than 5u. Sensors also cannot detect objects behind nebulae.]]))
addToSequence(radarTutorial, function() prev_object:destroy() end)
addToSequence(radarTutorial, function() prev_object = CpuShip():setFaction("UCN"):setTemplate("King George Battleship"):setCallSign("UCS Warspite"):setPosition(5000, -2500):orderIdle():setScanned(true) end)
addToSequence(radarTutorial, function() prev_object2 = CpuShip():setFaction("UCN"):setTemplate("UCS Skirmish Frigate"):setPosition(5000, 2500):setCallSign("UCS Havock"):orderIdle():setScanned(true) end)
addToSequence(radarTutorial, function() prev_object3 = CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("Wind"):setPosition(5000, -7500):orderIdle():setScanned(true) end)
addToSequence(radarTutorial, function() prev_object4 = CpuShip():setFaction("corsair"):setTemplate("Gunship"):setPosition(5000, 7500):orderIdle():setScanned(false) end)
addToSequence(radarTutorial, _([[Finally, these are ships. Each class of a ship has a different icon assigned to it. Top to bottom, in front of you are a Gunship, a Battleship, a Frigate and an unscanned ship. Unscanned ships appear as gray arrows.]]))
addToSequence(radarTutorial, function() prev_object:destroy() end)
addToSequence(radarTutorial, function() prev_object2:destroy() end)
addToSequence(radarTutorial, function() prev_object3:destroy() end)
addToSequence(radarTutorial, function() prev_object4:destroy() end)
addToSequence(radarTutorial, _([[Next, we will look at the short-range radar.]]))
addToSequence(radarTutorial, function() tutorial:switchViewToTactical() end)
addToSequence(radarTutorial, _([[The short-range radar can detect objects up to 5u from your ship. It also depicts the range of your own beam weapons.
Beam weapons are distinguished by colour as follows: red indicates Energy beam, yellow indicates Heat beam, and blue indicates EMP beam. In addition, your ship is equipped with a tractor beam. Each type of ship has different beam weapon layouts, with different ranges and locations.]]))
endOfTutorial = createSequence()
addToSequence(endOfTutorial, function() tutorial:switchViewToMainScreen() end)
addToSequence(endOfTutorial, _([[This concludes main screen and radar tutorial, there is plenty more for you to learn on the job about your ship's Command.
Please don't press anything else on your screen, and let the officer taking you through the tutorial know that you have finished training.]]))
