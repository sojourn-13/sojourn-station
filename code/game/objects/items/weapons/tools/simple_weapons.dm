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

/obj/item/tool/cannibal_scythe
	name = "\"Cannibal Strike\" scythe"
	desc = "A heavy grotesque handmade scythe made from parts of the most terrible creatures living on Amethyn. A real hunter's weapon that requires serious skills to handle itself.\
	 What are you waiting for, hunter? The Matriarch is calling for a great hunt!"
	icon = 'icons/obj/cannibal_scythe.dmi'
	icon_state = "cannibal"
	item_state = "cannibal"
	wielded_icon = "_doble"
	hitsound = 'sound/weapons/flamesword.ogg'
	toggleable = TRUE
	sharp = TRUE
	edge = TRUE
	slot_flags = SLOT_BACK
	max_upgrades = 3
	degradation = 0.3 //high quality hunting weapon.
	tool_qualities = list(QUALITY_CUTTING = 40,  QUALITY_SAWING = 35)
	force = WEAPON_FORCE_LETHAL + 20
	switched_on_forcemult = 0.7
	no_swing = TRUE
	throwforce = WEAPON_FORCE_LETHAL
	armor_divisor = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_HUGE
	origin_tech = list(TECH_COMBAT = 5)
	attack_verb = list("chopped", "sliced", "cut", "reaped", "lacerated", "slashed")
	price_tag = 4000 //megafauna parts.
	use_power_cost = 0
	toggleable = TRUE
	suitable_cell = /obj/item/cell/large/potato
	double_tact_required = TRUE
	var/coin_tracker = 0 //Number not false
	var/tracker
	var/last_launch
	item_icons = list(
		slot_back_str = 'icons/obj/cannibal_scythe.dmi',
		slot_s_store_str = 'icons/obj/cannibal_scythe.dmi',
		slot_l_hand_str = 'icons/obj/cannibal_scythe.dmi',
		slot_r_hand_str = 'icons/obj/cannibal_scythe.dmi'
		)
	item_state_slots = list(
		slot_l_hand_str = "lefthand",
		slot_r_hand_str = "righthand",
		slot_back_str   = "back",
		slot_s_store_str= "onsuit"
		)

/obj/item/tool/cannibal_scythe/pre_attack(atom/a, mob/user, var/params)
	if(!wielded)
		return TRUE
	..()

/obj/item/tool/cannibal_scythe/afterattack(mob/living/M, mob/living/user, target_zone)
	if(!wielded)
		to_chat(user, SPAN_DANGER("\The [src.name] is too heavy to swing with one hand!"))
		return FALSE

/obj/item/tool/cannibal_scythe/MouseDrop(over_object)
	if(suitable_cell)
		to_chat(usr, SPAN_WARNING("You study the shaft of the scythe, but you find absolutely nothing unusual!"))

/obj/item/tool/cannibal_scythe/resolve_attackby(atom/target, mob/user, give_coin = TRUE)
	clickdelay_offset = 2
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/speedy_dashing = H.momentum_speed
		if(speedy_dashing > 0)
			//Unlike dusk sabor we dont punish folks for not always being speedy
			clickdelay_offset = -speedy_dashing
			//Normally momentum can get upto like 3-4
			armor_divisor += (speedy_dashing * 3)
			force += (speedy_dashing * 3)
			if(tracker == target.name && give_coin)
				coin_tracker += 1
				to_chat(user, SPAN_DANGER("You are gaining momentum for the next hit!"))
			else
				if(ismob(target))
					tracker = target.name
					coin_tracker = 0
			//Do we have gained coins?
			if(coin_tracker)
				//If we do add are coins as pure damage and then 1/10th of an AD
				armor_divisor += (coin_tracker * 0.1)
				force += coin_tracker

	.=..()
	refresh_upgrades()

/obj/item/tool/cannibal_scythe/turn_on(mob/user)
	item_state = "cannibal"
	icon_state = "cannibal"
	to_chat(user, SPAN_NOTICE("You take a mobile stand, ready to take off at any moment or make a wide swing with your body!"))
	playsound(loc, 'sound/weapons/scabbard.ogg', 50, 1)
	no_swing = FALSE
	..()

/obj/item/tool/cannibal_scythe/turn_off(mob/user)
	no_swing = TRUE
	to_chat(user, SPAN_NOTICE("You're taking up a defensive stance, preparing to fight something serious! Your every stroke is full of precision!"))
	playsound(loc, 'sound/weapons/scabbard.ogg', 50, 1)
	..()

/obj/item/tool/cannibal_scythe/refresh_upgrades()
	..()
	if(switched_on)
		no_swing = FALSE

/obj/item/tool/cannibal_scythe/afterattack(atom/target, mob/user, proximity_flag, params)
	if(!switched_on || world.time < last_launch + 3 SECONDS)
		return
	var/cost = 0 * get_dist(target, user)
	if(user.check_gravity())
		cost *= (user.mob_size/10)

	if(cell?.checked_use(cost))
		if(!wielded)
			var/drop_prob = 80
			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				drop_prob *= H.stats.getMult(STAT_ROB, STAT_LEVEL_EXPERT)
			if(prob(drop_prob))
				to_chat(user, SPAN_WARNING("\The [src] launches from your grasp!"))
				user.drop_item(src)
				playsound(src, 'sound/misc/sandjump.ogg', 50, 0, 0)
				throw_at(target, get_dist(target, user), 1, user)
				last_launch = world.time
				return
		last_launch = world.time
		to_chat(usr, SPAN_WARNING("You takes off from his place, making a sharp dodge in the style of a leap hunter!"))
		playsound(src, 'sound/misc/sandjump.ogg', 50, 0, 0)
		user.throw_at(target, get_dist(target, user), 1, user)

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
