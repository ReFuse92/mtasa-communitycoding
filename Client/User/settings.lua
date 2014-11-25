--
-- Project: MTASA CommunityCoding
-- User: MasterM
-- Package: Client.User.Settings
-- Date:
-- Time:
--


lp = getLocalPlayer()
DEBUG = true
Chat = outputChatBox

--hier kommen alle Werte rein, die beim User lokal gespeichert werden sollen
xmlWerte = {
["Info"] = "In dieser Datei werden alle Einstellungen, die von dir vorgenommen wurden, gespeichert.",
["Car_Motor"] = "X",
["Car_Licht"] = "L",
}

local settingsFile = "@Einstellungen.xml")
--var for the file to make it a little bit more dynamic
--@, to make the file private, so other servers can't read it

function loadSettings()
	local xml = xmlLoadFile(settingsFile)
	if not xml then -- neue XML erstellen, falls benötigt
		xml = xmlCreateFile(settingsFile,"Einstellungen")
	end
	
	for i,v in pairs(xmlWerte) do -- Schleife von allen Werten der Tabelle
		if not xmlFindChild(xml,i,0) then -- wenn Wert nicht in XML, dann rein damit
			local temp_child = xmlCreateChild(xml,i)
			xmlNodeSetValue(temp_child,v)
			if DEBUG then Chat("#FFD795[Einstellungen]#FFFFFF Node #A50000"..i.."#FFFFFF mit Wert #A56000"..v.."#FFFFFF erstellt.",255,255,255,true) end
		end
	end
xmlSaveFile(xml)
xmlUnloadFile(xml)
end



function resetSettings()
	local xml = xmlLoadFile(settingsFile)
	if not xml then return loadSettings() end
		for i, v in pairs(xmlWerte) do
			xmlDestroyNode(xmlFindChild(xml,i,0))
			if DEBUG then Chat("#FFD795[Einstellungen]#FFFFFF Node #A50000"..i.."#FFFFFF zerstört.",255,255,255,true) end
		end
	xmlSaveFile(xml)
	xmlUnloadFile(xml)
	loadSettings()
end
addCommandHandler("destroy",resetSettings)



function getSetting(name)
	local xml = xmlLoadFile(settingsFile)
	if not xml then return loadSettings() end
	local child = xmlFindChild(xml,name,0)
	local value = false
		if child then
				value = xmlNodeGetValue(child)
				xmlUnloadFile(xml)
				if DEBUG then Chat("#FFD795[Einstellungen]#FFFFFF Wert #A56000"..value.."#FFFFFF ausgegeben.",255,255,255,true) end
		end
	return value
end

function setSetting(name,wert)
	local xml = xmlLoadFile(settingsFile)
	if not xml then return loadSettings() end
		if not xmlFindChild(xml,name,0) then 
			xmlNodeSetValue(xmlCreateChild(xml,name),wert)
			if DEBUG then Chat("#FFD795[Einstellungen]#FFFFFF Node #A50000"..name.."#FFFFFF erstellt und auf Wert #A56000"..wert.."#FFFFFF gesetzt.",255,255,255,true) end
			return true
		else
			xmlNodeSetValue(xmlFindChild(xml,name,0),wert)
			if DEBUG then Chat("#FFD795[Einstellungen]#FFFFFF Node #A50000"..name.."#FFFFFF auf Wert #A56000"..wert.."#FFFFFF umgestellt.",255,255,255,true) end
			return true
		end
	xmlSaveFile(xml)
	xmlUnloadFile(xml)
	return false
end

loadSettings()