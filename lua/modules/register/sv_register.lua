local prefix = JS.Config.DC.REGISTER.Prefix

function sendPOSTRequest(url, data, callback)
    http.Post(url, data, callback, function(error)
        print("Error: " .. error)
    end)
end

function commandHandler(ply, text, plyteam)

    if (JS.Config.DC.REGISTER.ActivateModule) then
    
        if (string.sub(text, 1, string.len(JS.Config.DC.REGISTERCommand)) == JS.Config.DC.REGISTERCommand) then

            local steamID = ply:SteamID64()

            local url = "http://localhost:5000/register/" .. steamID
            local data = {
                ["steamid"] = steamID
            }

            -- In der Response wird eine reg nummer zurückgegeben
            sendPOSTRequest(url, data, function(response)
                ply:ChatPrint(prefix .. "Registriere deinen Account auf unserem Discord mit '/register " .. response["message"] .. "'")
            end)

            return ""
            
        end

    end

end

hook.Add("PlayerSay", "JGetCommand", commandHandler)