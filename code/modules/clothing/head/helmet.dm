/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard operator gear. Protects the head from impacts."
	icon_state = "helmet"
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet",
		)
	item_flags = THICKMATERIAL
	body_parts_covered = HEAD | EARS
	armor = list(
		melee = 35,
		bullet = 25,
		energy = 20,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 1

//Blackshield helmets
/obj/item/clothing/head/helmet/ballistic
	name = "ballistic helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel."
	icon_state = "helmet_mil"
	armor = list(melee = 30, bullet = 45,energy = 20, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/head/helmet/ballistic/militia
	name = "blackshield helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel.\
			This one bears the IFF stripes of the Blackshield."
	icon_state = "helmet_mil_alt"

/obj/item/clothing/head/helmet/ballistic/green
	name = "green ballistic helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel.\
			Some folks are born to kill."
	icon_state = "helmet_green"

/obj/item/clothing/head/helmet/ballistic/tan
	name = "tan ballistic helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel.\
			Smells like sweat."
	icon_state = "helmet_tan"

/obj/item/clothing/head/helmet/botanist
	name = "botanist hood"
	desc = "Don't want anything getting in your eyes."
	icon_state = "botanist"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor = list(melee = 30, bullet = 20, energy = 20, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/botanist/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["botanist default"] = "botanist"
	options["cosine men yoroi lens"] = "cosine_men_yoroi"
	options["cosine men yoroi lensless"] = "cosine_men_yoroi_switched"
	options["cosine men yoroi round lens"] = "cosine_men_yoroi_weeaboomode"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/acolyte
	name = "vector hood"
	desc = "Even the most devout deserve head protection."
	icon_state = "acolyte"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor = list(melee = 30, bullet = 20, energy = 20, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/acolyte/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["vector default"] = "acolyte"
	options["tangent ridge helmet"] = "tangent_ridge_helmet_switched"
	options["tangent ridge helmet open"] = "tangent_ridge_helmet"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/rosaria
	name = "rosaria great helm"
	desc = "The rosaria protects. Deus Vult."
	icon_state = "rosaria_helm"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor = list(melee = 30, bullet = 30, energy = 30, bomb = 50, bio = 100, rad = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 4, MATERIAL_GLASS = 5, MATERIAL_GOLD = 5)

/obj/item/clothing/head/helmet/prime
	name = "prime hood"
	desc = "A visored helmet with a cloth hood covering it."
	icon_state = "prime"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor = list(melee = 30, bullet = 30, energy = 30, bomb = 50, bio = 100, rad = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 4, MATERIAL_GLASS = 5, MATERIAL_GOLD = 5)

/obj/item/clothing/head/helmet/custodian
	name = "custodian helmet"
	desc = "Cleaning floors is more dangerous than it looks."
	icon_state = "custodian"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor = list(melee = 30, bullet = 20, energy = 20, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/custodian/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["default custodian helmet"] = "custodian"
	options["sine cornette"] = "sine_cornette"
	options["sine cornette switched"] = "sine_cornette_switched"
	options["sine cornette switched alternative"] = "sine_cornette_switched_alternative"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/huntmaster_helmet
	name = "Huntmaster Nomad Helm"
	desc = "Made from the hide of a render patriarch, this visored helmet made of bone and leather with glass lenses to keep blood and grit from the eyes. \
			There is a small chimera etched into the bone on the rear of the helmet."
	item_state = "huntmaster_helmet"
	icon_state = "huntmaster_helmet"
	armor = list(
		melee = 60,
		bullet = 20,
		energy = 15,
		bomb = 15,
		bio = 15,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/huntmaster_helmet/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["huntmaster horned nomad helm"] = "huntmaster_helmet"
	options["huntmaster horned helm long snout"] = "huntmaster_helmet_alt"
	options["huntmaster hornless nomad helm"] = "huntmaster_helmet_hornless"
	options["huntmaster hornless helm long snout"] = "huntmaster_helmet_hornless_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/hunter
	name = "hunter's hood"
	desc = "A visored helmet made of bone and leather with glass lenses to keep blood and grit from the eyes."
	item_state = "hunter_helmet"
	icon_state = "hunter_helmet"
	armor = list(
		melee = 60,
		bullet = 10,
		energy = 5,
		bomb = 0,
		bio = 10,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/hunter/stalker
	item_state = "hunter_helmet_stalker"
	icon_state = "hunter_helmet_stalker"

/obj/item/clothing/head/helmet/hunter/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["combat helmet"] = "hunter_helmet"
	options["stalker hood"] = "hunter_helmet_stalker"
	options["visored helmet"] = "hunter_helmet_visor"
	options["nomad hooded-helm"] = "hunter_helmet_nomad"
	options["nomad helm long snout"] = "hunter_helmet_nomad_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/generic_full
	name = "full helmet"
	desc = "A generic non-branded full cover helmet with decent all round protection."
	icon_state = "helmet_full"
	armor = list(melee = 30, bullet = 30, energy = 30, bomb = 25, bio = 10, rad = 10)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/foreman
	name = "salvaged helmet"
	desc = "A helmet patched together by Prospector Salvagers, light and easy to breath in, \
	the helmet has a few bells and whistles, a set of inbuilt goggles to keep dust and blood out of ones eyes, \
	salvaged Greyson material coating it's outside it offer superb protection, and even a inbuilt radio. \
	Tragically the scav incharge of the radio was unable to tune it or turn it on."
	icon_state = "forehead_helmet"
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 23, MATERIAL_PLATINUM  = 8, MATERIAL_STEEL = 30, MATERIAL_SILVER = 12) //worth stealing
	price_tag = 1200
	armor = list(
		melee = 40,
		bullet = 30,
		energy = 30,
		bomb = 65,
		bio = 100,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	flash_protection = FLASH_PROTECTION_MAJOR
	action_button_name = "Toggle Headlamp"
	light_overlay = "technohelmet_light"
	brightness_on = 5 //Slightly better do to the sear costs

/obj/item/clothing/head/helmet/foreman/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["salvaged helmet"] = "forehead_helmet"
	options["alt salvaged helmet"] = "alt_scavenger_helmet"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/technomancersuit
	name = "'Mark V' environmental protection helmet"
	desc = "You feel like this helmet is rare, for some reason."
	icon_state = "technohelmet"
	armor = list(melee = 45, bullet = 45, energy = 40, bomb = 60, bio = 100, rad = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	flash_protection = FLASH_PROTECTION_MAJOR
	action_button_name = "Toggle Headlamp"
	light_overlay = "technohelmet_light"
	brightness_on = 4
	max_upgrades = 2

/obj/item/clothing/head/helmet/soteriasuit
	name = "'Mark II' environmental protection helmet"
	desc = "You feel like this helmet is cheap, for some reason."
	icon_state = "armor_engineering"
	armor = list(melee = 15, bullet = 15, energy = 25, bomb = 35, bio = 50, rad = 50)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	matter = list(MATERIAL_STEEL = 20)
	flash_protection = FLASH_PROTECTION_MODERATE
	max_upgrades = 2

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "These are often used by highly trained SWAT Members."
	icon_state = "swat"
	armor = list(melee = 80, bullet = 60, energy = 40, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150

/obj/item/clothing/head/armor/helmet/tanker
	name = "black tanker helmet"
	desc = "Protects the head from damage while you are in a mech or joy riding the cargo trolley."
	icon_state = "tanker_helmet"
	item_flags = THICKMATERIAL
	flags_inv = HIDEEARS|BLOCKHAIR
	siemens_coefficient = 1
	price_tag = 160
	armor = list(
		melee = 15,
		bullet = 15,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/armor/helmet/tanker/green
	name = "green tanker helmet"
	icon_state = "tanker_helmet_green"

/obj/item/clothing/head/armor/helmet/tanker/brown
	name = "brown tanker helmet"
	icon_state = "tanker_helmet_brown"

/obj/item/clothing/head/armor/helmet/tanker/gray
	name = "gray tanker helmet"
	icon_state = "tanker_helmet_gray"

/obj/item/clothing/head/helmet/laserproof
	name = "ablative helmet"
	desc = "A helmet that excels in protecting the wearer against energy projectiles."
	icon_state = "ablative"
	armor = list(melee = 30, bullet = 30, energy = 75, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150

/obj/item/clothing/head/helmet/laserproof/iron_lock_security
	name = "outdated ablative helmet"
	desc = "A \"Iron Lock Security\" helmet that excels in protecting the wearer against energy projectiles this even after all these years still is the base of ablative helmet design. Produced by Greyson Positronic"
	icon_state = "ablative"
	armor = list(melee = 20, bullet = 20, energy = 70, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 10, MATERIAL_PLATINUM = 2) //cheaper
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150

/obj/item/clothing/head/helmet/mercenary
	name = "mercenary helmet"
	desc = "What happens when someone combines ablative, melee, and bullet plating in the form of a fetching tan and visor. Not as singularly powerful as each individually but the best all round protection one can get."
	icon_state = "merchelm"
	armor = list(melee = 55, bullet = 55, energy = 55, bomb = 45, bio = 0, rad = 0) // best what you can get

/obj/item/clothing/head/helmet/handmade
	name = "handmade combat helmet"
	desc = "It looks like it was made from a bucket and some steel. Uncomfortable and heavy but better than nothing."
	icon_state = "hm_helmet"
	armor = list(
		melee = 25,
		bullet = 10,
		energy = 20,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 75
	max_upgrades = 2

/obj/item/clothing/head/helmet/handmade/greathelm
	name = "bucket-helm"
	desc = "A bucket with two holes for eyes and some smaller ones for ventilation, with steel added to gain some protection. One may say, <i>'Situla Vult!'</i>."
	icon_state = "hm_greathelm"
	armor = list(melee = 27, bullet = 29,energy = 27, bomb = 3, bio = 1, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS|EYES
	siemens_coefficient = 0.6
	price_tag = 85

/obj/item/clothing/head/armor/helmet/penance
	name = "penance helmet"
	desc = "A primitive helmet with a chainmailed coif. These were quickly made for trench conditions as logistical supply lines ran low on proper ballistic helmets, issued to consripts, thiefs, and cowards alike. Even after they were replaced, thousands of these shitty iron caps can be found as macabre military surplus. For some reason, you've decided to wear this ghastly thing."
	icon_state = "helmet_kriosanpenace"
	flags_inv = BLOCKHAIR
	armor = list(
		melee = 15,
		bullet = 15,
		energy = 0,
		bomb = 10,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	siemens_coefficient = 1

// toggleable face guard
/obj/item/clothing/head/helmet/faceshield
	//We cant just use the armor var to store the original since initial(armor) will return a null pointer
	var/tint_up = TINT_NONE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHEADHAIR
	var/flags_inv_up = HIDEEARS
	body_parts_covered = HEAD|EARS|EYES|FACE
	var/body_parts_covered_up = HEAD|EARS
	flash_protection = FLASH_PROTECTION_MAJOR
	var/flash_protection_up = FLASH_PROTECTION_NONE
	action_button_name = "Flip Face Shield"
	tool_qualities = list()
	max_upgrades = 0
	var/up = FALSE


/obj/item/clothing/head/helmet/faceshield/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	armor_up = list(melee = 35, bullet = 25, energy = 25, bomb = 20, bio = 0, rad = 0)
	armor = list(melee = 40, bullet = 40, energy = 30, bomb = 35, bio = 0, rad = 0)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	price_tag = 150

/obj/item/clothing/head/helmet/faceshield/attack_self()
	toggle()

/obj/item/clothing/head/helmet/faceshield/update_icon()
	icon_state = up ? "[initial(icon_state)]_up" : initial(icon_state)

/obj/item/clothing/head/helmet/faceshield/refresh_upgrades()
	. = ..()
	if(up)
		armor = getArmor(arglist(armor_up))
		flash_protection = flash_protection_up
		tint = tint_up
		flags_inv = flags_inv_up
		body_parts_covered = body_parts_covered_up
	else
		flash_protection = initial(flash_protection)
		tint = initial(tint)
		flags_inv = initial(flags_inv)
		body_parts_covered = initial(body_parts_covered)

//I wanted to name it set_up() but some how I thought that would be misleading
/obj/item/clothing/head/helmet/faceshield/proc/set_is_up(is_up)
	if(up == is_up) return
	up = is_up

	refresh_upgrades()

	update_icon()
	update_wear_icon()	//update our mob overlays

/obj/item/clothing/head/helmet/faceshield/verb/toggle()
	set category = "Object"
	set name = "Adjust face shield"
	set src in usr

	if(!usr.incapacitated())
		src.set_is_up(!src.up)

		if(src.up)
			to_chat(usr, "You push the [src] up out of your face.")
		else
			to_chat(usr, "You flip the [src] down to protect your face.")

		usr.update_action_buttons()

/obj/item/clothing/head/helmet/faceshield/helmet_visor
	name = "marshal helmet"
	desc = "It's a helmet specifically designed for general police work. Comes with a visor face cover and extra padding for dealing with criminal scum in melee."
	icon_state = "helmet_visor"
	armor_up = list(melee = 35, bullet = 45,energy = 20, bomb = 25, bio = 0, rad = 0)
	armor = list(melee = 35, bullet = 45,energy = 20, bomb = 25, bio = 0, rad = 0)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	price_tag = 150

/obj/item/clothing/head/helmet/marshal_full
	name = "marshal full helmet"
	desc = "A full helmet with a built in glow visor. While a weak light its better than nothing and the full cover design makes it ideal for melee protection."
	icon_state = "ironhammer_full"
	armor = list(melee = 45, bullet = 40,energy = 15, bomb = 25, bio = 0, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	flash_protection = FLASH_PROTECTION_MAJOR
	action_button_name = "Toggle Headlamp"
	brightness_on = 4

/obj/item/clothing/head/helmet/marshal_full/update_icon()
	if(on)
		icon_state = "ironhammer_full_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	else
		icon_state = "ironhammer_full"
		set_light(0, 0)
	update_wear_icon()
	..()

/*
 * Special helmets with HUDs
 */
/obj/item/clothing/head/helmet/riot_hud
	name = "marshal riot helmet"
	desc = "Standard-issue marshal helmet with a basic HUD and targeting system included."
	icon_state = "light_riot"
	body_parts_covered = HEAD|FACE|EARS
	armor = list(
		melee = 75,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	flash_protection = FLASH_PROTECTION_MAJOR
	action_button_name = "Toggle Security Hud"
	var/obj/item/clothing/glasses/hud/security/hud
	price_tag = 300

/obj/item/clothing/head/helmet/riot_hud/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/riot_hud/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/riot_hud/verb/toggle()
	set name = "Toggle Security Hud"
	set desc = "Shows you jobs and criminal statuses"
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses))
			to_chat(user, "You enable security hud on [src].")
			update_icon()
	else
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(user, "You disable security hud on [src].")
		hud.forceMove(src)
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/riot_hud/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/riot_hud/update_icon()
	if(hud in src)
		icon_state = "light_riot"
		set_light(0, 0)
	else
		icon_state = "light_riot_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	update_wear_icon()
	..()

/obj/item/clothing/head/helmet/night_vision_helm
	name = "thermo-nightvision helmet"
	desc = "Written on the side is a garbled mess complaining about the alphabet-soup boys shooting the owners tannerite stuffed dog. Comes with a built in nuclear cell labeled 'fuck your roads'. An observant eye would notice the electrical equipment on this would be valued in the thousands while the helmet costs roughly twenty credits."
	icon_state = "nhelm"
	body_parts_covered = HEAD|FACE|EARS
	armor = list(
		melee = 20,
		bullet = 20,
		energy = 15,
		bomb = 25,
		bio = 0,
		rad = 0
	) //Low protection since it gives night vision with no battery.
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	flash_protection = FLASH_PROTECTION_MAJOR
	action_button_name = "Toggle Thermal Night-Vision HUD"
	var/obj/item/clothing/glasses/hud/security/jensenshades/hud
	price_tag = 2000

/obj/item/clothing/head/helmet/night_vision_helm/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/night_vision_helm/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/night_vision_helm/verb/toggle()
	set name = "Toggle Thermal Night-Vision HUD"
	set desc = "Lets you see in the dark and look tacticool."
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses))
			to_chat(user, "You enable the thermal night-vision HUD on [src].")
			update_icon()
	else
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(user, "You disable the thermal night-vision HUD on [src].")
		hud.forceMove(src)
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/night_vision_helm/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automatically retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/night_vision_helm/update_icon()
	if(hud in src)
		icon_state = "nhelm_up"
	else
		icon_state = "nhelm"
	update_wear_icon()
	..()

// S E R B I A //

/obj/item/clothing/head/helmet/steelpot
	name = "steelpot helmet"
	desc = "A titanium helmet of serbian origin. Still widely used despite being discontinued."
	icon_state = "steelpot"
	armor = list(melee = 35, bullet = 30, energy = 0, bomb = 30, bio = 0, rad = 0) // slightly buffed IHS helmet minus energy resistance
	flags_inv = BLOCKHEADHAIR
	body_parts_covered = HEAD|EARS
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/faceshield/altyn
	name = "altyn helmet"
	desc = "A titanium helmet of serbian origin. Still widely used despite being discontinued."
	icon_state = "altyn"
	armor_up = list(melee = 20, bullet = 15, energy = 0, bomb = 15, bio = 0, rad = 0)
	armor_down = list(melee = 40, bullet = 40, energy = 0, bomb = 35, bio = 0, rad = 0)
	siemens_coefficient = 1
	up = TRUE

/obj/item/clothing/head/helmet/faceshield/altyn/brown
	icon_state = "altyn_brown"

/obj/item/clothing/head/helmet/faceshield/altyn/black
	icon_state = "altyn_black"

/obj/item/clothing/head/helmet/faceshield/altyn/maska
	name = "maska helmet"
	desc = "\"I do not know who I am, I don\'t know why I\'m here. All I know is that I must kill.\""
	icon_state = "maska"
	armor_down = list(melee = 55, bullet = 55, energy = 0, bomb = 45, bio = 0, rad = 0) // best what you can get, unless you face lasers
	var/icon_swap_to_old = TRUE

/obj/item/clothing/head/helmet/faceshield/altyn/maska/update_icon() //needed for fancy new icon
	var/iconstring = initial(icon_state)
	if (!icon_swap_to_old)
		iconstring = "maska"
	else
		iconstring = "maska_killa"

	if (up)
		iconstring += "_up"

	icon_state = iconstring

/obj/item/clothing/head/helmet/faceshield/altyn/maska/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["maska"] = "TRUE"
	options["maska killa"] = "FALSE"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_swap_to_old = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/visor/cyberpunkgoggle
	name = "\improper Type-34C Semi-Enclosed Head Wear"
	desc = "Civilian model of a popular helmet used by certain law enforcement agencies. It does not have any armor plating, but has a neo-laminated fabric lining."
	icon_state = "cyberpunkgoggle"
	flags_inv = HIDEEARS|HIDEEYES|BLOCKHAIR
	siemens_coefficient = 0.9	//More conductive than most helmets
	armor = list(
		melee = 5,
		bullet = 20,
		energy = 10,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/helmet/visor/cyberpunkgoggle/armored
	name = "\improper Type-34 Semi-Enclosed Headwear"
	desc = "Armored helmet used by certain law enforcement agencies. It's hard to believe there's someone somewhere behind that."
	armor = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 20,
		bio = 0,
		rad = 0
	)