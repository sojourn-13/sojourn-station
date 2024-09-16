/obj/item/clothing/suit/storage
	item_flags = DRAG_AND_DROP_UNEQUIP|EQUIP_SOUNDS
	var/obj/item/storage/internal/pockets
	var/cant_hold = list(/obj/item/clothing/accessory,
						 /obj/item/tool_upgrade/armor)

/obj/item/clothing/suit/storage/New()
	..()
	pockets = new/obj/item/storage/internal(src)
	pockets.storage_slots = 2	//two slots
	pockets.max_w_class = ITEM_SIZE_SMALL		//fit only pocket sized items
	pockets.max_storage_space = 4
	pockets.cant_hold |= extra_allowed

/obj/item/clothing/suit/storage/Destroy()
	qdel(pockets)
	pockets = null
	. = ..()

/obj/item/clothing/suit/storage/attack_hand(mob/user)
	if ((is_worn() || is_held()) && !pockets.handle_attack_hand(user))
		return TRUE
	..(user)

/obj/item/clothing/suit/storage/MouseDrop(obj/over_object)
	if(pockets.handle_mousedrop(usr, over_object))
		return TRUE
	..(over_object)

/obj/item/clothing/suit/storage/attackby(obj/item/W, mob/user)
	if(!istype(W, /obj/item/clothing/accessory)) // Do not put accessories into pockets
		pockets.attackby(W, user)
	..()

/obj/item/clothing/suit/storage/emp_act(severity)
	pockets.emp_act(severity)
	..()

//Jackets with buttons, used for labcoats, IA jackets, First Responder jackets, and brown jackets.
/obj/item/clothing/suit/storage/toggle
	var/icon_open
	var/icon_closed
	var/icon_drape

/obj/item/clothing/suit/storage/toggle/New()
	..()
	check_coat_verbs()


//Updates the verb list to accomodate with the jacket's current state
/obj/item/clothing/suit/storage/toggle/proc/check_coat_verbs()
	if(icon_state == icon_open)
		src.verbs -= /obj/item/clothing/suit/storage/toggle/verb/unbutton
		if(icon_closed)
			src.verbs |= /obj/item/clothing/suit/storage/toggle/verb/button
		if(icon_drape)
			src.verbs |= /obj/item/clothing/suit/storage/toggle/verb/drape
	else if(icon_state == icon_closed)
		src.verbs -= /obj/item/clothing/suit/storage/toggle/verb/button
		if(icon_drape)
			src.verbs |= /obj/item/clothing/suit/storage/toggle/verb/drape
		if(icon_open)
			src.verbs |= /obj/item/clothing/suit/storage/toggle/verb/unbutton
	else if(icon_state == icon_drape)
		src.verbs -= /obj/item/clothing/suit/storage/toggle/verb/drape
		if(icon_closed)
			src.verbs |= /obj/item/clothing/suit/storage/toggle/verb/button
		if(icon_open)
			src.verbs |= /obj/item/clothing/suit/storage/toggle/verb/unbutton


/obj/item/clothing/suit/storage/toggle/verb/button()
	set name = "Button Coat"
	set category = "Object"
	set src in usr
	//Can't do it sometimes
	if(!usr.canmove || usr.stat || usr.restrained())
		return 0

	if(!icon_closed)
		to_chat(usr, "This coat can not be bottoned.")
		return 0

	icon_state = icon_closed
	to_chat(usr, "You button the coat.")
	check_coat_verbs()
	update_wear_icon()


/obj/item/clothing/suit/storage/toggle/verb/unbutton()
	set name = "Unbutton Coat"
	set category = "Object"
	set src in usr
	//Can't do it sometimes
	if(!usr.canmove || usr.stat || usr.restrained())
		return 0

	if(!icon_open)
		to_chat(usr, "This coat can not be unbottoned.")
		return 0

	icon_state = icon_open
	to_chat(usr, "You unbutton the coat.")
	check_coat_verbs()
	update_wear_icon()

/obj/item/clothing/suit/storage/toggle/verb/drape() //COAT CAPES
	set name = "Drape Coat"
	set category = "Object"
	set src in usr
	//Can't do it sometimes
	if(!usr.canmove || usr.stat || usr.restrained())
		return 0

	if(!icon_drape)
		to_chat(usr, "This coat can not be draped.")
		return 0

	icon_state = icon_drape
	to_chat(usr, "You drape the coat over your shoulders.")
	check_coat_verbs()
	update_wear_icon()

/*
/obj/item/clothing/suit/storage/toggle/verb/toggle()
		set name = "Unbutton Coat Buttons"
		set category = "Object"
		set src in usr
		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		if(icon_state == icon_open) //Will check whether icon state is currently set to the "open" or "closed" state and switch it around with a message to the user
			icon_state = icon_closed
			to_chat(usr, "You button up the coat.")
		else if(icon_state == icon_closed)
			icon_state = icon_open
			to_chat(usr, "You unbutton the coat.")
		else //in case some goofy admin switches icon states around without switching the icon_open or icon_closed
			to_chat(usr, "This coat cannot be opened or closed.")
			return
		update_wear_icon()	//so our over-lays update
*/

/obj/item/clothing/suit/storage/vest/merc/New()
	..()
	pockets = new/obj/item/storage/internal(src)
	pockets.storage_slots = 4
	pockets.max_w_class = ITEM_SIZE_SMALL
	pockets.max_storage_space = 8
	pockets.cant_hold |= list(/obj/item/tool_upgrade/armor) //Prevents a bug

/obj/item/clothing/suit/storage/vest/ironhammer/New()
	..()
	pockets = new/obj/item/storage/internal(src)
	pockets.storage_slots = 4
	pockets.max_w_class = ITEM_SIZE_SMALL
	pockets.max_storage_space = 8
	pockets.cant_hold |= list(/obj/item/tool_upgrade/armor) //Prevents a bug

/obj/item/clothing/suit/storage/vest/breach2/New()
	..()
	pockets = new/obj/item/storage/internal(src)
	pockets.storage_slots = 5	//five slots
	pockets.max_w_class = ITEM_SIZE_SMALL
	pockets.max_storage_space = 10
	pockets.cant_hold |= list(/obj/item/tool_upgrade/armor) //Prevents a bug


/*Dresscoats*/

/obj/item/clothing/suit/storage/vic_dresscoat
	name = "black victorian dresscoat"
	desc = "An elaborate coat to go over an old-Earth Victorian Period dress. Much thinner fabric than you'd expected. This one is black."
	icon_state = "vickyblack"
	item_state = "vickyblack"

/obj/item/clothing/suit/storage/vic_dresscoat/red
	name = "red victorian dresscoat"
	desc = "An elaborate coat to go over an old-Earth Victorian Period dress. Much thinner fabric than you'd expected. This one is red."
	icon_state = "vickyred"
	item_state = "vickyred"

/*Puffer Vest*/

/obj/item/clothing/suit/storage/puffer
	name = "puffer jacket"
	desc = "A comfortable grey puffer jacket."
	icon_state = "pufferjacket"
	item_state = "pufferjacket"

/obj/item/clothing/suit/storage/puffer/vest
	name = "puffer vest"
	desc = "A comfortable grey puffer vest."
	icon_state = "puffervest"
	item_state = "puffervest"

/obj/item/clothing/suit/storage/puffer/purple
	name = "purple puffer jacket"
	desc = "A comfortable purple puffer jacket."
	icon_state = "puffycoatpurple"
	item_state = "puffycoatpurple"

/obj/item/clothing/suit/storage/puffer/blue
	name = "blue puffer jacket"
	desc = "A comfortable blue puffer jacket."
	icon_state = "puffycoatblue"
	item_state = "puffycoatblue"

/obj/item/clothing/suit/storage/puffer/red
	name = "red puffer jacket"
	desc = "A comfortable red puffer jacket."
	icon_state = "puffycoatred"
	item_state = "puffycoatred"

/obj/item/clothing/suit/storage/puffer/white
	name = "white puffer jacket"
	desc = "A comfortable white puffer jacket."
	icon_state = "puffycoatwhite"
	item_state = "puffycoatwhite"

/obj/item/clothing/suit/storage/puffer/black
	name = "black puffer jacket"
	desc = "A comfortable black puffer jacket."
	icon_state = "puffycoatblack"
	item_state = "puffycoatblack"

/obj/item/clothing/suit/storage/puffer/green
	name = "green puffer jacket"
	desc = "A comfortable green puffer jacket."
	icon_state = "puffycoatgreen"
	item_state = "puffycoatgreen"

/obj/item/clothing/suit/storage/puffer/pink
	name = "pink puffer jacket"
	desc = "A comfortable pink puffer jacket."
	icon_state = "puffycoatpink"
	item_state = "puffycoatpink"

/obj/item/clothing/suit/storage/puffer/yellow
	name = "yellow puffer jacket"
	desc = "A comfortable yellow puffer jacket."
	icon_state = "puffycoatyellow"
	item_state = "puffycoatyellow"

/*Military Jackets*/

/obj/item/clothing/suit/storage/miljacket/field
	name = "field jacket"
	icon_state = "fjacket"
	item_state = "fjacket"

/obj/item/clothing/suit/storage/miljacket/black
	name = "black military jacket"
	desc = "A military canvas jacket in a tactical black design."
	icon_state = "militaryjacket_black"
	item_state = "militaryjacket_black"

/obj/item/clothing/suit/storage/miljacket/drab
	name = "drab military jacket"
	desc = "A military canvas jacket in an olive drab design."
	icon_state = "militaryjacket_nobadge"
	item_state = "militaryjacket_nobadge"

/obj/item/clothing/suit/storage/miljacket/green
	name = "green military jacket"
	desc = "A military canvas jacket in a jungle green design."
	icon_state = "militaryjacket_green"
	item_state = "militaryjacket_green"

/obj/item/clothing/suit/storage/miljacket/grey
	name = "grey military jacket"
	desc = "A military canvas jacket in a urban grey design."
	icon_state = "militaryjacket_grey"
	item_state = "militaryjacket_grey"

/obj/item/clothing/suit/storage/miljacket/navy
	name = "navy military jacket"
	desc = "A military canvas jacket in a dark navy design."
	icon_state = "militaryjacket_navy"
	item_state = "militaryjacket_navy"

/obj/item/clothing/suit/storage/miljacket/tan
	name = "tan military jacket"
	desc = "A military canvas jacket in a sandy tan design."
	icon_state = "militaryjacket_tan"
	item_state = "militaryjacket_tan"

/obj/item/clothing/suit/storage/miljacket
	name = "white military jacket"
	desc = "A military canvas jacket in a white snow design."
	icon_state = "militaryjacket_white"
	item_state = "militaryjacket_white"

/obj/item/clothing/suit/storage/toggle/miljacket_soyfed
	name = "solfed military jacket"
	desc = "A military canvas jacket with old SolFed patches on it."
	icon_state = "militaryjacket_soyfed_open"
	item_state = "militaryjacket_soyfed_open"
	icon_open = "militaryjacket_soyfed_open"
	icon_closed = "militaryjacket_soyfed"

/obj/item/clothing/suit/storage/toggle/miljacket_marshal
	name = "Marshal jacket"
	desc = "A Resistant Marshal Coloured jacket with reflective yellow patches on it."
	armor_list = list(melee = 3, bullet = 3, energy = 3, bomb = 10, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	icon_state = "marshal_jacket"
	item_state = "marshal_jacket"
	icon_open = "marshal_jacket_open"
	icon_closed = "marshal_jacket"

/*Snowsuits*/

/obj/item/clothing/suit/storage/snowsuit
	name = "snowsuit"
	desc = "A special coat designed for cold environments."
	icon_state = "snowsuit"
	item_state_slots = list(slot_r_hand_str = "labcoat", slot_l_hand_str = "labcoat")
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor_list = list(melee = 0, bullet = 0,energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/suit/storage/snowsuit/command
	name = "command snowsuit"
	desc = "A special command coat designed for cold environments."
	icon_state = "snowsuit_command"

/obj/item/clothing/suit/storage/snowsuit/security
	name = "security snowsuit"
	desc = "A special security coat designed for cold environments."
	icon_state = "snowsuit_security"

/obj/item/clothing/suit/storage/snowsuit/medical
	name = "medical snowsuit"
	desc = "A special medical coat designed for cold environments."
	icon_state = "snowsuit_medical"

/obj/item/clothing/suit/storage/snowsuit/engineering
	name = "guild snowsuit"
	desc = "A special technomancer coat designed for cold environments."
	icon_state = "snowsuit_engineering"

/obj/item/clothing/suit/storage/snowsuit/cargo
	name = "lonestar snowsuit"
	desc = "A special guild coat designed for cold environments."
	icon_state = "snowsuit_cargo"

/obj/item/clothing/suit/storage/snowsuit/science
	name = "science snowsuit"
	desc = "A special science coat designed for cold environments."
	icon_state = "snowsuit_science"

/*Sport Jackets*/

/obj/item/clothing/suit/storage/toggle/track/trackblack
	name = "black track jacket"
	desc = "An athletic black track jacket."
	icon_state = "trackjacket"
	item_state = "trackjacket"
	icon_open = "trackjacket_open"
	icon_closed = "trackjacket"

/obj/item/clothing/suit/storage/toggle/track/trackblue
	name = "blue track jacket"
	desc = "An athletic blue track jacket."
	icon_state = "trackjacketblue"
	item_state = "trackjacketblue"
	icon_open = "trackjacketblue_open"
	icon_closed = "trackjacketblue"

/obj/item/clothing/suit/storage/toggle/track/trackgreen
	name = "green track jacket"
	desc = "An athletic green track jacket."
	icon_state = "trackjacketgreen"
	item_state = "trackjacketgreen"
	icon_open = "trackjacketgreen_open"
	icon_closed = "trackjacketgreen"

/obj/item/clothing/suit/storage/toggle/track/trackred
	name = "red track jacket"
	desc = "An athletic red track jacket."
	icon_state = "trackjacketred"
	item_state = "trackjacketred"
	icon_open = "trackjacketred_open"
	icon_closed = "trackjacketred"

/obj/item/clothing/suit/storage/toggle/track/trackwhite
	name = "white track jacket"
	desc = "An athletic white track jacket."
	icon_state = "trackjacketwhite"
	item_state = "trackjacketwhite"
	icon_open = "trackjacketwhite_open"
	icon_closed = "trackjacketwhite"

/obj/item/clothing/suit/storage/toggle/track/varsityblack
	name = "black varsity jacket"
	desc = "A sporty letterman jacket with a black design."
	icon_state = "varsity"
	item_state = "varsity"

/obj/item/clothing/suit/storage/toggle/track/varsityblue
	name = "blue varsity jacket"
	desc = "A sporty letterman jacket with a blue design."
	icon_state = "varsity_blue"
	item_state = "varsity_blue"

/obj/item/clothing/suit/storage/toggle/track/varsitybrown
	name = "brown varsity jacket"
	desc = "A sporty letterman jacket with a brown design."
	icon_state = "varsity_brown"
	item_state = "varsity_brown"

/obj/item/clothing/suit/storage/toggle/track/varsitygreen
	name = "green varsity jacket"
	desc = "A sporty letterman jacket with a green design."
	icon_state = "varsity_green"
	item_state = "varsity_green"

/obj/item/clothing/suit/storage/toggle/track/varsitypink
	name = "pink varsity jacket"
	desc = "A sporty letterman jacket with a pink design."
	icon_state = "varsity_pink"
	item_state = "varsity_pink"

/obj/item/clothing/suit/storage/toggle/track/varsitypurple
	name = "purple varsity jacket"
	desc = "A sporty letterman jacket with a purple design."
	icon_state = "varsity_purple"
	item_state = "varsity_purple"

/obj/item/clothing/suit/storage/toggle/track
	name = "red varsity jacket"
	desc = "A sporty letterman jacket with a red design."
	icon_state = "varsity_red"
	item_state = "varsity_red"

/*Jackets*/

/obj/item/clothing/suit/storage/toggle/leather/blackjacket
	name = "black leather jacket"
	desc = "A sturdy black jacket made out of synthetic leather."
	icon_state = "leather_jacket2"
	item_state = "leather_jacket2"
	icon_open = "leather_jacket2_open"
	icon_closed = "leather_jacket2"

/obj/item/clothing/suit/storage/toggle/leather/blackvest
	name = "black leather vest"
	desc = "A sturdy black leather vest made out of synthetic leather."
	icon_state = "leather_jacket_sleeveless"
	item_state = "leather_jacket_sleeveless"
	icon_open = "leather_jacket_sleeveless_open"
	icon_closed = "leather_jacket_sleeveless"

/obj/item/clothing/suit/storage/toggle/leather/brownjacket
	name = "brown leather jacket"
	desc = "A sturdy brown jacket made out of synthetic leather."
	icon_state = "brown_jacket"
	item_state = "brown_jacket"
	icon_open = "brown_jacket_open"
	icon_closed = "brown_jacket"

/obj/item/clothing/suit/storage/toggle/leather/brownvest
	name = "brown leather vest"
	desc = "A sturdy brown vest made out of synthetic leather."
	icon_state = "brown_jacket_sleeveless"
	item_state = "brown_jacket_sleeveless"
	icon_open = "brown_jacket_sleeveless_open"
	icon_closed = "brown_jacket_sleeveless"

/obj/item/clothing/suit/storage/toggle/leather/cyberpunk
	name = "cyberpunk jacket"
	desc = "A sleek overcoat made of neo-laminated fabric."
	icon_state = "cyberpunksleek"
	item_state = "cyberpunksleek"

/obj/item/clothing/suit/storage/toggle/leather/cyberpunk/black
	name = "black cyberpunk jacket"
	desc = "A sleek overcoat made of neo-laminated fabric."
	icon_state = "cyberpunksleek_black"
	item_state = "cyberpunksleek_black"

/obj/item/clothing/suit/storage/toggle/leather/cyberpunk/white
	name = "white cyberpunk jacket"
	desc = "A sleek overcoat made of neo-laminated fabric."
	icon_state = "cyberpunksleek_white"
	item_state = "cyberpunksleek_white"

/obj/item/clothing/suit/storage/toggle/leather/cyberpunk/green
	name = "green cyberpunk jacket"
	desc = "A sleek overcoat made of neo-laminated fabric."
	icon_state = "cyberpunksleek_green"
	item_state = "cyberpunksleek_green"

/obj/item/clothing/suit/storage/toggle/leather/drive
	name = "drive jacket"
	desc = "The perfect coat for driving fast and killing faster."
	icon_state = "drive_jacket"
	item_state = "drive_jacket"

/obj/item/clothing/suit/storage/toggle/leather/violetjacket
	name = "violet jacket"
	desc = "The perfect coat for driving fast and killing faster, this one is in stylish violet."
	icon_state = "violet_jacket"
	item_state = "violet_jacket"

/obj/item/clothing/suit/storage/toggle/leather/tunnelsnake
	name = "snake jacket"
	desc = "You know wearing this makes you RULE!"
	icon_state = "tunnelsnake"
	item_state = "tunnelsnake"

/obj/item/clothing/suit/storage/toggle/leather/denimjacket
	name = "denim jacket"
	desc = "A smart blue jacket made out of denim."
	icon_state = "denim_jacket"
	item_state = "denim_jacket"
	icon_open = "denim_jacket_open"
	icon_closed = "denim_jacket"

/obj/item/clothing/suit/storage/toggle/leather/denimjacket/outlaw
	name = "biker outlaw's denim jacket"
	desc = "A raggedy denim jacket with a tied up red handkerchief. It lacks slits to button it up."
	icon_state = "outlaw"
	item_state = "outlaw"

/obj/item/clothing/suit/storage/toggle/leather/denimvest
	name = "denim vest"
	desc = "A smart blue vest made out of denim"
	icon_state = "denim_jacket_sleeveless"
	item_state = "denim_jacket_sleeveless"
	icon_open = "denim_jacket_sleeveless_open"
	icon_closed = "denim_jacket_sleeveless"

/obj/item/clothing/suit/storage/toggle/leather
	name = "grey leather jacket"
	desc = "A sturdy grey jacket made out of synthetic leather."
	icon_state = "leather_jacket"
	item_state = "leather_jacket"
	armor_list = list(melee = 1, bullet = 1, energy = 1, bomb = 0, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	siemens_coefficient = 0.7
	price_tag = 80

/obj/item/clothing/suit/storage/toggle/leather/midriff
	name = "Midriff leather jacket"
	desc = "A not so sturdy jacket made of synthetic leather. Some hooligan has devestated this one by cutting it the midrif and sewing zippers into the sleeves. Hardly covers anything."
	icon_state = "midriff_leather"
	item_state = "midriff_leather"
	icon_open = "midriff_leather_open"
	icon_closed = "midriff_leather"
	armor_list = list(melee = 1, bullet = 1, energy = 1, bomb = 0, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/leather/bikermidriff
	name = "midriff bikers jacket"
	desc = "A stylish, midriff jacket made of synthetic leather. Red inner padding and thick layers, it'd be a great jacket for cruising down the road; If not for the length"
	icon_state = "bikermidriff"
	item_state = "bikermidriff"
	armor_list = list(melee = 1, bullet = 1, energy = 1, bomb = 0, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/leather/bikermidriff/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Sleeves down, open"] = "bikermidriff"
	options["Sleeves down, closed"] = "bikermidriff_closed_s"
	options["Sleeves up, open"] = "bikermidriff_r_s"
	options["Sleeves up, closed"] = "bikermidriff_r_closed_s"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/suit/storage/texan
	name = "ivory texan jacket"
	desc = "A jacket fit for a Plasma magnate of southern origin. Yeehaw!" // Now you only need a comically large white top hat.
	icon_state = "texan_jacket"
	item_state = "texan_jacket"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/*Flannel Shirts*/

/obj/item/clothing/suit/storage/toggle/flannel/aqua
	name = "aqua flannel shirt"
	desc = "A comfy flannel shirt with a aqua design."
	icon_state = "flannel_aqua"
	item_state = "flannel_aqua"
	icon_open = "flannel_aqua_open"
	icon_closed = "flannel_aqua"

/obj/item/clothing/suit/storage/toggle/flannel/black
	name = "black flannel shirt"
	desc = "A comfy flannel shirt with a black design."
	icon_state = "flannel_black"
	item_state = "flannel_black"
	icon_open = "flannel_black_open"
	icon_closed = "flannel_black"

/obj/item/clothing/suit/storage/toggle/flannel/brown
	name = "brown flannel shirt"
	desc = "A comfy flannel shirt with a brown design."
	icon_state = "flannel_brown"
	item_state = "flannel_brown"
	icon_open = "flannel_brown_open"
	icon_closed = "flannel_brown"

/obj/item/clothing/suit/storage/toggle/flannel/blue
	name = "blue flannel shirt"
	desc = "A comfy flannel shirt with a blue design."
	icon_state = "flannel_blue"
	item_state = "flannel_blue"
	icon_open = "flannel_blue_open"
	icon_closed = "flannel_blue"

/obj/item/clothing/suit/storage/toggle/flannel
	name = "red flannel shirt"
	desc = "A comfy flannel shirt with a red design."
	icon_state = "flannel_red"
	item_state = "flannel_red"
	icon_open = "flannel_red_open"
	icon_closed = "flannel_red"

/*Hoodies*/

/obj/item/clothing/suit/storage/toggle/hoodie/black
	name = "black hoodie"
	desc = "A warm, black sweatshirt."
	icon_state = "black_hoodie"
	item_state = "black_hoodie"
	icon_open = "black_hoodie_open"
	icon_closed = "black_hoodie"

/obj/item/clothing/suit/storage/toggle/hoodie/blue
	name = "blue hoodie"
	desc = "A warm, blue sweatshirt."
	icon_state = "blue_hoodie"
	item_state = "blue_hoodie"
	icon_open = "blue_hoodie_open"
	icon_closed = "blue_hoodie"

/obj/item/clothing/suit/storage/toggle/hoodie/green
	name = "green hoodie"
	desc = "A warm, green sweatshirt."
	icon_state = "green_hoodie"
	item_state = "green_hoodie"
	icon_open = "green_hoodie_open"
	icon_closed = "green_hoodie"

/obj/item/clothing/suit/storage/toggle/hoodie/grey
	name = "grey hoodie"
	desc = "A warm, grey sweatshirt."
	icon_state = "grey_hoodie"
	item_state = "grey_hoodie"
	icon_open = "grey_hoodie_open"
	icon_closed = "grey_hoodie"

/obj/item/clothing/suit/storage/toggle/hoodie/orange
	name = "orange hoodie"
	desc = "A warm, orange sweatshirt."
	icon_state = "orange_hoodie"
	item_state = "orange_hoodie"
	icon_open = "orange_hoodie_open"
	icon_closed = "orange_hoodie"

/obj/item/clothing/suit/storage/toggle/hoodie/red
	name = "red hoodie"
	desc = "A warm, red sweatshirt."
	icon_state = "red_hoodie"
	item_state = "red_hoodie"
	icon_open = "red_hoodie_open"
	icon_closed = "red_hoodie"

/obj/item/clothing/suit/storage/toggle/hoodie
	name = "yellow hoodie"
	desc = "A warm, yellow sweatshirt."
	icon_state = "yellow_hoodie"
	item_state = "yellow_hoodie"
	icon_open = "yellow_hoodie_open"
	icon_closed = "yellow_hoodie"
	min_cold_protection_temperature = T0C - 20
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/absolutehoodie
	name = "absolutist hoodie"
	desc = "A cotton black hoodie that's just a size too big. Very comfy."
	icon_state = "absolutehoodie"
	item_state = "absolutehoodie"
	armor_list = list(
		melee = 1,
		bullet = 1,
		energy = 1,
		bomb = 0,
		bio = 100,
		rad = 0)
	min_cold_protection_temperature = T0C - 20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/*Peacoat*/

obj/item/clothing/suit/storage/toggle/peacoat
	name = "peacoat"
	desc = "A well-tailored, stylish peacoat."
	icon_state = "peacoat"
	item_state = "peacoat"
	icon_open = "peacoat_open"
	icon_closed = "peacoat"

/*Jackets*/

/obj/item/clothing/suit/storage/toggle/bomber/ace
	name = "ace bomber jacket"
	desc = "A thick blue leather bomber jacket."
	icon_state = "pilot_bomber"
	item_state_slots = list(slot_r_hand_str = "brown_jacket", slot_l_hand_str = "brown_jacket")
	icon_open = "pilot_bomber_open"
	icon_closed = "pilot_bomber"

/obj/item/clothing/suit/storage/toggle/bomber/classic
	name = "classic bomber jacket"
	desc = "A thick leather bomber jacket. this one appears to have zippers on the sleeves, allowing them to be rolled up"
	icon_state = "nu_bomber"
	icon_open = "nu_bomber_open"
	icon_closed = "nu_bomber"

/obj/item/clothing/suit/storage/toggle/bomber/navigator
	name = "navigator bomber jacket"
	desc = "A thick, well-worn leather bomber jacket."
	icon_state = "bomberjacket_new"
	icon_open = null
	icon_closed = null

/obj/item/clothing/suit/storage/toggle/bomber/orange
	name = "orange bomber jacket"
	desc = "A cozy jacket in supply's colors. Show your department pride!"
	icon_state = "supply_dep_jacket"
	item_state = "supply_dep_jacket"
	icon_open = "supply_dep_jacket_open"
	icon_closed = "supply_dep_jacket"

/obj/item/clothing/suit/storage/toggle/bomber/purple
	name = "purple bomber jacket"
	desc = "A cozy jacket in science's colors. Show your department pride!"
	icon_state = "sci_dep_jacket"
	item_state = "sci_dep_jacket"
	icon_open = "sci_dep_jacket_open"
	icon_closed = "sci_dep_jacket"

/obj/item/clothing/suit/storage/toggle/bomber/red
	name = "red bomber jacket"
	desc = "A cozy jacket in security's colors. Show your department pride!"
	icon_state = "sec_dep_jacket"
	item_state = "sec_dep_jacket"
	icon_open = "sec_dep_jacket_open"
	icon_closed = "sec_dep_jacket"

/obj/item/clothing/suit/storage/toggle/bomber/scout
	name = "scout bomber jacket"
	desc = "A thick brown leather bomber jacket."
	icon_state = "bomber"
	item_state = "bomber"
	icon_open = "bomber_open"
	icon_closed = "bomber"

/obj/item/clothing/suit/storage/toggle/bomber/white
	name = "white bomber jacket"
	desc = "A cozy jacket in medical's colors. Show your department pride!"
	icon_state = "med_dep_jacket"
	item_state = "med_dep_jacket"
	icon_open = "med_dep_jacket_open"
	icon_closed = "med_dep_jacket"

/obj/item/clothing/suit/storage/toggle/bomber
	name = "yellow bomber jacket"
	desc = "A cozy jacket in engineering's colors. Show your department pride!"
	icon_state = "engi_dep_jacket"
	item_state = "engi_dep_jacket"
	icon_open = "engi_dep_jacket_open"
	icon_closed = "engi_dep_jacket"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7

/obj/item/clothing/suit/storage/aerostatic_bomber_jacket
	name = "red bomber jacket"
	desc = "A red bomber jacket that looks like its seen better days."
	icon_state = "aerostatic_bomber_jacket"
	item_state = "aerostatic_bomber_jacket"
	armor_list = list(
		melee = 1,
		bullet = 1,
		energy = 0,
		bomb = 5,
		bio = 30,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7

/obj/item/clothing/suit/storage/jamrock_blazer
	name = "jamrock blazer"
	desc = "A green blazer that looks perfect for a disco party."
	icon_state = "jamrock_blazer"
	item_state = "jamrock_blazer"
	armor_list = list(
		melee = 1,
		bullet = 1,
		energy = 0,
		bomb = 5,
		bio = 30,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7

/obj/item/clothing/suit/storage/tojo
	name = "Mad dog jacket" // KIRYU-CHAAAAN!~
	desc = "Go have fun, and live crazier than anyone else."
	icon_state = "tojojacket"
	item_state = "tojojacket"
	armor_list = list(
		melee = 1,
		bullet = 1,
		energy = 1,
		bomb = 0,
		bio = 0,
		rad = 0)

/obj/item/clothing/suit/storage/puffy

/*Helltaker drip - Seb*/
/obj/item/clothing/suit/storage/wcoat/helltaker // Refactoring waistcoat stats into this one as it's meant to be more a worn suit than an attachable waistcoat. - Seb
	name = "charming waistcoat"
	desc = "A feminine waistcoat that accentuates one's curves, to be worn with a dapper suit." // Now you can also be Malinka and Cerberus. - Seb
	icon_state = "hellvest"
	item_state = "hellvest"
	item_state_slots = list(slot_r_hand_str = "wcoat", slot_l_hand_str = "wcoat")
	armor_list = list(melee = 0, bullet = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	slot_flags = SLOT_OCLOTHING
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	siemens_coefficient = 0.9

/obj/item/clothing/suit/storage/helltaker_apron // Get your Helltaker apron. - Seb
	name = "lonestar black apron"
	desc = "Make them chocolate pancakes. Demon girls love chocolate pancakes."
	icon_state = "nalesnik" // Polish pancakes.
	item_state = "nalesnik"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	price_tag = 50

//Sweaters.
obj/item/clothing/suit/sweater/blue
	name = "blue sweater"
	desc = "A warm knit sweater in light blue."
	icon_state = "sweater_blue"

/obj/item/clothing/suit/sweater/darkblue
	name = "dark blue sweater"
	desc = "A warm knit sweater in dark blue."
	icon_state = "sweater_nt"

/obj/item/clothing/suit/sweater/grey
	name = "grey sweater"
	desc = "A warm knit sweater in grey."
	icon_state = "sweater"

/obj/item/clothing/suit/sweater/heart
	name = "heart sweater"
	desc = "A warm knit sweater in light blue with a big heart."
	icon_state = "sweater_blueheart"

/obj/item/clothing/suit/sweater/keyhole
	name = "keyhole sweater"
	desc = "A lavender sweater with an open chest."
	icon_state = "keyholesweater"

/obj/item/clothing/suit/sweater/mint
	name = "mint sweater"
	desc = "A warm knit sweater with a minty tint."
	icon_state = "sweater_mint"

/obj/item/clothing/suit/sweater/pink
	name = "pink sweater"
	desc = "A warm knit sweater in pink."
	icon_state = "sweater_pink"

/obj/item/clothing/suit/sweater/blackneck
	name = "black sweater"
	desc = "A tight sweater in black."
	icon_state = "turtleneck_black"

/obj/item/clothing/suit/sweater
	name = "christmas sweater"
	desc = "A very festive holiday sweater."
	icon_state = "turtleneck_winterred"
	slot_flags = SLOT_OCLOTHING
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	siemens_coefficient = 0.9

//Makeshift chest rig.
/obj/item/clothing/suit/storage/vest/chestrig
	name = "makeshift chest rig"
	desc = "A makeshift chest rig made for carrying some stuff. Can carry eight small items. Has little protective value."
	icon_state = "mchestrig"
	item_state = "mchestrig"
	armor_list = list(
		melee = 2,
		bullet = 1,
		energy = 1,
		bomb = 5,
		bio = 5,
		rad = 0
	)

/obj/item/clothing/suit/storage/vest/chestrig/New()
	..()
	pockets = new/obj/item/storage/internal(src)
	pockets.storage_slots = 8
	pockets.max_w_class = ITEM_SIZE_SMALL
	pockets.max_storage_space = 16
	pockets.cant_hold |= list(/obj/item/tool_upgrade/armor) //Prevents a bug

/*Suit Jackets*/
/obj/item/clothing/suit/storage/suitjacket/black
	name = "black buttoned suit jacket"
	desc = "A snappy black suit jacket with buttons."
	icon_state = "ia_jacket" // This one barely looks any different than the charcoal one.
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/blue
	name = "blue suit jacket"
	desc = "A snappy blue suit jacket."
	icon_state = "suitjacket_blue"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/burgundy
	name = "burgundy suit jacket"
	desc = "A snappy burgundy suit jacket."
	icon_state = "burgundy_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/charcoal
	name = "charcoal suit jacket"
	desc = "A snappy charcoal suit jacket."
	icon_state = "charcoal_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/checkered
	name = "checkered suit jacket"
	desc = "A snappy checkered suit jacket."
	icon_state = "checkered_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/green
	name = "green suit jacket"
	desc = "A snappy green suit jacket."
	icon_state = "suitjacket_green"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/navy
	name = "dark navy jacket"
	desc = "A snappy dark navy jacket."
	icon_state = "navy_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/purple
	name = "purple suit jacket"
	desc = "A snappy purple suit jacket."
	icon_state = "suitjacket_purp"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket
	name = "tan suit jacket"
	desc = "A snappy tan suit jacket."
	icon_state = "tan_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/pink
	name = "pink suit jacket"
	desc = "A snappy pink suit jacket."
	icon_state = "pink_suitjacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/olive
	name = "olive suit jacket"
	desc = "A snappy olive suit jacket."
	icon_state = "olive_suitjacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/navyjacket
	name = "navy suit jacket"
	desc = "A snappy navy suit jacket."
	icon_state = "navy_suitjacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/cream
	name = "cream suit jacket"
	desc = "A snappy cream suit jacket."
	icon_state = "cream_suitjacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/brown
	name = "brown suit jacket"
	desc = "A snappy brown suit jacket."
	icon_state = "brown_suitjacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/grey
	name = "grey suit jacket"
	desc = "A snappy grey suit jacket."
	icon_state = "grey_suitjacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/blackjacket
	name = "black suit jacket"
	desc = "A snappy black suit jacket."
	icon_state = "black_suitjacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/helltaker
	name = "white suit jacket"
	desc = "A stylish, opened white suit jacket with a red flower on it. Dapper enough to impress demon girls." // The OG Helltaker jacket drip is here. - Seb
	icon_state = "white_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/skylight_coat
	name = "skylight overcoat"
	desc = "A sleek black coat worn by those of now known as Skylight Services, once a group with malicious dealings and business practices, now partially reformed under new management of Lonestar. This overcoat seems like it could easily hide an old school submachine gun."
	icon_state = "skylight_coat_open"
	item_state = "skylight_coat_open"
	armor_list = list(
		melee = 5,
		bullet = 5,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/skylight_coat/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Overcoat open"] = "skylight_coat_open"
	options["Overcoat closed"] = "skylight_coat"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/storage/suitjacket/helltaker/black
	name = "devilish black suit jacket"
	desc = "A stylish, opened black suit jacket with adjustable styles."
	icon_state = "helljacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/helltaker/black/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["default"] = "helljacket"
	options["default, buttoned"] = "helljacket_closed"
	options["S & M combo"] = "pandemonium"
	options["draped over"] = "justicedrip"

	var/choice = input(M,"What kind of style do you want to change to?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You adjusted your jacket's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/storage/suitjacket/longcardigan_brown
	name = "long cardigan brown coat"
	desc = "A large brown cardigan coat. Has nice, deep pockets for keeping your hands warm."
	icon_state = "longcardigan_brown_m"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/longcardigan_brown/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["default"] = "longcardigan_brown_m"
	options["female alt"] = "longcardigan_brown_f"

	var/choice = input(M,"What kind of style do you want to change to?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You adjusted your jacket's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/storage/suitjacket/shortcardigan_blueandbrown
	name = "blue cardigan coat"
	desc = "A blue-brown cardigan coat. Has nice pockets and added shades of brown for contrast."
	icon_state = "longcardigan_blue"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/shortcardigan_blueandbrown/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["default"] = "longcardigan_blue"
	options["default open"] = "longcardigan_blue_open"
	options["dark blue"] = "longcardigan_blue_alt"
	options["dark brown open"] = "longcardigan_blue_alt_open"

	var/choice = input(M,"What kind of style do you want to change to?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You adjusted your jacket's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/storage/suitjacket/haori
	name = "haori"
	desc = "A black formal japanese jacket meant to be worn over a kimono, usually by men."
	item_state = "haori"
	icon_state = "haori"

/obj/item/clothing/suit/storage/suitjacket/scav
	name = "frontier jacket"
	desc = "A rough make jacket, patched together from a variety of tough cloth, \
	the fabric holds up well against wear and tear. Made first by several sewing inclined \
	Prospectors in order to avoid cuts and scraps while out in the field, \
	the design soon found itself spread throughout the colony."
	icon_state = "scav_jacket"
	item_state = "scav_jacket"

/obj/item/clothing/suit/storage/suitjacket/trenchcoat
	name = "noir trenchcoat"
	desc = "A long and rugged black trenchcoat, the perfect complement for your film noir ensemble. \n All you need now is a smoke, a whiskey, unlimited ammo and a license to kill." // Max Payne reference.
	icon_state = "black_trench"
	item_state = "black_trench"
	armor_list = list(melee = 1, bullet = 1, energy = 1, bomb = 0, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/storage/suitjacket/livesey // The word Rum and the word Death should mean the same to you. - Seb
	name = "Naval Surgeon jacket"
	desc = "An archaic, green jacket meant for a naval surgeon to dress formally while still being on duty."
	icon_state = "livesey"
	item_state = "livesey"
	armor_list = list(
		melee = 2,
		bullet = 1,
		energy = 1,
		bomb = 0,
		bio = 10,
		rad = 0
	)

/obj/item/clothing/suit/storage/boxer_jacket //I shoulda never smoked that shit now I'm overthrowing the soviet government
	name = "Boxer jacket"
	desc = "Uppercut their heads off."
	icon_state = "boxer_jacket"
	item_state = "boxer_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/rando
	name = "army leader outfit"
	desc = "A menacing, imposing costume of a warlord from a post-apocalyptic gang."
	icon_state = "warlord"
	item_state = "warlord"

/obj/item/clothing/suit/storage/rando/verb/toggle_style()
	set name = "Adjust Costume"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["We d-don't need to f-fight..."] = "warlord"
	options["..."] = "warlord_open"

	var/choice = input(M,"W-what kind of s-style do you w-want?","Adjust Costume") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "Y-you adjusted your o-outfit's s-style. [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//stupid sexy eris snowflakecode jacket.
/obj/item/clothing/suit/storage/solo
	name = "punk jacket"
	desc = "Authentic leather for an authentic punk."
	icon_state = "punk_highlight" //credits to Eris for the sprites

/obj/item/clothing/suit/storage/leather_jacket/punk/New(loc, jacket_type = "punk_highlight", logo_type, is_natural_spawn = TRUE)
	..()
	if(is_natural_spawn) // From junk pile or some such
		logo_type = pick(list(
			null, null, null, null, // 50% chance of not having any logo
			"punk_over_valentinos",
			"punk_over_samurai",
			"punk_over_jager_roach",
			"punk_over_tunnel_snakes"
		))
		jacket_type = pick(list(
			"punk_bright",
			"punk_dark",
			"punk_highlight"
		))

	if(logo_type)
		var/obj/item/clothing/accessory/logo/logo = new
		logo.icon_state = logo_type
		accessories += logo
		logo.has_suit = src
		loc = src
		switch(logo_type) // All of the following names associated with some group of people, thus capitalized
			if("punk_over_valentinos")
				name = "Valentinos jacket"
			if("punk_over_samurai")
				name = "Samurai jacket"
			if("punk_over_jager_roach")
				name = "Jager Roaches jacket"
			if("punk_over_tunnel_snakes")
				name = "Tunnel Snakes jacket"

	icon_state = jacket_type
	update_icon()
