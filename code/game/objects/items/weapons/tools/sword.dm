//Swords

/obj/item/tool/sword
	name = "claymore"
	desc = "What are you standing around staring at this for? Get to killing!"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "claymore"
	item_state = "claymore"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 5)
	sharp = TRUE
	edge = TRUE
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BELT
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_ROBUST
	armor_divisor = ARMOR_PEN_DEEP

	throwforce = WEAPON_FORCE_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_SAWING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	w_class = ITEM_SIZE_BULKY
	price_tag = 100

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "hilts", "blunts")
	alt_mode_toggle = "uses the broad side of their weapon"
	alt_mode_lossrate = 0.3

/obj/item/tool/sword/katana
	name = "katana"
	desc = "Modern Japanese-style blade that has no curve to it. This one looks pretty sharp."
	icon_state = "katana" // New sprite courtesy of Kavric
	item_state = "katana"
	hitsound = 'sound/weapons/heavyslash.ogg'
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 5, MATERIAL_DIAMOND = 1) //sharpened using diamond dust or whatever
	slot_flags = SLOT_BELT | SLOT_BACK
	force = WEAPON_FORCE_BRUTAL
	armor_divisor = ARMOR_PEN_SHALLOW
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "katana_back"
		)

/obj/item/tool/sword/katana_makeshift
	name = "makeshift katana"
	desc = "Modern Japanese-style blade that has no curve to it. This one is two knives welded together, proving where there's a will and a weeb there's a way."
	icon_state = "katana_improv"
	item_state = "katana_improv"
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTIC = 2) //twice the value of a kitche knife
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_SHALLOW
	price_tag = 40

/obj/item/tool/sword/katana/nano
	name = "\improper Soteria \"Muramasa\" katana"
	desc = "After an extensive binge of ancient animated recordings, a scientist decided to upgrade a recovered katana."
	icon_state = "eutactic_katana"
	item_state = "eutactic_katana"
	toggleable = TRUE

	suitable_cell = /obj/item/cell/small

	use_power_cost = 0.4
	passive_power_cost = 0.4

	switched_on_qualities = list(QUALITY_CUTTING = 25, QUALITY_SAWING = 15)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 6)
	switched_on_forcemult = 1.2 //40
	price_tag = 800

	has_alt_mode = FALSE

/obj/item/tool/sword/katana/nano/turn_on(mob/user)
	.=..()
	if(.)
		embed_mult = 0
		playsound(user, 'sound/weapons/saberon.ogg', 50, 1)

/obj/item/tool/sword/katana/nano/turn_off(mob/user)
	..()
	embed_mult = initial(embed_mult)
	playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)

/obj/item/tool/sword/katana/nano/update_icon()
	..()
	if(cell)
		overlays += "[icon_state]_cell"
	if(switched_on)
		overlays += "[icon_state]_power_on"
	else
		overlays += "[icon_state]_power_off"

/obj/item/tool/sword/katana/firebrand //Firebrand. Sprited and Implemented by Sieghardt
	name = "Artificer Firebrand"
	desc = "Originally the fever dream of an brave guild master looking for a better way to deal with roaches, the Firebrand ended up as a hellish implement of war. While turned off, this is a blunted hunk of metal. When turned on the Firebrand becomes a bringer of fiery doom to anyone unlucky enough to be its path."
	icon_state = "firebrand"
	item_state = "firebrand"
	toggleable = TRUE

	max_fuel = 100
	use_fuel_cost = 0.5
	passive_fuel_cost = 0.1
	price_tag = 700

	switched_on_qualities = list(QUALITY_CUTTING = 25, QUALITY_SAWING = 15, QUALITY_CAUTERIZING = 10, QUALITY_WELDING = 15)
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4)
	force = WEAPON_FORCE_NORMAL
	switched_on_forcemult = 3.3 //33
	//Weaker than the Muramasa and other high end weapons, as it's not LETHAL, but sets the target on fire. 1 stack though.
	structure_damage_factor = STRUCTURE_DAMAGE_BLUNT
	//A heated blade can not be sharp, it's just shaped like a sword while being a blunt object. When turned off it has as much damage as other blunt implements.
	heat = 2250
	glow_color = COLOR_ORANGE
	//Stronger when turned on. Will emit heat, turn its damage type to burn and set targets on fire.

	has_alt_mode = FALSE

/obj/item/tool/sword/katana/firebrand/is_hot()
	if(switched_on)
		return heat

/obj/item/tool/sword/katana/firebrand/turn_on(mob/user)
	.=..()
	if(.)
		embed_mult = 0
		damtype = BURN
		set_light(2)
		playsound(loc, 'sound/items/welderactivate.ogg', 50, 1)
		//Too hot to get stuck into crud.

/obj/item/tool/sword/katana/firebrand/apply_hit_effect(atom/target, blocked=FALSE)
	.=..()
	if(iscarbon(target) && switched_on)
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(1)
		M.IgniteMob()
		//Sets the target on fire, however only 1 stack at a time rather than 4 like most incendiary ammo.

/obj/item/tool/sword/katana/firebrand/turn_off(mob/user)
	..()
	embed_mult = initial(embed_mult)
	damtype = initial(damtype)
	set_light(0)
	playsound(loc, 'sound/items/welderdeactivate.ogg', 50, 1)

/obj/item/tool/sword/katana/firebrand/update_icon()
	..()
	if(switched_on)
		icon_state = "firebrand_on"
		item_state = "firebrand_on"
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)

/obj/item/tool/sword/saber
	name = "decorative saber"
	desc = "A finely made formal blade as a ornamental show of class or force. Despite being primarily for show it cuts deep and painfully."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "saber"
	item_state = "saber"
	armor_divisor = ARMOR_PEN_SHALLOW
	price_tag = 400
	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "switches their stance to avoid using the blade of their weapon"
	alt_mode_lossrate = 0.6

/obj/item/tool/sword/saber/cutlass
	name = "cutlass"
	desc = "A finely made sword for pirates or military men who take themselves too seriously."
	icon_state = "cutlass"
	item_state = "cutlass"
	price_tag = 300
	alt_mode_verbs = list("bashes", "stunts", "hilts", "blunts")
	alt_mode_toggle = "uses the broad side of their weapon"

/obj/item/tool/sword/saber/militiacommander
	name = "Officer's Saber"
	desc = "A masterfully forged Saber to be carried by the Blackshield Commander, Despite it fact for Ceremonial use. It can also be used in combat, if they're crazy enough."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "saber"
	item_state = "saber"
	armor_divisor = ARMOR_PEN_SHALLOW
	price_tag = 350

/obj/item/tool/sword/saber/militiasergeant
	name = "Sergeant's Saber"
	desc = "An Saber made for the Senior Enlisted of Blackshield, Usually used for Ceremonial usage but can also be used in combat, Preferably used by a maniac who likes to charge into battle without helmet or armor."
	icon_state = "cutlass"
	item_state = "cutlass"
	armor_divisor = ARMOR_PEN_SHALLOW
	price_tag = 325

/obj/item/tool/sword/saber/deconstuctive_rapier
	name = "Cinq Deconstructive Rapier"
	desc = "A long, thin bladed sword with a weaponized destructive analyzer integrated into the blade. At the moment of its victim's death it is able to deconstruct them and wirelessly transmit data to internal research database."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "rapier_cro" //Sprite by Gidgit
	item_state = "rapiersci"
	force = WEAPON_FORCE_PAINFUL - 5 //10 base
	armor_divisor = ARMOR_PEN_MODERATE
	price_tag = 1600
	has_alt_mode = TRUE
	attack_verb = list("stabbed", "slashed", "pierces")
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("jabs", "stunts", "wacks", "blunts")
	alt_mode_toggle = "switches their stance to avoid using the blade of their weapon"
	alt_mode_lossrate = 1.5 //So its able to be used as a baton in some cases
	reagent_flags = INJECTABLE|TRANSPARENT
	matter = null //magicium
	clickdelay_offset = -4 //DEFAULT_QUICK_COOLDOWN = 4 so we offset are weapon to quick
	var/datum/component/rnd_points/point_holder
	degradation = 0 //Used a lot
	embed_mult = 0

/obj/item/tool/sword/saber/deconstuctive_rapier/New()
	..()
	givepointscompont(0)
	GET_COMPONENT_FROM(C, /datum/component/rnd_points, src)
	point_holder = C

/obj/item/tool/sword/saber/deconstuctive_rapier/proc/add_points(points)
	if(point_holder)
		//message_admins("[points] points!")
		point_holder.data_points += points

/obj/item/tool/sword/saber/deconstuctive_rapier/resolve_attackby(atom/target, mob/user)
	.=..()
	//Little icky but it works
	if(isliving(target))
		var/mob/M = target
		if(!ishuman(M))
			if(!issilicon(M))
				if(is_dead(M))
					// Calculate points based on mob's research_value variable
					var/points_to_award = 50 // Default fallback value
					if("research_value" in M.vars)
						points_to_award = M.vars["research_value"]

					user.visible_message("[user] drives [src.name] into [M.name]'s body, deconstructing it!", "You drive the [src.name] into [M.name], extracting research data")
					msg_admin_attack("[user] deconned [M.name] - ([user.ckey]) with \a [src] (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[M.x];Y=[M.y];Z=[M.z]'>JMP</a>)")
					M.dust()
					add_points(points_to_award)
					add_overlay(image('icons/obj/cwj_cooking/scan.dmi', icon_state="scan_person", layer=ABOVE_WINDOW_LAYER))
					addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, update_icon)), 11)
					return

/obj/item/tool/sword/saber/injection_rapier
	name = "Cinq Inject Rapier"
	desc = "A long, thin bladed sword with a hollow chamber in the blade. A mechanical release mechanism allows the wielder to inject targets with fluid from a reservoir in the grip."
	icon = 'icons/obj/weapons-blades.dmi' //Sprite by Gidgit
	icon_state = "rapier_cbo"
	item_state = "rapiermed"
	force = WEAPON_FORCE_PAINFUL - 5 //10 base
	armor_divisor = ARMOR_PEN_MODERATE
	price_tag = 1600
	has_alt_mode = TRUE
	attack_verb = list("stabbed", "slashed", "pierces")
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("jabs", "stunts", "wacks", "blunts")
	alt_mode_toggle = "switches their stance to avoid using the blade of their weapon"
	alt_mode_lossrate = 1.5 //So its able to be used as a baton in some cases
	reagent_flags = INJECTABLE|TRANSPARENT
	matter = null //magicium
	clickdelay_offset = -4 //DEFAULT_QUICK_COOLDOWN = 4 so we offset are weapon to quick
	degradation = 0 //Used a lot
	var/max_reagents = 30
	embed_mult = 0
	unacidable = TRUE //So if we do acid injections we dont melt

/obj/item/tool/sword/saber/injection_rapier/refresh_upgrades()
	..()
	if(reagents)
		reagents.maximum_volume = max_reagents

/obj/item/tool/sword/saber/injection_rapier/New()
	..()
	create_reagents(30)

/obj/item/tool/sword/saber/injection_rapier/resolve_attackby(atom/target, mob/user)
	.=..()
	if(!target.reagents || !isliving(target))
		return

	if(!reagents.total_volume)
		return

	if(!target.reagents.get_free_space())
		return
	var/modifier = 1
	var/reagent_modifier = 1
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		modifier += min(30,H.stats.getStat(STAT_ROB))
		reagent_modifier = CLAMP(round(H.stats.getStat(STAT_BIO)/10), 1, 5)
	var/mob/living/L = target
	if(prob(min(100,((100 / armor_divisor)-L.getarmor(user.targeted_organ, ARMOR_MELEE))+modifier)))
		var/trans = reagents.trans_to_mob(target, rand(1,3)*reagent_modifier, CHEM_BLOOD)
		admin_inject_log(user, target, src, reagents.log_list(), trans)
		to_chat(user, SPAN_NOTICE("You inject [trans] units of the solution. [src] now contains [src.reagents.total_volume] units."))

/obj/item/tool/sword/handmade
	name = "junkblade"
	desc = "Hack and slash!"
	icon_state = "msword"
	item_state = "msword"
	slot_flags = SLOT_BELT|SLOT_BACK
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 2) // 2 rods, 5 plasteel
	armor_divisor = ARMOR_PEN_MODERATE
	tool_qualities = list(QUALITY_CUTTING = 15,  QUALITY_SAWING = 5)
	degradation = 1.5 // Crappily made
	max_upgrades = 5 // Handmade nature
	price_tag = 100 // Made with plasteel

/obj/item/tool/sword/foreman
	name = "\"Render Slayer\" Greatsword"
	desc = "This thing is too big to be called a sword. \
			Too big, too thick, too heavy, and too rough, \
			it is more like a large hunk of plasteel. \nA \
			Foreman's weapon of choice when bashing is not enough; \
			you have to cleave through the hordes to survive, and keep struggling."
	icon_state = "renderslayer"
	item_state = "renderslayer"
	force = WEAPON_FORCE_BRUTAL + 2 // 35 damage
	slot_flags = SLOT_BELT|SLOT_BACK
	armor_divisor = ARMOR_PEN_MASSIVE // Sharp edge
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	effective_faction = list("deathclaw") // Called like this for a reason
	damage_mult = 2
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_STEEL = 5)
	w_class = ITEM_SIZE_BULKY
	origin_tech = list(TECH_COMBAT = 3)
	attack_verb = list("attacked", "CLANG'd", "slashed", "sliced", "diced", "cut")
	hitsound = 'sound/weapons/renderslash.ogg' // Not gonna CLANG this up for the sake of our ears, but snowflake attack sound.
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "renderslayer"
		)

/obj/item/tool/knife/ritual/blade
	name = "awakened blade"
	desc = "The last stage of ascension a ritual knife, its latent powers fully awoken by the crayons' magic. \
			Suspiciously glowing runes are drawn on its surface that glow at random intervals."
	icon_state = "crayon_blade"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_STEEL = 2, MATERIAL_DIAMOND = 1)
	force = WEAPON_FORCE_ROBUST + 4 // 30 damage
	armor_divisor = ARMOR_PEN_MASSIVE // More balanced than psi weapons with psi mania perk.
	w_class = ITEM_SIZE_BULKY
	max_upgrades = 2
	slot_flags = SLOT_BELT|SLOT_BACK
	hitsound = 'sound/weapons/renderslash.ogg' // Snowflake
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "crayon_blade"
		)

/obj/item/tool/sword/machete
	name = "machete"
	desc = "An explorer's best friend and trust back up plan. Or primary plan for those who like to get in there personally."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "machete"
	item_state = "machete"
	tool_qualities = list(QUALITY_CUTTING = 10,  QUALITY_SAWING = 20) //So we can cut down trees
	force = WEAPON_FORCE_ROBUST
	w_class = ITEM_SIZE_NORMAL
	price_tag = 120
	matter = list(MATERIAL_STEEL = 15)

// Hunter Weapons

/obj/item/tool/sword/cleaver
	name = "sun cleaver"
	desc = "A weapon designed by the Hunting Lodge, this massive sword is especially effective against tengolos, xenomorphs, and tengolo berserkers, dealing double its normal damage with every strike."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "cleaver"
	item_state = "cleaver_back"
	tool_qualities = list(QUALITY_CUTTING = 30)
	force = WEAPON_FORCE_BRUTAL
	armor_divisor = ARMOR_PEN_SHALLOW
	w_class = ITEM_SIZE_BULKY
	effective_faction = list("tengo", "tengolo_berserker", "xenomorph") // Which faction the cleaver is effective against.
	damage_mult = 2.5 // The damage multiplier the cleaver get when attacking that faction.
	price_tag = 200
	item_icons = list(
		slot_back_str = 'icons/obj/weapons-blades.dmi')
	item_state_slots = list(
		slot_back_str = "cleaver_back"
		)

/obj/item/tool/sword/huntingclaw
	name = "hunting claw"
	desc = "The second best friend a hunter could ask for, this one handed blade is lightweight and razor sharp thanks to its starworks-grade alloy construction.\
	 The hilt is made out of wood with gold looking trimmings. A Black Bear has been beautifully etched on the wood. All craftsmanship is of the highest quality."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "huntingclaw"
	item_state = "huntingclaw"
	matter = list(MATERIAL_STEEL = 5, MATERIAL_WOOD = 2)
	slot_flags = SLOT_BELT | SLOT_BACK
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_SAWING = 20) //Very sharp blade, serrated back
	force = WEAPON_FORCE_ROBUST
	armor_divisor = ARMOR_PEN_DEEP // same as other, cheaper swords.
	effective_faction = list("wurm", "roach", "spider", "vox_tribe", "russian", "tengo", "tengolo_berserker", "xenomorph", "stalker") // This is the janky solution but works.
	damage_mult = 2 //We are better for hunting, worse for "real fights"
	w_class = ITEM_SIZE_NORMAL
	price_tag = 500

// Sun Branch Weapons

//Hilts are stolen from other server (I guess rougetown but cant find the source)

//Midday, sets the target on fire, 1->2 fire stack per hit
/obj/item/tool/sword/midday
	name = "\"Sunup\" sword"
	desc = "A brassy blade with an ornate handle embued with plasma and gemstones."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "midday"
	item_state = "sun_branch"
	tool_qualities = list(QUALITY_CUTTING = 30,  QUALITY_SAWING = 10)
	force = WEAPON_FORCE_DANGEROUS
	w_class = ITEM_SIZE_NORMAL
	price_tag = 720
	matter = list(MATERIAL_PLASTEEL = 2, MATERIAL_DIAMOND = 0.1, MATERIAL_PLASMA = 6, MATERIAL_GOLD = 2, MATERIAL_IRON = 5)
	swing_icon_mod = "_sun_branch"

/obj/item/tool/sword/midday/examine(mob/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.glasses, /obj/item/clothing/glasses/firefly_glasses) || H.stats.getPerk(PERK_NO_OBFUSCATION))
			to_chat(user, SPAN_NOTICE("When striking a target will set it ablaze."))
			to_chat(user, SPAN_NOTICE("When striking a target with Firefly glasses, will add an additional fuel to the fire and stoke the flames."))

/obj/item/tool/sword/midday/resolve_attackby(atom/target, mob/user)
	var/glasses = FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.glasses, /obj/item/clothing/glasses/firefly_glasses))
			glasses = TRUE

	//Set are target on fire
	if(isliving(target))
		var/mob/living/M = target
		M.adjust_fire_stacks(1)
		M.IgniteMob()

		if(glasses)
			M.adjust_fire_stacks(1)
			M.next_onfire_brn = 0
			M.handle_fire()

	.=..()

/obj/item/tool/sword/sun_set
	name = "\"Sunset\" sword"
	desc = "A brassy blade with an ornate handle embued with plasma and gemstones."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "sun_set"
	item_state = "sun_branch"
	tool_qualities = list(QUALITY_CUTTING = 30,  QUALITY_SAWING = 10)
	force = WEAPON_FORCE_DANGEROUS
	w_class = ITEM_SIZE_NORMAL
	price_tag = 980
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_DIAMOND = 0.5, MATERIAL_PLASMA = 6, MATERIAL_GOLD = 3, MATERIAL_IRON = 8)
	swing_icon_mod = "_sun_branch"

/obj/item/tool/sword/sun_set/examine(mob/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.glasses, /obj/item/clothing/glasses/firefly_glasses) || H.stats.getPerk(PERK_NO_OBFUSCATION))
			to_chat(user, SPAN_NOTICE("This sword when striking a burning target will quell the flames a little but based on how much fire will attack allow for faster attacking."))
			to_chat(user, SPAN_NOTICE("This sword when striking a burning target with Firefly glasses, will prevent the sword from quelling the flames, cut more deeply depending on fire fuel on the target and stoke the flames."))

/obj/item/tool/sword/sun_set/resolve_attackby(atom/target, mob/user)
	clickdelay_offset = 0 //Reset are clickdlay

	var/glasses = FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.glasses, /obj/item/clothing/glasses/firefly_glasses))
			glasses = TRUE

	if(isliving(target))
		var/mob/living/M = target
		clickdelay_offset -= M.fire_stacks * 0.5

		//Use a fire stack to be faster
		if(!glasses && M.fire_stacks)
			M.adjust_fire_stacks(-1)

		if(glasses)
			force += min(M.fire_stacks, 5)
			M.next_onfire_brn = 0
			M.handle_fire()

		//Caps at 7, meaning 14 fire stack is are cap
		if(clickdelay_offset < -7)
			clickdelay_offset = -7

	.=..()
	refresh_upgrades()

/obj/item/tool/sword/dawn
	name = "\"Crack of Dawn\" blade"
	desc = "A large brassy blade with an ornate handle embued with plasma and gemstones."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "dawn"
	item_state = "sun_branch"
	tool_qualities = list(QUALITY_CUTTING = 35,  QUALITY_SAWING = 15)
	force = WEAPON_FORCE_DANGEROUS
	w_class = ITEM_SIZE_NORMAL
	price_tag = 1000
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_DIAMOND = 1, MATERIAL_PLASMA = 6, MATERIAL_GOLD = 6, MATERIAL_IRON = 15)
	swing_icon_mod = "_sun_branch"

/obj/item/tool/sword/dawn/examine(mob/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.glasses, /obj/item/clothing/glasses/firefly_glasses) || H.stats.getPerk(PERK_NO_OBFUSCATION))
			to_chat(user, SPAN_NOTICE("This sword when striking a burning target will quell the flames a bit but will stoke the flames twice, deal more damage based on fire fuel, deal fixed burns and can fuel the fire."))
			to_chat(user, SPAN_NOTICE("This sword when striking a burning target with Firefly glasses, will prevent the sword from quelling the flames, cut more deeply depending on fire fuel, deal additional fixed burns."))

/obj/item/tool/sword/dawn/resolve_attackby(atom/target, mob/user)

	var/glasses = FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.glasses, /obj/item/clothing/glasses/firefly_glasses))
			glasses = TRUE

	if(isliving(target))
		var/mob/living/M = target
		M.next_onfire_brn = 0
		M.handle_fire()
		if(!glasses)
			M.adjust_fire_stacks(-1)
		M.next_onfire_brn = 0
		M.handle_fire()
		if(!glasses)
			M.adjust_fire_stacks(-1)
		force += M.fire_stacks
		if(!ishuman(M))
			M.fireloss += min(M.fire_stacks, 20)
			if(glasses)
				M.fireloss += min(M.fire_stacks, 5)
		else
			//We cant heal fixed damage if we are a human
			force += min(M.fire_stacks, 20)
			if(glasses)
				force += min(M.fire_stacks, 5)

		M.updatehealth()

		if(prob(M.fire_stacks))
			M.adjust_fire_stacks(3)

	.=..()
	refresh_upgrades()
