-- Dies ist eine Standard-Konfigurationsdatei für das jyodssystems-Addon.
-- Hier können Einstellungen für verschiedene Unterordner festgelegt werden.

if JS.Config.SYNC then return end

JS.Config.SYNC = {}
JS.Config.SYNC.Name = "SYNC"

JS.Config.SYNC.Prefix = "[SYNC] "

hook.Call("js.registerModule", nil, JS.Config.SYNC)