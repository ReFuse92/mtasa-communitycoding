--
-- Project: MTASA CommunityCoding
-- User: StiviK
-- Package: Server.Main
-- Date: 22.11.14
-- Time: 11:36
--

if #mySQL > 0 then -- check if we have valid mysql informations
    outputDebugString("[MYSQL] Connecting to the mySQL-Server...")

    mySQL.handler = dbConnect("mysql", mySQL.host, mySQL.user, mySQL.pass)

    if isElement(mySQL.handler) then
        outputDebugString("[MYSQL] Successfully connected to the mySQL-Server!")
    else
        outputDebugString("[MYSQL] Connection to the mySQL-Server failed! Stopping resource...")
        stopResource(getThisResource())
    end

    --[[
        Setzt den Wert der Spalte auf den angegeben Wert
        @param usr player
        @param data string
        @param value string/number
    --]]
    function setMySQLData (usr, data, value)
        assert(isElement(usr), "[setMySQLData] usr is not valid element!")
        assert(data, "[setMySQLData] data is not valid!")
        assert(value, "[setMySQLData] value is not valid!")

        return dbExec(mySQL.handler, "UPDATE `userdata` SET `??` = ? WHERE `username` = ?;", data, value, getPlayerName(usr));
    end

    --[[
        Setzt alle Daten aus einer Tabelle in die Userdatenbank
        @param usr player
        @param tbl table {"spalte1", "wert1", "spalte2", "wert2"}
        @author StiviK
    --]]
    function setAllMySQLData (usr, tbl)
        assert(isElement(usr), "[setAllMySQLData] usr is not valid element!")
        assert(type(tbl) == "table", "[setAllMySQLData] data is not valid!")

        local query = ("UPDATE `userdata` SET `%s` = %s"):format("??", "?")
        if #tbl > 2 then
            for i = 3, #tbl, 2 do
                if i == #tbl-1 then
                    query = ("%s, `%s` = %s WHERE `username`= ?;"):format(query, "??", "?")
                else
                    query = ("%s, `%s` = %s"):format(query, "??", "?")
                end
            end
        else
            query = ("%s WHERE `username`= ?;"):format(query)
        end

        table.insert(tbl, getPlayerName(usr))
        return dbExec(mySQL.handler, query, unpack(tbl))
    end

    --[[
        Lädt den gewünschten aus der Wert aus der Datenbank
        @param usr player
        @param data string
        @para process boolean (Direkte verarbeitung mit dbPoll?)
    --]]
    function getMySQLData (usr, data, process)
        assert(isElement(usr), "[setMySQLData] usr is not valid element!")
        assert(data, "[setMySQLData] data is not valid!")
        local process = process == true;

        local result = dbQuery(mySQL.handler, "SELECT `??` FROM userdata WHERE `username` = ?;", data, getPlayerName(usr))
        if result ~= nil then
            if process then
                return dbPoll(result, -1);
            else
                return result;
            end
        else
            return false;
        end
    end
end