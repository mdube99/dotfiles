# Fawzan's dwm
![Screenshot of dwm](https://gitlab.com/fawzakin/dwm/raw/screenshots/dwm.png)
*Wallpaper inspired from [u/atlas-ark](https://reddit.com/u/atlas-ark). The bar is from dwm itself with status2d patch, not from dwmblocks or polybar.*

# Description
dwm is a tilling window manager for X server made by people on ([Suckless](https://suckless.org)). 
It is known for its small size, fast performance, and superb customizability options (by directly editing its source file). 

This my custom build of dwm. Vanilla dwm version 6.2 with many patches that I see fit for my use case.

### Hard Dependencies:
You need these for dwm to run or behave as intended:
+ xorg (xorg-server, libx11, libxinerama, libxft, libxcb-res0, libc6)
+ [st](https://gitlab.com/fawzakin/st) (terminal)
+ [dmenu](https://gitlab.com/fawzakin/dmenu) (run launcher and logout menu)

These are the default fonts. Click on the hyperlink to download and put them in ~/.local/share/fonts
+ Iosevka SS14 Font ([click here to download](https://github.com/be5invis/Iosevka/releases/download/v10.1.0/ttf-iosevka-ss14-10.1.0.zip))
+ My modified Nerd Font ([click here to download](https://gitlab.com/fawzakin/dotfiles/raw/main/fonts/.local/share/fonts/SymbolsNerdFontComplete-2048-em.ttf))
 
### Soft Dependencies:
You can choose not to install the following but you won't be able to use dwm to the fullest:
+ amixer from alsa-utils (for changing volume)
+ lm_sensors (for displaying CPU temperature in statusbar)
+ acpilight (if xorg-xbacklight doesn't work on your machine)
+ [dmscripts](https://gitlab.com/dwt1/dmscripts) ([my fork](https://gitlab.com/fawzadin/dmscripts) is recommended)
+ i3lock (for screen locker)
+ flameshot (for taking screenshots)
+ mpd, mpc, and ncmpcpp (for music player and online radio)
+ mpdris2 and playerctl (for media keys to work beside mpc)
+ lxsession (for running certain GUI application that requires sudo)
+ lxappearance (for changing your system themes)
+ picom (for compositor and prevent screen tearing)
+ xwallpaper (for applying wallpaper)
+ yad and xclip (for displaying and copying window class with `Mod+Insert`)
+ xmodmap and xcape (for rebinding caps lock key)
+ unclutter (for hiding cursor when not needed)

### List of applied patches:
From [dwm website](https://dwm.suckless.org/patches/):
+ actualfullscreen
+ alternativetags
+ alwayscenter
+ attachsideandbellow
+ autostart
+ cfacts (vanitygaps combo)
+ cyclelayouts
+ focusmaster
+ focusonclick
+ focusurgent
+ noborder (floatingfix)
+ pertag
+ restartsig
+ scratchpads
+ status2d (xrdb)
+ swallow
+ systray
+ vanitygaps
+ warp
+ xresources
+ zoomswap

From [bakkeby](https://github.com/bakkeby/patches/tree/master/dwm):
+ focusdir
+ placedir

From [siduck76](https://github.com/siduck76/chadwm):
+ barborder
+ underlinetags

From [Quentin Franchi](https://gitlab.com/dev.quentinfranchi/dwm):
+ [systray icon size](https://gitlab.com/-/snippets/2184056)
 
Patches that were in this build but removed due to better replacement or lack of use:
+ push
+ rotatestack
+ sticky
+ stickyindicator
+ shiftviewclients (by bakkeby)
 
# Installation
Use the following command to only install dwm:

	sudo make clean install

Note that this will overwrite your existing dwm install. It also **won't** install other important programs such as st and dmenu.
Please use my dotfiles installer to automatically install those as well [here](https://gitlab.com/fawzakin/sidost).

You can run dwm using xinitrc if you prefer not using display manager by adding `exec dwm` in your xinitrc.

# Keybinding
Press `Mod+F1` or run `dwmcs` to open a quick cheatsheet of all available keybinds. Some keybinding will be mentioned later in this README.

Note that I use QWE ASD instead of 456 789 for tags (workspaces) because I find them to be much more natural for my fingers. Use `Mod+r` to see alternate tags. 

You can also bind your caps lock to `mod3` with `xmodmap` to get more functionality. Currently, it can be used as an alternative to `shift` key when moving windows to other tag (`Mod+Mod3+Tag`) and to look and move windows to multiple tags (Mod3+Tag and Alt+Mod3+Tag).

# Default app to launch
You can set the following environment variable to launch specific app with a keybind:
| Variable | Description | Default | Keybind |
| --- | --- | --- | --- |
| FM | File Manager | pcmanfm | Mod+m |
| BROWSER | Web Browser | brave | Mod+b |
| APP1 | Any App 1 | none | Mod+z |
| APP2 | Any App 2 | none | mod+x |
| COMP | Compositor | picom | Mod+F2/Mod+F3 |
| PREFTOP | \*top program | htop | Mod+v |
| IMAGE | Image Viewer | sxiv | Mod+PrtSc |

There are only two apps that are hardcoded to config.def.h as I find no better alternative for them. Those are `pulsemixer` (Mod+c) and `ncmpcpp` (Mod+n).

#  Side Programs
Installing dwm with `make` or `install_dwm.sh` will also install the following side programs:
+ `dwmcom`: Run long commands from dwm such as for audio control, logout menu, and more. Check it with `dwmcom -h`
+ `dwmcs`: Generate cheatsheet for all keybindings
+ `dwmstatusbar`: Printout useful information to the bar

Informations printed by `dwmstatusbar`, from left to right:
+ CPU usage in percentage
+ CPU temperature in Celcius. Will show nothing if you haven't installed `lm_sensors` or in a VM
+ RAM usage in USE/MAX
+ Volume in percentage. Its value will change immediately on volume change with the volume key
+ Battery in percentage. Will show nothing if your system doesn't have battery like in a desktop or a VM
+ Date and time. Will use 24 hours format for time

**NOTE:** status2d-xrdb patch adds two additional draw codes. Both of which use colors from Xresources listed in `xcolor` array in `config.def.h`.
- ^C<num>^: The foreground/text color
- ^B<num>^: The background color
 
**WARNING:** If you accidentally leave one caret (^) between two status2d draw codes, dwm will unknowingly crash.  
For example, running the command below will crash dwm. Note the single caret between 9 and c.
 
	xsetroot -name " ^b#696969^c#1337aa^ Don't run this command ^d^"

Make sure you have all carets written correctly before running any `xsetroot` commands.

# Autostart
This repository includes `autostart.sh` to run the statusbar, necessary programs, and remap caps lock to `mod3`. Put it in ~/dwm, ~/.local/share/dwm, or ~/.dwm. If you want my full `autostart.sh`, head over to my [dotfiles repo](https://gitlab.com/fawzakin/dotfiles).
# Xresources Values
The build now supports Xresources. The value are the following:
+ `borderpx`: Thickness of border [int]
+ `barpadpx`: Thickness of bar padding from all sides [int]
+ `snap`: The pixel from screen edge where the window would "snap" into when being moved [int]
+ `smartgaps`: No gaps when there's only one window on a view [0/1]
+ `showbar`: Show statusbar [0/1]
+ `showsystray`: Show system tray [0/1]
+ `topbar`: Put statusbar on top of screen [0/1]
+ `ulall`: Give every tag icon a underline [0/1]
+ `ulpad`: Horizontal padding between the underline and tag [int]
+ `ulstroke`: Thickness or height of the underline [int]
+ `ulvoffset`: Underline offset from the bottom [int]
+ `font`: Statusbar Font. [fontname:size=int]
+ `acc` : Accent color. Used for selected tags and time display [#colorhex]
+ `hgl` : Highlight color. Used for clock icon [#colorhex]
+ `fgr` : Foreground color. Used for any text on bar [#colorhex]
+ `bgr` : Background color. Used for the whole color of the bar.[#colorhex]
+ `dgr` : Dark (back)ground color. Used for any info display besides the time [#colorhex]
+ `mfact`: Witdh of master stack [float]
+ `nmaster`: Number of windows/clients in master stack [int]
+ `resizehints`: Respect size hints in tiled resizals [0/1]

**NOTE:** Putting anything beside the given syntax will crash dwm (especially `font`. You can't add anything beside font name and size without crashing dwm, if you need those, change it in `config.def.h`).

# Todo
Here are a list of things I may do for the future:
+ Update base to version 6.3
+ Fun ricing

# License and Credit
MIT License. 

Credits:
- The Suckless dev team and every patch contributors
- [bakkeby](https://github.com/bakkeby): Provides some more good dwm patches
- [Quentin Franchi](https://gitlab.com/dev.quentinfranchi): Systray icon size patch
- [siduck76](https://github.com/siduck76): Statusbar inspiration
- [u/eProTaLT83](https://reddit.com/u/eProTaLT83): Merges barborder with status2d and underlinetags
- [pystartdust](https://github.com/pystardust): Provides the base of dwmstatusbar (sbar)
