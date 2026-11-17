#!/bin/bash
# Launcher para R36S (ArkOS / dArkOS / ROCKNIX / JELOS). Copiar a /roms/ports/ (o ports de tu SD)
# junto con la carpeta ScratchEverywhere/.
XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ -d "/opt/system/Tools/PortMaster/" ]; then controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then controlfolder="/opt/tools/PortMaster"
elif [ -d "$XDG_DATA_HOME/PortMaster/" ]; then controlfolder="$XDG_DATA_HOME/PortMaster"
else controlfolder="/roms/ports/PortMaster"; fi
[ -f "$controlfolder/control.txt" ] && source "$controlfolder/control.txt"

GAMEDIR="$(cd "$(dirname "$0")" && pwd)/ScratchEverywhere"
cd "$GAMEDIR" || exit 1
mkdir -p scratch-everywhere
exec > "$GAMEDIR/log.txt" 2>&1

export SDL_VIDEODRIVER=${SDL_VIDEODRIVER:-kmsdrm}
export SE_FULLSCREEN=1
export SE_GAMEPAD_MOUSE=1        # stick derecho = mouse, R2 clic izq., R3 clic der.
export HOME="$GAMEDIR"            # config y datos quedan junto al port
[ -n "$sdl_controllerconfig" ] && export SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig"
[ -f "$controlfolder/gamecontrollerdb.txt" ] && export SDL_GAMECONTROLLERCONFIG_FILE="$controlfolder/gamecontrollerdb.txt"

chmod +x ./scratch-r36s
./scratch-r36s

command -v pm_finish >/dev/null && pm_finish
