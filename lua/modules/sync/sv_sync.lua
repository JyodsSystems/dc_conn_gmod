
local function GetPlayersDB()
    local dbTable = "VoidChar_characters"
    local dbQuery = "SELECT * FROM " .. dbTable

    local dbResult = sql.Query(dbQuery)

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


timer.Create("SyncTimer", 25, 0, function()

    local dbResult = GetPlayersDB()

    if (dbResult == nil) then
        return
    end

    -- Send all player data to server
    local url = "http://" + JS.Config.DC.SYNC.Host + "/sync"
    
    local jsonData = util.TableToJSON(dbResult)
    --print(JS.Config.SYNC.Prefix .. "Sende Daten an Server...")
        
        local toSend = {
            ["data"] = jsonData
        }


    sendPOSTRequestAsJSON(url, toSend, function(response)
        if (response == "success") then
            --print(JS.Config.SYNC.Prefix .. "Daten erfolgreich synchronisiert!")
        end
    end)

end)