/obj/item/storage/sheath
	name = "absolutism sheath"
	desc = "Made to store only the swords of the church."
	icon = 'icons/obj/sheath.dmi'

	icon_state = "sheath_0"
	item_state = "sheath_0"
	var/base_icon_state = "sheath"
	var/base_item_state = "sheath"

	slot_flags = SLOT_BELT
	price_tag = 50
	matter = list(MATERIAL_BIOMATTER = 5)
	storage_slots = 1
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_HUGE

	can_hold = list(
		/obj/item/tool/sword/nt,
		/obj/item/tool/sword/saber
		)
	cant_hold = list(
		/obj/item/tool/knife/dagger/nt,
		/obj/item/tool/spear/halberd
		)
	insertion_sound = 'sound/effects/sheathin.ogg'
	extraction_sound = 'sound/effects/sheathout.ogg'

/obj/item/storage/sheath/attack_hand(mob/living/carbon/human/user)
	if(contents.len && (src in user))
		var/obj/item/I = contents[contents.len]
		if(istype(I))
			hide_from(usr)
			var/turf/T = get_turf(user)
			remove_from_storage(I, T)
			usr.put_in_hands(I)
			add_fingerprint(user)
	else
		..()

/obj/item/storage/sheath/Initialize(mapload, ...)
	. = ..()
	update_icon()

/obj/item/storage/sheath/update_icon()
	var/icon_to_set
	for(var/obj/item/SW in contents)
		icon_to_set = SW.icon_state
	icon_state = "[base_icon_state]_[contents.len ? icon_to_set : "0"]"
	item_state = "[base_item_state]_[contents.len ? icon_to_set : "0"]"
	..()

/obj/item/storage/sheath/non_church
	name = "sheath_0"
	desc = "Made to store swords."

/obj/item/storage/sheath/non_church/general
	name = "sword sheath"
	desc = "A leathery-like sheath made to store blades."
	base_icon_state = "general_sheath"
	base_item_state = "general_sheath"

	can_hold = list(
		/obj/item/tool/cheap
	)
	cant_hold = list(
		/obj/item/tool/cheap/spear
	)

/obj/item/storage/sheath/afterattack(atom/A as mob|obj|turf|area, mob/user, proximity, params)

	//message_admins("I ran, A = [A], user = [user]")
	for(var/obj/item/I in contents)
		//message_admins("I found = [I]")
		var/added_reach = 0
		var/is_alive_target = FALSE
		var/damage_mult = 0.5
		var/ad_loss = 1
		if(isliving(A))
			//message_admins("A is living")
			var/mob/living/target_maybe_alive = A
			if(target_maybe_alive.stat != DEAD)
				//message_admins("A is living not dead")
				is_alive_target = TRUE
			if(isliving(user) && is_alive_target)
				//message_admins("user is living")
				var/mob/living/melee_arts = user
				var/tasklevel = max((melee_arts.learnt_tasks.get_task_mastery_level("SHEATH_ARTS")-1),0)
				added_reach += tasklevel
				//message_admins("tasklevel [tasklevel]")
				if(melee_arts.stats.getPerk(PERK_NATURAL_STYLE))
					added_reach += 1
					damage_mult = 0.7
					ad_loss = 0.5
				//So first we give all the reach we need to are obj held inside
				//Then we set it to be unable to embed, as well as not able to swing do to issues with that
				I.extended_reach = added_reach
				I.no_swing = TRUE
				I.embed_mult = 0
				I.force *= damage_mult
				I.armor_divisor -= ad_loss
				//This is a uniquic attack proc that has smaller checks, this is to
				I.fancy_ranged_melee_attack(A, user)
				I.refresh_upgrades()
				if(istool(I))
					var/obj/item/tool/T = I
					T.adjustToolHealth(-(0.2*T.degradation),user)
				update_icon()
				//message_admins("is_alive_target [is_alive_target]")
				if(is_alive_target)
					if(target_maybe_alive.stat == DEAD)
						//message_admins("melee arts")
						melee_arts.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/sheath_arts, "SHEATH_ARTS", skill_gained = 1, learner = melee_arts)
		break
	..()

