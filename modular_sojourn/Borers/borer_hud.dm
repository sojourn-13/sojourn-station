/datum/hud_data/borer

	equip_slots = list() // Checked by mob_can_equip().
	ProcessHUD = list(
		"health","nutrition","body temperature","pressure","toxin","oxygen","fire","internal","sanity","neural system accumulation",
		"throw","pull","resist","drop","look up","rest", "toggle inventory",
		"move intent","intent","damage zone","craft menu"
	)

	icon              // If set, overrides ui_style.
	//has_a_intent = 1  // Set to draw intent box.
	//has_m_intent = 1  // Set to draw move intent box.
	//has_warnings = 1  // Set to draw environment warnings.
	//has_pressure = 1  // Draw the pressure indicator.
	//has_nutrition = 1 // Draw the nutrition indicator.
	//has_bodytemp = 1  // Draw the bodytemp indicator.
	has_hands = 0     // Set to draw hands.
	//has_drop = 1      // Set to draw drop button.
	//has_throw = 1     // Set to draw throw button.
	//has_resist = 1    // Set to draw resist button.
	has_internals = 1 // Set to draw the internals toggle button.

	gear = list(null)



/datum/hud/borer
	name = "BorerStyle"
	icon = 'icons/mob/screen/ErisStyleHolo.dmi'
	//Xbags, Ybags for space_orient_objs
	//Others for slot_orient_objs
	MinStyleFlag = TRUE
	StorageData = list(
		"Xspace" = 4.5*32, //in pixels
		"Yspace" = 1.5*32, //in pixels
		"ColCount" = 7,
	)


	HUDoverlays = list(
		"flash"      = list("type" = /obj/screen/full_1_tile_overlay, "loc" = "WEST,SOUTH-1 to EAST+1,NORTH", "minloc" = "WEST,SOUTH to EAST,NORTH", "icon_state" = "blank"),
		"pain"       = list("type" = /obj/screen/full_1_tile_overlay, "loc" = "WEST,SOUTH-1 to EAST+1,NORTH", "minloc" = "WEST,SOUTH to EAST,NORTH", "icon_state" = "blank"),
		"drugeffect" = list("type" = /obj/screen/drugoverlay,         "loc" = "WEST,SOUTH-1 to EAST+1,NORTH", "minloc" = "WEST,SOUTH to EAST,NORTH", "icon_state" = "blank"),

		"damageoverlay"  = list("type" = /obj/screen/damageoverlay,   "loc" = "1,1:-32", "icon" =  'icons/mob/screen1_full.dmi'),
		"glassesoverlay" = list("type" = /obj/screen/glasses_overlay, "loc" = "1,1:-32", "icon_state" = "blank"),
	)

	HUDneed = list(
//status
	"nutrition"          = list("type" = /obj/screen/nutrition/parasite,         "loc" = "EAST+1:1,BOTTOM+3:25",   "minloc" = "RIGHT:1,5:26",  "background" = "back17"),
	"neural system accumulation" = list("type" = /obj/screen/nsa,       "loc" = "EAST+1:1,BOTTOM+4:6",    "minloc" = "RIGHT:1,6:7",   "background" = "back17"),
	"body temperature"   = list("type" = /obj/screen/bodytemp,          "loc" = "EAST+1:1,BOTTOM+4:19",   "minloc" = "RIGHT:1,6:20",  "background" = "back17"),
	"health"             = list("type" = /obj/screen/health,            "loc" = "EAST+1,BOTTOM+5",        "minloc" = "RIGHT,7",       "background" = "back1"),
	"sanity"             = list("type" = /obj/screen/sanity,            "loc" = "EAST+1,BOTTOM+6",        "minloc" = "RIGHT,8:-2",    "background" = "back1"),
	"oxygen"             = list("type" = /obj/screen/oxygen,            "loc" = "EAST+1:1,BOTTOM+7",      "minloc" = "RIGHT:1,9:-3",  "background" = "back18"),
	"fire"               = list("type" = /obj/screen/fire,              "loc" = "EAST+1:16,BOTTOM+7",     "minloc" = "RIGHT:16,9:-3", "background" = "back18"),
	"pressure"           = list("type" = /obj/screen/pressure,          "loc" = "EAST+1:1,BOTTOM+7:15",   "minloc" = "RIGHT:1,9:12",  "background" = "back18"),
	"toxin"              = list("type" = /obj/screen/toxin,             "loc" = "EAST+1:16,BOTTOM+7:15",  "minloc" = "RIGHT:16,9:12", "background" = "back18"),
	"internal"           = list("type" = /obj/screen/internal,          "loc" = "EAST+1,BOTTOM+8:-2",     "minloc" = "RIGHT,10:-5",   "background" = "back15"),
//corner buttons
	"jump"               = list("type" = /obj/screen/jump,              "loc" = "EAST+1,BOTTOM+1:-6", "minloc" = "RIGHT,3:-6",   "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"look up"            = list("type" = /obj/screen/look_up,           "loc" = "EAST,BOTTOM+1:13",   "minloc" = "RIGHT-1,2:13", "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"throw"              = list("type" = /obj/screen/HUDthrow,          "loc" = "EAST+1,BOTTOM+1:13", "minloc" = "RIGHT,2:13",   "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"pull"               = list("type" = /obj/screen/pull,              "loc" = "EAST-1,BOTTOM+1:13", "minloc" = "RIGHT-2,2:13", "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"drop"               = list("type" = /obj/screen/drop,              "loc" = "EAST+1,BOTTOM+1",    "minloc" = "RIGHT,2",      "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"resist"             = list("type" = /obj/screen/resist,            "loc" = "EAST-1,BOTTOM+1",    "minloc" = "RIGHT-2,2",    "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"rest"               = list("type" = /obj/screen/rest,              "loc" = "EAST,BOTTOM+1",      "minloc" = "RIGHT-1,2",    "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"move intent"        = list("type" = /obj/screen/mov_intent,        "loc" = "EAST,BOTTOM",        "minloc" = "RIGHT-1,1",    "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back1"),
	"implant bionics"    = list("type" = /obj/screen/implant_bionics,   "loc" = "EAST-2,BOTTOM-1",    "minloc" = "12,1",         "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back13"),
	"craft menu"         = list("type" = /obj/screen/craft_menu,        "loc" = "EAST-2:16,BOTTOM",   "minloc" = "12:16,1",      "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back13"),
	"wield"              = list("type" = /obj/screen/wield,             "loc" = "EAST-2:16,BOTTOM+1", "minloc" = "12:16,2",      "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back13"),
	"intent"             = list("type" = /obj/screen/intent,            "loc" = "EAST-1,BOTTOM",      "minloc" = "13,1",         "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back1"),
	"damage zone"        = list("type" = /obj/screen/zone_sel,          "loc" = "EAST+1,BOTTOM",      "minloc" = "RIGHT,1",      "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back1"),
//hand buttons
	"equip"              = list("type" = /obj/screen/equip,             "loc" = "8,1",                "minloc" = "7,2",          "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back14-l"),
	"swap hand"          = list("type" = /obj/screen/swap,              "loc" = "8,1",                "minloc" = "7,2",          "hideflag" = TOGGLE_BOTTOM_FLAG),
	"right arm bionics"  = list("type" = /obj/screen/bionics/r_arm,     "loc" = "7:19,1",             "minloc" = "6:20,2",       "background" = "back16"),
	"left arm bionics"   = list("type" = /obj/screen/bionics/l_arm,     "loc" = "10,1",               "minloc" = "9:-1,2",       "background" = "back16"),

	"toggle inventory"    = list("type" = /obj/screen/toggle_invetory,   "loc" = "2,0",                "minloc" = "1,1",          "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back1")

	)

	slot_data = list (null
//		"Uniform" =   list("loc" = "2,1", "minloc" = "1,2",           "state" = "center",  "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1"),
//		"Suit" =   list("loc" = "3,1", "minloc" = "2,2",              "state" = "equip",   "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1"),
//		"Mask" =         list("loc" = "3,2", "minloc" = "2,3",        "state" = "mask",    "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1"),
//		"Gloves" =       list("loc" = "4,1", "minloc" = "3,2",        "state" = "gloves",  "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1"),
//		"Glasses" =         list("loc" = "2,2", "minloc" = "1,3",     "state" = "glasses", "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1"),
//		"Left Ear" =        list("loc" = "4,2", "minloc" = "3,3",     "state" = "ears0",   "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1"),
//		"Right Ear" =        list("loc" = "4,3", "minloc" = "3,4",    "state" = "ears1",   "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1"),
//		"Hat" =         list("loc" = "3,3", "minloc" = "2,4",         "state" = "hair",    "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1"),
//		"Shoes" =        list("loc" = "3,0", "minloc" = "2,1",        "state" = "shoes",   "hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1"),
//		"Suit Storage" = list("loc" = "4,0", "minloc" = "3,1",        "state" = "suit-belt","hideflag" = TOGGLE_BOTTOM_FLAG,   "background" = "back1"),
//		"Back" =         list("loc" = "7,0", "minloc" = "6,1",        "state" = "back",    "hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1"),
//		"ID" =           list("loc" = "5,0", "minloc" = "4,1",        "state" = "id",      "hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1"),
//		"Left Pocket" =     list("loc" = "10,0", "minloc" = "9,1",    "state" = "pocket_l","hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1"),
//		"Right Pocket" =     list("loc" = "11,0", "minloc" = "10,1",  "state" = "pocket_r","hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1"),
//		"Belt" =         list("loc" = "6,0", "minloc" = "5,1",        "state" = "belt",    "hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1"),
//		"Left Hand" =       list("loc" = "9,0", "minloc" = "8,1",     "state" = "hand-l",  "hideflag" = TOGGLE_BOTTOM_FLAG, "type" = /obj/screen/inventory/hand, "background" = "back1"),
//		"Right Hand" =       list("loc" = "8,0", "minloc" = "7,1",    "state" = "hand-r",  "hideflag" = TOGGLE_BOTTOM_FLAG, "type" = /obj/screen/inventory/hand, "background" = "back1")
		)

	HUDfrippery = list(
		list("loc" = "1,0", "icon_state" = "frame0-3", "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "1,0", "icon_state" = "frame3-4", "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "1,1", "icon_state" = "frame2-2",  "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "1,2", "icon_state" = "frame2-3",  "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "1,3", "icon_state" = "frame2-1",  "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "1,1", "icon_state" = "frame1-3", "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "1,2", "icon_state" = "frame1-7",  "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "1,3", "icon_state" = "frame1-5",  "hideflag" = TOGGLE_INVENTORY_FLAG),
//		list("loc" = "5,1", "icon_state" = "frame1-2",  "hideflag" = TOGGLE_INVENTORY_FLAG),
//		list("loc" = "5,2", "icon_state" = "frame1-6",  "hideflag" = TOGGLE_INVENTORY_FLAG),
//		list("loc" = "5,3", "icon_state" = "frame1-4", "hideflag" = TOGGLE_INVENTORY_FLAG),
//		list("loc" = "8,1:13", "icon_state" = "frame1-8", "hideflag" = TOGGLE_BOTTOM_FLAG),
//		list("loc" = "9,1:13", "icon_state" = "frame1-1", "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "12,0", "icon_state" = "frame3-2", "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "12,0", "icon_state" = "frame0-2", "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "12,0", "icon_state" = "frame0-3", "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "EAST+1,BOTTOM+2:25", "icon_state" = "frame1-1"),
		list("loc" = "EAST+1,BOTTOM+2:25", "icon_state" = "frame3-3"),
		list("loc" = "EAST+1,BOTTOM+2:25", "icon_state" = "frame0-4"),
		list("loc" = "EAST+1,BOTTOM+8:14", "icon_state" = "frame0-1"),
		list("loc" = "EAST+1,BOTTOM+8:14", "icon_state" = "frame3-1")
		)
//		list("loc" = "2,3", "icon_state" = "block",  "hideflag" = TOGGLE_INVENTORY_FLAG),


/datum/hud/borer/New()
	..()
	IconUnderlays = list(
		"back0" = new /image(src.icon, "t0"),
		"back1" = new /image(src.icon, "t1"),
		"back2" = new /image(src.icon, "t2"),
		"back3" = new /image(src.icon, "t3"),
		"back4" = new /image(src.icon, "t4"),
		"back5" = new /image(src.icon, "t5"),
		"back6" = new /image(src.icon, "t6"),
		"back7" = new /image(src.icon, "t7"),
		"back8" = new /image(src.icon, "t8"),
		"back9" = new /image(src.icon, "t9"),
		"back10" = new /image(src.icon, "t10"),
		"back11" = new /image(src.icon, "t11"),
		"back12" = new /image(src.icon, "t12"),
		"back13" = new /image(src.icon, "t13"),
		"back14-l" = new /image(src.icon, "t14-l"),
		"back14-m" = new /image(src.icon, "t14-m"),
		"back14-r" = new /image(src.icon, "t14-r"),
		"back15" = new /image(src.icon, "t15"),
		"back16" = new /image(src.icon, "t16"),
		"back17" = new /image(src.icon, "t17"),
		"back17-1" = new /image(src.icon, "t17-1"),
		"back18" = new /image(src.icon, "t18"),
	)

	for (var/p in IconUnderlays)
		var/image/I = IconUnderlays[p]
		I.alpha = 200
