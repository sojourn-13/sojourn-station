//Warning! If you change icon_state or item_state, make sure you change path for sneath as well. icons/obj/sneath.dmi
/obj/item/tool/sword/nt // not supposed to be in the game, had to make the shortsword its own type to prevent fucking up the scourge. sorry.
	name = "short sword"
	desc = "A saintly looking sword, made to do God's work. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_shortsword"
	item_state = "nt_shortsword"
	w_class = ITEM_SIZE_NORMAL
	extra_bulk = 3 //a little more size, it's awkward to store out of a sheath.
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_WEAK
	armor_divisor = ARMOR_PEN_DEEP
	price_tag = 300
	matter = list(MATERIAL_BIOMATTER = 25, MATERIAL_STEEL = 5)

/obj/item/tool/sword/nt/equipped(mob/living/M)
	. = ..()
	if(is_held() && is_neotheology_disciple(M))
		embed_mult = 0.05
	else
		embed_mult = initial(embed_mult)

/obj/item/tool/sword/nt/shortsword
	name = "short sword"
	desc = "A saintly looking sword, made to do God's work. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_shortsword"
	item_state = "nt_shortsword"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_WEAK
	armor_divisor = ARMOR_PEN_DEEP
	price_tag = 300
	matter = list(MATERIAL_BIOMATTER = 25, MATERIAL_STEEL = 5)

/obj/item/tool/sword/nt/longsword
	name = "longsword"
	desc = "A saintly looking longsword, recommended by experienced crusaders. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon_state = "nt_longsword"
	item_state = "nt_longsword"
	force = WEAPON_FORCE_ROBUST + 4
	armor_divisor = ARMOR_PEN_HALF
	w_class = ITEM_SIZE_BULKY
	price_tag = 500
	matter = list(MATERIAL_BIOMATTER = 50, MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 5)

/obj/item/tool/knife/dagger/nt
	name = "dagger"
	desc = "A saintly looking dagger, may the absolute have mercy. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_dagger"
	item_state = "nt_dagger"
	force = WEAPON_FORCE_PAINFUL
	armor_divisor = ARMOR_PEN_MASSIVE
	price_tag = 120
	matter = list(MATERIAL_BIOMATTER = 5, MATERIAL_STEEL = 1)

/obj/item/tool/spear/halberd
	name = "halberd"
	desc = "This weapon of ancient design appears to be a spear-axe hybrid. \
	It saw a lot of use back in the Dark Ages back on Earth - in more recent times, sablekyne hunters use a similar weapon \
	on their homeworlds, the weapons practical use taking down huge and heavily armored wildlife lead to the church adopting its own design."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_halberd"
	item_state = "nt_halberd"
	wielded_icon = "nt_halberd_wielded"
	force = WEAPON_FORCE_BRUTAL + 5
	armor_divisor = ARMOR_PEN_MODERATE
	max_upgrades = 3
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	extended_reach = TRUE
	forced_broad_strike = TRUE
	price_tag = 600
	matter = list(MATERIAL_BIOMATTER = 60, MATERIAL_STEEL = 8, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 2)

/obj/item/tool/sword/nt/scourge
	name = "scourge"
	desc = "A saintly looking scourge, extreme punishment in handheld form. Can be extended to hurt more. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon_state = "nt_scourge"
	item_state = "nt_scourge"
	force = WEAPON_FORCE_ROBUST
	var/force_extended = WEAPON_FORCE_PAINFUL
	armor_divisor = 1
	var/armor_divisor_extended = 0.5
	var/extended = FALSE
	var/agony = 20
	var/agony_extended = 45 //Church harmbaton! This is legit better then a normal baton as it can be upgraded AND has base 15 damage
	var/stun = 0
	w_class = ITEM_SIZE_BULKY
	price_tag = 800
	matter = list(MATERIAL_BIOMATTER = 30, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 2)
	has_alt_mode = FALSE

/obj/item/tool/sword/nt/scourge/attack_self(mob/user)
	if(extended)
		unextend()
	else
		extend()

/obj/item/tool/sword/nt/scourge/proc/extend()
	extended = TRUE
	force += (force_extended - initial(force))
	armor_divisor += (armor_divisor_extended - initial(armor_divisor))
	agony += (agony_extended - initial(agony))
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	refresh_upgrades() //it's also sets all to default
	update_icon()

/obj/item/tool/sword/nt/scourge/proc/unextend()
	extended = FALSE
	w_class = initial(w_class)
	agony = initial(agony)
	slot_flags = initial(slot_flags)
	armor_divisor = initial(armor_divisor)
	refresh_upgrades() //it's also sets all to default
	update_icon()

/obj/item/tool/sword/nt/scourge/update_icon()
	if(extended)
		icon_state = initial(icon_state) + "_extended"
	else
		icon_state = initial(icon_state)
	..()

/obj/item/tool/sword/nt/scourge/apply_hit_effect(mob/living/carbon/human/target, mob/living/user, hit_zone)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/O = target
		target.stun_effect_act(stun, agony, hit_zone, src)
		O.say(pick("LORD", "MERCY", "SPARE", "ME", "HAVE", "PLEASE"))

/obj/item/tool/sword/nt/spear
	name = "spear"
	desc = "A saint looking short spear, designed for use with a shield or as a throwing weapon. \
	The spear-tip usually breaks after being thrown at a target, but it can be hammered into shape again."
	icon_state = "nt_spear"
	item_state = "nt_spear"
	wielded_icon = "nt_spear_wielded"
	force = WEAPON_FORCE_DANGEROUS
	var/tipbroken = FALSE
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK | SLOT_BELT
	throwforce = WEAPON_FORCE_LETHAL * 1.5
	armor_divisor = ARMOR_PEN_MASSIVE
	throw_speed = 3
	price_tag = 450
	allow_spin = FALSE
	extended_reach = TRUE
	push_attack = TRUE
	matter = list(MATERIAL_BIOMATTER = 20, MATERIAL_PLASTEEL = 10) // More expensive, high-end spear

/obj/item/tool/sword/nt/spear/equipped(mob/living/W)
	. = ..()
	if(is_held() && is_neotheology_disciple(W))
		embed_mult = 0.2
	else
		embed_mult = initial(embed_mult)

/obj/item/tool/sword/nt/spear/dropped(mob/living/W)
	embed_mult = 600
	..()

/obj/item/tool/sword/nt/spear/on_embed(mob/user)
	. = ..()
	tipbroken = TRUE

/obj/item/tool/sword/nt/spear/examine(mob/user)
	. = ..()
	if (tipbroken)
		to_chat(user, SPAN_WARNING("\The [src] is broken. It looks like it could be repaired with a hammer."))

/obj/item/tool/sword/nt/spear/attackby(obj/item/I, var/mob/user)
	. = ..()
	if (I.has_quality(QUALITY_HAMMERING))
		if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_HAMMERING, FAILCHANCE_EASY, STAT_MEC))
			to_chat(user, SPAN_NOTICE("You repair \the damaged spear-tip."))
			tipbroken = FALSE

/obj/item/tool/sword/nt/flanged
	name = "flanged mace"
	desc = "A saintly looking mace, designed to be a beacon of hope in the darkest of times. Devotees can activate it to light their path. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon_state = "nt_flanged"
	item_state = "nt_flanged"
	force = WEAPON_FORCE_ROBUST
	armor_divisor = ARMOR_PEN_HALF
	w_class = ITEM_SIZE_BULKY
	price_tag = 800
	matter = list(MATERIAL_BIOMATTER = 30, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 5, MATERIAL_SILVER = 3)
	tool_qualities = list(QUALITY_HAMMERING = 10) //Not designed for that fine nailing
	var/glowing = FALSE
	sharp = FALSE
	embed_mult = 0
	has_alt_mode = FALSE

/obj/item/tool/sword/nt/flanged/attack_self(mob/user)
	var/mob/living/carbon/human/theuser = user
	var/obj/item/implant/core_implant/cruciform/CI = theuser.get_core_implant()
	if(!CI || !CI.active || !CI.wearer || !istype(CI,/obj/item/implant/core_implant/cruciform))
		to_chat(user, SPAN_WARNING("You do not have a cruciform with which to light this beacon!"))
		return
	if(CI.power < 20)
		to_chat(user, SPAN_WARNING("You do not have enough power to light up the beacon!"))
		return
	if(glowing)
		to_chat(user, SPAN_WARNING("The flanged mace is still lit up."))
		return
	else
		set_light(l_range = 4, l_power = 2, l_color = COLOR_YELLOW)
		to_chat(user, SPAN_WARNING("The beacon has been lit!"))
		glowing = TRUE
		update_icon()
		damtype = BURN
		spawn(1200)
			set_light(l_range = 0, l_power = 0, l_color = COLOR_YELLOW)
			glowing = FALSE
			damtype = initial(damtype)
			update_icon()

/obj/item/tool/sword/nt/flanged/update_icon()
	if(glowing)
		icon_state = initial(icon_state) + "_glow"
		item_state = initial(item_state) + "_glow"
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)
	..()

/obj/item/tool/sword/nt/warhammer
	name = "warhammer"
	desc = "A saintly looking warhammer, designed to knock back attackers when held in both hands. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon_state = "nt_warhammer"
	item_state = "nt_warhammer"
	wielded_icon = "nt_warhammer_wielded"
	force = WEAPON_FORCE_BRUTAL - 3 //Naturally weaker do to knockbacking are targets (can stun lock)
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	armor_divisor = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_BULKY
	price_tag = 800
	matter = list(MATERIAL_BIOMATTER = 30, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 8)
	tool_qualities = list(QUALITY_HAMMERING = 30) //Not designed for that fine nailing
	var/glowing = FALSE
	sharp = FALSE
	embed_mult = 0
	effective_faction = list("spider") // Spiders are weak to crushing.
	damage_mult = 2

/obj/item/tool/sword/nt/warhammer/attack(atom/movable/target, mob/user)
	if(wielded && prob(50))
		var/whack_speed = 1
		var/throwdir = get_dir(user,target)
		target.throw_at(get_edge_target_turf(target, throwdir),whack_speed,whack_speed)
	..()

/obj/item/tool/sword/nt/power
	name = "\"Vexilar\" forceblade"
	desc = "A hefty greatsword with golden wiring embedded into its handle and blade, designed to channel the power of a cruciform to project an ultra-sharp energy blade. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon_state = "nt_force"
	item_state = "nt_force"
	switched_on_icon_state = "nt_force_on"
	switched_on_item_state = "nt_force_on"
	force = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_BULKY
	no_swing = TRUE
	f
	matter = list(MATERIAL_BIOMATTER = 50, MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 6, MATERIAL_GOLD = 3)
	toggleable = TRUE
	heat = 3800
	switched_on_forcemult = 1.75 //35 total; slightly better than a halberd
	switched_on_penmult = 2 //30 total; same as a halberd
	switched_on_qualities = list(QUALITY_CUTTING = 30, QUALITY_SAWING = 30)
	switched_off_qualities = list(QUALITY_CUTTING = 10, QUALITY_SAWING = 10)
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_SAWING = 10)
	effective_faction = list("psi_monster", "hive") //DEUS VULT
	damage_mult = 1.2 //20% damage buff when purging the ABOMINATION
	var/faith_cost = 5 //How much faith does it use per attack?

/obj/item/tool/sword/nt/power/attack_self(mob/living/user)
	if(!user.get_core_implant(/obj/item/implant/core_implant/cruciform)) //No cruciform, no activation
		to_chat(user, SPAN_WARNING("You have absolutely no idea how this works."))
		return FALSE
	else
		var/obj/item/implant/core_implant/cruciform/user_cruci = user.get_core_implant(/obj/item/implant/core_implant/cruciform)
		if(user_cruci.power < faith_cost && !switched_on)
			to_chat(user, SPAN_WARNING("Your cruciform has to recharge before you activate the [name]!"))
			return FALSE
		else if(!switched_on)
			user_cruci.use_power(faith_cost)
	set_light(l_range = 3, l_power = 1, l_color = COLOR_BLUE_LIGHT)
	..()

/obj/item/tool/sword/nt/power/attack(mob/living/M, mob/living/user)
	if(switched_on)
		var/obj/item/implant/core_implant/cruciform/user_cruci = user.get_core_implant(/obj/item/implant/core_implant/cruciform)
		if(!user_cruci || user_cruci.power < faith_cost)
			turn_off()
			to_chat(user, SPAN_WARNING("The light of the [name] dims, its power extinguished."))
		else
			user_cruci.use_power(faith_cost)
	..()

/obj/item/tool/sword/nt/power/turn_off(mob/user)
	. = ..()
	set_light(l_range = 0, l_power = 0, l_color = COLOR_BLUE_LIGHT)

/obj/item/tool/sword/nt/power/is_hot()
	if (switched_on)
		return heat

/obj/item/shield/riot/nt
	name = "shield"
	desc = "A saintly looking shield, let the God protect you. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division. \
	Has several leather straps on the back to hold melee weapons."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_shield"
	item_state = "nt_shield"
	force = WEAPON_FORCE_DANGEROUS
	armor_list = list(melee = 5, bullet = 5, energy = 2, bomb = 15, bio = 0, rad = 0)
	matter = list(MATERIAL_BIOMATTER = 35, MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 5, MATERIAL_GOLD = 3)
	price_tag = 1000
	base_block_chance = 60
	item_flags = DRAG_AND_DROP_UNEQUIP

	max_durability = 180
	durability = 180

	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "nt_shield"
		)

	var/obj/item/storage/internal/container
	var/storage_slots = 3
	var/max_w_class = ITEM_SIZE_HUGE
	var/list/can_hold = new/list(
		/obj/item/tool/sword/nt/shortsword,
		/obj/item/tool/sword/nt/spear,
		/obj/item/tool/knife/dagger/nt,
		/obj/item/tool/knife/neotritual,
		/obj/item/book/ritual/cruciform,
		/obj/item/stack/thrown/nt/verutum
		)

/obj/item/shield/riot/nt/New()
	container = new /obj/item/storage/internal(src)
	container.storage_slots = storage_slots
	container.can_hold = can_hold
	container.max_w_class = max_w_class
	container.master_item = src
	.=..()

/obj/item/shield/riot/nt/proc/handle_attack_hand(mob/user as mob)
	return container.handle_attack_hand(user)

/obj/item/shield/riot/nt/proc/handle_mousedrop(var/mob/user, var/atom/over_object)
	return container.handle_mousedrop(user, over_object)

/obj/item/shield/riot/nt/MouseDrop(obj/over_object)
	if(container.handle_mousedrop(usr, over_object))
		return TRUE
	return ..()

/obj/item/shield/riot/nt/attack_hand(mob/user as mob)
	if (loc == user)
		container.open(user)
	else
		container.close_all()
		..()

	src.add_fingerprint(user)
	return

/obj/item/shield/riot/nt/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/tool/baton) || istype(W, /obj/item/tool/sword/nt))
		on_bash(W, user)
	else
		..()

/obj/item/shield/riot/nt/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	return base_block_chance

/obj/item/shield/buckler/nt
	name = "NT Parma"
	desc = "A round shield with a golden trim. Has several biomatter-leather straps on the back to hold melee weapons."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_buckler" //by CeUvi we thx thy
	item_state = "nt_buckler"
	matter = list(MATERIAL_BIOMATTER = 15, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 2, MATERIAL_GOLD = 1)
	price_tag = 300
	base_block_chance = 45
	item_flags = DRAG_AND_DROP_UNEQUIP
	max_durability = 60 //So we can brake and need healing time to time
	durability = 60
	var/obj/item/storage/internal/container
	var/storage_slots = 1
	var/max_w_class = ITEM_SIZE_HUGE
	var/list/can_hold = list(
		/obj/item/tool/sword/nt/shortsword,
		/obj/item/tool/sword/nt/spear, //Romans would have these with their shield to ware down their foe
		/obj/item/tool/knife/dagger/nt,
		/obj/item/tool/knife/neotritual,
		/obj/item/book/ritual/cruciform,
		/obj/item/stack/thrown/nt/verutum
		)

/obj/item/shield/buckler/nt/New()
	container = new /obj/item/storage/internal(src)
	container.storage_slots = storage_slots
	container.can_hold = can_hold
	container.max_w_class = max_w_class
	container.master_item = src
	..()

/obj/item/shield/buckler/nt/proc/handle_attack_hand(mob/user as mob)
	return container.handle_attack_hand(user)

/obj/item/shield/buckler/nt/proc/handle_mousedrop(var/mob/user, var/atom/over_object)
	return container.handle_mousedrop(user, over_object)

/obj/item/shield/buckler/nt/MouseDrop(obj/over_object)
	if(container.handle_mousedrop(usr, over_object))
		return TRUE
	return ..()

/obj/item/shield/buckler/nt/attack_hand(mob/user as mob)
	if (loc == user)
		container.open(user)
	else
		container.close_all()
		..()

	add_fingerprint(user)
	return

/obj/item/shield/riot/nt/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/tool/baton) || istype(W, /obj/item/tool/sword/nt))
		on_bash(W, user)
	else
		..()

/obj/item/tool/sword/crusader
	name = "crusader great sword"
	desc = "A traditional blade meeting the materials and design of the future. \
	It's made from durasteel and the craftsmanship is of the highest quality. It bears the insignia of the Church. Deus Vult."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "crusader"
	item_state = "crusader"
	force = WEAPON_FORCE_LETHAL
	armor_divisor = ARMOR_PEN_HALF
	matter = list(MATERIAL_DURASTEEL = 25, MATERIAL_GOLD = 3)
	price_tag = 10000

//Throwables

/obj/item/stack/thrown/nt
	name = "Faithful Throwing knife"
	desc = "A saintly-looking sword forged to do God\'s distant work."
	icon_state = "nt_shortsword"
	item_state = "nt_shortsword"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_WEAK
	armor_divisor = ARMOR_PEN_SHALLOW
	price_tag = 300
	matter = list(MATERIAL_BIOMATTER = 25, MATERIAL_STEEL = 5)

/obj/item/stack/thrown/nt/equipped(mob/living/M)
	..()
	if(is_held() && is_neotheology_disciple(M))
		embed_mult = 0.2
	else
		embed_mult = initial(embed_mult)

/obj/item/stack/thrown/nt/verutum
	name = "verutum"
	desc = "A short, saintly-looking javelin for throwing or use with a shield. They are small enough to allow holding multiple in one hand."
	icon_state = "nt_verutum"
	item_state = "nt_verutum"
	singular_name = "verutum"
	plural_name = "veruta"
	wielded_icon = "nt_verutum_wielded"
	force = 20

	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK | SLOT_BELT
	throwforce = WEAPON_FORCE_LETHAL
	armor_divisor = ARMOR_PEN_DEEP
	throw_speed = 3
	price_tag = 150
	allow_spin = FALSE
	matter = list(MATERIAL_BIOMATTER = 10, MATERIAL_STEEL = 5) // Easy to mass-produce and arm the faithful
	//style_damage = 30 - todo port this maybe?

/obj/item/stack/thrown/nt/verutum/launchAt()
	embed_mult = 600
	..()
