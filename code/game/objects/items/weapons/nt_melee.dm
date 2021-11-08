//Warning! If you change icon_state or item_state, make sure you change path for sneath as well. icons/obj/sneath.dmi
/obj/item/tool/sword/nt // not supposed to be in the game, had to make the shortsword its own type to prevent fucking up the scourge. sorry.
	name = "short sword"
	desc = "A saintly looking sword, made to do God's work. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_shortsword"
	item_state = "nt_shortsword"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_WEAK
	armor_penetration = ARMOR_PEN_DEEP
	price_tag = 300
	matter = list(MATERIAL_BIOMATTER = 25, MATERIAL_STEEL = 5)

/obj/item/tool/sword/nt/equipped(mob/living/M)
	. = ..()
	if(is_held() && is_neotheology_disciple(M))
		embed_mult = 0.1
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
	armor_penetration = ARMOR_PEN_DEEP
	price_tag = 300
	matter = list(MATERIAL_BIOMATTER = 25, MATERIAL_STEEL = 5)

/obj/item/tool/sword/nt/longsword
	name = "longsword"
	desc = "A saintly looking longsword, recommended by experienced crusaders. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon_state = "nt_longsword"
	item_state = "nt_longsword"
	force = WEAPON_FORCE_ROBUST
	armor_penetration = ARMOR_PEN_EXTREME
	w_class = ITEM_SIZE_BULKY
	price_tag = 500
	matter = list(MATERIAL_BIOMATTER = 75, MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 5)

/obj/item/tool/knife/dagger/nt
	name = "dagger"
	desc = "A saintly looking dagger, may the absolute have mercy. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_dagger"
	item_state = "nt_dagger"
	force = WEAPON_FORCE_PAINFUL
	armor_penetration = ARMOR_PEN_MASSIVE
	price_tag = 120
	matter = list(MATERIAL_BIOMATTER = 10, MATERIAL_STEEL = 1)

/obj/item/tool/spear/halberd
	name = "halberd"
	desc = "This weapon of ancient design appears to be a spear-axe hybrid. \
	It saw a lot of use back in the Dark Ages back on Earth - in more recent times, sablekyne hunters use a similar weapon \
	on their homeworlds, the weapons practical use taking down huge and heavily armored wildlife lead to the church adopting its own design."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_halberd"
	item_state = "nt_halberd"
	wielded_icon = "nt_halberd_wielded"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MASSIVE
	price_tag = 600
	matter = list(MATERIAL_BIOMATTER = 80, MATERIAL_STEEL = 8, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 2)

/obj/item/tool/sword/nt/scourge
	name = "scourge"
	desc = "A saintly looking scourge, extreme punishment in handheld form. Can be extended to hurt more. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon_state = "nt_scourge"
	item_state = "nt_scourge"
	force = WEAPON_FORCE_ROBUST
	var/force_extended = WEAPON_FORCE_PAINFUL
	armor_penetration = ARMOR_PEN_MASSIVE
	var/armor_penetration_extended = ARMOR_PEN_HALF
	var/extended = FALSE
	var/agony = 20
	var/agony_extended = 45 //Church harmbaton! This is legit better then a normal baton as it can be upgraded AND has base 15 damage
	var/stun = 0
	w_class = ITEM_SIZE_BULKY
	price_tag = 800
	matter = list(MATERIAL_BIOMATTER = 50, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 2)

/obj/item/tool/sword/nt/scourge/attack_self(mob/user)
	if(isBroken)
		to_chat(user, SPAN_WARNING("\The [src] is broken."))
		return
	if(extended)
		unextend()
	else
		extend()

/obj/item/tool/sword/nt/scourge/proc/extend()
	extended = TRUE
	force += (force_extended - initial(force))
	armor_penetration += (armor_penetration_extended - initial(armor_penetration))
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
	armor_penetration = initial(armor_penetration)
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
	throwforce = 75 //We 2 shot anyone!
	armor_penetration = ARMOR_PEN_HALF
	throw_speed = 3
	price_tag = 150
	matter = list(MATERIAL_BIOMATTER = 10, MATERIAL_STEEL = 5,) // easy to mass-produce and arm the faithful

/obj/item/tool/sword/nt/spear/equipped(mob/living/W)
	. = ..()
	if(is_held() && is_neotheology_disciple(W))
		embed_mult = 0.1
	else
		embed_mult = initial(embed_mult)
	if(isBroken)
		force = WEAPON_FORCE_NORMAL
		throwforce = WEAPON_FORCE_HARMLESS

/obj/item/tool/sword/nt/spear/dropped(mob/living/W)
	embed_mult = 300
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

/obj/item/shield/riot/nt
	name = "shield"
	desc = "A saintly looking shield, let the God protect you. \
	It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division. \
	Has several leather straps on the back to hold melee weapons."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_shield"
	item_state = "nt_shield"
	force = WEAPON_FORCE_DANGEROUS
	armor = list(melee = 20, bullet = 30, energy = 30, bomb = 0, bio = 0, rad = 0)
	matter = list(MATERIAL_BIOMATTER = 50, MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 10, MATERIAL_GOLD = 5)
	price_tag = 1000
	base_block_chance = 60
	item_flags = DRAG_AND_DROP_UNEQUIP
	var/obj/item/storage/internal/container
	var/storage_slots = 3
	var/max_w_class = ITEM_SIZE_HUGE
	var/list/can_hold = new/list(
		/obj/item/tool/sword/nt/shortsword,
		/obj/item/tool/sword/nt/spear,
		/obj/item/tool/knife/dagger/nt,
		/obj/item/tool/knife/neotritual,
		/obj/item/book/ritual/cruciform,
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
	//aspects = list(SANCTIFIED) todo:port this
	price_tag = 300
	base_block_chance = 45
	item_flags = DRAG_AND_DROP_UNEQUIP
	max_durability = 110 //So we can brake and need healing time to time
	durability = 110
	var/obj/item/storage/internal/container
	var/storage_slots = 2
	var/max_w_class = ITEM_SIZE_HUGE
	var/list/can_hold = list(
		/obj/item/tool/sword/nt/shortsword,
		/obj/item/tool/sword/nt/spear, //Romans would have these with their shield to ware down their foe
		/obj/item/tool/knife/dagger/nt,
		/obj/item/tool/knife/neotritual,
		/obj/item/book/ritual/cruciform,
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
	armor_penetration = ARMOR_PEN_HALF
	matter = list(MATERIAL_DURASTEEL = 25, MATERIAL_GOLD = 3)
	price_tag = 10000
