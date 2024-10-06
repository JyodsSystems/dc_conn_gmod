
local function GetPlayersDB()
    local dbTable = "Voidchar_characters"
    local dbQuery = "SELECT * FROM " .. dbTable

    local dbResult = sql.Query(dbQuery)

    print(table.ToString(dbResult, "dbResult", true))

    if (dbResult == nil) then
        print(JS.Config.SYNC.Prefix .. "Error: " .. sql.LastError())
        return
    end

    return dbResult
end

function sendPOSTRequestAsJSON(url, data, callback)
    http.Post(url, data, callback, function(error)
        print(JS.Config.SYNC.Prefix .. "Error: " .. error)
    end, {["Content-Type"] = "application/json"})
end


timer.Create("SyncTimer", 60, 0, function()

    local dbResult = GetPlayersDB()

    if (dbResult == nil) then
        return
    end

    -- Sende alle Spielerdaten in data an den Server
    local url = "http://localhost:5000/sync"
    
    local jsonData = util.TableToJSON(dbResult)
    print(JS.Config.SYNC.Prefix .. "Sende Daten an Server...")
    
    local data = {
        ["data"] = jsonData
    }


    sendPOSTRequestAsJSON(url, jsonData, function(response)
        if (response == "success") then
            print(JS.Config.SYNC.Prefix .. "Daten erfolgreich synchronisiert!")
        end
    end)

end)