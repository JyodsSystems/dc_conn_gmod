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

JS.Config.DC.REGISTER.Prefix = "<c=0,255,0>[DC.REGISTER]</c> "

hook.Call("js.registerModule", nil, JS.Config.DC.REGISTER)