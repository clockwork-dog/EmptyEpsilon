-- Name: Scripting Scenarios 101
-- Description: The basics of creating Empty Epsilon scripts 
-- Type: Basic

                                   -- FIRST STEPS

-- 1. Click "copy scenario" in your GM client, create a new file, and give it a following name: scenario_number_name.lua
        -- TIP 
-- Numbered scenarios will sort themselves in ascending order on the scenrio selection screen;
-- unnumbered ones will display the bottom in order of their creation

-- 2. Paste your copied script into the file
        -- TIP
-- Every object you have just pasted will appear in the order you created them in.

-- 3. At the top of your scenario write Name and Description, as shown above :

-- "Name" is the title of your scenario, as shown on the Scenario Selection screen 
-- "Description" is the scenario's description, as shown on the Scenatio Selection screen
-- "Type" is a left-over from a different branch of EE, where all scenarios are sorted by those. 
        -- TIP 
--Not giving your scenario a type will not affect its functionality, but your EE log will complain about it 

-- ONCE YOU HAVE DONE THAT, YOU HAVE CREATED YOUR SCENARIO!
-- HOWEVER...
-- Functions, descriptions, GM buttons and quite a few assorted tweaks DO NOT COPY OVER, and you will need to add them by hand
            -- TIP
-- If your want to add something to an existing scenario, and don't want to wipe all of your tweaks, choose "copy selected" in the GM client

                              -- DECONSTRUCTING AND TWEAKING SPACE OBJECTS 

-- Everything spawned in game is categorised as a space object. 
-- I will take you through the types and some of the existing functions of those objects
-- And show you how to tweak those in your scripts

                              -- SPACE OBJECTS - TERRAIN

-- terrain has the least amount of functionality
-- For every single spawned object that exists in game, you need to help EE establish what is it is and where it is 

--object type    -- location
Asteroid():setPosition(-6222, -2556)
Nebula():setPosition(20350, -20321)

        --TIP
--EE calculates distances in pixels. 100 == 1U, as seen on radar in-game. A single grid is 20000x20000

                             -- SPACE OBJECTS -- ASTEROIDS -- TWEAKING

-- Let's make the asteroid below spicy! 

-- You can add all aditional base functions to an object using ":" as a devider. 
-- But, because I want to explain what I'm doing, I'm going to split those up into idividual lines. 
-- In order to do so, I need to name the asteroid below. This way, EE knows which asteroid I mean when I add things to it. 

tweakedAsteroid = Asteroid():setPosition(-12889, 7333)

-- changing the size of your asteroid 
tweakedAsteroid:setSize(500)
-- default size for an asteroid is 120

-- adding basic descriptions 
tweakedAsteroid:setDescriptions("Whis is what player sees before they scan it", "This is what player sees once they scanned it \nCreates a line break")

-- adding additional information for the science officer 
tweakedAsteroid:addInfos(1, "label", "text in the \ninformation tab")
        --TIP
-- those info blocks on the science screen are tiny, I recommend rationalising what you are adding to those.
-- You will have to create your own line breaks.

        --TIP
-- Instead of naming this asteroid, you can compress all of the additional tweaks into a single line as follows
-- Asteroid():setPosition(-12889, 7333):setDescriptions("[[Whis is what player sees before they scan it]]", "[[This is what player sees once they scanned it \nCreates a line break]]"):setSize(500):addInfos(1, "label", "text in the \ninformation tab")

                              -- SPACE OBJECTS - ARTIFACTS 

-- the game will randomly select one of eight artifact models when it's created.
-- you can change the model by changing the number. To view the existing textures, head to EmptyEpsilon > packs > SolCommand 
Artifact():setPosition(18244, 4870):setModel("artifact6")

        --TIP
-- setModel() indicates that EE is pulling this item from model_data.lua file. You can view other parameters of the model there

                              -- SPACE OBJECTS - ARTIFACTS -- TWEAKING

-- I will name this artifact so I can carry on working with it on a different line
tweakedArtifact = Artifact():setPosition(19466, 7023):setModel("artifact6")

-- making it spin and make sure it can be picked up 
tweakedArtifact:setSpin(2.0):allowPickup(true)

-- There is another thing you can do with artifacts, but we'll get there when we talk about callback functions

                             -- TEMPLATE BASED OBJECTS

-- Stations and ships are Template Based Objects. When you spawn them, they are called from shipTemplates_FileName.lua

                             -- TEMPLATE BASED OBJECTS -- STATIONS

-- Space station templates live in shipTemplates_BCStations.lua file
-- They have a slightly different functionality from the ships.
-- Default Hull and Shields for Stations are defined in Templates. 

-- It is essential that a station has the following:

-- type of object   -- template                 -- faction       -- callsign         -- location 
   SpaceStation():setTemplate("Small Station"):setFaction("UCN"):setCallSign("Tiny boi"):setPosition(-4760, -18701)

                             -- TEMPLATE BASED OBJECTS -- STATIONS -- TWEAKING

-- Again, I shall name it for convenience                                     -- and change its callsign 
tweakedStation = SpaceStation():setTemplate("Large Station"):setFaction("UCN"):setCallSign("Chonk"):setPosition(-1162, 68)

-- Boosting shields and hull
-- Bf you want to give it more shield than its default max, you will have to change said max first

        -- set max allowed   -- set current  -- set max allowed             -- set current 
tweakedStation:setHullMax(800):setHull(400):setShieldsMax(500, 500, 500, 500):setShields(400, 500, 500, 600)
                                            -- any Template-based object can have between 1 and 8 shields 
                                            -- those will auto-segment
                                            -- if you have given it more shield (600) than it can take (500), it will default to max in-game 

 -- setting whether it shares energy       -- setting whether it repairs hull damage
tweakedStation:setSharesEnergyWithDocked(true):setRepairDocked(true)

-- changing the radar signatures 
-- radar signatures are set as a float between 0.0 and 1.0 in the following order:(gravity, electonic, biological)
-- If you set it to negative, it will default to zero
tweakedStation:setRadarSignatureInfo(1.0, 0.8, 0.0)


-- tweaking its scanning difficulty
tweakedStation:setScanningParameters(3, 2)
                  -- parameters are as follows (difficulty as a numerical value, number of times you need to scan it)

                              -- TEMPLATE BASED OBJECECTS -- CPU SHIPS

-- All SpaceShips are a type of Template Based Object. Those are the most complex by virtue of having weapons, engines, reactors and systems

-- this is how the ship gets spawned by default:
--type     -- faction               -- Template          -- Callsign         -- location                -- default orders    -- weapon storage
CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("VS6"):setPosition(12817, -12140):orderRoaming():setWeaponStorage("HVLI", 3)

                        -- TEMPLATE BASED OBJECTS -- CPU SHIPS -- TWEAKING

-- As with stations, ships will load with default parameters, but we can change those
-- I will name it and change the callsign before proceeding 
tweakedShip = CpuShip():setFaction("Independent"):setTemplate("Gunship"):setCallSign("Beefy gunship"):setPosition(14032, -6389)

-- giving it a warp drive + setting a default warp speed (you need to do both for it to have a warp drive)
tweakedShip:setWarpDrive(true):setWarpSpeed(1000.00)

-- changing its orders   -- changing its AI 
tweakedShip:orderIdle():setAI("default")

-- other AIs include: "fighter", "missilevolley"
-- "fighter" is the default we use for gunships. It'll lob a couple missiles at you and then engage until it's hurt, which is where it will start running away
-- "default" some of you might remember from the very early days of BC. It will attach itself to you like a limpet and try to beam you down. Weirdly difficult to fight because it gets SO close
-- "missile volley" makes it a deranged little yo-yo which will orbit you forever and ever. Hard to hit, but will not menace you. 

-- OTHER ORDERS
-- simple orders include: orderStandGround(), orderRoaming()
        -- TIP I recommend spawning EVERY CPUShip as Idle; it's the easiest thing to do 

-- order reliant on location include: FlyTowards(location/vector), orderFlyTowardsBlind(location/vector), orderDefendLocation(location/vector)
        -- TIP 
-- the easiest way to make the ship fly towards something in game if to copy and paste its location on x and y axis
-- the center of your grid and scenario's starting point is (0,0); right and down are positive numbers, up and left are netive numbers

-- orders reliant on other objects include: orderDefendTarget(target), orderAttack(target), orderRetreat(target); orderDock(target); orderFlyFormation(fellow ship as a target, vector offset)
        --NB
-- If you put orders that make your ship interact with another ship in the body of your script, the scanario WILL NOT LOAD
-- (This is because technically that other ship does not exist yet)
-- I will show you where this stuff can be called

--let's change its weapons. As with shields, you have to set Max before you give it more than it can physically take
tweakedShip:setWeaponStorageMax("HVLI", 6):setWeaponStorageMax("Homing", 4):setWeaponStorageMax("EMP", 2):setWeaponStorage("HVLI", 6):setWeaponStorage("Homing", 4):setWeaponStorage("Emp", 2)

-- Let's beef up its hull and shields
tweakedShip:setHullMax(150):setHull(150):setShieldsMax(100, 100):setShields(100, 100)

        -- TIP
-- You can add descriptions, scanning difficulty and signature to CPU Ships
-- To view default parameters the ship, find its template! For example, gunships live in shipTemplates_BCStarfighters.lua

                                -- TEMPLATE BASED OBJECTS -- PLAYER SHIPS

          -- this is how a playership spawns. You will note that it does not have a callsign, using default PL250                        
player1 = PlayerSpaceship():setTemplate("UCS Talavaar Class Destroyer"):setPosition(424, 253):setWarpDrive(true):setWarpSpeed(1000.00)
-- let's give it a name so we can operate with it later 

                                -- TEMPLATE BASED OBJECTS -- PLAYER SHIPS -- TWEAKING

-- You can tweaks its weapons storage, hull and shields, as above. 
-- naturally, it will not have orders and AI 

-- here are some additional things you might want to do to the player ship 

--set a callsign
player1:setCallSign("Talavaar")

-- double its energy levels, coolant and probes; set max before you set current amount    
player1:setEnergyLevelMax(2000):setEnergyLevel(2000):setMaxCoolant(20):setMaxScanProbeCount(16):setScanProbeCount(16)


                                -- SCRIPTING CALLBACK FUNCTIONS --

-- the simplest way to affect the player ship is by including a callback function 
-- which, in simple terms is a function that gets triggered when a pre-existing function is called 

-- HERE ARE THE PRE-EXISTING FUNCTIONS THAT USE CALLBACK FUNCTIONS:
-- onTakingDamage() >> works with warpjammers, and all Template Based Objects
-- onDestruction() >> works with mines, warpjammers, asteroids, probes, and Template Based Objects
-- onPickUp() >> works with artifacts, and destroys the artifact in the process
-- onExpiration() >> works with Probes. NOTE that because probes are creates in-game, scripting with them is complicated
-- onTeleportation() >> works with wormholes

-- ((all custom Comms act as a callback, but I have not dug into that because we have a live GM. If you want a custom comm in your script, let me know))

-- STRUCTURE 
-- all callback functions at its base are structured as follows >> object:onTakingDamage(function() -effects-of-the-function- end)


                                -- CASE STUDY -- ARTIFACT -- ONE CALLBACK FUNCTION 

                    
-- our existing artifact
tweakedArtifact:onPickUp( -- when you pick it up
    function() -- creates function 
        player1:setSystemHeat("reactor", 1.0) -- reactor gets hot
        player1:setSystemHealth("reactor", 0.0) -- reactor drops to zero health 
    end -- end function
) -- close bracket 

                                -- CASE STUDY -- WARPJAMMER -- TWO CALLBACK FUNCTIONS

-- here is a WarpJammer I created in my Playground scenario with a variable range and a callback functions for damage and destruction 

-- local name -- type        -- faction                 -- location      -- !!variable range     -- if you damage it...
bigJammer = WarpJammer():setFaction("Independent"):setPosition(24444, -5000):setRange(1, 1000):onTakingDamage(
    function() -- creates function 
        bigJammer:setDescriptionForScanState("notscanned",
            [[Warning! Destruction of this WarpJammer will result in critical damage]]) -- description for unscanned state changes to a warning
        bigJammer:setDescriptionForScanState("simplescan", 
        [[Warning! Destruction of this WarpJammer will result in critical damage]]) -- description for simple scan state changes to a warning 
        bigJammer:setDescriptionForScanState("fullscan", 
        [[Warning! Destruction of this WarpJammer will result in critical damage]]) -- description for full scan state changes to a warning 
    end -- end function (bracket is closed on the line below)
):onDestruction( -- if you destroy it... 
    function() -- creates function 
        player1:takeDamage(150) -- player takes 150 default "energy" damage 
        player1:takeDamage(100, "emp") -- and 150 EMP damage 
    end -- end function
) -- close bracket 
            -- TIP
            --setDescriptionForScanState("state", "[[Description Text]]") is an alernative to setDesctiption() BUT it does not work with every single object, and can get buggy

                                 -- CALLBACK FUNCTIONS -- CONDITIONS

-- so far all our functions were unconditional, i.e. the effects take place regardless of other factors
-- often, however, this might not be the case, and you might want something to happen depending on circumstances
-- this has a basic if... then structure 

-- let's add a conditonal function to our beefy gunship, indicating what happens if it takes hull damage
tweakedShip:onTakingDamage( -- open bracket 
    function() -- creates function 
        if tweakedShip:getHull() < tweakedShip:getHullMax() then  -- if curent Hull is less than maximum then 
            tweakedShip:orderAttack(player1) -- the ship's previous order is overriden and it attacks the player 
        end -- "if... then" clause need to be ended 
    end -- end function 
) -- close bracket 

                                -- OTHER AREAS OF THE SCENARIO SCRIPT 

-- Most basic scripts that we operate with only have the body. 
-- However, if there are custom funcitons that need to be initiated, this need to happen inside "init" function

function init()
    -- init function calls/initiates every function inside it ONCE after the body of the scenario spawned

    -- EXAMPLE
    -- now that the body has loaded and the game knows what all of the objects in it are, you can order your playership to dock to its base
    player1:commandDock(tweakedStation)
    -- NB you need to be within docking range for this function to be exceduted
    
    -- custom functions that requiring a single initiation will need to be called from init() like so:
    -- customFunction()
end 

function update(delta)
    -- update function is running throughout the scenario
    -- everything which can have a status change and needs to update needs to be called from update function 
    -- delta as a parameter records the passage of time
    -- if you added a loop into your scenario, it needs to be called from update function to operate
    -- loops look a bit like this: "for _, obj in ipairs(list) do"
end


                        -- DEBUGGING YOUR SCRIPT

-- IF YOUR SCRIPT CRASHES THE GAME >> 
                            -- open EmptyEpsilon.log and look for the Error message.
                            -- it is likely that your scenario has something in it that the game stuggles to locate, like a template that it can't identify
                            -- make sure that all templates you are using exist within shipTemplates_FileName.lua AND that doc is set to "required" in shipTemplates.lua
                            -- go through the log errors and resolve those one by one 

-- IF YOUR SCRIPT IS SHOWING A RED MESSAGE ON EE CONSOLE >>
                            -- EE will tell you the line the problem originates in 
                            -- quite often, it's just a matter of syntax and spelling: make sure all your brackets are closed, check the spelling and symbols on the problem line
                            -- if the problem line is in a function, the error message will likely tell you where you went wrong with your syntax; follow its advice 
                            -- "NIL VALUE" indicates that you scenario is trying to reference something that it thinks does not exist:
                            -- if you are using an existing parameter (such as Stations, Systems, Weapons), check the Scripting Reference doc to make sure that you have added it exactly as written there
                            -- (this will be at the top of the scripting reference doc)
                            -- if you are using a parameter established elsewhere (Templates, Factions), check to see if it is exactly as written there
                            -- check scripting reference doc to see if your arguments are correct syntaxtually. For example, setWarpDrive() calls for a boolean (true/false), if you try to put anythign else into it, it will freak out
                            -- if it's flagging a pre-existing function, you may be trying to use something that only exists at the template creation stage and not scripting stage
                            -- (for example, if you use :setDefaultAI in scenario instead of :setAI, it won't work because that function exists ONLY in template creation)

-- IF YOUR SCRIPT LOADS BUT DOES NOT DO WHAT YOU WANT IT TO DO >>
                            -- it may be that your arguments are wrong, in which case double-check the logic of what you are doing
                            -- (for example, if you have commandDock() as above but the the player ship is too far, it will not dock because it physically can't from the location it's in)
                            -- check that you have actually initiated your functions in the relevant part of the script

-- YOU HAVE CHECKED ALL OF THOSE AND IT'S STILL UNHAPPY >>
                            -- ask for help! :)

                        -- HOW-TO-UNDERSTAND-LUA: BASIC TERMS

-- local name >> anything that you have given a name to. Use "name = thing" to declare a local name
-- function >> a bit of code that make things happen! Always has a space for parameter () but not always actually has a parameter
-- pre-existing function >> EE has a lot of those. setHull() is one example. Those can also be functions from lua libraries
-- parameter >> a "box" within functions brackets that can have value 
-- arguments >> a value assigned to that "box"
-- string >> text, as in, "string"
-- number >> numerical value. Can be a float (1.0) or integer (100)
-- boolean >> true/false
-- for example, :setWeaponStorage("HVLI", 6) >> setWeaponStorage() calls a pre-existing function; it takes two arguments in its parameters: a string to indicate EMissileweapons and a number to indicate the number of items.
-- conditions >> if... then clause
-- list >> a box in which you can put an array of things 
-- loop >> a structure that repeats code 

-- ANY QUESTIONS, DO REACH OUT!
-- x NAT