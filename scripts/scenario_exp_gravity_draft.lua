-- Name: Eploration Grav Anomaly Tier 1
-- Description: Functionality draft
-- Type: Basic
-- Variation[Takanami]: This scenario will run on Takanami
-- Variation[Havock]: This scenario will run on Havock

require("utils.lua")
require("utils_bc.lua")

-- Playerships
player = PlayerSpaceship():setPosition(-15801, 60039):setWarpDrive(true):setWarpSpeed(1000.00):setFaction("UCN")

shuttle = PlayerSpaceship():setPosition(-16101, 60339):setWarpDrive(true):setWarpSpeed(1000.00):setFaction("UCN")

-- UCN Ships


-- Other

-- Grav Anomaly
anomaly = SpaceStation():setPosition(0, 0):setTemplate("Gravitational Anomaly"):setFaction("Independent"):setCallSign("")

-- Terrain

-- Automation

-- currently breaks at the exact distance of 5k with wither version of the logic. 
-- Why? No fucking clue. To debug
-- Also, to thik of a version of logic for this that does not suck. 

boom = 0
function gravAn(delta)
    for _, obj in ipairs(anomaly:getObjectsInRange(40000)) do
        ox, oy = obj:getPosition()
        ax, ay = anomaly:getPosition()
        local distance = distance(anomaly, obj)
        local angle = math.deg(math.atan(oy - ay, ox - ax)) % 360
        -- if distance <= 20000 then
        --     draw = 5000
        -- else
        --     draw = draw - 10
        --     if draw < 30 then
        --         draw = 30
        --     end
        -- end
        if distance <= 30000 then
            draw = 5000
        elseif distance <= 25000 then
            draw = 3000
        elseif distance <= 20000 then
            draw = 1000
        elseif distance <= 15000 then
            draw = 500
        elseif distance <= 10000 then
            draw = 300
            boom = 0
        elseif distance <= 5000 then
            draw = 100
        elseif distance <= 2000 then
            draw = 30
        end
        local x, y = vectorFromAngle(angle, math.floor(distance / draw))
        nx = ox - x
        ny = oy - y
        obj:setPosition(nx, ny)
        -- if distance <= 3000 and obj == player then
        --     player:setCanDock(false)
        -- else
        --     player:setCanDock(true)
        -- end
        -- if distance <= 3000 and obj == shuttle then
        --     shuttle:setCanDock(false)
        -- else
        --     shuttle:setCanDock(true)
        -- end
        print(distance)
        if distance <= 700 and distance >= 300 then
            if boom == 0 then
                -- if obj == player or obj == shuttle then
                    obj:takeDamage(50)
                    eX, eY = vectorFromAngle(angle, distance)
                    ExplosionEffect():setPosition(eX, eY):setSize(200)
                    boom = 1
                -- end
            end
        end
    end
end

-- variations
function setVariations()
    if string.find(getScenarioVariation(), "Havock") then
        player:setTemplate("UCS Skirmish Class Frigate"):setCallSign("UCS Havock"):setFaction("UCN")
        shuttle:setTemplate("UCS Havock Shuttle"):setCallSign("UCS Havock Shuttle")
    elseif string.find(getScenarioVariation(), "Takanami") then
        player:setTemplate("UCS Hoplite Class Destroyer"):setCallSign("UCS Takanami"):setFaction("UCN")
        shuttle:setTemplate("UCS Takanami Shuttle"):setCallSign("UCS Takanami Shuttle")
    end
end

function init()
    setVariations()
    player:setActivePresetNumber(0)
    shuttle:setActivePresetNumber(0)
end

function update(delta)
    gravAn(delta)
end
