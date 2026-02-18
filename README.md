# salkin_cleanmlo

Ein nützliches Utility-Script für FiveM, das Ambient-NPCs und Szenarios in MLO-Bereichen unterdrückt. Perfekt geeignet, um zu verhindern, dass NPCs in Custom-Interiors auf unsichtbaren Stühlen sitzen oder durch Wände laufen.

## ✨ Features
*   **Szenario-Blocking:** Verhindert, dass NPCs Standard-GTA-Animationen (wie Anlehnen oder Sitzen) in MLO-Bereichen ausführen.
*   **Ped-Cleaning:** Löscht automatisch alle Peds, die in den definierten Zonen spawnen.
*   **Pfad-Deaktivierung:** Schaltet die Navmesh-Pfade für NPCs aus, damit diese nicht durch das MLO laufen.
*   **Performance:** Extrem optimiert (0.00ms), da der Loop nur alle 5 Sekunden läuft.

## 🛠 Installation
1. Kopiere den Ordner `salkin_cleanmlo` in dein `resources` Verzeichnis.
2. Füge `ensure salkin_cleanmlo` in deine `server.cfg` ein.
3. Trage deine MLO-Koordinaten in der `config.lua` ein.

## 📖 Konfiguration
Einfach die Koordinaten und den gewünschten Radius in der `config.lua` hinzufügen:
```lua
{ coords = vector3(x, y, z), radius = 20.0 }
