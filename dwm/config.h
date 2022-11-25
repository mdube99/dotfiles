/* Fawzan's build of dwm */

/* Appearance */
/* These variables can be edited with Xresource. */
static       unsigned int borderpx  = 3;    /* border pixel of windows */
static       unsigned int barpadpx  = 3;    /* padding pixel of bar */
static       unsigned int snap      = 10;   /* snap pixel when dragging floating windows to the edge of the screen */
static       int smartgaps          = 1;    /* 1 means no outer gap when there is only one window */
static       int showbar            = 1;    /* 0 means no bar */
static       int showsystray        = 1;    /* 0 means no systray */
static       int topbar             = 0;    /* 0 means bottom bar */
static       unsigned int ulall     = 0;    /* 1 to show underline on all tags, 0 for just the active ones */
static       unsigned int ulpad	    = 2;    /* horizontal padding between the underline and tag */
static       unsigned int ulstroke  = 3;    /* thickness / height of the underline */
static       unsigned int ulvoffset = 24;   /* how far above the bottom of the bar the line should appear */
static       char font[]            = "JetBrainsMono Nerd Font:style:medium:size=12";   /* Main font */
static       char fonticon[]        = "Material Design Icons-Regular:size=12";     /* Icon Font */

/* Constant variables cannot be edited with Xresource. 
 * Don't bother enabling them in ResourcePref */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static const unsigned int systrayiconsize = 28;/* systray icon size in px */
static const unsigned int systraypinning = 0;  /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 0;  /* systray spacing */
static const int systraypinningfailfirst = 1;  /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int swallowfloating    = 0;       /* 1 means swallow floating windows by default */
static const int focusonwheel       = 1;       /* 0: Focus by click, 1: Focus by moving the cursor to a window */
static const char *fonts[]          = { font, fonticon };

/* Default color scheme is Matcha-dark-alice */
static       char acc[]             = "#7aa2f7";    /* Accent */
static       char hgl[]             = "#668ee3";    /* Highlight */
static       char fgr[]             = "#d7d7d7";    /* Foreground */
static       char bgr[]             = "#262626";    /* Background */
static       char lgr[]             = "#323232";    /* Lighter Background */
static       char dgr[]             = "#1a1a1a";    /* Darker Background */
static       char *xcolor[]         = { acc, hgl, fgr, bgr, dgr, lgr };
static const char *colors[][3]      = {
	/*               fg   bg   border   */
	[SchemeNorm] = { fgr, bgr, bgr},
	[SchemeSel]  = { acc, lgr, acc},
};


/* Tagging */

static const char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};
static const char *tagsalt[] = {" ", " ", " ", " ", " ", "", "", ""};

/* Scratchpads */
typedef struct {
	const char *name;
	const void *cmd;
} Sp;

const char *spcmd0[] = {"st", "-n", "spterm", "-g", "120x30", NULL };
const char *spcmd1[] = {"st", "-n", "sptop", "-g", "120x30", "-e", "dwmcom", "-v", NULL };  
const char *spcmd2[] = {"st", "-n", "spvol", "-g", "120x30", "-e", "pulsemixer", NULL };  
const char *spcmd3[] = {"st", "-n", "spmus", "-g", "120x30", "-e", "ncmpcpp", NULL };
const char *spcmd4[] = {"st", "-n", "spcs", "-g", "120x30", "-t", "Cheatsheet", "-e", "dwmcs", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd0},
	{"sptop",       spcmd1},
	{"spvol",       spcmd2},
	{"spmus", 	spcmd3},
	{"spcs",        spcmd4},
};

/* Window Rules */
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class     	   instance  title           tags mask  isfloating  isterminal  noswallow  monitor */
	{ "Brave-browser", NULL,     NULL,     	     1 << 8,    0,          0,          -1,        -1 },
	{ "Firefox", 	     NULL,     NULL,           1 << 8,    0,          0,          -1,        -1 },
  { "Galculator",    NULL,     NULL,           0,         1,          0,          0,         -1 },
  { "Qalculate-gtk", NULL,     NULL,           0,         1,          0,          0,         -1 },
	{ "zoom",          NULL,     NULL,           1 << 6,    1,          0,          0,         -1 }, /* I have to give in. I am sorry */
	{ "st-256color",   NULL,     NULL,           0 << 8,    0,	    1,	        0, 	   -1 },
  { "DesktopEditors",          NULL,   NULL,   1 << 4,    0,          0,          0,         -1 },
  { "Lxsession-default-apps",  NULL,   NULL,   0,         1,          0,          0,         -1 },
  { "gnome-calculator",  NULL,   NULL,   0,         1,          0,          0,         -1 },
  { "discord",      NULL,   NULL,              1 << 2,         0,          0,          0,         -1 },
  { "obsidian",      NULL,   NULL,              1 << 1,         0,          0,          0,         -1 },
  { NULL,  "spssh",   NULL,   1,         1,          1,          0,         -1 },
	{ NULL,	       "spterm",     NULL,           SPTAG(0),  1,          1,          0,         -1 },
	{ NULL,	        "sptop",     NULL,           SPTAG(1),  1,          0,          0,         -1 },
	{ NULL,	        "spvol",     NULL,           SPTAG(2),  1,          0,          0,         -1 },
	{ NULL,	     	"spmus",     NULL,           SPTAG(3),  1,          0,          0,         -1 },
	{ NULL,	    	 "spcs",     NULL,           SPTAG(4),  1,          1,          1,         -1 },
  { NULL,	    "noswallow",     NULL,           0,         0,          1,          1,         -1 },
	{ NULL,      	   NULL,     "Event Tester", 0,         1,          0,          1,         -1 }, /* xev */
};

/* Layouts */
static       float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static       int nmaster     = 1;    /* number of clients in master area */
static       int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#include "layouts.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]≡",      tile },    /* first entry is default */
	{ "|M|",      centeredmaster },
	{ "(M)",      monocle },
	{ "(~)",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* Key Definitions */
#define MODKEY Mod4Mask
#define CAPKEY Mod3Mask
#define ALTKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|CAPKEY,                KEY,      tag,            {.ui = 1 << TAG} }, \
 	{ CAPKEY,                       KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ CAPKEY|ALTKEY,                KEY,      toggletag,      {.ui = 1 << TAG} },

/* Helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* Menu commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-c", "-g", "2", "-l", "20", "-p", " ", NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *termaltcmd[]  = { "st", "-c", "noswallow", "-t", "st (no swallow)", NULL };
static const char *filecmd[]  = { "dwmcom", "-m", NULL };
static const char *browsercmd[] = { "dwmcom", "-b", NULL };
static const char *apponecmd[] = {"dwmcom", "-1", NULL};
static const char *apptwocmd[] = {"dwmcom", "-2", NULL};
static const char *mute[] =  { "bash", "/home/mdube-manjaro/dotfiles/scripts/volume-toggle", NULL };

/* Xresources preferences to load at startup */
ResourcePref resources[] = {
		{ "borderpx",          	INTEGER, &borderpx },
		{ "barpadpx",          	INTEGER, &barpadpx },
		{ "snap",               INTEGER, &snap },
		{ "smartgaps",          INTEGER, &smartgaps },
		{ "showbar",          	INTEGER, &showbar },
		{ "showsystray",        INTEGER, &showsystray },
		{ "topbar",          	  INTEGER, &topbar },
		{ "ulall",              INTEGER, &ulall },
		{ "ulpad",              INTEGER, &ulpad },
		{ "ulstroke",           INTEGER, &ulstroke },
		{ "ulvoffset",          INTEGER, &ulvoffset },
		{ "font",               STRING,  &font },
    { "acc",                STRING,  &acc },
		{ "hgl",                STRING,  &hgl },
		{ "fgr",                STRING,  &fgr },
		{ "bgr",                STRING,  &bgr },
		{ "dgr",                STRING,  &dgr },
		{ "mfact",      	FLOAT,   &mfact },
    { "nmaster",          	INTEGER, &nmaster },
		{ "resizehints",       	INTEGER, &resizehints },
};

#include <X11/XF86keysym.h>

/* Press Mod+F1 to see quick cheatsheet */
/* FORMAT: modifier, key, function, argument */
static Key keys[] = {
	/* STARTKEY: Do not delete this comment line */
   	// =================
   	// ## dwm General ##
   	// =================
  { MODKEY|ShiftMask,                  XK_Escape, spawn,          SHCMD("dwmcom -r") }, // Restart
	{ MODKEY,                            XK_r, togglealttag,   {0} },
	{ MODKEY,                            XK_t, togglebar,      {0} },
  { 0|ControlMask|ALTKEY,         XK_Delete, spawn,          SHCMD("bash /home/mdube-manjaro/development/scripts/dm-kill") },
  { ALTKEY,                       XK_b,      spawn,          SHCMD("bash /home/mdube-manjaro/development/scripts/bg-dm") },
  { ALTKEY,                       XK_s,      spawn,          SHCMD("bash /home/mdube-manjaro/development/scripts/sshmenu") },
  { ALTKEY,                       XK_f,      spawn,          SHCMD("bash /home/mdube-manjaro/development/scripts/flux") },


   	// ======================
   	// ## Layout Switching ##
   	// ======================
	{ MODKEY|ShiftMask,                  XK_t, setlayout,      {.v = &layouts[0]} }, // Tile
	{ MODKEY|ShiftMask,                  XK_r, setlayout,      {.v = &layouts[1]} }, // CMaster
  { MODKEY|ShiftMask,                  XK_g, setlayout,      {.v = &layouts[2]} }, // Mono
	{ MODKEY|ShiftMask,                  XK_f, setlayout,      {.v = &layouts[3]} }, // Float


	{ MODKEY,                            XK_0, view,           {.ui = ~0  } },
	{ ALTKEY,                            XK_1, setlayout,      {.v = &layouts[0]} }, // Tile
	{ ALTKEY,                            XK_2, setlayout,      {.v = &layouts[1]} }, // CMaster
  { ALTKEY,                            XK_3, setlayout,      {.v = &layouts[2]} }, // Mono
	{ ALTKEY,                            XK_4, setlayout,      {.v = &layouts[3]} }, // Float

	{ MODKEY|ShiftMask,	     XK_semicolon, cyclelayout,    {.i = -1 } },
	{ MODKEY|ShiftMask,	    XK_apostrophe, cyclelayout,    {.i = +1 } },

   	// ============================
   	// ## Client Focus/Placement ##
   	// ============================
 //  { MODKEY,                            XK_h, focusdir,       {.i = 0 } }, // left
	// { MODKEY,                            XK_j, focusdir,       {.i = 3 } }, // down
	// { MODKEY,                            XK_k, focusdir,       {.i = 2 } }, // up
	// { MODKEY,                            XK_l, focusdir,       {.i = 1 } }, // right
	// { MODKEY|ShiftMask,                  XK_h, placedir,       {.i = 0 } }, 
	// { MODKEY|ShiftMask,                  XK_l, placedir,       {.i = 1 } },
	// { MODKEY|ShiftMask,                  XK_k, placedir,       {.i = 2 } },
	// { MODKEY|ShiftMask,                  XK_j, placedir,       {.i = 3 } },

    { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },    // old rice
    { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },    // old rice
    { MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },    // old rice
    { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },    // old rice
    { MODKEY|ShiftMask,             XK_h,      setcfact,       {.f = +0.25} },    // old rice
    { MODKEY|ShiftMask,             XK_l,      setcfact,       {.f = -0.25} },    // old rice
    { MODKEY|ShiftMask,             XK_j,      restack,      {.i = +0.5 } },      // old rice
    { MODKEY|ShiftMask,             XK_k,      restack,      {.i = -0.5 } },      // old rice

	{ MODKEY|ControlMask,                XK_k, focusstack,     {.i = -1 } },
	{ MODKEY|ControlMask,                XK_j, focusstack,     {.i = +1 } },
	{ MODKEY,           	               XK_o, focusmaster,    {0} },
	{ MODKEY|ShiftMask,                  XK_o, zoom,           {0} },
  { ALTKEY,                            XK_space,  zoom,           {0} },
	{ MODKEY|ControlMask,                XK_o, focusurgent,    {0} },

	// ====================
   	// ## Client Control ##
   	// ====================
	{ MODKEY|ControlMask,                XK_h, setmfact,       {.f = -0.05} },
  { MODKEY|ControlMask,                XK_l, setmfact,       {.f = +0.05} },
	{ MODKEY,                            XK_y, setcfact,       {.f =  0.00} },
	{ MODKEY,                            XK_u, setcfact,       {.f = -0.25} },
	{ MODKEY,                            XK_i, setcfact,       {.f = +0.25} },
	{ MODKEY,                    XK_semicolon, incnmaster,     {.i = -1 } },
	{ MODKEY,                   XK_apostrophe, incnmaster,     {.i = +1 } },
	{ MODKEY,         	             XK_space, togglefloating, {0} },
	{ MODKEY,		                    XK_f, togglefullscr,  {0} },
	{ MODKEY,                          XK_Tab, view,           {0} },
	{ ALTKEY,                          XK_Tab, view,           {0} }, // Alt binding
	{ MODKEY,                        XK_q, killclient,     {0} },
        
   	// =================
   	// ## Vanity Gaps ##
   	// =================
 	{ MODKEY,              		     XK_p, togglegaps,     {0} },
	{ MODKEY|ShiftMask,    		     XK_p, defaultgaps,    {0} },
	{ MODKEY,    	           XK_bracketleft, incrgaps,       {.i = -1 } },
	{ MODKEY,                 XK_bracketright, incrgaps,       {.i = +1 } },
	{ MODKEY|ShiftMask,        XK_bracketleft, incrgaps,       {.i = -5 } },
	{ MODKEY|ShiftMask,       XK_bracketright, incrgaps,       {.i = +5 } },        

   	// =======================
	// ## Monitor Switching ##
   	// =======================
	{ MODKEY,                        XK_comma,  focusmon,       {.i = +1 } },
	{ MODKEY,                        XK_period, focusmon,       {.i = -1 } },
	{ MODKEY|ShiftMask,              XK_comma, tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = -1 } },

   	// =======================
	// ## Program Launchers ##
   	// =======================
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termaltcmd } },
	{ MODKEY,                        XK_d,     spawn,          {.v = dmenucmd } },
 	{ MODKEY,                            XK_z, spawn,          {.v = apponecmd } },   	
 	{ MODKEY,                            XK_x, spawn,          {.v = apptwocmd } },   	
  { MODKEY,                            XK_b, spawn,          {.v = browsercmd } },
  { MODKEY,                            XK_m, spawn,          {.v = filecmd } },
	{ MODKEY,                       XK_Escape, spawn,          SHCMD("dwmcom -l") },
	{ MODKEY,		        XK_Insert, spawn,          SHCMD("dwmcom -n") }, // Class find
	{ MODKEY,		     XK_BackSpace, spawn,      	   SHCMD("dm-websearch") }, // Brave
	{ MODKEY,	                 XK_equal, spawn,          SHCMD("dm-translate") }, // To Clipboard 
	{ MODKEY,		         XK_minus, spawn,          SHCMD("dm-confedit") },
	{ MODKEY,		             XK_0, spawn,          SHCMD("dm-note") },
	{ MODKEY,		             XK_9, spawn,          SHCMD("dm-colpick") },
	{ MODKEY,		             XK_8, spawn,          SHCMD("passmenu-notify -l 10 -p Pass:") },
	{ MODKEY,        	            XK_F2, spawn,          SHCMD("dwmcom -c") }, // stop comp 
	{ MODKEY,        	            XK_F3, spawn,          SHCMD("dwmcom -p") }, // restart comp 
	{ MODKEY,		            XK_F4, spawn,          SHCMD("dm-kill") },
	{ MODKEY,		           XK_F11, spawn,          SHCMD("macros-toggle") }, // Krita 
	{ MODKEY,		           XK_F12, spawn,          SHCMD("huionside") }, // H640P

   	// ========================
	// ## Scratchpad Toggles ##
   	// ========================
	{ MODKEY,                         XK_grave, togglescratch,  {.ui = 0 } }, // term 
	{ MODKEY,			                    XK_v, togglescratch,  {.ui = 1 } }, // *top
	{ MODKEY, 	                      XK_c, togglescratch,  {.ui = 2 } }, // pulsemixer
	{ MODKEY,            	            XK_n, togglescratch,  {.ui = 3 } }, // ncmpcpp
	{ MODKEY,        	                XK_F1, togglescratch,  {.ui = 4 } }, // cheatsheet  

   	// =========================
    // ## Multimedia Keybinds ##
   	// =========================
	{ 0,                       	 XK_Print, spawn,          SHCMD("flameshot gui") },
	{ ControlMask,            	 XK_Print, spawn,          SHCMD("flameshot full -c") },
	{ MODKEY,            	         XK_Print, spawn,          SHCMD("dwmcom -f") }, // Open last SC
	{ 0,              XF86XK_AudioRaiseVolume, spawn,          SHCMD("dwmcom -i") }, // Inc. vol
	{ 0,              XF86XK_AudioLowerVolume, spawn,          SHCMD("dwmcom -d") }, // Dec. vol
	{ 0,                     XF86XK_AudioMute, spawn,          SHCMD("dwmcom -t") }, // Mute
	{ 0,               XF86XK_MonBrightnessUp, spawn,          SHCMD("light -A 5") },
	{ 0,             XF86XK_MonBrightnessDown, spawn,          SHCMD("light -U 5") },
	{ 0,                   XF86XK_ScreenSaver, spawn,          SHCMD("$HOME/.local/bin/i3lock-auto") },
	{ 0,                     XF86XK_AudioPlay, spawn,          SHCMD("playerctl play-pause || mpc toggle") },
	{ MODKEY,                            XK_4, spawn,          SHCMD("playerctl play-pause || mpc toggle") },
	{ 0,                     XF86XK_AudioStop, spawn,          SHCMD("playerctl stop || mpc stop") },
	{ MODKEY,                            XK_5, spawn,          SHCMD("playerctl stop || mpc stop") },
	{ 0,                     XF86XK_AudioPrev, spawn,          SHCMD("playerctl previous || mpc prev") },
	{ MODKEY,                            XK_6, spawn,          SHCMD("playerctl previous || mpc prev") },
	{ 0,                     XF86XK_AudioNext, spawn,          SHCMD("playerctl next || mpc next") },
	{ MODKEY,                            XK_7, spawn,          SHCMD("playerctl next || mpc next") },

   	// ================
	// ## Tag Labels ##
   	// ================
	TAGKEYS(                             XK_1, 		   0)
	TAGKEYS(                             XK_2, 		   1)
	TAGKEYS(                             XK_3, 		   2)
	TAGKEYS(                             XK_4, 		   3)
	TAGKEYS(                             XK_5, 		   4)
	TAGKEYS(                             XK_6, 		   5)
	TAGKEYS(                             XK_7, 		   6)
	TAGKEYS(                             XK_8, 		   7)
	TAGKEYS(                             XK_9, 		   8)

	/* ENDKEY: Do not delete this comment line */
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        cyclelayout,    {.i = +1 } },
	{ ClkLtSymbol,          0,              Button2,        setlayout,      {.v = &layouts[4]} },
	{ ClkLtSymbol,          0,              Button3,        cyclelayout,    {.i = -1 } },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	//{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

