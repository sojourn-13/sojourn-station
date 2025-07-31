//replaces our stun baton code with /tg/station's code
/obj/item/tool/baton
	name = "stun baton"
	desc = "A stun baton for incapacitating people with."
	icon_state = "stunbaton"
	item_state = "baton"
	icon = 'icons/obj/weapons.dmi'
	slot_flags = SLOT_BELT
	toggleable = TRUE
	force = WEAPON_FORCE_PAINFUL
	sharp = FALSE
	edge = FALSE
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("beaten")
	price_tag = 500
	stunforce = 0
	agonyforce = 40
	hitcost = 100
	switched_on_qualities = list(QUALITY_HAMMERING = 10, QUALITY_PULSING = 20)
	switched_off_qualities = list(QUALITY_HAMMERING = 10)
	use_power_cost = 0.8
	suitable_cell = /obj/item/cell/medium
	glow_color = COLOR_LIGHTING_ORANGE_BRIGHT
	cell = /obj/item/cell/medium/high
	var/slime_killer = FALSE
	structure_damage_factor = STRUCTURE_DAMAGE_BLUNT
	matter = list(MATERIAL_STEEL = 10, MATERIAL_GLASS = 1, MATERIAL_PLASTIC = 10)

/obj/item/tool/baton/maul
	name = "shock maul"
	desc = "A heavy duty stun-baton designed for riot control and in rare cases - coralling oversized faunda"
	icon_state = "stunmaul"
	icon = 'icons/obj/weapons.dmi'
	item_state = "stunmaul"
	wielded_icon = "stunmaul_wielded"
	slot_flags = SLOT_BELT
	toggleable = TRUE
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_HUGE
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("subjugated", "battered", "oppressed", "persecuted")
	effective_faction = list("spider") // Spiders are weak to crushing.
	price_tag = 800
	stunforce = 0
	agonyforce = 60
	hitcost = 1000
	switched_on_qualities = list(QUALITY_HAMMERING = 20, QUALITY_PULSING = 30)
	switched_off_qualities = list(QUALITY_HAMMERING = 20)
	use_power_cost = 0.8
	suitable_cell = /obj/item/cell/large
	glow_color = COLOR_LIGHTING_ORANGE_BRIGHT
	cell = /obj/item/cell/large/high
	structure_damage_factor = STRUCTURE_DAMAGE_BLUNT
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 15, MATERIAL_SILVER = 10)
	clickdelay_offset = DEFAULT_ATTACK_COOLDOWN*1.5

/obj/item/tool/baton/mini
	name = "mini stun baton"
	desc = "A small stun baton for self defense on a buget."
	icon_state = "shocker"
	item_state = "shocker"
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_SMALL
	price_tag = 120
	agonyforce = 20
	hitcost = 50
	max_upgrades = 2
	switched_on_qualities = list(QUALITY_HAMMERING = 5, QUALITY_PULSING = 10)
	switched_off_qualities = list(QUALITY_HAMMERING = 5)
	use_power_cost = 0.4
	suitable_cell = /obj/item/cell/small
	cell = /obj/item/cell/small/high
	matter = list(MATERIAL_STEEL = 5, MATERIAL_GLASS = 1, MATERIAL_PLASTIC = 5)

/obj/item/tool/baton/turn_on(mob/user)
	if (cell && cell.charge > 0)
		to_chat(user, SPAN_NOTICE("You switch [src] on."))
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		set_light(1.5, 1)
		..()
	else
		to_chat(user, SPAN_WARNING("[src] has no power!"))
		set_light(0)

/obj/item/tool/baton/turn_off(mob/user)
	playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You switch [src] off."))
	set_light(0)
	..()

/obj/item/tool/baton/Initialize()
	. = ..()
	update_icon()

/obj/item/tool/baton/Destroy()
	QDEL_NULL(cell)
	return ..()

/obj/item/tool/baton/handle_atom_del(atom/A)
	..()
	if(A == cell)
		cell = null
		update_icon()

/obj/item/tool/baton/proc/deductcharge(var/power_drain)
	if(cell)
		. = cell.checked_use(power_drain) //try to use enough power
		if(!cell.check_charge(hitcost))	//do we have enough power for another hit?
			turn_off()

/obj/item/tool/baton/update_icon()
	if(switched_on)
		icon_state = "[initial(icon_state)]_active"
	else if(!cell)
		icon_state = "[initial(icon_state)]_nocell"
	else
		icon_state = "[initial(icon_state)]"

	if(icon_state == "[initial(icon_state)]_active")
		set_light(1.5, 1)
	else
		set_light(0)

/obj/item/tool/baton/examine(mob/user)
	if(!..(user, 1))
		return

	if(cell)
		to_chat(user, SPAN_NOTICE("The baton is [round(cell.percent())]% charged."))
	else
		to_chat(user, SPAN_WARNING("The baton does not have a power source installed."))

/obj/item/tool/baton/attack_self(mob/user)
	..()
	if(cell && cell.charge > hitcost)
		playsound(loc, "sparks", 75, 1, -1)
		update_icon()
	add_fingerprint(user)

/obj/item/tool/baton/attack(mob/M, mob/user)
	if(switched_on && (CLUMSY in user.mutations) && prob(50))
		to_chat(user, SPAN_DANGER("You accidentally hit yourself with the [src]!"))
		apply_hit_effect(user, user, BP_HEAD)
		deductcharge(hitcost)
		return
	return ..()

/obj/item/tool/baton/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(isrobot(target))
		return ..()

	var/agony = agonyforce
	var/stun = stunforce
	var/obj/item/organ/external/affecting = null
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		affecting = H.get_organ(hit_zone)

	if(user.a_intent == I_HURT)
		. = ..()
		if (!.)	//item/attack() does it's own messaging and logs
			return 0	// item/attack() will return 1 if they hit, 0 if they missed.

		//whacking someone causes a much poorer electrical contact than deliberately prodding them.
		stun *= 0.5
		if(switched_on)		//Checks to see if the stunbaton is on.
			agony *= 0.5	//whacking someone causes a much poorer contact than prodding them.
		else
			agony = 0	//Shouldn't really stun if it's off, should it?
		//we can't really extract the actual hit zone from ..(), unfortunately. Just act like they attacked the area they intended to.
	else if(!switched_on)
		if(affecting)
			target.visible_message(SPAN_WARNING("[target] has been prodded in the [affecting.name] with [src] by [user]. Luckily it was off."))
		else
			target.visible_message(SPAN_WARNING("[target] has been prodded with [src] by [user]. Luckily it was off."))
	else
		if(affecting)
			target.visible_message(SPAN_DANGER("[target] has been prodded in the [affecting.name] with [src] by [user]!"))
		else
			target.visible_message(SPAN_DANGER("[target] has been prodded with [src] by [user]!"))
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)

	//stun effects
	if(switched_on && deductcharge(hitcost))
		target.stun_effect_act(stun, agony, hit_zone, src)
		msg_admin_attack("[key_name(user)] stunned [key_name(target)] with the [src].")

		if(ishuman(target))
			var/mob/living/carbon/human/H = target
			H.forcesay(hit_appends)
		if(isslime(target) && slime_killer)
			var/mob/living/carbon/slime/S = target
			S.death()

/obj/item/tool/baton/emp_act(severity)
	if(cell)
		cell.emp_act(severity)	//let's not duplicate code everywhere if we don't have to please.
	..()

//secborg stun baton module
/obj/item/tool/baton/robot/attack_self(mob/user)
	//try to find our power cell
	var/mob/living/silicon/robot/R = loc
	if (istype(R))
		cell = R.cell
	return ..()

/obj/item/tool/baton/robot/attackby(obj/item/W, mob/user)
	return

//Makeshift stun baton. Replacement for stun gloves.
/obj/item/tool/baton/cattleprod
	name = "stun prod"
	desc = "An improvised stun baton."
	icon_state = "stunprod"
	item_state = "prod"
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	stunforce = 0
	agonyforce = 40	//same force as a stunbaton, but uses way more charge.
	hitcost = 150
	attack_verb = list("poked")
	slot_flags = null
	cell = null
	structure_damage_factor = STRUCTURE_DAMAGE_NORMAL

/obj/item/tool/baton/excelbaton
	name = "Expropriator"
	desc = "A cheap and effective way to feed the red tide."
	icon_state = "sovietbaton"
	item_state = "soviet"
	force = WEAPON_FORCE_PAINFUL
	light_color = COLOR_LIGHTING_CYAN_BRIGHT
	throwforce = WEAPON_FORCE_PAINFUL
	stunforce = 0
	agonyforce = 40
	hitcost = 100
	attack_verb = list("battered")
	slot_flags = SLOT_BELT
	structure_damage_factor = STRUCTURE_DAMAGE_NORMAL
	matter = list(MATERIAL_STEEL = 15, MATERIAL_PLASTEEL = 5)
	cell = /obj/item/cell/medium/excelsior

/obj/item/tool/baton/slimebaton
	name = "xenobio baton"
	desc = "A stunbaton that is designed against slimes and other lab mistakes."
	icon_state = "prod_si"
	item_state = "prod_si"
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	stunforce = 0
	agonyforce = 50
	hitcost = 125
	attack_verb = list("poked")
	slime_killer = TRUE
	slot_flags = null
	cell = null
	matter = list(MATERIAL_STEEL = 13, MATERIAL_GLASS = 2, MATERIAL_PLASTIC = 13)

//Arc Welder both a welder and a stunbaton in one

/obj/item/tool/baton/arcwelder
	name = "arc welder"
	desc = "A specialized tool designed by the Artificer's Guild. It functions as a portable battery powered welder, partial multitool, and incredibly painful taser. Due to its complex design it doesn't require welding goggles nor conduct shocks."
	icon = 'icons/obj/tools.dmi'
	icon_state = "arc_welder"
	item_state = "arc_welder"
	w_class = ITEM_SIZE_NORMAL
	worksound = WORKSOUND_WELDING
	switched_on_qualities = list(QUALITY_WELDING = 45, QUALITY_PULSING = 30, QUALITY_WIRE_CUTTING = 15, QUALITY_CAUTERIZING = 10)
	matter = list(MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 3)
	price_tag = 1000 //valuable given its design
	use_power_cost = 1.2
	sparks_on_use = TRUE
	force = WEAPON_FORCE_WEAK
	switched_on_forcemult = 2.1 //15
	throwforce = WEAPON_FORCE_WEAK
	suitable_cell = /obj/item/cell/medium
	toggleable = TRUE
	create_hot_spot = TRUE
	glow_color = COLOR_BLUE_LIGHT
	max_upgrades = 3
	agonyforce = 40
	hitcost = 100

/obj/item/tool/baton/arcwelder/cyborg
	desc = "A specialized tool designed by the Artificer's Guild. It functions as a battery powered welder and multitool. This version has a regulation on it preventing it to be used as a taser."
	name = "integrated arc welder"
	suitable_cell = /obj/item/cell/medium/moebius/nuclear

/obj/item/tool/baton/arcwelder/turn_on(mob/user)
	if (cell && cell.charge > 0)
		item_state = "[initial(item_state)]_on"
		to_chat(user, SPAN_NOTICE("You switch [src] on."))
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		..()
		damtype = BURN
	else
		item_state = initial(item_state)
		to_chat(user, SPAN_WARNING("[src] has no power!"))

/obj/item/tool/baton/arcwelder/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/effects/sparks1.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You switch [src] off."))
	..()
	damtype = initial(damtype)
