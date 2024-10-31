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
            
            print(steamID)

            local url = "http://" + JS.Config.DC.REGISTER.Host + "/register/" .. steamID
            local data = {
                ["steamid"] = steamID
            }
            
            
            ply:ChatPrint(prefix .. JS.Config.DC.REGISTER.Wait)

            sendPOSTRequest(url, data, function(response)
                ply:ChatPrint(prefix .. response)
    			ply:ChatPrint(prefix .. JS.Config.DC.REGISTER.Discord)
            end)

            return ""
            
        end

    end

end

hook.Add("PlayerSay", "JGetCommand", commandHandler)