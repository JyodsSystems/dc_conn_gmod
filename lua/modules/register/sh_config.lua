-- Dies ist eine Standard-Konfigurationsdatei für das jyodssystems-Addon.
-- Hier können Einstellungen für verschiedene Unterordner festgelegt werden.

if JS.Config.DC then return end

JS.Config.DC = {}

if JS.Config.DC.REGISTER then return end

JS.Config.DC.REGISTER = {}
JS.Config.DC.REGISTER.Name = "DC.REGISTER"
JS.Config.DC.REGISTER.ActivateModule = true

JS.Config.Servername = "[PG]"
JS.Config.DC.REGISTERCommand = "/register"

JS.Config.DC.REGISTER.Host = "0.0.0.0:5000"

JS.Config.DC.REGISTER.Prefix = "<c=0,255,0>[DC.REGISTER]</c> "
JS.Config.DC.REGISTER.Wait = "Bitte warten..."
JS.Config.DC.REGISTER.Discord = "Den Einheits-Discord findest du unter: <url>https://discord.gg/zC7NFDKxys</url>"

hook.Call("js.registerModule", nil, JS.Config.DC.REGISTER)