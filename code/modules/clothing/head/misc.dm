/obj/item/clothing/head/centhat
	name = "\improper CentCom. hat"
	icon_state = "centcom"
	item_state_slots = list(
		slot_l_hand_str = "centhat",
		slot_r_hand_str = "centhat",
		)
	desc = "It's good to be emperor."
	siemens_coefficient = 0.9
	body_parts_covered = 0


/obj/item/clothing/head/laurel
	name = "Laurel wreath"
	icon_state = "laurel"
	desc = "A round wreath made of connected branches and leaves of the bay laurel."
	slot_flags = SLOT_HEAD | SLOT_EARS
	body_parts_covered = 0

/obj/item/clothing/head/laurel/silver
	name = "silver Laurel wreath"
	icon_state = "laurel_s"
	desc = "A round wreath made of connected branches and leaves of the bay laurel. This one appears to be formed  silver."

/obj/item/clothing/head/laurel/gold
	name = "golden Laurel wreath"
	icon_state = "laurel_g"
	desc = "A round wreath made of connected branches and leaves of the bay laurel. This one appears to be formed of gold."

/obj/item/clothing/head/hairflower
	name = "red flower pin"
	icon_state = "hairflower"
	desc = "A hair flower pin. It smells nice."
	slot_flags = SLOT_HEAD | SLOT_EARS
	body_parts_covered = 0

/obj/item/clothing/head/hairflower/blue
	icon_state = "hairflower_blue"
	name = "blue flower pin"

/obj/item/clothing/head/hairflower/pink
	icon_state = "hairflower_pink"
	name = "pink flower pin"

/obj/item/clothing/head/hairflower/yellow
	icon_state = "hairflower_yellow"
	name = "yellow flower pin"

/obj/item/clothing/head/hairflower/violet
	icon_state = "hairflower_violet"
	name = "violet flower pin"

/obj/item/clothing/head/hairflower/orange
	icon_state = "hairflower_orange"
	name = "orange flower pin"

/obj/item/clothing/head/hairflower/white
	icon_state = "hairflower_white"
	name = "white flower pin"

/*Ears Pins*/
/obj/item/clothing/head/pin/ear_pin
	name = "ear dangle"
	icon_state = "ear_dangle"
	desc = "Two small objects dangling on someone's ears. Probably some sorta of decoration."
	slot_flags =  SLOT_EARS
	body_parts_covered = 0

/obj/item/clothing/head/pin/ear_pin/ear_stud
	name = "ear stud"
	icon_state = "ear_stud"
	desc = "Two small objects dangling on someone's ears. Probably some sorta of decoration"
	slot_flags =  SLOT_EARS
	body_parts_covered = 0

/*Hair Pins*/

/obj/item/clothing/head/pin
	name = "hairpin"
	icon_state = "pin"
	desc = "A small metal hair pin."
	slot_flags = SLOT_HEAD | SLOT_EARS
	body_parts_covered = 0

/obj/item/clothing/head/pin/attackby(var/obj/item/W, var/mob/user) //happy valentines day Gidgit
	//do checks for what we were hit by and what kind of pin we turn into.
	var/obj/item/reagent_containers/food/snacks/grown/G = W
	if(G.seed && G.name == "poppy")
		new /obj/item/clothing/head/hairflower(src.loc)
		user.drop_from_inventory(W)
		qdel(W)
		qdel(src)
	if(G.seed && G.name == "harebell")
		new /obj/item/clothing/head/hairflower/violet(src.loc)
		user.drop_from_inventory(W)
		qdel(W)
		qdel(src)
	if(G.seed && G.name == "sunflower")
		new /obj/item/clothing/head/hairflower/yellow(src.loc)
		user.drop_from_inventory(W)
		qdel(W)
		qdel(src)
	if(G.seed && G.name == "grass")
		new /obj/item/clothing/head/pin/clover(src.loc)
		user.drop_from_inventory(W)
		qdel(W)
		qdel(src)

/obj/item/clothing/head/pin/butterfly
	name = "blue butterfly pin"
	icon_state = "butterflypin"
	desc = "A decorative hairpin with a blue plastic butterfly on it."

/obj/item/clothing/head/pin/clover
	name = "clover hairpin"
	icon_state = "cloverpin"
	desc = "A hairpin with a clover on it. Lucky you!"

/obj/item/clothing/head/pin/magnet
	name = "hair magnets"
	icon_state = "magnetpin"
	desc = "A small metal hair pin with a magnet attached. Popular among the tiny demographic of fashionable robots."

/*Hair Ribbons*/

/obj/item/clothing/head/ribbon
	name = "white hair ribbon"
	icon_state = "whiteribbon"
	desc = "A big white ribbon tied in a bow. Cute!"

obj/item/clothing/head/ribbon/red
	name = "red hair ribbon"
	icon_state = "redribbon"
	desc = "A big red ribbon tied in a bow. Somehow, this one reminds you of Jana cartoons."

/*Maid Headdress*/

/obj/item/clothing/head/maid
	name = "maid headdress"
	icon_state = "maid"
	desc = "A frilly headdress, for keeping your hair away from the mess you're cleaning."


/*Top Hats*/

/obj/item/clothing/head/tophat
	name = "black top hat"
	desc = "A standard top hat in a classic black design."
	icon_state = "tophat"
	item_state = "tophat"
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/tophat/purple
	name = "mulberry top hat"
	desc = "An elegant top hat in a distinctive purple color."
	icon_state = "ptophat"
	item_state = "ptophat"

/obj/item/clothing/head/tophat/beaverhat
	name = "beaver top hat"
	icon_state = "beaver_hat"
	item_state = "beaver_hat"
	desc = "A blue top hat made out of comfortable beaver pelt."

/*Bandanas*/

/obj/item/clothing/head/bandana/green
	name = "green bandana"
	desc = "A green bandana fashioned from a piece of cloth."
	icon_state = "greenbandana"
	item_state = "greenbandana"
	flags_inv = 0
	body_parts_covered = 0

/obj/item/clothing/head/bandana/orange //themij: Taryn Kifer
	name = "orange bandana"
	desc = "An orange bandana fashioned from a piece of cloth."
	icon_state = "orange_bandana"
	body_parts_covered = 0

/obj/item/clothing/head/bandana
	name = "red bandana"
	desc = "A red bandana fashioned from a piece of cloth."
	icon_state = "bandana"
	flags_inv = BLOCKHEADHAIR

/*Bowler Hats*/

/obj/item/clothing/head/bowler/bowlerclassic
	name = "classic bowler hat"
	desc = "A black felt hat with a rounded crown."
	icon_state = "bowler"
	body_parts_covered = 0

/obj/item/clothing/head/bowler/bowlerbasil
	name = "basil bowler hat"
	desc = "A black felt hat with a rounded crown and green stripe."
	icon_state = "bowlergreen"
	body_parts_covered = 0

/obj/item/clothing/head/bowler
	name = "banded bowler hat"
	icon_state = "bowler_hat"
	desc = "A black felt hat with a rounded crown and white stripe."
	body_parts_covered = 0

/*Cowboy Hats*/

/obj/item/clothing/head/cowboy
	name = "rancher cowboy hat"
	icon_state = "cowboyrancher"
	desc = "A straw cowboy hat with a high tipped brim."

/obj/item/clothing/head/cowboy/desperado
	name = "desperado cowboy hat"
	icon_state = "cowboydesperado"
	desc = "A black leather cowboy hat with a tipped brim."

/obj/item/clothing/head/cowboy/journeyman
	name = "journeyman cowboy hat"
	icon_state = "cowboygambler"
	desc = "A brown straw cowboy hat with a weathered shape."

/obj/item/clothing/head/cowboy/marshal
	name = "marshal cowboy hat"
	icon_state = "cowboymarshal"
	desc = "A brown felt cowboy hat with a long flat brim."

/obj/item/clothing/head/cowboy/shootist
	name = "shootist cowboy hat"
	icon_state = "cowboyshootist"
	desc = "A black leather cowboy hat with a long flat brim."

/obj/item/clothing/head/cowboy/wrangler
	name = "wrangler cowboy hat"
	desc = "A tan felt cowboy hat with a high tipped brim."
	icon_state = "cowboyhat"
	body_parts_covered = 0

/obj/item/clothing/head/cowboy/bandit
	name = "bandit cowboy hat"
	desc = "A black leather cowboy hat with a long tipped brim."
	icon_state = "cowboy_black"

/obj/item/clothing/head/cowboy/longhorn
	name = "longhorn cowboy hat"
	desc = "A brown felt cowboy hat with a very long brim."
	icon_state = "cowboy_wide"

/obj/item/clothing/head/cowboy/greenhorn
	name = "greenhorn cowboy hat"
	desc = "A small brown felt cowboy hat for tiny gunslingers."
	icon_state = "cowboy_small"

/obj/item/clothing/head/cowboy/frontiersman
	name = "frontiersman cowboy hat"
	desc = "A rugged dark felt hat worn with a green leather hood."
	icon_state = "stormchaser"

/*Fedoras*/

/obj/item/clothing/head/fedora
	name = "black fedora"
	icon_state = "fedora"
	desc = "A black felt fedora with a sharp brim."

/obj/item/clothing/head/fedora/brown
	name = "brown fedora"
	icon_state = "detectiveold"
	desc = "A soft brown felt fedora."

/obj/item/clothing/head/fedora/grey
	name = "grey fedora"
	icon_state = "detective2"
	desc = "A soft grey felt fedora."

/obj/item/clothing/head/fedora/feathered
	name = "feather fedora"
	icon_state = "feather_trilby"
	desc = "A dark blue felt fedora with a classy white feather."

/obj/item/clothing/head/investigator //to prevent it being under loadout
	name = "investigator fedora"
	icon_state = "investigator"
	desc = "A soft brown fedora belonging to a man of law."

/*Misc*/

/obj/item/clothing/head/rank/centcom
	name = "\improper CentCom. hat"
	icon_state = "centcom"
	item_state_slots = list(
		slot_l_hand_str = "centhat",
		slot_r_hand_str = "centhat",
		)
	desc = "It's good to be emperor."
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/sombrero
	name = "sombrero"
	desc = "You can practically taste the fiesta."
	icon_state = "sombrero"
	item_state = "sombrero"
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/fez
	name = "fez"
	icon_state = "fez"
	desc = "A conical red hat in prime oriental fashion."

/obj/item/clothing/head/boaterhat
	name = "boater hat"
	icon_state = "boater_hat"
	desc = "A formal beige summer hat."

/obj/item/clothing/head/leather_hat
	name = "leather hat"
	icon_state = "field_numerical_hat"
	desc = "A tall hat for followers of the faith. Can be turned inside out to turn from red to purple or vice versa"
	armor_list = list( //same as the garb
		melee = 2,
		bullet = 0,
		energy = 2,
		bomb = 5,
		bio = 100,
		rad = 0
	)

/obj/item/clothing/head/leather_hat/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Red Hat"] = "field_numerical_hat"
	options["Purple Hat"] = "field_numerical_hat_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/flatcap
	name = "flat cap"
	desc = "A rugged and reliable working cap."
	icon_state = "flat_cap"
	item_state_slots = list(
		slot_l_hand_str = "det_hat",
		slot_r_hand_str = "det_hat",
		)
	siemens_coefficient = 0.9

/obj/item/clothing/head/bearpelt
	name = "bear pelt hat"
	desc = "Fuzzy."
	icon_state = "bearpelt"
	flags_inv = BLOCKHEADHAIR
	siemens_coefficient = 0.7

/obj/item/clothing/head/turban
	name = "turban"
	desc = "A cloth designed to be worn around the head."
	icon_state = "turban"
	body_parts_covered = 0
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/rice_hat
	name = "rice hat"
	desc = "A hat made out of straw, designed to keep the sun from hurting your face."
	icon_state = "rice_hat"

/obj/item/clothing/head/jingasa
	name = "jingasa"
	desc = "A sturdy metal cap designed to protect the head from weather and falling objects."
	icon_state = "jingasa"
	armor_list = list(melee = 1, bullet = 1, energy = 1, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/headband
	name = "headband"
	desc = "A simple cloth headband intended to help keep ones hair neat and orderly."
	icon_state = "headband_colorless"

/obj/item/clothing/head/strawhat
	name = "straw hat"
	desc = "A plain old straw hat for keeping the sun out of ones eyes. A red band is all that keeps this old thing in one piece."
	icon_state = "small_strawhat"

/obj/item/clothing/head/strawhat/big
	name = "wide straw hat"
	desc = "A great big straw hat. Its size and durable make will keep ones eyes safe for a thousand sunny days."
	icon_state = "large_strawhat"

/obj/item/clothing/head/sunhat
	name = "yellow sunhat"
	desc = "A wide brimmed, feminine hat. Perfect for those warm Amethyn summers."
	icon_state = "sunhat"

/obj/item/clothing/head/sunhat/white
	name = "white sunhat"
	desc = "A wide brimmed, feminine hat. Perfect for those warm Amethyn summers."
	icon_state = "sunhat_white"

/obj/item/clothing/head/sunhat/shade
	name = "shadehat"
	desc = "A wide brimmed shadecap. A bit witchy, but it'll do the job."
	icon_state = "shadehat"

/obj/item/clothing/head/sunhat/blackshade
	name = "black shadehat"
	desc = "A wide brimmed shadecap. A bit gothic, but it'll do the job."
	icon_state = "shadehat_black"

obj/item/clothing/head/sunhat/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["standard"] = ""
	options["lopsided"] = "_lopsided"
	var/choice = input(M,"What do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You adjust your hat to a [choice] style.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/tiara
	name = "tiara"
	desc = "A simple, metal tiara."
	icon_state = "tiara"

/obj/item/clothing/head/voidhelm
	name = "kin voidhelm"
	desc = "An old, battered voidhelmet. Its original source unknown and its seals long since worn out - still, it makes for a decent helmet, if nothing else is available."
	icon_state = "kin_voidhelm"
	armor_list = list(melee = 3, bullet = 3, energy = 3, bomb = 0, bio = 0, rad = 0) //if the absolute greatcoat can have these stats, so can this.
	item_flags = THICKMATERIAL
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = MEDIUM_OBSCURATION

/obj/item/clothing/head/headdress
	name = "headdress"
	desc = "A simple, ornamental headdress."
	icon_state = "headress"

/obj/item/clothing/head/headscarf
	name = "headscarf"
	desc = "A patterned bolt of synth-cloth tied here and there that sits comfortably around the head. Excellent for keeping sand from your face - if you weren't in a temperate forest, that is."
	icon_state = "zhan_scarf"

/obj/item/clothing/head/exceslior/excelsior_officer
	name = "excelsior officer cap"
	desc = "A peaked commissar cap marked with a red hammer and gear emblem on an orange background at its front."
	icon_state = "excelsior_officer"

/obj/item/clothing/head/ranger
	name = "ranger hat"
	desc = "A rather generic sergeant hat. On second look it's actually a ranger hat."
	icon_state = "ranger"
	item_state = "ranger"
	price_tag = 40

/obj/item/clothing/head/inhaler
	name = "odd looking helmet"
	desc = "A confusingly complex helmet. It is capable of protecting you so it's more useful than being a simple decoration."
	icon_state = "inhaler"
	item_state = "inhaler"
	item_flags = THICKMATERIAL
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	siemens_coefficient = 1
	price_tag = 600
	armor_list = list(
		melee = 5,
		bullet = 3,
		energy = 2,
		bomb = 0,
		bio = 20,
		rad = 25
	)

/obj/item/clothing/head/os_cap
	name = "Greyson Positronic Cap"
	desc = "A flat brim cap warn by Greyson Positronic office workers to keep out light and sport their logo at the same time."
	icon_state = "os_cap"
	item_state = "os_cap"
	armor_list = list(
		melee = 1,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 20,
		rad = 25
	)

/obj/item/clothing/head/os_cap/nova
	name = "Greyson Star Trader Cap"
	desc = "A flat brim cap made for the colony office workers to keep out light out of their heads, weirdly enough it smells like if you just buyed it out of the vendor, it smells like cinnamon."
	icon_state = "os_cap"
	item_state = "os_cap"
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 1,
		bomb = 0,
		bio = 5,
		rad = 5
	)

/*
 * Ushanka
 */
/obj/item/clothing/head/ushanka
	name = "ushanka"
	desc = "A warm, black fur cap with a soviet design."
	icon_state = "ushanka"
	item_state = "ushanka"
	flags_inv = HIDEEARS

// No more bulky ushanka, no need for this.
/*
/obj/item/clothing/head/ushanka/attack_self(mob/user as mob)
	if(src.icon_state == "ushankadown")
		src.icon_state = "ushankaup"
		to_chat(user, "You raise the ear flaps on the ushanka.")
	else
		src.icon_state = "ushankadown"
		to_chat(user, "You lower the ear flaps on the ushanka.")
*/

// Hood for the Outsider cloak

/obj/item/clothing/head/outcasthood
	name = "outcast's hood"
	desc = "A raggedy hood from your trusty cloak, can be used to hide your face from the harmful looks of others."
	icon_state = "ragged_hood"
	item_state = "ragged_hood"
	flags_inv = HIDEEARS|BLOCKHAIR
	armor_list = list(melee = 1, bullet = 0, energy = 2, bomb = 0, bio = 5, rad = 5)

// hoods for the tacticool ponchos.

/obj/item/clothing/head/tacticalhood
	name = "brown tactical hood"
	desc = "A tactical brown hood to no doubt match an equally tactical brown poncho."
	icon_state = "tacponhood_brown"
	item_state = "tacponhood_brown"
	flags_inv = HIDEEARS|BLOCKHAIR

/obj/item/clothing/head/tacticalhood/green
	name = "green tactical hood"
	desc = "A tactical brown hood to no doubt match an equally tactical brown poncho."
	icon_state = "tacponhood_green"
	item_state = "tacponhood_green"
	flags_inv = HIDEEARS|BLOCKHAIR

/obj/item/clothing/head/tacticalhood/grey
	name = "grey tactical hood"
	desc = "A tactical grey hood to no doubt match an equally tactical grey poncho."
	icon_state = "tacponhood_grey"
	item_state = "tacponhood_grey"
	flags_inv = HIDEEARS|BLOCKHAIR

/obj/item/clothing/head/tacticalhood/camo
	name = "camo tactical hood"
	desc = "A tactical brown hood to no doubt match an equally tactical brown poncho."
	icon_state = "tacponhood_camo"
	item_state = "tacponhood_camo"
	flags_inv = HIDEEARS|BLOCKHAIR

/obj/item/clothing/head/tacticalhood/ghillie
	name = "ghillie hood"
	desc = "A tactical brown hood to no doubt match an equally tactical brown poncho."
	icon_state = "tacponhood_ghillie"
	item_state = "tacponhood_ghillie"
	flags_inv = HIDEEARS|BLOCKHAIR

/obj/item/clothing/head/tacticalhood_color
	name = "hood"
	desc = "A tactical hood, in a color of your choice."
	icon_state = "tacponhood_color"
	item_state = "tacponhood_color"
	flags_inv = HIDEEARS|BLOCKHAIR

/obj/item/clothing/head/religion_hood_color
	name = "religious hood"
	desc = "A religious hood that can be colored."
	icon_state = "general_hood"
	item_state = "general_hood"


/obj/item/clothing/head/hev

	name = "Hazardous Enviroment Protection suit helmet"
	desc = "A hood that comes with the hazardous protection suit."
	icon_state = "rad"
	action_button_name = "Toggle Headlamp"
	brightness_on = 5
	light_overlay = "hardhat_light"
	armor_list = list(
		melee = 16,
		bullet = 15,
		energy = 13,
		bomb = 75,
		bio = 100,
		rad = 100
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.4
	w_class = ITEM_SIZE_NORMAL
	item_flags = STOPPRESSUREDAMAGE //hardhat has it? So this gets it to.
	heat_protection = HEAD
	cold_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	unacidable = TRUE
	price_tag = 1000
