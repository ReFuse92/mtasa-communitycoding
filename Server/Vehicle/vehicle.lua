--
-- Project: MTASA CommunityCoding
-- User: MasterM
-- Package: Server.Vehicle.vehicle
-- Date:
-- Time:
--


-- Usefull
for i=0, 49 do
setGarageOpen(i,true)
end


UserVehicles = {}



Chat = outputChatBox

function loadCars()
	local query = dbQuery(mySQL.handler, "SELECT * FROM Fahrzeuge")
	local result, row, error = dbPoll(query, -1)
	if row > 0 then
		for result, row in pairs(result) do
		-- auslesen
		local ID = row["ID"]
		local Autoname = row["Name"]
		local Owner = row["Besitzer"]
		local sOwner = row["Schlüssel"]
		local Spawn = fromJSON(row["Spawn"])
		local Schaden = row["Schaden"]
		local Farbe = fromJSON(row["Farbe"])
		local Tunings = fromJSON(row["Tunings"])
		local Spezial = fromJSON(row["Spezial"])
		local Tank = row["Tankinhalt"]
		local Kennzeichen = row["Kennzeichen"]
		-- erstellen
		veh = createVehicle(getVehicleModelFromName(Autoname),Spawn[1], Spawn[2], Spawn[3], Spawn[4], Spawn[5], Spawn[6], Kennzeichen)
		setElementInterior(veh,Spawn[7])
		setElementDimension(veh,Spawn[8])
		--weitere Einstellungen
		setVehicleRespawnPosition(veh,1628.82 , -1609.18 , 13.55 , 359.96 , 0 , 90.12)-- bei den Abschleppern
		setElementHealth(veh,tonumber(Schaden))
		createBlipAttachedTo(veh,55)
		toggleVehicleRespawn(veh,true)-- ggf. Daten von nebenbei laufenden Scripts überschreiben
		setVehicleRespawnDelay(veh,15000)-- 15 sekunden
		setVehicleIdleRespawnDelay(veh,1000*60*60*24)-- 24 Stunden (wird nicht respawnt)
		
		-- Farbe
		setVehicleColor(veh, Farbe[1], Farbe[2], Farbe[3], Farbe[4], Farbe[5], Farbe[6] )
		setVehicleHeadLightColor(veh, Farbe[7], Farbe[8], Farbe[9])
		setVehiclePaintjob(veh, Farbe[10])
		--Tunings
		
		
		--[[  muss überarbeitet werden
			for i, v in pairs(Tunings) do
				if(i) then
					if(i > 999) and (i < 1194) then
						addVehicleUpgrade(veh, v)
					end
				end
			end
				
				
					-- Spezial
					-- Motor
					if gettok(Spezial,1,",") == "1" then setVehicleHandling(veh,"engineAcceleration",getVehicleHandling(veh)["engineAcceleration"]+0.3) end
					if gettok(Spezial,2,",") == "1" then setVehicleHandling(veh,"engineAcceleration",getVehicleHandling(veh)["engineAcceleration"]+0.7) end
					if gettok(Spezial,3,",") == "1" then setVehicleHandling(veh,"engineAcceleration",getVehicleHandling(veh)["engineAcceleration"]+1.3) end
					-- Getriebe
					if gettok(Spezial,4,",") == "1" then setVehicleHandling(veh,"maxVelocity",getVehicleHandling(veh)["maxVelocity"]+0.2) end
					if gettok(Spezial,5,",") == "1" then setVehicleHandling(veh,"maxVelocity",getVehicleHandling(veh)["maxVelocity"]+0.9) end
					if gettok(Spezial,6,",") == "1" then setVehicleHandling(veh,"maxVelocity",getVehicleHandling(veh)["maxVelocity"]+1.7) end
					-- Fahrwerk
					if gettok(Spezial,7,",") == "1" then setVehicleHandling(veh,"suspensionLowerLimit",getVehicleHandling(veh)["suspensionLowerLimit"]+0.1) end
					if gettok(Spezial,8,",") == "1" then setVehicleHandling(veh,"tractionLoss",getVehicleHandling(veh)["tractionLoss"]+0.2) end
					if gettok(Spezial,9,",") == "1" then setVehicleHandling(veh,"tractionLoss",getVehicleHandling(veh)["tractionLoss"]+0.5) end
					-- Bremsen
					if gettok(Spezial,10,",") == "1" then setVehicleHandling(veh,"brakeDeceleration",getVehicleHandling(veh)["brakeDeceleration"]+0.05) end
					if gettok(Spezial,11,",") == "1" then setVehicleHandling(veh,"brakeDeceleration",getVehicleHandling(veh)["brakeDeceleration"]+0.05) end
					if gettok(Spezial,12,",") == "1" then setVehicleHandling(veh,"brakeDeceleration",getVehicleHandling(veh)["brakeDeceleration"]+0.15) end
                ]]
				
			UserVehicles[veh] = {}
			UserVehicles[veh]["ID"] = ID
			UserVehicles[veh]["Besitzer"] = Owner
			UserVehicles[veh]["Schlüssel"] = sOwner
			UserVehicles[veh]["Spezial"] = Spezial
			UserVehicles[veh]["Tank"] = Tank
			-- Daten müssen nicht gesynct werden, da am Serverstart noch keine Spieler da sind
			
			addEventHandler("onVehicleExit",veh,saveVehicle)
		-- ende des Auslesens
		end
	else
		outputDebugString("[Vehicles]Keine Fahrzeuge vorhanden",1)
	end
end



function addVehicle(vehid,x,y,z,Besitzer)
	local temp_veh = createVehicle(vehid,x,y,z,0,0,0,Besitzer)
	local spawn = toJSON({x,y,z,0,0,0,0,0})
	local farbe = toJSON({255,255,255,0,0,0,255,255,255,3})--Farbe 1,2 Lichtfarbe, Paintjob
	local query = dbQuery(mySQL.handler,"INSERT INTO Fahrzeuge (Name, Besitzer, Schluessel, Spawn, Schaden, Farbe, Tunings, Spezial, Tank, Kennzeichen) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", getVehicleName(temp_veh), Besitzer, toJSON({}), spawn, 1000, farbe, toJSON(getVehicleUpgrades(temp_veh)), toJSON({}), 1000, Besitzer )
	local result, rows, ID = dbPoll(query,-1)
	setVehicleColor(temp_veh,255,255,255,255,255,255)
	UserVehicles[temp_veh] = {}
	UserVehicles[temp_veh]["ID"] = ID
	UserVehicles[temp_veh]["Besitzer"] = Besitzer
	UserVehicles[temp_veh]["Schlüssel"] = {}
	UserVehicles[temp_veh]["Spezial"] = {}
	UserVehicles[temp_veh]["Tank"] = 1000
	
	updateDataForAllClients(temp_veh,"ID")
	updateDataForAllClients(temp_veh,"Besitzer")
	updateDataForAllClients(temp_veh,"Schlüssel")
	updateDataForAllClients(temp_veh,"Spezial")
	updateDataForAllClients(temp_veh,"Tank")
	
	addEventHandler("onVehicleExit",temp_veh,saveVehicle)
	return temp_veh
end



function saveVehicle(driver)
	if UserVehicles[source] then
		if UserVehicles[source]["Besitzer"] == getPlayerName(driver) then
			local x,y,z = getElementPosition(source)
			local rx,ry,rz = getElementRotation(source)
			local int, dim = getElementInterior(source), getElementDimension(source)
			local spawn = toJSON({x,y,z,rx,ry,rz,int,dim})
			local id = UserVehicles[source]["ID"]
			dbExec(mySQL.handler,"UPDATE Fahrzeuge SET Spawn=?, Schaden=? WHERE ID=?",spawn,getElementHealth(source),id)
			outputConsole("Dein Fahrzeug mit ID "..id.." ("..getVehicleName(source)..") wurde gespeichert.",driver)
		end
	end
end


function getVehicleKeyOwners(vehicle)
	if vehicle and UserVehicles[vehicle] then
		return UserVehicles[vehicle]["Schlüssel"]
	else
		return false
	end
end

function hasPlayerVehicleKey(player,vehicle)
	if player and vehicle and UserVehicles[vehicle] then
		if UserVehicles[vehicle]["Schlüssel"][player] then
			return true
		end
		return false
	else
		return false
	end
end

function removePlayerFromVehicleKeyList(player,vehicle)
	if player and vehicle and UserVehicles[vehicle] then
		for i,v in pairs (UserVehicles[vehicle]["Schlüssel"]) do
			if i == getPlayerName(player) then
			table.remove(UserVehicles[vehicle]["Schlüssel"],i)
			updateDataForAllClients(vehicle,"Schlüssel")
				return true
			end
		end
		return false
	else
		return false
	end
end

function addPlayerToVehicleKeyList(player,vehicle)
	if player and vehicle and UserVehicles[vehicle] then
		if not UserVehicles[vehicle]["Schlüssel"][player] then
			UserVehicles[vehicle]["Schlüssel"][player] = true
			updateDataForAllClients(vehicle,"Schlüssel")
			return true
		end
		return false
	else
		return false
	end
end




--syncing
function updateDataForAllClients(veh,key)
	triggerClientEvent("onClientRecieveVehicleData", resourceRoot, veh, key, UserVehicles[veh][key])
end


local vehRequestTimer = false
function sendClientVehicleDatas()
	--triggerClientEvent(client,"onClientPrepareVehicleData",getRootElement(),UserVehicles)
	--Use a letent event! (Preventing DoS Attemps!)
	local events = #getLatentEventHandles(client)
	if events > 3 then
		--Server handles many events at the same time for one client. We should requeue our event to pretend heavy load!
		if (vehRequestTimer and isTimer(vehRequestTimer)) then
			--Would be handles twice. Stop here!
			return false
		else
			--Retry in 5 seconds..
			vehRequestTimer = setTimer(
				function(c)
					_G["client"] = c
					sendClientVehicleDatas()
				end
			, 5000, 1, client)
		end
	else
		--Execute the trigger..
		triggerLatentClientEvent(client, "onClientPrepareVehicleData", 500000, false, client, UserVehicles)
	end
end
addEvent("onClientWishToHaveVehicleData", true)
addEventHandler("onClientWishToHaveVehicleData", getRootElement(), sendClientVehicleDatas)


--TODO
--[[
function deleteVehicle(veh)
	if UserVehicles[veh] then
		dbExec(mySQL.handler,"UPDATE Fahrzeuge SET Spawn=?, Schaden=? WHERE ID=?",id)
		return true
	else
		return false
	end
end]]


loadCars()

--
--Testing
--
function createEpicVehicle(player,cmd,id)
	if id then	
		local x,y,z = getElementPosition(player)
		if not getVehicleModelFromName(id) then return Chat(id.." ist kein gültiges Fahrzeug.", player) end
				local newveh = addVehicle(getVehicleModelFromName(id),x,y+2,z,getPlayerName(player))	
				warpPedIntoVehicle(player,newveh)
				setElementInterior(newveh,getElementInterior(player))
				setElementDimension(newveh,getElementDimension(player))
	else
		Chat("Du musst ein Fahrzeug angeben", player)
	end
end
addCommandHandler("vehicle",createEpicVehicle)

