-- Project: MTASA CommunityCoding
-- User: Adrian93
-- Package: Server.User.Login.login
-- Date: 23.11.2014
-- Time: 11:39
--

--[[
function GetAccount( username )
	if username ~= "" then
		local query = dbQuery(mySQL.handler, "SELECT * FROM accounts WHERE Username = ?", username)
		local result, rows = dbPoll(query, -1)
		if rows == 1 then
			return result[1]
		else
			return false
		end
	end
	return false
end

function AddAccount( username, password )
	if username ~= "" then
		if password ~= "" then
			local account = GetAccount(username)
			if account == false then
				local exec = dbExec(mySQL.handler, "INSERT INTO accounts (Username, Password, PlayedH, PlayedM, Fraktion, Rang, Skin, Adminlvl, Money, Bankmoney) VALUES (?, ?, '0', '0', '0', '0', '0', '0', '0', '0', )", username, md5(password))
				if exec then
					outputDebugString("Der Account "..username.." wurde erfolgreich angelegt!")
					return true
				else
					return false
				end
			end
		end
	end
end

function Register ( playername,PlayerPW )
	local user = GetAccount(playername)
	if user then
		local pwfalsch = 2
		triggerClientEvent(getPlayerFromName(playername),"ZeigEsMir",getPlayerFromName(playername), pwfalsch)
	else
		triggerClientEvent(getPlayerFromName(playername),"closeLoginRegister",getPlayerFromName(playername))
		spawnSpieler(playername)
		AddAccount(playername, PlayerPW)
	end
end


function Login( spieler, pw )
   	local player = getPlayerFromName(spieler)
    local Passwort = md5(pw)
	local Password = getMysqlData(spieler, "Password")
    local SQL = dbQuery( mySQL.handler, "SELECT * FROM accounts WHERE Username = '"..spieler.."' AND Password = '"..md5(pw).."'")
    local result, num_rows = dbPoll(SQL, -1 )
	if (Password==Passwort)then
		if result then
			for _, row in ipairs ( result ) do
				if num_rows == 1 then
					for key, value in pairs(row) do
						setElementData(source, key,value)  --wenn das nicht, dann halt alles einzeln seten
					end
						triggerClientEvent(player,"closeLoginRegister",player)
						spawnSpieler(player)
						-- setElementData(player, "Username", row["Username"])
						-- setElementData(player, "PlayedH", row["PlayedH"])
						-- setElementData(player, "PlayedM", row["PlayedM"])
						-- setElementData(player, "Fraktion", row["Fraktion"])
						-- setElementData(player, "Rang", row["Rang"])
						-- setElementData(player, "Skin", row["Skin"])
						-- setElementData(player, "Adminlvl", row["Adminlvl"])
						-- setElementData(player, "Money", row["Money"])
						-- setElementData(player, "Bankmoney", row["Bankmoney"])
					end
				end
			end
	else
		outputDebugString(spieler.." hat das Passwort falsch eingegeben!")
		local pwfalsch = 1
		triggerClientEvent(player,"ZeigEsMir",player, pwfalsch)
	end
end
--]]
addEvent("RegistratePlayer",true)
addEvent("LoginPlayer",true)
addEventHandler("RegistratePlayer",getRootElement(),Register)
addEventHandler("LoginPlayer",getRootElement(),Login)


function spawnSpieler(player)
	local x = 631
	local y = -571
	local z = 16.34
	local Rotation = 270

	setElementData(player, "isLoggedIn", true)
	spawnPlayer(player, x, y, z, Rotation)
	fadeCamera(player, true)
	setCameraTarget(player, player)
end
