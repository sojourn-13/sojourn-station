//** Shield Helpers
//These are shared by various items that have shield-like behaviour

//bad_arc is the ABSOLUTE arc of directions from which we cannot block. If you want to fix it to e.g. the user's facing you will need to rotate the dirs yourself.
/proc/check_parry_arc(mob/user, var/bad_arc, atom/damage_source = null, mob/attacker = null)
	//check attack direction
	var/attack_dir = 0 //direction from the user to the source of the attack
	if(istype(damage_source, /obj/item/projectile))
		var/obj/item/projectile/P = damage_source
		attack_dir = get_dir(get_turf(user), P.starting)
	else if(attacker)
		attack_dir = get_dir(get_turf(user), get_turf(attacker))
	else if(damage_source)
		attack_dir = get_dir(get_turf(user), get_turf(damage_source))

	if(!(attack_dir && (attack_dir & bad_arc)))
		return 1
	return 0

/proc/default_parry_check(mob/user, mob/attacker, atom/damage_source)
	//parry only melee attacks
	if(istype(damage_source, /obj/item/projectile) || (attacker && get_dist(user, attacker) > 1) || user.incapacitated())
		return 0

	//block as long as they are not directly behind us
	var/bad_arc = reverse_direction(user.dir) //arc of directions from which we cannot block
	if(!check_parry_arc(user, bad_arc, damage_source, attacker))
		return 0

	return 1

/obj/item/shield
	name = "shield"
	var/base_block_chance = 35
	var/slowdown_time = 1
	armor_list = list(melee = 2, bullet = 2, energy = 1, bomb = 0, bio = 0, rad = 0)
	var/max_durability = 200 //So we can brake and need healing time to time
	var/durability = 200
	var/can_block_proj = TRUE

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "steadies their shield for wide bashing"
	alt_mode_lossrate = 0.4

/obj/item/shield/proc/breakShield(mob/user)
	if(user)
		to_chat(user, SPAN_DANGER("Your [src] broke!"))
		new /obj/item/material/shard/shrapnel(user.loc)
	else
		new /obj/item/material/shard/shrapnel(get_turf(src))
	playsound(get_turf(src), 'sound/items/electronic_assembly_emptying.ogg', 50, 1 -3)
	spawn(2) qdel(src)
	return

/obj/item/shield/proc/adjustShieldDurability(amount, user)
	durability += amount
	if(durability > max_durability)
		durability = max_durability
	if(durability <= 1)
		breakShield(user)

/obj/item/shield/attackby(obj/item/I, mob/user)
	if(I.has_quality(QUALITY_ADHESIVE))
		if(src.durability)
			user.visible_message(SPAN_NOTICE("[user] begins repairing \the [src] with the [I]!"))
			if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_ADHESIVE, FAILCHANCE_EASY, required_stat = STAT_MEC))
				src.adjustShieldDurability(src.max_durability * 0.8 + (user.stats.getStat(STAT_MEC)*0.2)*0.1, user)

/obj/item/shield/examine(mob/user)
	if(!..(user,2))
		return

	if (durability)
		if (durability > max_durability * 0.95)
			return
		else if (durability > max_durability * 0.80)
			to_chat(user, "It has a few light scratches.")
		else if (durability > max_durability * 0.40)
			to_chat(user, SPAN_NOTICE("It shows minor signs of stress and wear."))
		else if (durability > max_durability * 0.20)
			to_chat(user, SPAN_WARNING("It looks a bit cracked and worn."))
		else if (durability > max_durability * 0.10)
			to_chat(user, SPAN_WARNING("Whatever use this tool once had is fading fast."))
		else if (durability > max_durability * 0.05)
			to_chat(user, SPAN_WARNING("Attempting to use this thing as a tool is probably not going to work out well."))
		else
			to_chat(user, SPAN_DANGER("It's falling apart. This is one slip away from just being a pile of assorted trash."))

/obj/item/shield/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")

	if(istype(damage_source, /obj/item/projectile) || (attacker && get_dist(user, attacker) > 1) || user.incapacitated())
		return 0

	//block as long as they are not directly behind us
	var/bad_arc = reverse_direction(user.dir) //arc of directions from which we cannot block
	if(istype(attacker, /mob/living/simple_animal/hostile) || istype(attacker, /mob/living/carbon/superior_animal/))
		var/mob/living/carbon/human/defender = user
		if(check_shield_arc(defender, bad_arc, damage_source, attacker))
			if(defender.halloss >= 50)
				defender.visible_message(SPAN_DANGER("\The [defender] is too tired to block!"))
				return 0
			else
				var/damage_received = CLAMP(damage * (CLAMP(100-user.stats.getStat(STAT_TGH)/2,0,100) / 100) - user.stats.getStat(STAT_TGH)/5,1,100)
				if(damage_received <= 0)
					damage_received = 1 //Alawys small amount of damage
				if(istype(attacker, /mob/living/carbon/superior_animal/roach/))
					adjustShieldDurability(-(damage_received/6))
				else if(istype(attacker, /mob/living/carbon/superior_animal/giant_spider/))
					adjustShieldDurability(-(damage_received/2))
				else if(istype(attacker, /mob/living/carbon/superior_animal/termite_no_despawn/))
					adjustShieldDurability(-(damage_received/2))
				else
					adjustShieldDurability(-damage_received)
				defender.adjustHalLoss(damage_received)
				defender.visible_message(SPAN_DANGER("\The [defender] blocks [attack_text] with \the [src]!"))
				return 1
	if(check_parry_arc(user, bad_arc, damage_source, attacker))
		if(prob(get_block_chance(user, damage, damage_source, attacker)))
			user.visible_message(SPAN_DANGER("\The [user] blocks [attack_text] with \the [src]!"))
			return 1
	return 0

/obj/item/shield/block_bullet(mob/user, var/obj/item/projectile/damage_source, def_zone)
	var/bad_arc = reverse_direction(user.dir)
	var/list/protected_area = get_protected_area(user)
	if(prob(50))
		protected_area = protected_area | get_partial_protected_area(user)
	if(protected_area.Find(def_zone) && check_shield_arc(user, bad_arc, damage_source) && can_block_proj)
		visible_message(SPAN_DANGER("\The [user] blocks \the [damage_source] with \the [src]!"))
		adjustShieldDurability(-damage_source.damage_types[BRUTE], user)
		adjustShieldDurability(-damage_source.damage_types[BURN], user)
		visible_message(SPAN_DANGER("\The [user] blocks \the [damage_source] with \the [src]!"))
		playsound(user.loc, 'sound/weapons/shield/shieldblock.ogg', 50, 1)
		return 1
	return 0

/obj/item/shield/proc/check_shield_arc(mob/user, var/bad_arc, atom/damage_source = null, mob/attacker = null)
	//shield direction

	var/shield_dir = 0
	if(user.get_equipped_item(slot_l_hand) == src)
		shield_dir = turn(user.dir, 90)
	else if(user.get_equipped_item(slot_r_hand) == src)
		shield_dir = turn(user.dir, -90)
	//check attack direction
	var/attack_dir = 0 //direction from the user to the source of the attack
	if(istype(damage_source, /obj/item/projectile))
		var/obj/item/projectile/P = damage_source
		attack_dir = get_dir(get_turf(user), P.starting)
	else if(attacker)
		attack_dir = get_dir(get_turf(user), get_turf(attacker))
	else if(damage_source)
		attack_dir = get_dir(get_turf(user), get_turf(damage_source))

	//blocked directions
	if(user.get_equipped_item(slot_back) == src)
		if(attack_dir & bad_arc && attack_dir)
			return TRUE
		else
			return FALSE


	if(wielded && !(attack_dir && (attack_dir & bad_arc)))
		return TRUE
	else if(!(attack_dir == bad_arc) && !(attack_dir == reverse_direction(shield_dir)) && !(attack_dir == (bad_arc | reverse_direction(shield_dir))))
		return TRUE
	return FALSE

/obj/item/shield/proc/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	return base_block_chance

/obj/item/shield/proc/get_protected_area(mob/user)
	return BP_ALL_LIMBS

/obj/item/shield/proc/get_partial_protected_area(mob/user)
	return list()

/obj/item/shield/attack(mob/M, mob/user)
	if(isliving(M))
		var/mob/living/L = M
		if(L.slowdown < slowdown_time * 3)
			L.slowdown += slowdown_time
	return ..()

/obj/item/shield/resolve_attackby(atom/target, mob/user)
	if(issuperioranimal(target))
		var/mob/living/carbon/superior_animal/SA = target
		SA.loseTarget(TRUE,TRUE)
		SA.react_to_attack(SA,src,user)
	..()

/obj/item/shield/buckler
	name = "tactical shield"
	desc = "A compact personal shield made of pre-preg aramid fibres designed to stop or deflect bullets without slowing down its wielder."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tactical" //by CeUvi we thx thy
	item_state = "tactical"
	flags = CONDUCT
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	throw_speed = 2
	throw_range = 6
	w_class = ITEM_SIZE_BULKY
	origin_tech = list(TECH_MATERIAL = 2)
	armor_list = list(melee = 5, bullet = 6, energy = 2, bomb = 0, bio = 0, rad = 0)
	matter = list(MATERIAL_GLASS = 5, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 12)
	price_tag = 100
	attack_verb = list("shoved", "bashed")
	max_durability = 120 //So we can brake and need healing time to time
	durability = 120
	var/cooldown = 0 //shield bash cooldown. based on world.time
	var/picked_by_human = FALSE
	var/mob/living/carbon/human/picking_human

/obj/item/shield/buckler/handle_shield(mob/user)
	. = ..()
	if(.) playsound(user.loc, 'sound/weapons/Genhit.ogg', 50, 1)

/obj/item/shield/buckler/get_protected_area(mob/user)
	var/list/p_area = list(BP_CHEST)

	if(user.get_equipped_item(slot_back) == src)
		return p_area

	if(user.get_equipped_item(slot_l_hand) == src)
		p_area.Add(BP_L_ARM)
	else if(user.get_equipped_item(slot_r_hand) == src)
		p_area.Add(BP_R_ARM)

	return p_area

/obj/item/shield/buckler/get_partial_protected_area(mob/user)
	return list(BP_GROIN,BP_HEAD)

/obj/item/shield/buckler/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/tool/baton))
		on_bash(W, user)
	else
		..()

/obj/item/shield/buckler/proc/on_bash(var/obj/item/W, var/mob/user)
	if(cooldown < world.time - 25)
		user.visible_message(SPAN_WARNING("[user] bashes [src] with [W]!"))
		playsound(user.loc, 'sound/effects/shieldbash.ogg', 50, 1)
		cooldown = world.time

/obj/item/shield/buckler/excelsior
	name = "Excelsior shield"
	desc = "A small round shield in Excelsior colours with the rim having a engraving \"A shield only the working people!\"."
	icon_state = "buckler_excelsior"
	item_state = "buckler_excelsior"
	flags = null
	throw_speed = 2
	throw_range = 6
	armor_list = list(melee = 7, bullet = 2, energy = 3, bomb = 10, bio = 0, rad = 0)
	base_block_chance = 60
	matter = list(MATERIAL_GLASS = 5, MATERIAL_STEEL = 8, MATERIAL_PLASTEEL = 15)
	max_durability = 300 //Strong so that we can protect folks from quote a few shots
	durability = 300

//Used for mobs as these has less materals and are pre-damageed
/obj/item/shield/buckler/excelsior/dropped
	matter = list(MATERIAL_GLASS = 3, MATERIAL_STEEL = 2, MATERIAL_PLASTEEL = 1)

/obj/item/shield/buckler/excelsior/dropped/Initialize()
	. = ..()
	durability -= rand(200, 280)

/obj/item/shield/buckler/excelsior/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(!is_excelsior(user))
		return FALSE
	..()

/obj/item/shield/buckler/excelsior/block_bullet(mob/user, var/obj/item/projectile/damage_source, def_zone)
	if(!is_excelsior(user))
		return FALSE
	..()

/obj/item/shield/riot
	name = "ballistic shield"
	desc = "A heavy personal shield made of pre-preg aramid fibres designed to stop or deflect bullets and other projectiles fired at its wielder at the cost of mobility."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "riot"
	item_state = "riot"
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_HUGE
	origin_tech = list(TECH_MATERIAL = 2)
	matter = list(MATERIAL_GLASS = 20, MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 15)
	price_tag = 230
	base_block_chance = 60
	attack_verb = list("shoved", "bashed")
	armor_list = list(melee = 3, bullet = 8, energy = 2, bomb = 20, bio = 0, rad = 0)
	var/cooldown = 0 //shield bash cooldown. based on world.time
	var/picked_by_human = FALSE
	var/mob/living/carbon/human/picking_human
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "riot"
		)

/obj/item/shield/riot/damaged

/obj/item/shield/riot/damaged/Initialize()
	. = ..()
	durability -= rand(130, 50)

/obj/item/shield/riot/handle_shield(mob/user)
	. = ..()
	if(.) playsound(user.loc, 'sound/weapons/shield/shieldmelee.ogg', 50, 1)

/obj/item/shield/riot/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	if(MOVING_QUICKLY(user))
		return 0
	if(MOVING_DELIBERATELY(user))
		return base_block_chance

/obj/item/shield/riot/get_protected_area(mob/user)
	var/list/p_area = list(BP_CHEST, BP_GROIN, BP_HEAD)

	if(user.get_equipped_item(slot_back) == src)
		return p_area

	if(MOVING_QUICKLY(user))
		if(user.get_equipped_item(slot_l_hand) == src)
			p_area = list(BP_L_ARM)
		else if(user.get_equipped_item(slot_r_hand) == src)
			p_area = list(BP_R_ARM)
	else if(MOVING_DELIBERATELY(user) && wielded)
		p_area = BP_ALL_LIMBS

	if(user.get_equipped_item(slot_l_hand) == src)
		p_area.Add(BP_L_ARM)
	else if(user.get_equipped_item(slot_r_hand) == src)
		p_area.Add(BP_R_ARM)
	return p_area

/obj/item/shield/riot/get_partial_protected_area(mob/user)
	if(MOVING_DELIBERATELY(user))
		return list(BP_ALL_LIMBS)

/obj/item/shield/riot/New()
	RegisterSignal(src, COMSIG_ITEM_PICKED, PROC_REF(is_picked))
	RegisterSignal(src, COMSIG_ITEM_DROPPED, PROC_REF(is_dropped))
	return ..()

/obj/item/shield/riot/proc/is_picked()
	var/mob/living/carbon/human/user = loc
	if(istype(user))
		picked_by_human = TRUE
		picking_human = user
		RegisterSignal(picking_human, COMSIG_HUMAN_WALKINTENT_CHANGE, PROC_REF(update_state))
		update_state()

/obj/item/shield/riot/proc/is_dropped()
	if(picked_by_human && picking_human)
		UnregisterSignal(picking_human, COMSIG_HUMAN_WALKINTENT_CHANGE)
		picked_by_human = FALSE
		picking_human = null

/obj/item/shield/riot/proc/update_state()
	if(!picking_human)
		return
	if(MOVING_QUICKLY(picking_human))
		item_state = "[initial(item_state)]_run"
		visible_message("[picking_human] lowers their [src.name].")
	else
		item_state = "[initial(item_state)]_walk"
		visible_message("[picking_human] raises their [src.name] to cover themself!")
	update_wear_icon()

/obj/item/shield/riot/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/tool/baton))
		on_bash(W, user)
	else
		..()

/obj/item/shield/riot/proc/on_bash(var/obj/item/W, var/mob/user)
	if(cooldown < world.time - 25)
		user.visible_message(SPAN_WARNING("[user] bashes [src] with [W]!"))
		playsound(user.loc, 'sound/effects/shieldbash.ogg', 50, 1)
		cooldown = world.time

/obj/item/shield/riot/lid
	name = "lid shield"
	desc = "A detached lid from a trash cart, that works well as shield."
	icon_state = "lid_shield"
	flags = CONDUCT
	throw_speed = 2
	throw_range = 2
	durability = 70
	matter = list(MATERIAL_STEEL = 8)
	base_block_chance = 40
	max_durability = 70 //So we can brake and need healing time to time

/obj/item/shield/riot/dozershield
	name = "bulldozer shield"
	desc = "A crude beast of a shield hewn from slabs of metal welded to a locker door, it has been forged into a wall that stands between you and your foes."
	icon_state = "dozershield"
	item_state = "dozershield"
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_HUGE
	matter = list(MATERIAL_STEEL = 16, MATERIAL_PLASTEEL = 10)
	price_tag = 200
	base_block_chance = 55
	max_durability = 200
	durability = 180
	slowdown_hold = 1 // Unwieldy and makeshift in nature

/obj/item/shield/hardsuit
	name = "hardsuit shield"
	desc = "A massive ballistic shield that seems impossible to wield without mechanical assist."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hardshield"
	item_state = "hardshield"
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_HUGE
	origin_tech = list()
	matter = list()
	price_tag = 0
	base_block_chance = 70
	attack_verb = list("smashed", "bashed")
	armor_list = list(melee = 3, bullet = 5, energy = 2, bomb = 0, bio = 0, rad = 0)
	max_durability = 250 //So we can brake and need healing time to time
	durability = 250
	var/cooldown = 0 //shield bash cooldown. based on world.time
	var/picked_by_human = FALSE
	var/mob/living/carbon/human/picking_human
	slowdown_hold = 3
	var/mob/living/creator
	var/cleanup = TRUE	// Should the shield despawn moments after being discarded by the summoner?
	var/init_procees = TRUE

/obj/item/shield/hardsuit/get_protected_area(mob/user)
	var/list/p_area = list(BP_CHEST, BP_GROIN, BP_HEAD)

	if(user.get_equipped_item(slot_l_hand) == src)
		p_area.Add(BP_L_ARM)
	else if(user.get_equipped_item(slot_r_hand) == src)
		p_area.Add(BP_R_ARM)
	return p_area

/obj/item/shield/hardsuit/get_partial_protected_area(mob/user)
	return list(BP_ALL_LIMBS)

/obj/item/shield/hardsuit/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/tool/baton))
		on_bash(W, user)
	else
		..()

/obj/item/shield/hardsuit/proc/on_bash(var/obj/item/W, var/mob/user)
	if(cooldown < world.time - 25)
		user.visible_message(SPAN_WARNING("[user] bashes [src] with [W]!"))
		playsound(user.loc, 'sound/effects/shieldbash.ogg', 50, 1)
		cooldown = world.time

/obj/item/shield/hardsuit/Initialize(mapload)
	. = ..()
	if(init_procees)
		START_PROCESSING(SSobj, src)

/obj/item/shield/hardsuit/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/shield/hardsuit/dropped()
	if(cleanup)
		spawn(1) if(src) qdel(src)

/obj/item/shield/hardsuit/Process()
	if(!creator || loc != creator || (creator.l_hand != src && creator.r_hand != src))
		// Tidy up a bit.
		if(isliving(loc))
			var/mob/living/carbon/human/host = loc
			if(istype(host))
				for(var/obj/item/organ/external/organ in host.organs)
					for(var/obj/item/O in organ.implants)
						if(O == src)
							organ.implants -= src
			host.pinned -= src
			host.embedded -= src
			host.drop_from_inventory(src)
		if(cleanup)
			spawn(1) if(src) qdel(src)

/*
 * Handmade shield
 */

/obj/item/shield/buckler/handmade
	name = "round handmade shield"
	desc = "A handmade stout shield, that protects the wielder while not weighting them down."
	icon_state = "buckler" //Sprites done by CeUvi
	item_state = "buckler"
	flags = null
	throw_speed = 2
	throw_range = 6
	matter = list(MATERIAL_STEEL = 6)
	base_block_chance = 40
	armor_list = list(melee = 3, bullet = 2, energy = 2, bomb = 0, bio = 0, rad = 0)
	max_durability = 100 //So we can brake and need healing time to time
	durability = 100

/obj/item/shield/buckler/handmade/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	return base_block_chance


/obj/item/shield/buckler/handmade/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/extinguisher) || istype(W, /obj/item/storage/toolbox) || istype(W, /obj/item/melee))
		on_bash(W, user)
	else
		..()

/obj/item/shield/buckler/handmade/bone
	name = "bone shield"
	desc = "A handmade stout shield, but with a small size crafted entirely of bone. Exceptionally good at enduring melee attacks due to its light weight and high density."
	icon_state = "buckler_bone"
	item_state = "buckler_bone"
	flags = null
	throw_speed = 2
	throw_range = 6
	armor_list = list(melee = 7, bullet = 3, energy = 5, bomb = 10, bio = 0, rad = 0)
	matter = list(MATERIAL_BONE = 6)
	base_block_chance = 50
	max_durability = 130 //So we can brake and need healing time to time
	durability = 130

/obj/item/shield/riot/tray
	name = "tray shield"
	desc = "A thin makeshift shield, but with a good size."
	icon_state = "tray_shield"
	item_state = "tray_shield"
	flags = CONDUCT
	throw_speed = 2
	throw_range = 4
	matter = list(MATERIAL_STEEL = 4)
	base_block_chance = 50
	max_durability = 90 //So we can brake and need healing time to time
	durability = 90
	armor_list = list(melee = 5, bullet = 2, energy = 1, bomb = 0, bio = 0, rad = 0)

/obj/item/shield/riot/tray/get_protected_area(mob/user)
	var/list/p_area = list(BP_CHEST, BP_HEAD, BP_L_ARM, BP_R_ARM, BP_GROIN)
	if(MOVING_DELIBERATELY(user) && wielded)
		p_area = BP_ALL_LIMBS
	return p_area

/obj/item/shield/riot/tray/get_partial_protected_area(mob/user)
	return list(BP_ALL_LIMBS)

/obj/item/shield/riot/tray/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	return base_block_chance

/obj/item/shield/riot/crusader
	name = "crusader tower shield"
	desc = "A traditional tower shield meeting the materials and design of the future. It's made from durasteel and the craftsmanship is the highest quality, setting it apart from regular shields. It bears the insignia of the Church. Deus Vult."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_shield"
	item_state = "nt_shield"
	price_tag = 2000
	max_durability = 500 //Well clearly made to last it should require some repair post crusade
	durability = 500
	armor_list = list(melee = 7, bullet = 8, energy = 6, bomb = 15, bio = 0, rad = 0)
	matter = list(MATERIAL_GLASS = 3, MATERIAL_STEEL = 10, MATERIAL_DURASTEEL = 20)
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "nt_shield"
		)

/obj/item/shield/riot/crusader/handle_shield(mob/user)
	. = ..()
	if(.) playsound(user.loc, 'sound/weapons/Genhit.ogg', 50, 1)

/*
 * Energy Shield
 */

/obj/item/shield/buckler/energy
	name = "energy combat shield"
	desc = "A shield capable of stopping most projectile and melee attacks. It can be retracted, expanded, and stored anywhere."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "eshield0" // eshield1 for expanded
	item_state  = "eshield" // eshield1 for expanded
	flags = CONDUCT
	force = 3
	throwforce = 5
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 4, TECH_MAGNET = 3, TECH_ILLEGAL = 4)
	attack_verb = list("shoved", "bashed")
	var/active = 0
	max_durability = 80 //So we can brake and need healing time to time
	durability = 80
	slot_flags = SLOT_BELT

/obj/item/shield/buckler/energy/handle_shield(mob/user)
	if(!active)
		return 0 //turn it on first!
	. = ..()

	if(.)
		var/datum/effect/effect/system/spark_spread/spark_system = new
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		playsound(user.loc, 'sound/weapons/blade1.ogg', 50, 1)

/obj/item/shield/buckler/energy/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	if(istype(damage_source, /obj/item/projectile))
		var/obj/item/projectile/P = damage_source
		if((is_sharp(P) && damage > 10) || istype(P, /obj/item/projectile/beam))
			return (base_block_chance - round(damage)) //This way are lasers and bullets that deal 35~ damage cant be blocked.
	return base_block_chance

/obj/item/shield/buckler/energy/attack_self(mob/living/user as mob)
	if ((CLUMSY in user.mutations) && prob(15))
		to_chat(user, SPAN_WARNING("You accidentally bash yourself with the [src]."))
		user.damage_through_armor(10, BURN, user.hand)
		user.Weaken(3)
	active = !active
	if (active)
		force = WEAPON_FORCE_PAINFUL
		update_icon()
		w_class = ITEM_SIZE_BULKY
		playsound(user, 'sound/weapons/saberon.ogg', 50, 1)
		to_chat(user, SPAN_NOTICE("\The [src] is now active."))

	else
		force = 3
		update_icon()
		w_class = ITEM_SIZE_TINY
		playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)
		to_chat(user, SPAN_NOTICE("\The [src] can now be concealed."))

	add_fingerprint(user)
	return

/obj/item/shield/buckler/energy/update_icon()
	icon_state = "eshield[active]"
	item_state = "eshield[active]"
	update_wear_icon()
	if(active)
		set_light(1.5, 1.5, COLOR_LIGHTING_BLUE_BRIGHT)
	else
		set_light(0)

/obj/item/shield/buckler/energy/reaver
	name = "reaver combat shield"
	desc = "A shield capable of stopping most projectile and melee attacks. It can be retracted, expanded, and stored anywhere. This one was created for void wolves, generally employed by reavers."
	icon_state = "voidwolfshield0" // eshield1 for expanded
	item_state = "voidwolfshield"

/obj/item/shield/buckler/energy/reaver/damaged

/obj/item/shield/buckler/energy/reaver/damaged/Initialize()
	. = ..()
	durability -= rand(130, 90)

/obj/item/shield/buckler/energy/reaver/update_icon()
	icon_state = "voidwolfshield[active]"
	item_state = "voidwolfshield[active]"
	update_wear_icon()
	if(active)
		set_light(1.5, 1.5, COLOR_LIGHTING_RED_BRIGHT)
	else
		set_light(0)

/obj/item/shield/parrying
	name = "parrying dagger"
	desc = "A parrying dagger forged in a specific way to easily parry other melee attacks with ease, sacrificing its lethality in exchange."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "dagger"
	item_state = "dagger"
	flags = CONDUCT
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_DANGEROUS
	throw_speed = 2
	throw_range = 6
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5)
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 2)
	price_tag = 250
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	max_durability = 35 //So we can brake and need healing time to time
	durability = 35
	var/cooldown = 0 //shield bash cooldown. based on world.time
	var/picked_by_human = FALSE
	var/mob/living/carbon/human/picking_human
	can_block_proj = FALSE
	has_alt_mode = FALSE

/obj/item/shield/parrying/handle_shield(mob/user)
	. = ..()
	if(.) playsound(user.loc, 'sound/weapons/shield/shieldmelee.ogg', 50, 1)

/obj/item/shield/parrying/get_protected_area(mob/user)
	var/list/p_area = list(BP_CHEST)

	if(user.get_equipped_item(slot_l_hand) == src)
		p_area.Add(BP_L_ARM)
	else if(user.get_equipped_item(slot_r_hand) == src)
		p_area.Add(BP_R_ARM)

	return p_area

/obj/item/shield/parrying/get_partial_protected_area(mob/user)
	return list(BP_GROIN,BP_HEAD)


/obj/item/shield/parrying/proc/on_bash(var/obj/item/W, var/mob/user)
	if(cooldown < world.time - 25)
		user.visible_message(SPAN_WARNING("[user] slashes [src] with [W]!"))
		playsound(user.loc, 'sound/weapons/sharphit.ogg', 50, 1)
		cooldown = world.time
