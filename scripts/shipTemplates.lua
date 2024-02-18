--[[
Base of the ship templates, from here different classes of ships are included to be used within the game.
Each sub-file defines it's own set of ship classes.

These are:
* Stations: For different kinds of space stations, from tiny to huge.
* Starfighters: Smallest ships in the game.
* Frigates: Medium sized ships. Operate on a small crew.
* Covette: Large, slower, less maneuverable ships.
* Dreadnaught: Huge things. Everything in here is really really big, and generally really really deadly.

Player ships are in general large frigates to small corvette class
--]]
--require("shipTemplates_Stations.lua")
---[[Until these are ready, they are disabled
--require("shipTemplates_StarFighters.lua")
--require("shipTemplates_Frigates.lua")
--require("shipTemplates_Corvette.lua")
--require("shipTemplates_Dreadnaught.lua")
--require("shipTemplates_Experimental.lua)
--]]
--For now, we add our old ship templates as well. These should be removed at some point.
--require("shipTemplates_OLD.lua")
--Bridge Command Modded ship template files below
require("shipTemplates_BCFrigates.lua")
require("shipTemplates_BCDestroyers.lua")
require("shipTemplates_BCCruisers.lua")
require("shipTemplates_BCBattleships.lua")
require("shipTemplates_BCStations.lua")
require("shipTemplates_BCStarfighters.lua")
require("shipTemplates_BCDrones.lua")
require("shipTemplates_BCScienceObjects.lua")
-- require("shipTemplates_Larp.lua")
require("shipTemplates_BSNewDrones.lua")
--require("shipTemplates_BCAliens.lua")
--require("shipTemplates_BCTest.lua")
