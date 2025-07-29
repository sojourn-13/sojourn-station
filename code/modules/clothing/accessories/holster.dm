/obj/item/clothing/accessory/holster
	name = "shoulder holster"
	desc = "A leather weapon holster mounted around the shoulder."
	icon_state = "holster"
	slot = "utility"
	matter = list(MATERIAL_BIOMATTER = 5)
	price_tag = 200
	var/obj/item/holstered = null
	var/sound_in = 'sound/effects/holsterin.ogg'
	var/sound_out = 'sound/effects/holsterout.ogg'
	var/list/can_hold
	var/list/cant_hold = new/list()
	var/sheath_arts = FALSE
	no_swing = TRUE

/obj/item/clothing/accessory/holster/proc/holster(var/obj/item/I, var/mob/living/user)
	if(holstered && istype(user))
		to_chat(user, SPAN_WARNING("There is already \a [holstered] holstered here!"))
		return

	if (LAZYLEN(can_hold))
		if(!is_type_in_list(I,can_hold))
			to_chat(user, "<span class='warning'>[I] won't fit in [src]!</span>")
			return

	else if (!(I.slot_flags & SLOT_HOLSTER))
		to_chat(user, SPAN_WARNING("[I] won't fit in [src]!"))
		return

	if(cant_hold.len && is_type_in_list(I, cant_hold))
		to_chat(usr, SPAN_NOTICE("[src] cannot sheathe [I]."))
		return

	holstered = I
	user.drop_from_inventory(holstered)
	holstered.loc = src
	holstered.add_fingerprint(user)
	w_class = max(w_class, holstered.w_class)
	user.visible_message(SPAN_NOTICE("[user] holsters \the [holstered]."), SPAN_NOTICE("You holster \the [holstered]."))
	name = "occupied [initial(name)]"
	playsound(user, "[sound_in]", 75, 0)
	update_icon()

/obj/item/clothing/accessory/holster/proc/clear_holster()
	holstered = null
	name = initial(name)

/obj/item/clothing/accessory/holster/proc/unholster(mob/user as mob)
	if(!holstered)
		return

	if(user.lying)
		to_chat(user, SPAN_WARNING("You need to be standing!"))
		return

	if(istype(user.get_active_hand(),/obj))
		to_chat(user, SPAN_WARNING("You need an empty hand to draw \the [holstered]!"))
	else
		if(user.a_intent == I_HURT)
			usr.visible_message(
				SPAN_DANGER("[user] draws \the [holstered], ready to fight!"),
				SPAN_WARNING("You draw \the [holstered], ready to fight!")
				)
		else
			user.visible_message(
				SPAN_NOTICE("[user] draws \the [holstered], pointing it at the ground."),
				SPAN_NOTICE("You draw \the [holstered], pointing it at the ground.")
				)
		user.put_in_active_hand(holstered)
		holstered.add_fingerprint(user)
		playsound(user, "[sound_out]", 75, 0)
		update_icon()
		w_class = initial(w_class)
		clear_holster()

/obj/item/clothing/accessory/holster/attack_hand(mob/user as mob)
	if (has_suit)	//if we are part of a suit
		if (holstered)
			unholster(user)
		return

	..(user)

/obj/item/clothing/accessory/holster/attackby(obj/item/W as obj, mob/user as mob)
	holster(W, user)

/obj/item/clothing/accessory/holster/emp_act(severity)
	if (holstered)
		holstered.emp_act(severity)
	..()

/obj/item/clothing/accessory/holster/examine(mob/user)
	..(user)
	if (holstered)
		if(get_dist(user, src) < 1) //Gotta be close to see what's in there
			to_chat(user, "A [holstered] is holstered here.")
		else
			to_chat(user, "You can't get a good look at the contents of that holster...")
	else
		to_chat(user, "It is empty.")

	if(sheath_arts)
		to_chat(user, "This is a sheath that will relay the stored item as the attacking weapon.")

/obj/item/clothing/accessory/holster/on_attached(obj/item/clothing/under/S, mob/user as mob)
	..()
	has_suit.verbs += /obj/item/clothing/accessory/holster/verb/holster_verb

/obj/item/clothing/accessory/holster/on_removed(mob/user as mob)
	has_suit.verbs -= /obj/item/clothing/accessory/holster/verb/holster_verb
	..()

//For the holster hotkey
/obj/item/clothing/accessory/holster/verb/holster_verb()
	set name = "Holster"
	set category = "Object"
	set src in usr
	if(!isliving(usr))
		return
	if(usr.stat)
		return

	//can't we just use src here?
	var/obj/item/clothing/accessory/holster/H = null
	if (istype(src, /obj/item/clothing/accessory/holster))
		H = src
	else if (istype(src, /obj/item/clothing/under))
		var/obj/item/clothing/under/S = src
		if (S.accessories.len)
			H = locate() in S.accessories

	if (!H)
		to_chat(usr, SPAN_WARNING("Something is very wrong."))

	if(!H.holstered)
		var/obj/item/W = usr.get_active_hand()
		if(!istype(W, /obj/item))
			to_chat(usr, SPAN_WARNING("You need your gun equiped to holster it."))
			return
		H.holster(W, usr)
	else
		H.unholster(usr)

/obj/item/clothing/accessory/holster/armpit
	name = "armpit holster"
	desc = "A leather weapon holster mounted around the armpit."
	icon_state = "holster"

/obj/item/clothing/accessory/holster/waist
	name = "waist holster"
	desc = "A leather weapon holster mounted around the waist."
	icon_state = "holster"
	overlay_state = "holster_low"

/obj/item/clothing/accessory/holster/hip
	name = "hip holster"
	desc = "A leather weapon holster mounted around the hip."
	icon_state = "holster_hip"

/obj/item/clothing/accessory/holster/leg
	name = "leg holster"
	desc = "A leather weapon holster mounted around the upper leg."
	icon_state = "holster_leg"
	overlay_state = "holster_leg"


/*
Sword holsters
*/

/obj/item/clothing/accessory/holster/saber
	name = "saber scabbard"
	desc = "A white leather weapon sheath mounted around the waist."
	icon_state = "saber_holster"
	overlay_state = "saber"
	slot_flags = SLOT_ACCESSORY_BUFFER|SLOT_BELT
	slot = "utility"
	can_hold = list(/obj/item/tool/sword/saber)
	price_tag = 200
	sound_in = 'sound/effects/sheathin.ogg'
	sound_out = 'sound/effects/sheathout.ogg'
	sheath_arts = TRUE

/obj/item/clothing/accessory/holster/saber/militiacommander
	name = "blackshield Commander's scabbard"
	desc = "A brown leather Scabbard with golden lining, on it the emblem of Blackshield, This one is designed for the Commander's Saber."
	icon_state = "saber_holster"
	overlay_state = "saber"
	slot = "utility"
	can_hold = list(/obj/item/tool/sword/saber)
	price_tag = 200
	sound_in = 'sound/effects/sheathin.ogg'
	sound_out = 'sound/effects/sheathout.ogg'

/obj/item/clothing/accessory/holster/saber/militiacommander/occupied
	var/holstered_spawn = /obj/item/tool/sword/saber/militiacommander

/obj/item/clothing/accessory/holster/saber/militiacommander/occupied/Initialize()
	holstered = new holstered_spawn
	update_icon()

/obj/item/clothing/accessory/holster/saber/militiasergeant
	name = "blackshield sergeant's scabbard"
	desc = "A brown leather Scabbard with silver lining, on it the emblem of Blackshield, This one is designed for the Sergeant's Saber."
	icon_state = "saber_holster"
	overlay_state = "saber"
	slot = "utility"
	can_hold = list(/obj/item/tool/sword/saber)
	price_tag = 200
	sound_in = 'sound/effects/sheathin.ogg'
	sound_out = 'sound/effects/sheathout.ogg'

/obj/item/clothing/accessory/holster/saber/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/accessory/icon.dmi', "saber_layer"))

/obj/item/clothing/accessory/holster/saber/militiasergeant/occupied
	var/holstered_spawn = /obj/item/tool/sword/saber/militiasergeant

/obj/item/clothing/accessory/holster/saber/militiasergeant/occupied/Initialize()
	holstered = new holstered_spawn
	update_icon()

/obj/item/clothing/accessory/holster/saber/occupied
	var/holstered_spawn = /obj/item/tool/sword/saber

/obj/item/clothing/accessory/holster/saber/occupied/Initialize()
	holstered = new holstered_spawn
	update_icon()

/obj/item/clothing/accessory/holster/saber/greatsword
	name = "quickdraw scabbard"
	desc = "A sturdy brown leather scabbard with gold trim. A spring loaded release mechanism and universal design makes it fantastic for all swords."
	icon_state = "crusader_holster"
	overlay_state = "crusader"
	can_hold = list(/obj/item/tool/sword)

/obj/item/clothing/accessory/holster/saber/greatsword/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/accessory/icon.dmi', "crusader_layer"))

/obj/item/clothing/accessory/holster/saber/greatsword/occupied
	var/holstered_spawn = /obj/item/tool/sword/crusader

/obj/item/clothing/accessory/holster/saber/greatsword/occupied/Initialize()
	holstered = new holstered_spawn
	update_icon()

//Subtype which is for printing from the biomachine
/obj/item/clothing/accessory/holster/saber/greatsword/churchprint
	name = "Absolutist Sword Scabbard"
	desc = "A sturdy brown leather scabbard with gold trim. Perfectly designed for holding weapons to fight against the enemies of the Church."
	icon_state = "crusader_holster"
	overlay_state = "crusader"
	can_hold = list(
		/obj/item/tool/sword/nt,
		/obj/item/tool/sword/crusader
		)

/obj/item/clothing/accessory/holster/saber/greatsword/churchprint/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/accessory/icon.dmi', "crusader_layer"))

/obj/item/clothing/accessory/holster/saber/greatsword/churchprint/occupied
	var/holstered_spawn = /obj/item/tool/sword/crusader

/obj/item/clothing/accessory/holster/saber/greatsword/churchprint/occupied/Initialize()
	holstered = new holstered_spawn
	update_icon()

/obj/item/clothing/accessory/holster/saber/machete
	name = "machete scabbard"
	desc = "A sturdy black leather scabbard. For the survivalist in you."
	icon_state = "machete_holster"
	overlay_state = "machete"
	can_hold = list(/obj/item/tool/sword/machete, /obj/item/tool/sword/handmade)

/obj/item/clothing/accessory/holster/saber/machete/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/accessory/icon.dmi', "machete_layer"))

/obj/item/clothing/accessory/holster/saber/machete/occupied
	var/holstered_spawn = /obj/item/tool/sword/machete

/obj/item/clothing/accessory/holster/saber/machete/occupied/Initialize()
	holstered = new holstered_spawn
	update_icon()

/obj/item/clothing/accessory/holster/saber/huntingclaw
	name = "Hunting Claw Sheath"
	desc = "A sheath specifically made to be occupied by the Hunting Claw. It's made out of locally sourced leather and bone and treated to give it it's characteristic color,\
	 the modular strapping makes it so that it can be adapted to each hunter's carrying needs across their body and gear comfortably."
	icon_state = "huntingclaw_holster"
	overlay_state = "huntingclaw"
	can_hold = list(/obj/item/tool/sword/huntingclaw)

/obj/item/clothing/accessory/holster/saber/huntingclaw/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/accessory/icon.dmi', "huntingclaw_layer"))

/obj/item/clothing/accessory/holster/saber/huntingclaw/occupied
	var/holstered_spawn = /obj/item/tool/sword/huntingclaw

/obj/item/clothing/accessory/holster/saber/huntingclaw/occupied/Initialize()
	holstered = new holstered_spawn
	update_icon()


/obj/item/clothing/accessory/holster/saber/cutlass
	name = "cutlass scabbard"
	desc = "A simple brown scabbard meant for a cutlass. For pirates and military men who take themselves too seriously."
	icon_state = "cutlass_holster"
	overlay_state = "cutlass"
	slot = "utility"
	can_hold = list(/obj/item/tool/sword/saber, /obj/item/tool/sword/katana)
	price_tag = 200
	sound_in = 'sound/effects/sheathin.ogg'
	sound_out = 'sound/effects/sheathout.ogg'

/obj/item/clothing/accessory/holster/saber/cutlass/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/accessory/icon.dmi', "cutlass_layer"))


/obj/item/clothing/accessory/holster/saber/cutlass/occupied
	var/holstered_spawn = /obj/item/tool/sword/saber/cutlass

/obj/item/clothing/accessory/holster/saber/cutlass/occupied/Initialize()
	holstered = new holstered_spawn
	update_icon()

/obj/item/clothing/accessory/holster/saber/rapiermed
	name = "Soteria CBOs Multi-Scabbard"
	desc = "A brilliantly wood carved gold gilded scabbard fit for royalty, it's design is surgically precise."
	icon_state = "rapiermed_holster"
	overlay_state = "rapiermed"
	slot = "utility"
	can_hold = list(/obj/item/tool/sword/saber/injection_rapier, /obj/item/tool/sword/katana/nano, /obj/item/tool/hydrogen_sword)
	price_tag = 2000
	sound_in = 'sound/effects/sheathin.ogg'
	sound_out = 'sound/effects/sheathout.ogg'

/obj/item/clothing/accessory/holster/saber/rapiermed/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/accessory/icon.dmi', "rapiermed_layer"))


/obj/item/clothing/accessory/holster/saber/rapiermed/occupied
	var/holstered_spawn = /obj/item/tool/sword/saber/injection_rapier

/obj/item/clothing/accessory/holster/saber/rapiermed/occupied/Initialize()
	holstered = new holstered_spawn
	update_icon()

//
/obj/item/clothing/accessory/holster/saber/rapiersci
	name = "Soteria CROs Multi-Saya"
	desc = "A sleek hardened ebony material covers the entire saya in multifaceted shapes, it's design probes your mind."
	icon_state = "rapiersci_holster"
	overlay_state = "rapiersci"
	slot = "utility"
	can_hold = list(/obj/item/tool/sword/saber/deconstuctive_rapier, /obj/item/tool/sword/katana/nano, /obj/item/tool/hydrogen_sword)
	price_tag = 2000
	sound_in = 'sound/effects/sheathin.ogg'
	sound_out = 'sound/effects/sheathout.ogg'

/obj/item/clothing/accessory/holster/saber/rapiersci/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/accessory/icon.dmi', "rapiersci_layer"))


/obj/item/clothing/accessory/holster/saber/rapiersci/occupied
	var/holstered_spawn = /obj/item/tool/sword/saber/deconstuctive_rapier

/obj/item/clothing/accessory/holster/saber/rapiersci/occupied/Initialize()
	holstered = new holstered_spawn
	update_icon()

/obj/item/clothing/accessory/holster/saber/saya
	name = "katana saya"
	desc = "A traditional \"saya\", a sheath for a non-curved oriental sword known as a katana."
	icon_state = "saya"
	overlay_state = "saya"
	slot = "utility"
	can_hold = list(/obj/item/tool/sword/katana_makeshift, /obj/item/tool/sword/katana, /obj/item/material/sword/katana, /obj/item/tool/sword/katana/nano, /obj/item/tool/cheap/katana) // Only straight swords.

/obj/item/clothing/accessory/holster/saber/saya/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/accessory/icon.dmi', "saya_layer"))

/obj/item/clothing/accessory/holster/saber/saya/occupied
	var/holstered_spawn = /obj/item/tool/sword/katana

/obj/item/clothing/accessory/holster/saber/saya/occupied/Initialize()
	holstered = new holstered_spawn
	update_icon()

/obj/item/clothing/accessory/holster/saber/machete/cheap
	name = "pleather scabbard"
	desc = "A cheap sheath for cheap weapons. This probably isn't suitable for anything more valuable than mass-produced stuff."
	can_hold = list(/obj/item/tool/cheap, /obj/item/tool/sword/handmade) // Only shitty swords.
	cant_hold = list(/obj/item/tool/cheap/spear) // Can't sheathe a spear here!
	icon_state = "cheap_holster"
	overlay_state = "cheap"

/obj/item/clothing/accessory/holster/saber/machete/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/accessory/icon.dmi', "cheap_layer"))




/obj/item/clothing/accessory/holster/afterattack(atom/A as mob|obj|turf|area, mob/user, proximity, params)
	if(!sheath_arts)
		..()
		return
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

