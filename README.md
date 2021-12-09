# Dotfiles


## Programs included in the config


| Program          | Description                                              |
|------------------|----------------------------------------------------------|
| dwm              | Tiling Window Manager                                    |
| st               | Suckless Terminal                                        |
| exa              | ls alternative with colors and icons                     |
| feh              | for viewing images and setting background                |
| betterlockscreen | Lockscreen on sleep requires i3lock                      |
| polkit-gnome     | for getting authentication for non terminal applications |
| nm-applet        | Network manager applet                                   |
| autorandr        | Xrandr profiles that can be set on boot                  |
| dunst            | Notifications                                            |
| dmenu            | launcher                                                 |
| neovim           | Text editor - I use lunarvim                             |
| zsh              | Bash Alternative                                         |
| tmux             | not really used anymore                                  |
| picom            | ibhagwan fork for rounded corners                        |
| redshift         | Flux alternative                                         |
| lxappearance     | For editing cursor, font, GTK applications               |
| pavucontrol      | For controlling pulseaudio                               |
| flameshot        | screenshots                                              |


## DWM

My DWM build is heavily based off of [Chadwm by Siduck76](https://github.com/siduck/chadwm), with additional patches such as sticky, columns, and scratchpad.

#### Setup

* Put the .dwm folder in ~/
* chmod +x all scripts in .dwm folder
* copy the stuff from fonts folder to your ~/.local/share/fonts ( this is for material design icon font )
* cd into chadwm and sudo make install
* autostart file is just an example one so it must be adjusted for your liking!

* Run autostart file from .xinitrc or
* Create desktop entry as follows:

```bash
touch /usr/share/xsessions/dwm.desktop  
```

```bash
[Desktop Entry]
Name=dwm
Comment=Dynamic Window Manager
Exec= <path to autostart file> 
Type=Application 
```

#### Patches

| Patch           |
|-----------------|
| barpadding      |
| bottomstack     |
| cfacts          |
| dragmfact       |
| dragcfact       |
| fibonacii       |
| gaplessgrid     |
| horizgrid       |
| movestack       |
| vanity          |
| colorful        |
| statuspadding   |
| status2d        |
| underline tags  |
| notitle         |
| sticky          |
| stickyindicator |
| columns         |
| columngaps      |
| scratchpad      |

## ST - Suckless Terminal

I use [Siduck's suckless terminal build](https://github.com/siduck/st), as its pretty much exactly what I would do if I built my own. 


## dmenu

#### Patches

| Patch     |
|-----------|
| border    |
| grid      |
| center    |
| highlight |

## Fonts

* JetBrainsMono NerdFont
* Material Design font


### If vim-instant-markdown isn't working:

Make sure that instant-markdown-d is installed using
    npm -g install instant-markdown-d
