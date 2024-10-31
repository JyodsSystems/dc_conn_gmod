# DC Connection GMod Addon

Dieses Addon ermöglicht die Integration von Garry's Mod mit einem Discord-Backend. Es bietet Module zur Registrierung und Synchronisation von Spielern.

## Installation

1. Klone das Repository in dein `garrysmod/addons` Verzeichnis:
    ```sh
    git clone https://github.com/JyodsSystems/dc_conn_gmod.git
    ```

2. Stelle sicher, dass das Backend korrekt eingerichtet ist. Weitere Informationen findest du im [Backend-Repository](https://github.com/JyodsSystems/dc_conn_backend).

## Konfiguration

### Allgemeine Konfiguration

Die Konfigurationsdateien befinden sich im Verzeichnis `lua/modules/register/sh_config.lua` und `lua/modules/sync/sh_config.lua`.

#### `lua/modules/register/sh_config.lua`

```lua
if JS.Config.DC then return end
JS.Config.DC = {}
if JS.Config.DC.REGISTER then return end
JS.Config.DC.REGISTER = {}
JS.Config.DC.REGISTER.Name = "DC.REGISTER"
JS.Config.DC.REGISTER.ActivateModule = true
JS.Config.Servername = "[PG]"
JS.Config.DC.REGISTERCommand = "/register"
JS.Config.DC.REGISTER.Host = "0.0.0.0:5000"  -- Ändere dies auf die IP und den Port deines Backends
JS.Config.DC.REGISTER.Prefix = "<c=0,255,0>[DC.REGISTER]</c> "
JS.Config.DC.REGISTER.Wait = "Bitte warten..."
JS.Config.DC.REGISTER.Discord = "Den Einheits-Discord findest du unter: <url>https://discord.gg/zC7NFDKxys</url>"
hook.Call("js.registerModule", nil, JS.Config.DC.REGISTER)
```


#### `lua/modules/sync/sh_config.lua`

```
if JS.Config.SYNC then return end
JS.Config.SYNC = {}
JS.Config.SYNC.Name = "SYNC"
JS.Config.SYNC.Prefix = "[SYNC] "
JS.Config.DC.SYNC.Host = "0.0.0.0:5000"  -- Ändere dies auf die IP und den Port deines Backends
hook.Call("js.registerModule", nil, JS.Config.SYNC)
```

## Module

### Register Modul

Das Register Modul ermöglicht es Spielern, sich über einen Befehl zu registrieren.

- **Datei:** `lua/modules/register/sv_register.lua`
- **Befehl:** `/register`
- **Konfigurationsparameter:**
  - `JS.Config.DC.REGISTERCommand`: Der Befehl, den Spieler eingeben müssen, um sich zu registrieren.
  - `JS.Config.DC.REGISTER.Host`: Die URL des Backends, an das die Registrierungsdaten gesendet werden.

### Sync Modul

Das Sync Modul synchronisiert die Spielerdaten mit dem Backend.

- **Datei:** `lua/modules/sync/sv_sync.lua`
- **Timer:** Synchronisiert alle 25 Sekunden die Daten.
- **Konfigurationsparameter:**
  - `JS.Config.DC.SYNC.Host`: Die URL des Backends, an das die Synchronisationsdaten gesendet werden.

## Backend

Stelle sicher, dass das Backend korrekt eingerichtet ist. Weitere Informationen findest du im [Backend-Repository](https://github.com/JyodsSystems/dc_conn_backend).

## Lizenz

Dieses Projekt ist unter der MIT-Lizenz lizenziert. Siehe die [LICENSE](LICENSE) Datei für weitere Details.