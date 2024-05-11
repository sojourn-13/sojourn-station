//CLOTH RANDOM
/obj/random/cloth/masks
	name = "random mask"
	desc = "This is a random mask."
	icon_state = "armor-grey"

/obj/random/cloth/masks/item_to_spawn()
	return pickweight(list(/obj/item/clothing/mask/balaclava = 15,
				/obj/item/clothing/mask/balaclava/tactical = 20,
				/obj/item/clothing/mask/bandana = 2,
				/obj/item/clothing/mask/bandana/blue = 1,
				/obj/item/clothing/mask/rank/botanist = 1,
				/obj/item/clothing/mask/bandana/camo = 1,
				/obj/item/clothing/mask/bandana/yellow = 1,
				/obj/item/clothing/mask/bandana/green = 1,
				/obj/item/clothing/mask/bandana/orange = 1,
				/obj/item/clothing/mask/bandana/purple = 1,
				/obj/item/clothing/mask/bandana/red = 1,
				/obj/item/clothing/mask/bandana/skull = 1,
				/obj/item/clothing/mask/breath = 20,
				/obj/item/clothing/mask/breath/medical = 5,
				/obj/item/clothing/mask/gas = 20,
				/obj/item/clothing/mask/gas/germanmask = 15,
				/obj/item/clothing/mask/costume/job/clown = 10,
				/obj/item/clothing/mask/costume/job/clown/joker = 10,
				/obj/item/clothing/mask/gas/ihs = 10,
				/obj/item/clothing/mask/gas/tactical = 2,
				/obj/item/clothing/mask/chameleon/voice = 2,
				/obj/item/clothing/mask/costume/job/luchador = 2,
				/obj/item/clothing/mask/costume/job/luchador/rudos = 2,
				/obj/item/clothing/mask/costume/job/luchador/tecnicos = 2,
				/obj/item/clothing/mask/muzzle = 2,
				/obj/item/clothing/mask/surgical = 8))

/obj/random/cloth/masks/low_chance
	name = "low chance random mask"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/armor
	name = "random armor"
	desc = "This is a random armor."
	icon_state = "armor-grey"

/obj/random/cloth/armor/item_to_spawn()
	return pickweight(list(/obj/item/clothing/suit/armor/bulletproof = 10,
				/obj/item/clothing/suit/space/captain = 1,
				/obj/item/clothing/suit/armor/heavy = 2,
				/obj/item/clothing/suit/armor/heavy/riot = 4,
				/obj/item/clothing/suit/armor/laserproof = 2,
				/obj/item/clothing/suit/armor/vest/ironhammer  = 10,
				/obj/item/clothing/suit/storage/vest = 5,
				/obj/item/clothing/suit/armor/platecarrier  = 10,
				/obj/item/clothing/suit/armor/flakvest  = 5,
				/obj/item/clothing/suit/armor/vest/handmade = 20,
				/obj/item/clothing/suit/space/void/SCAF = 1,
				/obj/item/clothing/suit/storage/vest/merc = 1,
				/obj/item/clothing/suit/space/void/odst/red = 1,
				/obj/item/clothing/suit/space/void/odst/blue = 1,
				/obj/item/clothing/suit/space/void/odst/orange = 1,
				/obj/item/clothing/suit/armor/vest = 20))

/obj/random/cloth/armor/low_chance
	name = "low chance random armor"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/suit
	name = "random suit"
	desc = "This is a random suit."
	icon_state = "armor-grey"

/obj/random/cloth/suit/item_to_spawn()
	return pickweight(list(/obj/item/clothing/suit/poncho = 10,
				/obj/item/clothing/suit/storage/rank/ass_jacket = 10,
				/obj/item/clothing/suit/storage/rank/cargo_jacket = 10,
				/obj/item/clothing/suit/storage/rank/insp_trench = 5,
				/obj/item/clothing/suit/storage/hazardvest = 10,
				/obj/item/clothing/suit/storage/toggle/leather = 3,
				/obj/item/clothing/suit/storage/rank/robotech_jacket = 10,
				/obj/item/clothing/suit/storage/toggle/bomber = 5,
				/obj/item/clothing/suit/storage/toggle/hoodie = 5,
				/obj/item/clothing/suit/storage/toggle/hoodie/black = 5,
				/obj/item/clothing/suit/gorka/toggle/gorka_ih/ih_med_g = 2,
				/obj/item/clothing/suit/gorka/toggle/crew_med = 2,
				/obj/item/clothing/suit/gorka/toggle/gorka/standard = 2,
				/obj/item/clothing/suit/gorka/toggle/gorka/camo = 2,
				/obj/item/clothing/suit/gorka/toggle/gorka/crew = 2,
				/obj/item/clothing/suit/gorka/toggle/gorka/crew_b = 2,
				/obj/item/clothing/suit/gorka/toggle/gorka/crew_g = 2,
				/obj/item/clothing/suit/gorka/toggle/gorka/crew_light = 2,
				/obj/item/clothing/suit/gorka/toggle/gorka/crew_light_b = 2,
				/obj/item/clothing/suit/gorka/toggle/gorka/crew_o = 2,
				/obj/item/clothing/suit/gorka/toggle/gorka/crew_y = 2,
				/obj/item/clothing/suit/gorka/toggle/gorka = 2,
				/obj/item/clothing/suit/storage/aerostatic_bomber_jacket = 2,
				/obj/item/clothing/suit/storage/jamrock_blazer = 2,
				/obj/item/clothing/suit/storage/toggle/labcoat = 3,
				/obj/item/clothing/suit/storage/toggle/labcoat/cmo = 3,
				/obj/item/clothing/suit/storage/toggle/labcoat/medspec = 3,
				/obj/item/clothing/suit/storage/toggle/labcoat/science = 3,
				/obj/item/clothing/suit/storage/toggle/labcoat/purple = 3,
				/obj/item/clothing/suit/storage/rank/qm_coat = 2,
				/obj/item/clothing/suit/storage/toggle/leather/cyberpunk = 8,
				/obj/item/clothing/suit/storage/triad = 2,
				/obj/item/clothing/suit/storage/akira = 2))

/obj/random/cloth/suit/low_chance
	name = "low chance random suit"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/hazmatsuit
	name = "random hazmat suit"
	desc = "This is a random hazmat suit."
	icon_state = "armor-grey"

/obj/random/cloth/hazmatsuit/item_to_spawn()
	return pickweight(list(/obj/item/clothing/suit/bio_suit = 5,
				/obj/item/clothing/suit/bio_suit/cmo = 5,
				/obj/item/clothing/suit/bio_suit/general = 5,
				/obj/item/clothing/suit/bio_suit/janitor = 5,
				/obj/item/clothing/suit/bio_suit/scientist = 5,
				/obj/item/clothing/suit/bio_suit/security = 5,
				/obj/item/clothing/suit/bio_suit/virology = 5,
				/obj/item/clothing/suit/radiation = 30,
				/obj/item/clothing/suit/space/bomb = 20))

/obj/random/cloth/hazmatsuit/low_chance
	name = "low chance random hazmat suit"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/under
	name = "random under"
	desc = "This is a random under."
	icon_state = "armor-grey"

/obj/random/cloth/under/item_to_spawn()
	return pickweight(list(/obj/item/clothing/under/color/aqua = 5,
				/obj/item/clothing/under/rank/assistant/formal = 5,
				/obj/item/clothing/under/suit_jacket/blackskirt = 5,
				/obj/item/clothing/under/suit_jacket/blazer = 5,
				/obj/item/clothing/under/pj/blue = 5,
				/obj/item/clothing/under/color/brown = 5,
				/obj/item/clothing/under/color/grey = 5,
				/obj/item/clothing/under/color/grey = 5,
				/obj/item/clothing/under/color/red = 5,
				/obj/item/clothing/under/color/pink = 5,
				/obj/item/clothing/under/orange = 5,
				/obj/item/clothing/under/color/green = 5,
				/obj/item/clothing/under/color = 5,
				/obj/item/clothing/under/color/black = 5,
				/obj/item/clothing/under/color/darkblue = 5,
				/obj/item/clothing/under/color/darkred = 5,
				/obj/item/clothing/under/suit_jacket/brown = 5,
				/obj/item/clothing/under/color/lightblue = 5,
				/obj/item/clothing/under/color/lightbrown = 5,
				/obj/item/clothing/under/color/lightgreen = 5,
				/obj/item/clothing/under/color/lightpurple = 5,
				/obj/item/clothing/under/color/lightred = 5,
				/obj/item/clothing/under/overalls = 5,
				/obj/item/clothing/under/gorka/camo = 2,
				/obj/item/clothing/under/gorka/crew = 2,
				/obj/item/clothing/under/gorka/crewblue = 2,
				/obj/item/clothing/under/gorka/crewgreen = 2,
				/obj/item/clothing/under/gorka/crewlight = 2,
				/obj/item/clothing/under/gorka/crewlightblue = 2,
				/obj/item/clothing/under/gorka/creworange = 2,
				/obj/item/clothing/under/gorka/crewyellow = 2,
				/obj/item/clothing/under/gorka/standard = 2,
				/obj/item/clothing/under/jamrock_suit = 2,
				/obj/item/clothing/under/aerostatic_suit = 2,
				/obj/item/clothing/under/costume/history/pirate = 5,
				/obj/item/clothing/under/color/purple = 5,
				/obj/item/clothing/under/costume/misc/rainbowjumpsuit = 5,
				/obj/item/clothing/under/pj = 5,
				/obj/item/clothing/under/dress/properblue = 5,
				/obj/item/clothing/under/suit_jacket/red = 5,
				/obj/item/clothing/under/suit_jacket = 5,
				/obj/item/clothing/under/turtleneck = 5,
				/obj/item/clothing/under/tactical = 5,
				/obj/item/clothing/under/syndicate = 5,
				/obj/item/clothing/under/dress = 5,
				/obj/item/clothing/under/dress/blue = 5,
				/obj/item/clothing/under/dress/red = 5,
				/obj/item/clothing/under/leisure = 5,
				/obj/item/clothing/under/leisure/white = 5,
				/obj/item/clothing/under/leisure/pullover = 5,
				/obj/item/clothing/under/track_suit = 2,
				/obj/item/clothing/under/white = 2,
				/obj/item/clothing/under/red = 2,
				/obj/item/clothing/under/green = 2,
				/obj/item/clothing/under/grey = 2,
				/obj/item/clothing/under/black = 2,
				/obj/item/clothing/under/dress/black = 1,
				/obj/item/clothing/under/dress/white = 1,
				/obj/item/clothing/under/helltaker = 2,
				/obj/item/clothing/under/johnny = 2,
				/obj/item/clothing/under/raider = 1))

/obj/random/cloth/under/low_chance
	name = "low chance random under"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/helmet
	name = "random helmet"
	desc = "This is a random helmet."
	icon_state = "armor-grey"

/obj/random/cloth/helmet/item_to_spawn()
	return pickweight(list(/obj/item/clothing/head/helmet = 5,
				/obj/item/clothing/head/helmet/faceshield/riot = 5,
				/obj/item/clothing/head/helmet/ballistic = 5,
				/obj/item/clothing/head/helmet/laserproof = 2,
				/obj/item/clothing/head/helmet/handmade = 5,
				/obj/item/clothing/head/helmet/steelpot = 8,
				/obj/item/clothing/head/helmet/generic_full = 5,
				/obj/item/clothing/head/helmet/faceshield/altyn = 2,
				/obj/item/clothing/head/helmet/faceshield/altyn/maska = 2,
				/obj/item/clothing/head/helmet/mercenary = 2,
				/obj/item/clothing/head/helmet/bulletproof = 2,
				/obj/item/clothing/head/helmet/space/void/odst/red = 1,
				/obj/item/clothing/head/helmet/space/void/odst/blue = 1,
				/obj/item/clothing/head/helmet/space/void/odst/orange = 1,
				/obj/item/clothing/head/helmet/space/void/SCAF = 1,
				/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg = 1,
				/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal = 0.3,))

/obj/random/cloth/helmet/low_chance
	name = "low chance random helmet"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/head
	name = "random head"
	desc = "This is a random head."
	icon_state = "armor-grey"

/obj/random/cloth/head/item_to_spawn()
	return pickweight(list(/obj/item/clothing/head/costume/animal/kitty = 1,    //God forgive us
				/obj/item/clothing/head/bandana/green = 5,
				/obj/item/clothing/head/beret = 5,
				/obj/item/clothing/head/rank/commander = 1,
				/obj/item/clothing/head/bearpelt = 5,
				/obj/item/clothing/head/bowler = 5,
				/obj/item/clothing/head/bowler/bowlerclassic = 5,
				/obj/item/clothing/head/costume/misc/cake = 5,
				/obj/item/clothing/head/rank/chaplain = 5,
				/obj/item/clothing/head/rank/chef = 5,
				/obj/item/clothing/head/fedora/feathered = 5,
				/obj/item/clothing/head/flatcap = 5,
				/obj/item/clothing/head/fez = 5,
				/obj/item/clothing/head/fedora = 5,
				/obj/item/clothing/head/firefighter/chief = 5,
				/obj/item/clothing/head/hardhat = 5,
				/obj/item/clothing/head/costume/job/nun = 5,
				/obj/item/clothing/head/costume/halloween/mad = 5,
				/obj/item/clothing/head/bandana/orange = 5,
				/obj/item/clothing/head/bandana/green = 5,
				/obj/item/clothing/head/costume/job/nun = 5,
				/obj/item/clothing/head/rank/inspector = 5,
				/obj/item/clothing/head/soft = 1,
				/obj/item/clothing/head/soft/red = 1,
				/obj/item/clothing/head/costume/misc/rainbow = 1,
				/obj/item/clothing/head/soft/purple = 1,
				/obj/item/clothing/head/soft/orange = 1,
				/obj/item/clothing/head/soft/white = 1,
				/obj/item/clothing/head/soft/grey = 1,
				/obj/item/clothing/head/soft/green = 1,
				/obj/item/clothing/head/soft/blue = 1,
				/obj/item/clothing/head/soft = 5,
				/obj/item/clothing/head/soft/green2soft = 1,
				/obj/item/clothing/head/soft/tan2soft = 1,
				/obj/item/clothing/head/soft/sec2soft = 1,
				/obj/item/clothing/head/soft/sec/corp = 1,
				/obj/item/clothing/head/tophat = 5,
				/obj/item/clothing/head/ushanka = 3,
				/obj/item/clothing/head/costume/history/anarchist_cap = 2,
				/obj/item/clothing/head/costume/history/anarchist = 1,
				/obj/item/clothing/head/welding = 5,
				/obj/item/clothing/head/ranger = 3,
				/obj/item/clothing/head/inhaler = 1,
				/obj/random/cloth/bikehelms = 1))

/obj/random/cloth/head/low_chance
	name = "low chance random head"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/bikehelms/low_chance
	name = "low chance random biker helmet"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/gloves
	name = "random gloves"
	desc = "This is a random gloves."
	icon_state = "armor-grey"

/obj/random/cloth/gloves/item_to_spawn()
	return pickweight(list(/obj/item/clothing/gloves/botanic_leather = 2,
				/obj/item/clothing/gloves/aerostatic_gloves = 2,
				/obj/item/clothing/gloves/boxing = 2,
				/obj/item/clothing/gloves/boxing/blue = 5,
				/obj/item/clothing/gloves/boxing/green = 1,
				/obj/item/clothing/gloves/boxing/yellow = 1,
				/obj/item/clothing/gloves/captain = 1,
				/obj/item/clothing/gloves/thick/ablasive = 2,
				/obj/item/clothing/gloves/color = 3,
				/obj/item/clothing/gloves/color/blue = 3,
				/obj/item/clothing/gloves/color/brown = 3,
				/obj/item/clothing/gloves/color/green = 3,
				/obj/item/clothing/gloves/color/grey = 3,
				/obj/item/clothing/gloves/color/light_brown = 3,
				/obj/item/clothing/gloves/color/orange = 3,
				/obj/item/clothing/gloves/color/purple = 3,
				/obj/item/clothing/gloves/rainbow = 3,
				/obj/item/clothing/gloves/color/red = 3,
				/obj/item/clothing/gloves/color/yellow = 3,
				/obj/item/clothing/gloves/insulated = 6,
				/obj/item/clothing/gloves/insulated/cheap = 7,
				/obj/item/clothing/gloves/latex = 9,
				/obj/item/clothing/gloves/thick = 5,
				/obj/item/clothing/gloves/thick/combat = 1,
				/obj/item/clothing/gloves/thick/swat = 2,
				/obj/item/clothing/gloves/stungloves = 1,
				/obj/item/clothing/gloves/evening = 2,
				/obj/item/clothing/gloves/ash_evening = 2,
				/obj/item/clothing/gloves/knuckles = 2))

/obj/random/cloth/gloves/low_chance
	name = "low chance random gloves"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/glasses
	name = "random glasses"
	desc = "This is a random glasses."
	icon_state = "armor-grey"

/obj/random/cloth/glasses/item_to_spawn()
	return pickweight(list(/obj/item/clothing/glasses/eyepatch = 4,
				/obj/item/clothing/glasses/binoclard_lenses = 2,
				/obj/item/clothing/glasses/regular/gglasses = 2,
				/obj/item/clothing/glasses/regular/hack_lens = 2,
				/obj/item/clothing/glasses/hud/health = 2,
				/obj/item/clothing/glasses/hud/security = 2,
				/obj/item/clothing/glasses/sechud/tactical = 2,
				/obj/item/clothing/glasses/threedglasses = 4,
				/obj/item/clothing/glasses/welding = 4))

/obj/random/cloth/glasses/low_chance
	name = "low chance random glasses"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/shoes
	name = "random shoes"
	desc = "This is a random pair of shoes."
	icon_state = "armor-grey"

/obj/random/cloth/shoes/item_to_spawn()
	return pickweight(list(/obj/item/clothing/shoes/color/black = 14,
				/obj/item/clothing/shoes/costume/job/clown = 14,
				/obj/item/clothing/shoes/color/blue = 1,   //Those are ugly, so they are rare
				/obj/item/clothing/shoes/color/brown = 1,
				/obj/item/clothing/shoes/color/green = 1,
				/obj/item/clothing/shoes/orange = 1,
				/obj/item/clothing/shoes/color/purple = 1,
				/obj/item/clothing/shoes/costume/misc/rainbow = 1,
				/obj/item/clothing/shoes/color = 1,
				/obj/item/clothing/shoes/color/red = 1,
				/obj/item/clothing/shoes/color/yellow = 1,
				/obj/item/clothing/shoes/galoshes = 8,
				/obj/item/clothing/shoes/jackboots = 14,
				/obj/item/clothing/shoes/jackboots/longboot = 7,
				/obj/item/clothing/shoes/jackboots/redboot = 4,
				/obj/item/clothing/shoes/leather = 14,
				/obj/item/clothing/shoes/aerostatic_boots = 10,
				/obj/item/clothing/shoes/render = 10,
				/obj/item/clothing/shoes/ablasive = 8,
				/obj/item/clothing/shoes/reinforced = 14,
				/obj/item/clothing/shoes/workboots = 4,
				/obj/item/clothing/shoes/track_shoes = 3))

/obj/random/cloth/shoes/low_chance
	name = "low chance random shoes"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/backpack
	name = "random backpack"
	desc = "This is a random backpack"
	icon_state = "armor-grey"

/obj/random/cloth/backpack/item_to_spawn()
	return pickweight(list(/obj/item/storage/backpack = 1,
				/obj/item/storage/backpack/white = 5,
				/obj/item/storage/backpack/purple = 5,
				/obj/item/storage/backpack/blue = 5,
				/obj/item/storage/backpack/green = 5,
				/obj/item/storage/backpack/orange = 5,
				/obj/item/storage/backpack/botanist = 4,
				/obj/item/storage/backpack/captain = 1,
				/obj/item/storage/backpack/clown = 4,
				/obj/item/storage/backpack/industrial = 6,
				/obj/item/storage/backpack/medical = 6,
				/obj/item/storage/backpack/security = 6,
				/obj/item/storage/backpack/neotheology = 2,
				/obj/item/storage/backpack/ironhammer = 2,
				/obj/item/storage/backpack/military = 6,
				/obj/item/storage/backpack/sport = 1,
				/obj/item/storage/backpack/sport/white = 5,
				/obj/item/storage/backpack/sport/purple = 5,
				/obj/item/storage/backpack/sport/blue = 5,
				/obj/item/storage/backpack/sport/green = 5,
				/obj/item/storage/backpack/sport/orange = 5,
				/obj/item/storage/backpack/sport/botanist = 4,
				/obj/item/storage/backpack/sport/neotheology = 2,
				/obj/item/storage/backpack/sport/ironhammer = 2,
				/obj/item/storage/backpack/satchel = 1,
				/obj/item/storage/backpack/satchel/white = 5,
				/obj/item/storage/backpack/satchel/purple = 5,
				/obj/item/storage/backpack/satchel/blue = 5,
				/obj/item/storage/backpack/satchel/green = 5,
				/obj/item/storage/backpack/satchel/orange = 5,
				/obj/item/storage/backpack/satchel/botanist = 4,
				/obj/item/storage/backpack/satchel/captain = 1,
				/obj/item/storage/backpack/satchel/industrial = 6,
				/obj/item/storage/backpack/satchel/medical = 6,
				/obj/item/storage/backpack/satchel/security = 6,
				/obj/item/storage/backpack/satchel/leather/withwallet = 12,
				/obj/item/storage/backpack/satchel/ironhammer = 4,
				/obj/item/storage/backpack/satchel/neotheology = 4))

/obj/random/cloth/backpack/low_chance
	name = "low chance random backpack"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/belt
	name = "random belt"
	desc = "This is a random belt."
	icon_state = "armor-grey"

/obj/random/cloth/belt/item_to_spawn()
	return pickweight(list(/obj/item/storage/belt/medical = 8,
				/obj/item/storage/belt/medical/emt = 8,
				/obj/item/storage/belt/security = 4,
				/obj/item/storage/belt/webbing = 6,
				/obj/item/storage/belt/webbing/ih = 2,
				/obj/item/storage/belt/security/neotheology = 2,
				/obj/item/storage/belt/utility = 8,
				/obj/item/storage/belt/utility/neotheology = 4))

/obj/random/cloth/belt/low_chance
	name = "low chance random belt"
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/holster
	name = "random holster"
	desc = "This is a random holster."
	icon_state = "armor-grey"

/obj/random/cloth/holster/item_to_spawn()
	return pickweight(list(/obj/item/clothing/accessory/holster = 1,
				/obj/item/clothing/accessory/holster/armpit = 1,
				/obj/item/clothing/accessory/holster/waist = 1,
				/obj/item/clothing/accessory/holster/saber = 1,
				/obj/item/clothing/accessory/holster/saber/greatsword = 1,
				/obj/item/clothing/accessory/holster/saber/machete = 1,
				/obj/item/clothing/accessory/holster/saber/cutlass = 1,
				/obj/item/clothing/accessory/holster/saber/saya = 1,
				/obj/item/clothing/accessory/holster/hip = 1,))

/obj/random/cloth/holster/low_chance
	name = "low chance random holster"
	desc = "This is a random holster."
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/greyson_clothing
	name = "random greyson clothing"
	desc = "This is a random greyson clothing."
	icon_state = "armor-grey"

/obj/random/cloth/greyson_clothing/low_chance
	name = "low chance random greyson clothing"
	desc = "This is a random greyson clothing."
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 60

/obj/random/cloth/greyson_clothing/item_to_spawn()
	return pickweight(list(/obj/item/clothing/under/os_jumpsuit = 8,
				/obj/item/clothing/under/iron_lock_security = 5,
				/obj/item/clothing/shoes/ablasive/iron_lock_security = 1,
				/obj/item/clothing/gloves/thick/ablasive/iron_lock_security  = 1,
				/obj/item/clothing/head/soft/iron_lock_security = 1,
				/obj/item/clothing/head/helmet/laserproof/iron_lock_security = 1,
				/obj/item/clothing/suit/armor/vest/iron_lock_security = 1,
				/obj/item/clothing/suit/greatcoat/os = 4,
				/obj/item/clothing/head/os_cap = 4,
				/obj/item/clothing/suit/space/void/os = 6,
				/obj/item/clothing/suit/space/void/greyson = 1))

/obj/random/cloth/assault/reaver
	name = "low chance Reaver Assault Armor"
	desc = "Low chance reaver assault armor spawn. Intended for use on Reavers."
	icon_state = "armor-grey-low"
	spawn_nothing_percentage = 97 //about a 1/3 chance on a normal round of obtaining this

/obj/random/cloth/assault/reaver/item_to_spawn()
	return pickweight(list(/obj/item/clothing/suit/space/void/assault_wolf))

/obj/random/cloth/bells
	name = "random bell collar"
	desc = "This is a random bell collar."
	icon_state = "armor-grey"

/obj/random/cloth/bells/item_to_spawn()
	return pickweight(list(
				/obj/item/clothing/accessory/choker/gold_bell_small_goth = 2,
				/obj/item/clothing/accessory/choker/gold_bell_goth = 1,
				/obj/item/clothing/accessory/choker/silver_bell_goth = 2,
				/obj/item/clothing/accessory/choker/silver_bell_small_goth = 1,
				/obj/item/clothing/accessory/choker/gold_bell = 2,
				/obj/item/clothing/accessory/choker/gold_bell_small = 3,
				/obj/item/clothing/accessory/choker/silver_bell = 2,
				/obj/item/clothing/accessory/choker/silver_bell_small = 3
				))
