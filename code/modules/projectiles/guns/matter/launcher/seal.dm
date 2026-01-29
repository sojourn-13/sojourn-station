//Is this realy not a bluecross?

/obj/item/gun/matter/seal
	name = "\"Seal\"  waxworks rapier"
	desc = "A strange half rapier half rocket hybrid that uses candles as ammo."
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_HOLSTER
	fire_sound = 'sound/items/lighter.ogg'
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_WOOD = 3, MATERIAL_GOLD = 15)
	serial_type = "INDEX"
	hitsound = 'sound/weapons/bladeslice.ogg'

	max_stored_matter = 7 //Annoying to use do to low ammo

	stored_matter = 0 //When freshly printed we do have ammo

	projectile_cost = 1
	projectile_type = /obj/item/projectile/plasma/super_light

	item_loader = /obj/item/flame/candle

	swing_icon_mod = "_sun_branch"
	icon = 'icons/obj/guns/matter/seal.dmi'
	icon_state = "seal"
	item_state = "seal"
	item_text = "Candles"

	item_icons = list(
		icon_l_hand = 'icons/mob/items/lefthand_guns.dmi',
		icon_r_hand = 'icons/mob/items/righthand_guns.dmi',
		)

/obj/item/gun/matter/seal/examine(user)
	. = ..()

	if(isliving(user))
		var/mob/living/L = user
		if(L.stats.getPerk(PERK_SIDE_LOADING))
			to_chat(L, SPAN_NOTICE("[name] is eligible for sideloading.")) // Feedback that we can do this

/obj/item/gun/matter/seal/consume_next_projectile()
	if(stored_matter < projectile_cost)
		return null
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		var/fae = FALSE
		if(istype(H.belt, /obj/item/device/lighting/toggleable/lantern/fae))
			fae = TRUE

		var/datum/perk/cooldown/ignis_gladius_artium/IGA = H.stats.getPerk(PERK_IGA)
		if(!IGA)
			H.stats.addPerk(PERK_IGA)
			if(fae)
				playsound(src, 'sound/items/glitch.ogg', 20, 1, 1) //The fea is upset

		else
			if(!wielded)
				//We just fired a shot increase are movement a lot!
				IGA.ammo_shots += 1

		//So useful! an extra shot!
		if(H.stats.getPerk(PERK_SIDE_LOADING))
			var/otherhands_object = H.get_inactive_hand()
			if(istype(otherhands_object, /obj/item/flame/candle))
				var/obj/item/flame/candle/C = otherhands_object
				attackby(C, H)

		if(wielded && fae)
			if(prob(20) && IGA.sezionatura >= 2)
				new /obj/effect/temp_visual/text/fae_correction_ii(H.loc)
				new /obj/effect/temp_visual/text/fae_correction(H.loc)
				IGA.sezionatura -= 1 //We lose momentum to correct are form
				playsound(src, 'sound/items/glitch.ogg', 20, 1, 1) //The fea is upset
				unwield(H)
				H.sanity.changeLevel(-250) //Yes We are devistated by this
			else
				new /obj/effect/temp_visual/text/fae_correction(H.loc)
				playsound(src, 'sound/machines/Chime.ogg', 20, 1, 1)
				H.sanity.changeLevel(-15)

	stored_matter -= projectile_cost
	return new projectile_type(src)


/obj/item/gun/matter/seal/resolve_attackby(atom/target, mob/user, params)
	var/glasses = FALSE
	var/fae = FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.glasses, /obj/item/clothing/glasses/firefly_glasses))
			glasses = TRUE
		if(istype(H.belt, /obj/item/device/lighting/toggleable/lantern/fae))
			fae = TRUE

	if(isliving(target) && ishuman(user))
		var/mob/living/M = target
		var/mob/living/carbon/human/U = user

		if(M.stat != DEAD)
			var/datum/perk/cooldown/ignis_gladius_artium/IGA = U.stats.getPerk(PERK_IGA)
			if(!IGA)
				U.stats.addPerk(PERK_IGA)
				if(fae)
					playsound(src, 'sound/items/glitch.ogg', 20, 1, 1) //The fea is upset
			else
				if(!wielded) //Dont trigger anything if wielded
					IGA.perk_lifetime += 1 SECONDS
					IGA.sezionatura += 1
					force += IGA.ammo_shots
					force += IGA.sezionatura / 10

					if(IGA.sezionatura >= 15)
						M.adjust_fire_stacks(2 + glasses)
						M.IgniteMob()
						//If we start using wax then we are fire stack possitive
						if(stored_matter > 0)
							M.adjust_fire_stacks(1)
							stored_matter -= 0.1

					//Seal down their movements
					if(IGA.sezionatura >= 10 && stored_matter > 0)
						M.entanglement += 1.5 + glasses + (IGA.sezionatura / 100)
						playsound(src, 'sound/items/smoking.ogg', 20, 1, 1)
						stored_matter -= 0.1

					if(IGA.sezionatura >= 5)
						M.IgniteMob()
						M.next_onfire_brn = 0
						M.handle_fire()
						if(M.fire_stacks > 0)
							M.adjust_fire_stacks(-1)

					if(fae)
						//Tempo

						if(stored_matter >= 4 && IGA.sezionatura >= 20 && M.health >= M.maxHealth * 0.5)
							new /obj/effect/temp_visual/text/fae_correction_vi(U.loc)
							Fire(M, user, pointblank=glasses)
							swing_attack(M, U, params)
							U.sanity.changeLevel(-200)
							user.visible_message(SPAN_DANGER("[U] relentlessly stabs [M]"))
							//KILL HIM
							if(M.health > 0)
								attack(src, U, params)
								stored_matter -= 1
								M.adjust_fire_stacks(1)
								IGA.sezionatura += 1
							if(M.health > 0)
								attack(src, U, params)
								stored_matter -= 1
								M.adjust_fire_stacks(1)
								IGA.sezionatura += 1
							if(M.health > 0)
								attack(src, U, params)
								stored_matter -= 1
								M.adjust_fire_stacks(1)
								IGA.sezionatura += 1
							if(M.health > 0)
								attack(src, U, params)
								stored_matter -= 1
								M.adjust_fire_stacks(1)
								IGA.sezionatura += 1
							M.updatehealth()
							if(M.stat != DEAD)
								IGA.perk_lifetime -= 1 SECONDS
								U.sanity.changeLevel(-30)
								new /obj/effect/temp_visual/text/fae_correction_vii(U.loc)
								M.next_onfire_brn = 0
								M.handle_fire()
								if(M.fire_stacks > 0)
									M.adjust_fire_stacks(-1)
								if(glasses)
									M.next_onfire_brn = 0
									M.handle_fire()
									if(M.fire_stacks > 0)
										M.adjust_fire_stacks(-1)
								if(stored_matter > 1)
									force += clamp(IGA.sezionatura, 10 + M.fire_stacks, 1)
									if(glasses)
										force += min(IGA.sezionatura, 3)

						else
							if(stored_matter > 3 && IGA.sezionatura >= 7 && M.fire_stacks > 2 && M.fire_stacks < 5)
								new /obj/effect/temp_visual/text/fae_correction_v(U.loc)
								playsound(src, 'sound/items/glitch.ogg', 20, 1, 1) //The fea is upset
								Fire(M, user, pointblank=glasses)
								U.sanity.changeLevel(-150)
								IGA.perk_lifetime -= 1 SECONDS
							if(stored_matter > 5 && IGA.sezionatura >= 3 && M.fire_stacks < 1)
								new /obj/effect/temp_visual/text/fae_correction_iv(U.loc)
								swing_attack(M, U, params)
								U.sanity.changeLevel(-50)
								IGA.perk_lifetime -= 1 SECONDS

					if(!ishuman(M))
						M.IgniteMob()
						M.next_onfire_brn = 0
						if(M.fire_stacks > 0)
							M.adjust_fire_stacks(-1)
						M.handle_fire()
						M.fireloss += min(IGA.sezionatura, 10 + M.fire_stacks)
						if(glasses)
							M.fireloss += min(IGA.sezionatura, 3)
					else
						//We cant heal fixed damage if we are a human
						force += min(IGA.sezionatura, 10 + M.fire_stacks)
						if(glasses)
							force += min(IGA.sezionatura, 3)

			//If we have a fea then try and tell us that we are stupid and wrong
			if(wielded && fae)
				if(prob(20) && IGA.sezionatura >= 2)
					new /obj/effect/temp_visual/text/fae_correction_ii(U.loc)
					new /obj/effect/temp_visual/text/fae_correction(U.loc)
					IGA.sezionatura -= 1 //We lose momentum to correct are form
					playsound(src, 'sound/items/glitch.ogg', 20, 1, 1) //The fea is upset
					unwield(U)
					U.sanity.changeLevel(-250) //Yes We are devistated by this
				else
					new /obj/effect/temp_visual/text/fae_correction(U.loc)
					playsound(src, 'sound/machines/Chime.ogg', 20, 1, 1)
					U.sanity.changeLevel(-15)

		M.updatehealth()
		//Ashes to Ashes
		if(M.health <= 0)
			playsound(src, 'sound/items/zippo_close.ogg', 20, 1, 1)

	.=..()
	refresh_upgrades()