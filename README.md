# skunkworks #

This is a repo for DCS keybind mods, etc.

###Paths for custom binds, command references, etc###

Relevant paths are as follows

\Eagle Dynamics\DCS World Open Beta\Mods\aircraft\Input\joystick\default.lua

\Eagle Dynamics\DCS World Open Beta\Mods\aircraft\Input\keyboard\default.lua

\Eagle Dynamics\DCS World Open Beta\Mods\aircraft\Cockpit\Scripts\clickabledata.lua

\Eagle Dynamics\DCS World Open Beta\Mods\aircraft\Cockpit\Scripts\command_refs.lua


###Thrustmaster Target script for Warthog throttle###

Move TMWarthogDX128.tmc to the scripts directory within your Thrustmaster TARGET installation directory

Open TMWarthogDX128 with Thrustmaster TARGET Script Editor

Click Compile

Click run and troubles any errors that appear

Stop the script and close TARGET Script Editor

Create a new desktop shortcut with the following values...

Target: "C:\Program Files (x86)\Thrustmaster\TARGET\x64\TARGETGUI.exe" -r "C:\Program Files (x86)\Thrustmaster\TARGET\s>
Start in: "C:\Program Files (x86)\Thrustmaster\TARGET"

Double clicking this shortcut will run TARGETGUI.exe, in a small window, with the script automatically fired up.
