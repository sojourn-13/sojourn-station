//Those are all weapons that don't had tool modding at some point, but should have it for balance purposes.

/obj/item/tool/broken_bottle
	name = "broken bottle"
	desc = "A bottle with a sharp broken bottom."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "broken_bottle"
	matter = list(MATERIAL_GLASS = 2)
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_WEAK
	item_state = "beer"
	attack_verb = list("stabbed", "slashed", "attacked")
	sharp = TRUE
	edge = FALSE
	max_upgrades = 1 //it's not even a tool
	tool_qualities = list(QUALITY_CUTTING = 10)
	var/icon/broken_outline = icon('icons/obj/drinks.dmi', "broken")

/obj/item/tool/nailstick
	name = "nailed stick"
	desc = "Stick with some nails in it. Looks sharp enough."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hm_spikeclub"
	item_state = "hm_spikeclub"
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("beaten", "slammed", "smacked", "struck", "battered")
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	max_upgrades = 5
	tool_qualities = list(QUALITY_HAMMERING = 10)
	effective_faction = list("spider") // Spiders are weak to crushing.
	damage_mult = 2

/obj/item/tool/hatchet
	name = "hatchet"
	desc = "A very sharp axe blade upon a short fiber-metal handle. It has a long history of chopping things, but now it is used for chopping wood."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hatchet"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTIC = 3)
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_SMALL
	sharp = TRUE
	edge = TRUE
	armor_divisor = ARMOR_PEN_SHALLOW
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 1)
	attack_verb = list("chopped", "torn", "cut")
	tool_qualities = list(QUALITY_CUTTING = 20, QUALITY_SAWING = 15)
	worksound = WORKSOUND_HARD_SLASH
	price_tag = 30

/obj/item/tool/hatchet/robo //for the service borg
	embed_mult = 0

/obj/item/tool/fireaxe
	name = "fire axe"
	desc = "Truly, the weapon of a madman. Who would think to fight fire with an axe?"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "fireaxe0"
	wielded_icon = "fireaxe1"
	sharp = TRUE
	edge = TRUE
	armor_divisor = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_PRYING = 20, QUALITY_SAWING = 15)
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_BRUTAL
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	embed_mult = 1.2 //Axes cut deep, and their hooked shape catches on things
	worksound = WORKSOUND_HARD_SLASH
	price_tag = 190
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "fireaxe0_back"
		)

/obj/item/tool/fireaxe/afterattack(atom/A as mob|obj|turf|area, mob/user as mob, proximity)
	if(!proximity) return
	..()
	if(A && wielded)
		if(istype(A,/obj/effect/plant))
			var/obj/effect/plant/P = A
			P.die_off()

/obj/item/tool/fireaxe/woodsman
	name = "woodsman axe"
	desc = "Chop the wood to fuel the fire."
	icon_state = "woodsmanaxe0"
	wielded_icon = "woodsmanaxe1"
	force = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_CUTTING = 40, QUALITY_SAWING = 30)
	w_class = ITEM_SIZE_BULKY
	price_tag = 30

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_verbs = list("bashes", "beats", "clobbers")
	alt_mode_sharp = FALSE
	alt_mode_toggle = "flips the axe to its broad side"

/obj/item/tool/fireaxe/militia_tomahawk
	name = "blackshield tactical tomahawk"
	desc = "For cutting, sawing, prying, and throwing at targets mid back-flip. Surprisingly portable!"
	icon_state = "sec_tomahawk"
	wielded_icon = "sec_tomahawk"
	force = WEAPON_FORCE_ROBUST + 4 // Better than the cheap axe
	throwforce = WEAPON_FORCE_LETHAL // Meant to be a throwing weapon
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_CUTTING = 30, QUALITY_SAWING = 25, QUALITY_PRYING = 15)
	w_class = ITEM_SIZE_SMALL //just let the shield have their webbing-portable tomahawk.
	price_tag = 45

/obj/item/tool/fireaxe/handmade
	name = "makeshift axe"
	desc = "A heavy plasteel blade affixed to a welded metal shaft, for close up carnage."
	icon_state = "makeshift_axe"
	item_state = "makeshift_axe"
	wielded_icon = "makeshift_axe_wielded"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTEEL = 3)
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_NORMAL
	armor_divisor = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("chopped", "torn", "cut", "cleaved", "slashed")
	tool_qualities = list(QUALITY_CUTTING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	embed_mult = 1.1
	degradation = 1.5
	max_upgrades = 5
	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_verbs = list("bashes", "beats", "clobbers")
	alt_mode_sharp = FALSE
	alt_mode_toggle = "flips the axe to its broad side"

/obj/item/tool/minihoe
	name = "mini hoe"
	desc = "It's used for removing weeds or scratching your back."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hoe"
	item_state = "hoe"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2)
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	max_upgrades = 2
	tool_qualities = list(QUALITY_SHOVELING = 10)
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("slashed", "sliced", "cut", "clawed")

/obj/item/tool/scythe
	name = "scythe"
	desc = "A sharp and curved blade on a long fiber-metal handle, this tool makes it easy to reap what you sow."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "scythe0"
	item_state = "scythe0"
	matter = list(MATERIAL_PLASTEEL = 7, MATERIAL_PLASTIC = 3)
	sharp = TRUE
	edge = TRUE
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	tool_qualities = list(QUALITY_CUTTING = 15, QUALITY_SAWING = 10)
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "scythe0_back"
		)

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_verbs = list("jabs", "prods", "wacks")
	alt_mode_sharp = FALSE
	alt_mode_toggle = "flips the scythe backwards to use as a blunt spear"
	alt_mode_lossrate = 0.3

//Flails
/obj/item/tool/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	max_upgrades = 2
	tool_qualities = list(QUALITY_HAMMERING = 5)

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_verbs = list("flogged", "whipped", "lashed", "disciplined")
	alt_mode_toggle = "loosens their hand on the grip"
	alt_mode_lossrate = 0.7

/obj/item/tool/disciplinary_action
	name = "Disciplinary Action"
	desc = "A long whip of steel chains used by Blackshield for when someone acts out of line."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_DANGEROUS
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	max_upgrades = 3
	tool_qualities = list(QUALITY_HAMMERING = 5)

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_verbs = list("flogged", "whipped", "lashed", "disciplined")
	alt_mode_toggle = "loosens their hand on the grip"
	alt_mode_lossrate = 0.7

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
	desc = "An Saber made for the Senior Enlisted of Blackshield, Usually used for Ceremonial usage but can also be used in combat, Preferably used by a maniac who likes to charge into battle without helmet or armour."
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
	degradation = 0.4 //Used a lot
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
					user.visible_message("[user] drives [src.name] into [M.name]'s body, deconstructing it!", "You drive the [src.name] into [M.name], extracting research data")
					msg_admin_attack("[user] deconned [M.name] - ([user.ckey]) with \a [src] (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[M.x];Y=[M.y];Z=[M.z]'>JMP</a>)")
					M.dust()
					add_points(50)
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
	degradation = 0.4 //Used a lot
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

/obj/item/tool/gauntlet
	name = "render gauntlet"
	desc = "A crudely made gauntlet consisting of straps, metal reinforcement and render skin - including it's deadly claws."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "gauntlet"
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_SAWING = 20) //Cuts people down just like trees.
	force = WEAPON_FORCE_BRUTAL
	armor_divisor = ARMOR_PEN_HALF //same pen as a dagger. This is a fairly rare weapon that require fighting on of the more dangerous mobs.
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 5)
	attack_verb = list("clawed", "scratched", "lacerated", "slashed")
	price_tag = 200

/obj/item/tool/power_fist
	name = "power fist"
	desc = "A battery powered hydraulic combat gauntlet designed for extended operations where close combat and muscles matter most."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "powerfist"
	item_state = "powerfist"
	toggleable = TRUE
	worksound = WORKSOUND_HAMMER
	switched_on_forcemult = 3.3 //33
	armor_divisor = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 7)
	attack_verb = list("punched", "decked", "haymakered", "uppercut")
	degradation = 0.7
	use_power_cost = 1
	suitable_cell = /obj/item/cell/medium
	switched_on_qualities = list(QUALITY_HAMMERING = 30)
	switched_off_qualities = list(QUALITY_HAMMERING = 10)
	hitsound = 'sound/weapons/smash.ogg'
	price_tag = 300

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "adjusts their grip to strike lightly"
	alt_mode_lossrate = 0.9

/obj/item/tool/power_fist/turn_on(mob/user)
	if (cell && cell.charge > 0)
		item_state = "[initial(item_state)]_on"
		to_chat(user, SPAN_NOTICE("You switch [src] on."))
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		..()
	else
		item_state = initial(item_state)
		to_chat(user, SPAN_WARNING("[src] has no power!"))

/obj/item/tool/power_fist/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You switch [src] off."))
	..()

//POLEARMS
/obj/item/tool/spear
	icon = 'icons/obj/weapons.dmi'
	icon_state = "spear_glass"
	item_state = "spear_glass"
	wielded_icon = "spear_glass_wielded"
	name = "shard spear"
	desc = "A spiky bit of material tied onto a metal pole with some wire. It's an insult to spears across the galaxy - but it can still do some nasty damage and has some decent armor-piercing capabilities. Spears like these are often seen in the hands of vagrants, muggers, or desperate militias. Due to this weapon - if you could call it that - being so long, you're able to attack enemies from up to a tile away."
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	throw_speed = 3
	edge = TRUE
	sharp = TRUE
	extended_reach = TRUE
	tool_qualities = list(QUALITY_CUTTING = 10)
	origin_tech = list(TECH_COMBAT = 1)
	hitsound = 'sound/weapons/slice.ogg' // Sounds more like a stab than a cut.
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	embed_mult = 1.5
	price_tag = 50
	//attack_distance = 2


	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_MODERATE
	throw_speed = 3
	max_upgrades = 5

	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "spearglass0_back"
		)

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "switches their stance to strike at targets with the shaft"
	alt_mode_lossrate = 0.4
	no_swing = TRUE


/obj/item/tool/spear/steel
	name = "steel spear"
	desc = "A steel spearhead welded to a crude metal shaft, made from two welded rods. It'll serve well enough."
	icon_state = "spear_steel"
	item_state = "spear_steel"
	wielded_icon = "spear_steel_wielded"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_ROBUST
	armor_divisor = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 10,  QUALITY_WIRE_CUTTING = 5, QUALITY_SCREW_DRIVING = 5)
	matter = list(MATERIAL_STEEL = 3)
	structure_damage_factor = STRUCTURE_DAMAGE_WEAK

/obj/item/tool/spear/plasteel
	name = "plasteel spear"
	desc = "A carefully crafted plasteel spearhead affixed to a metal shaft, it is welded securely on and feels balanced. Show them the past still lives."
	icon_state = "spear_plasteel"
	item_state = "spear_plasteel"
	wielded_icon = "spear_plasteel_wielded"
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_BRUTAL
	armor_divisor = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 15,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 10)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTEEL = 2)
	structure_damage_factor = STRUCTURE_DAMAGE_NORMAL

/obj/item/tool/spear/uranium
	name = "uranium spear"
	desc = "A steel spear with a uranium lined spearhead. Your foes may survive the stab, but the toxin will linger."
	icon_state = "spear_uranium"
	item_state = "spear_uranium"
	wielded_icon = "spear_uranium_wielded"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 10,  QUALITY_WIRE_CUTTING = 5, QUALITY_SCREW_DRIVING = 5)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_URANIUM = 1)

/obj/item/tool/spear/uranium/apply_hit_effect(mob/living/carbon/human/target, mob/living/user, hit_zone)
	..()
	if(istype(target))
		target.apply_effect(rand(5, 10), IRRADIATE)

/obj/item/tool/spear/makeshift_halberd
	name = "makeshift halberd"
	desc = "Slap a heavy blade on some rods duct-taped together and call it a day."
	icon_state = "makeshift_halberd"
	item_state = "makeshift_halberd"
	wielded_icon = "makeshift_halberd_wielded"
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_NORMAL
	armor_divisor = ARMOR_PEN_SHALLOW
	tool_qualities = list(QUALITY_CUTTING = 10)
	matter = list(MATERIAL_STEEL = 5)

/obj/item/tool/spear/hunter_halberd
	name = "halberd"
	desc = "A hand-crafted halberd with a red cloth wrapped around the base of the blade itself. A Hunter's signature melee weapon of choice."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hunter_halberd"
	item_state = "hunter_halberd"
	wielded_icon = "hunter_halberd_wielded"
	force = WEAPON_FORCE_BRUTAL
	armor_divisor = ARMOR_PEN_DEEP
	effective_faction = list("wurm", "roach", "spider", "vox_tribe", "russian", "tengo", "tengolo_berserker", "xenomorph", "stalker") // This is the janky solution but works.
	damage_mult = 2 //We are better for hunting, worse for "real fights"
	price_tag = 500
	matter = list(MATERIAL_STEEL = 22, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 4)

//Shitty loadout weapons
/obj/item/tool/cheap
	name = "cheap sword"
	desc = "A sword of acceptable quality, mass-produced by Lonestar. It's no work art, but it's sharp enough to get the job done."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "cheap_sword"
	item_state = "cheap_sword"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5)
	sharp = TRUE
	edge = TRUE
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_ROBUST
	armor_divisor = ARMOR_PEN_DEEP

	throwforce = WEAPON_FORCE_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_SAWING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "switches their stance to avoid using the blade of their weapon"
	alt_mode_lossrate = 0.9 //Little loss so people can use these in real gimmics

/obj/item/tool/cheap/axe
	name = "cheap tomahawk"
	desc = "A tomahawk of acceptable quality, mass-produced by Lonestar. Just expensive enough to be called tactical."
	icon_state = "cheap_axe"
	item_state = "cheap_axe"
	structure_damage_factor = STRUCTURE_DAMAGE_WEAK
	attack_verb = list("attacked", "slashed", "chopped", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/tool/cheap/katana
	name = "cheap katana"
	desc = "A katana of acceptable quality, mass-produced by Lonestar. Easily their best-selling product from this lineup."
	icon_state = "katana_old"
	item_state = "katana"
	force = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_EXTREME

/obj/item/tool/cheap/spear
	name = "cheap spear"
	desc = "A spear of acceptable quality, mass-produced by Lonestar. Place sharp end towards enemy."
	icon_state = "cheap_spear"
	item_state = "cheap_spear"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK|SLOT_BELT
	throwforce = WEAPON_FORCE_BRUTAL
	throw_speed = 3
	embed_mult = 1.5
	structure_damage_factor = STRUCTURE_DAMAGE_WEAK
	tool_qualities = list(QUALITY_CUTTING = 15,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 10)
	hitsound = 'sound/weapons/slice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "cheap_spear"
		)
	alt_mode_toggle = "switches their stance to strike at targets with the shaft"
	alt_mode_lossrate = 0.4

/obj/item/tool/cheap/saber
	name = "cheap saber"
	desc = "A saber of acceptable quality, mass-produced by Lonestar. Probably not fit for parrying, but why not give it a try?"
	icon_state = "cheap_saber"
	item_state = "cutlass"
