function init()
	print("init called")
	state = 0
	supplyDrop = nil

	my_ship = CpuShip():setFactionId(faction_id):setPosition(position_x, position_y):setTemplate("Scout Drone")
	:setCallSign("SUPPLY DRONE"):setScanned(true):setWarpDrive(true):setWarpSpeed(1000.00):orderFlyTowardsBlind(target_x,
		target_y)
end

function update(delta)
	local x, y = my_ship:getPosition()

	if not my_ship:isValid() then
		destroyScript()
	end

	if state == 0 then
		if math.abs(x - target_x) < 300 and math.abs(y - target_y) < 300 then
			supplyDrop = SupplyDrop():setFactionId(faction_id):setPosition(target_x + random(-300, 300),
				target_y + random(-300, 300)):setEnergy(1500)
				-- supplyDrop:onPickUp(
	-- function()
		-- keeping this here, but it does not work, because I can't pass player into this script as a variable
		-- (I tried)
		--player:addToShipLog("Missiles Have Been Restocked", "Blue", "Weapons"):addToShipLog(
			--You Have Been Refueled", "Blue", "Engineering")
	-- end)
			state = 1
		end
	elseif state == 1 then
		my_ship:orderFlyTowardsBlind(position_x, position_y)
		if pCallsign == "UCS Havock" then
			supplyDrop:setWeaponStorage("Homing", 12):setWeaponStorage("HVLI", 6):setWeaponStorage("Mine", 6)
				:setWeaponStorage("EMP", 6):setWeaponStorage("Nuke", 2)
		elseif pCallsign == "UCS Takanami" then
			supplyDrop:setWeaponStorage("Homing", 12):setWeaponStorage("HVLI", 8):setWeaponStorage("Mine", 6)
				:setWeaponStorage("EMP", 8):setWeaponStorage("Nuke", 2)
		else
			supplyDrop:setWeaponStorage("Homing", 6):setWeaponStorage("HVLI", 6)
		end
		if math.abs(x - position_x) < 300 and math.abs(y - position_y) < 300 then
		
			my_ship:destroy()
			destroyScript()
			return
		end
	end
end
