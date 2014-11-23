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

    function setMySQLData (usr, data, value)
        assert(isElement(usr), "[setMySQLData] usr is not valid element!")
        assert(data, "[setMySQLData] data is not valid!")
        assert(value, "[setMySQLData] value is not valid!")

        return dbExec("UPDATE `userdata` SET `??` = ? WHERE `username` = ?;", data, value, getPlayerName(usr));
    end

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