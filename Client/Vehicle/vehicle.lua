--
-- Project: MTASA CommunityCoding
-- User: MasterM
-- Package: Client.Vehicle.vehicle
-- Date:
-- Time:
--
lp = getLocalPlayer()


--
--Datensynchro (falls unverständlich, bitte fragen)
--

addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),function()
triggerServerEvent("onClientWishToHaveVehicleData",lp)
end)


UserVehicles = nil

addEvent("onClientPrepareVehicleData",true)
addEventHandler("onClientPrepareVehicleData",root,function(tab)
UserVehicles = tab
end)



addEvent("onClientRecieveVehicleData",true)
addEventHandler("onClientRecieveVehicleData",root,function(veh,key,value)
		if not UserVehicles[veh] then UserVehicles[veh] = {} end
		UserVehicles[veh][key] = value
end)


--
--Funktionen
--


--addEventHandler()








