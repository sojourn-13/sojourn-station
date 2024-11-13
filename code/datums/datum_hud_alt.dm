/datum/hud/human/optimized
	name = "ErisOptimized"
	icon = 'icons/mob/screen/ErisStyleHolo.dmi'
	//Xbags, Ybags for space_orient_objs
	//Others for slot_orient_objs
	MinStyleFlag = TRUE //We *are* the optimized verson
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

	/* !!!! IF YOU WANT TO ADD A VERB TO THIS - ADD ITS NAME TO code\modules\mob\living\carbon\human\species\species_hud.dm
	PLEASE DON'T REPEAT MY MISTAKES, I'VE WASTED HOURS OF MY LIFE ON THIS - Kegdo 2022*/
	HUDneed = list(
//status
	"nutrition"          = list("type" = /obj/screen/nutrition,         "loc" = "EAST+1,4.6",             "background" = "back17"),
	"neural system accumulation" = list("type" = /obj/screen/nsa,       "loc" = "EAST+1,5",               "background" = "back17"),
	"body temperature"   = list("type" = /obj/screen/bodytemp,          "loc" = "EAST+1,5.4",             "background" = "back17"),
	"health"             = list("type" = /obj/screen/health,            "loc" = "EAST+1,5.8",             "background" = "back1"),
	"sanity"             = list("type" = /obj/screen/sanity,            "loc" = "EAST+1,6.8",             "background" = "back1"),
	"oxygen"             = list("type" = /obj/screen/oxygen,            "loc" = "EAST+1:1,7.8",           "background" = "back18"),
	"fire"               = list("type" = /obj/screen/fire,              "loc" = "16.46:1,7.8",            "background" = "back18"),
	"pressure"           = list("type" = /obj/screen/pressure,          "loc" = "16:1,8.27",              "background" = "back18"),
	"toxin"              = list("type" = /obj/screen/toxin,             "loc" = "16.46:1,8.27",           "background" = "back18"),
	"internal"           = list("type" = /obj/screen/internal,          "loc" = "16,8.75",                "background" = "back15"),
//corner buttons
	//"jump"               = list("type" = /obj/screen/jump,              "loc" = "EAST+1,BOTTOM+1:-6", "minloc" = "RIGHT,3:-6",   "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"look up"            = list("type" = /obj/screen/look_up,           "loc" = "16,2.83",            "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"throw"              = list("type" = /obj/screen/HUDthrow,          "loc" = "16,1.35",            "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"pull"               = list("type" = /obj/screen/pull,              "loc" = "16,2.47",            "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"drop"               = list("type" = /obj/screen/drop,              "loc" = "16,0.96",            "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"resist"             = list("type" = /obj/screen/resist,            "loc" = "16,2.1",             "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"rest"               = list("type" = /obj/screen/rest,              "loc" = "16,3.22",            "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"block"              = list("type" = /obj/screen/block,             "loc" = "16,1.71",            "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back17-1"),
	"move intent"        = list("type" = /obj/screen/mov_intent,        "loc" = "EAST,BOTTOM",        "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back1"),
	"implant bionics"    = list("type" = /obj/screen/implant_bionics,   "loc" = "EAST-2,BOTTOM-1",    "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back13"),
	"craft menu"         = list("type" = /obj/screen/craft_menu,        "loc" = "EAST-2:16,BOTTOM",   "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back13"),
	"wield"              = list("type" = /obj/screen/wield,             "loc" = "13,0",               "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back13"),
	"intent"             = list("type" = /obj/screen/intent,            "loc" = "EAST-1,BOTTOM",      "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back1"),
	"damage zone"        = list("type" = /obj/screen/zone_sel,          "loc" = "EAST+1,BOTTOM",      "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back1"),
//hand buttons
	"equip"              = list("type" = /obj/screen/equip,             "loc" = "8,1",                "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back14-l"),
	"swap hand"          = list("type" = /obj/screen/swap,              "loc" = "8,1",                "hideflag" = TOGGLE_BOTTOM_FLAG),
	"right arm bionics"  = list("type" = /obj/screen/bionics/r_arm,     "loc" = "7:19,1",             "background" = "back16"),
	"left arm bionics"   = list("type" = /obj/screen/bionics/l_arm,     "loc" = "10,1",               "background" = "back16"),

	"toggle inventory"    = list("type" = /obj/screen/toggle_invetory,   "loc" = "2,0",               "hideflag" = TOGGLE_BOTTOM_FLAG, "background" = "back1", "minloc" = "16,15"),
	"action palette"      = list("type" = /obj/screen/action_palette,    "loc" = "16,9.25")
	)

	slot_data = list (
		"Uniform" =         list("loc" = "2,1",   "state" = "center",   "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1", "minloc" = "1,0"),
		"Suit" =            list("loc" = "3,1",   "state" = "equip",    "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1", "minloc" = "3,0"),
		"Mask" =            list("loc" = "3,2",   "state" = "mask",     "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1", "minloc" = "12,0"),
		"Gloves" =          list("loc" = "4,1",   "state" = "gloves",   "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1", "minloc" = "16,12"),
		"Glasses" =         list("loc" = "2,2",   "state" = "glasses",  "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1", "minloc" = "16,11"),
		"Left Ear" =        list("loc" = "4,2",   "state" = "ears0",    "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1", "minloc" = "16,14"),
		"Right Ear" =       list("loc" = "4,3",   "state" = "ears1",    "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1", "minloc" = "16,3.6"),
		"Hat" =             list("loc" = "3,3",   "state" = "hair",     "hideflag" = TOGGLE_INVENTORY_FLAG, "background" = "back1", "minloc" = "16,13"),
		"Shoes" =           list("loc" = "3,0",   "state" = "shoes",    "hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1", "minloc" = "2,0"),
		"Suit Storage" =    list("loc" = "4,0",   "state" = "suit-belt","hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1"),
		"Back" =            list("loc" = "5,0",   "state" = "back",     "hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1", "minloc" = "6,0"),
		"ID" =              list("loc" = "11,0",  "state" = "id",       "hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1"),
		"Left Pocket" =     list("loc" = "10,0",  "state" = "pocket_l", "hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1"),
		"Right Pocket" =    list("loc" = "7,0",   "state" = "pocket_r", "hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1"),
		"Belt" =            list("loc" = "6,0",   "state" = "belt",     "hideflag" = TOGGLE_BOTTOM_FLAG,    "background" = "back1", "minloc" = "5,0"),
		"Left Hand" =       list("loc" = "9,0",   "state" = "hand-l",   "hideflag" = TOGGLE_BOTTOM_FLAG,    "type" = /obj/screen/inventory/hand, "background" = "back1"),
		"Right Hand" =      list("loc" = "8,0",   "state" = "hand-r",   "hideflag" = TOGGLE_BOTTOM_FLAG,    "type" = /obj/screen/inventory/hand, "background" = "back1")
		)

	HUDfrippery = list(
		list("loc" = "1,0", "icon_state" = "frame0-3",    "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "1,0", "icon_state" = "frame3-4",    "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "1,1", "icon_state" = "frame2-2",    "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "1,2", "icon_state" = "frame2-3",    "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "1,3", "icon_state" = "frame2-1",    "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "1,1", "icon_state" = "frame1-3",    "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "1,2", "icon_state" = "frame1-7",    "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "1,3", "icon_state" = "frame1-5",    "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "5,1", "icon_state" = "frame1-2",    "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "5,2", "icon_state" = "frame1-6",    "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "5,3", "icon_state" = "frame1-4",    "hideflag" = TOGGLE_INVENTORY_FLAG),
		list("loc" = "8,1:13", "icon_state" = "frame1-8", "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "9,1:13", "icon_state" = "frame1-1", "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "12,0", "icon_state" = "frame3-2",   "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "12,0", "icon_state" = "frame0-2",   "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "12,0", "icon_state" = "frame0-3",   "hideflag" = TOGGLE_BOTTOM_FLAG),
		list("loc" = "EAST+1,3.6", "icon_state" = "frame1-1"),
		list("loc" = "EAST+1,3.6", "icon_state" = "frame3-3"),
		list("loc" = "EAST+1,3.6", "icon_state" = "frame0-4"),
		list("loc" = "16,10", "icon_state" = "frame3-1")
		)
		//list("loc" = "2,3", "icon_state" = "block",  "hideflag" = TOGGLE_INVENTORY_FLAG),


/datum/hud/human/optimized/New()
	..()

/datum/interface/ghost_Eris/optimized
	mobtype = /mob/observer/ghost
	styleName = "ErisOptimized"
