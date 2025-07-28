
//Psionic powers that summan items and when drop destory said item

/mob/living/carbon/human/proc/psionic_omnitool()
	set category = "Psionic powers.Summoning"
	set name = "Telekinetic Omnitool (2)"
	set desc = "Spend two psi points to create an omnitool. It disappears when dropped or if it leaves your hand."
	var/psi_point_cost = 2
	var/stat_mec = 25
	var/stat_bio = 25
	var/stat_rob = 25
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/tool/psionic_omnitool/tool = new /obj/item/tool/psionic_omnitool(src, user)
		if (user.stats.getStat(STAT_MEC) > 32)
			stat_mec = user.stats.getStat(STAT_MEC) * 0.8
			if (user.stats.getStat(STAT_MEC) > 62)
				stat_mec = 50
		if (user.stats.getStat(STAT_BIO) > 32)
			stat_bio = user.stats.getStat(STAT_BIO) * 0.8
			if (user.stats.getStat(STAT_BIO) > 62)
				stat_bio = 50
		if (user.stats.getStat(STAT_ROB) > 32)
			stat_rob = user.stats.getStat(STAT_ROB) * 0.8
			if (user.stats.getStat(STAT_ROB) > 62)
				stat_rob = 50
		tool.tool_qualities = list(QUALITY_SCREW_DRIVING = stat_mec, QUALITY_BOLT_TURNING = stat_mec, QUALITY_DRILLING = stat_mec, QUALITY_WELDING = stat_mec, QUALITY_CAUTERIZING = stat_bio, QUALITY_PRYING = stat_mec, QUALITY_DIGGING = stat_rob, QUALITY_PULSING = stat_mec, QUALITY_WIRE_CUTTING = stat_mec, QUALITY_HAMMERING = stat_rob, QUALITY_SHOVELING = stat_rob, QUALITY_EXCAVATION = stat_rob, QUALITY_CLAMPING = stat_bio, QUALITY_RETRACTING = stat_bio, QUALITY_SAWING = stat_mec, QUALITY_BONE_SETTING = stat_bio, QUALITY_CUTTING = stat_bio, QUALITY_BONE_GRAFTING = stat_bio)
		user.visible_message(
			"[user] clenches their fist, electricity crackling before a telekinetic omnitool is shaped in their hand!",
			"You feel the rush of electric essence shocking your hand lightly before a telekinetic omnitool forms!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(tool)

/mob/living/carbon/human/proc/pyrokinetic_spark()
	set category = "Psionic powers.Summoning"
	set name = "Pyrokinetic Spark (1)"
	set desc = "Spend a single psi point to create a tiny flickering fire in your hand that will shine light and ignite combustible materials, can be thrown but will extinguish quickly."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/flame/pyrokinetic_spark/flame = new /obj/item/flame/pyrokinetic_spark(src, user)
		user.visible_message(
			"[user] raises their arm, electricity crackling before a small flame juts from their hand!",
			"You feel the rush of electric essence shocking your arm lightly before a small flame forms in your hand!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(flame)

/mob/living/carbon/human/proc/psionic_knife()
	set category = "Psionic powers.Summoning"
	set name = "Psychic Blade (1)"
	set desc = "Spend a single psi point to create a shoddy, yet still deadly knife. It's power and damage scale with your robustness."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/tool/knife/psionic_blade/knife = new /obj/item/tool/knife/psionic_blade(src, user)
		user.visible_message(
			"[user] clenches their fist, electricity crackling before a psionic blade forms in their hand!",
			"You feel the rush of electric essence shocking your hand lightly before a psychic blade forms!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(knife)

/mob/living/carbon/human/proc/psionic_shield()
	set category = "Psionic powers.Summoning"
	set name = "Psychic Shield (1)"
	set desc = "Spend a single psi point to create an energy shield capable of blocking melee attacks. \
	If you already have a shield in-hand, it will be enhanced instead, making it capable of blocking lasers and bullets at the cost of its durablity.\
	If the shield in-hand is already enhanced, it will be be repaired instead."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		//Used to tell if we need to spawn new shield or not
		var/successfully_enhanced = FALSE
		//Grabs the item on the mobs *actively selected hand*
		var/active = user.get_active_hand()
		//Grabs the item on the mobs *non-selected hand*
		var/inactive = user.get_inactive_hand()
		//Small tracker of how many shields we have use for preventing a spawning of a 3rd shield
		var/num_of_shields = 0

		// This is a little messy as we are going to do the same thing basically twice, but if you have 2 shields
		// Then you get to enhanced one for free!
		if(active)
			if(istype(active, /obj/item/shield/riot/crusader/psionic))
				var/obj/item/shield/riot/crusader/psionic/PS = active
				num_of_shields += 1
				if(!PS.can_block_proj)
					PS.can_block_proj = TRUE
					PS.base_block_chance += 10
					PS.adjustShieldDurability(-10, user)
					successfully_enhanced = TRUE
				else
					//We healed are shield at the cost of a point
					PS.adjustShieldDurability(80, user)
					PS.base_block_chance += 5
		if(inactive)
			if(istype(inactive, /obj/item/shield/riot/crusader/psionic))
				num_of_shields += 1
				var/obj/item/shield/riot/crusader/psionic/PS = inactive
				if(!PS.can_block_proj)
					PS.can_block_proj = TRUE
					PS.base_block_chance += 10
					PS.adjustShieldDurability(-10, user)
					successfully_enhanced = TRUE
				else
					//We healed are shield at the cost of a poins
					PS.adjustShieldDurability(80, user)
					PS.base_block_chance += 5

		//Did we improve a shield that was in are hands?
		//If so tell the player and stop this proc
		if(successfully_enhanced || num_of_shields >= 2)
			user.visible_message(
			"[user] looks at the psy-shield and forcefully compresses it!",
			"It's hard to tell, but you can feel that the shield became more solid. It should be able to block lasers and bullets now."
			)
			return

		//Spawn the item inside the user (mob that has the psionic implant)
		//We then tell the player a fancy message well playing a sound and forcemoving it to a in_active hand if possable
		var/obj/item/shield/riot/crusader/psionic/shield = new /obj/item/shield/riot/crusader/psionic(src, user)
		user.visible_message(
			"[user] clenches their fist, electricity crackling before a psy-shield forms in their hand!",
			"You feel the rush of electric essence shocking your hand lightly before a psy-shield forms!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		//If we have 60 TGH we automatically make the basic shield block proj skipping 1 psionic point cost
		//This is so that if you have tanked cog or just power level TGH to be able to use the shield more affectively you can still be tanky!
		//If you pick bedlam backround you also bypass the need of 2 points to block proj.
		if (user.stats.getStat(STAT_TGH) >= STAT_LEVEL_PROF || user.stats.getPerk(PERK_PSI_MANIA))
			user.visible_message(
			"[user] looks at the psy-shield and forcefully compresses it!",
			"It's hard to tell, but you can feel that the shield became more solid. It should be able to block lasers and bullets now."
			)
			shield.can_block_proj = TRUE
			shield.base_block_chance += 10
			shield.adjustShieldDurability(-10, user)
		if(usr.put_in_active_hand(shield))
			return
		STOP_PROCESSING(SSobj, shield)
		qdel(shield)


/mob/living/carbon/human/proc/psionic_shield_layered()
	set category = "Psionic powers.Summoning"
	set name = "Layered Psychic Shield (1)"
	set desc = "Spend a single psi point to create a layered shield capable of blocking bullets, energy beams and melee attacks."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/shield/riot/crusader/psionic/layered/shield = new /obj/item/shield/riot/crusader/psionic/layered(src, user)
		user.visible_message(
			"[user] clenches their fist, electricity crackling before a psy-shield forms in their hand!",
			"You feel the rush of electric essence shocking your hand lightly before a psy-shield forms!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		if(usr.put_in_active_hand(shield))
			return
		STOP_PROCESSING(SSobj, shield)
		qdel(shield)


/mob/living/carbon/human/proc/telekinetic_fist()
	set category = "Psionic powers.Summoning"
	set name = "Telekinetic Fist (1)"
	set desc = "Spend a single psi point to create a telekinetic fist, a single-use melee weapon that knocks your foes back. It's knockback and power \
	scales with your robustness."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/tool/hammer/telekinetic_fist/fist = new /obj/item/tool/hammer/telekinetic_fist(src, user)
		user.visible_message(
			"[user] clenches their hand into a fist, electric energy crackling around it before a telekinetic fist forms over it!",
			"You clench your hand into a fist, electric energy crackling around your fingers before a telekinetic fist forms over it!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(fist)

/mob/living/carbon/human/proc/kinetic_barrier()
	set category = "Psionic powers.Summoning"
	set name = "Kinetic Barrier (2)"
	set desc = "Spend two psi points to create a wide, psychic barrier in front of you. It blocks all movement and projectiles, but not vision."
	var/psi_point_cost = 2
	var/timer = 10 SECONDS
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/shield_projector/line/psionic/shield = new(src, user.stats.getStat(STAT_COG), user.dir)
		user.visible_message(
			"[user] stares ahead as a psychic barrier forms from thin air!",
			"You focus your will and create an impassible barrier!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		spawn(timer) shield.Destroy() // Delete the shield after 10 seconds



// Psionic Orbs

/mob/living/carbon/human/proc/kinetic_blaster()
	set category = "Psionic powers.Orbs"
	set name = "Kinetic Orb (0)"
	set desc = "Create a kinetic orb in your hand at no cost to your psi points. It acts as a ranged weapon that grows in power with your cognition and uses a single psi point per shot."
	var/psi_point_cost = 0
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/gun/kinetic_blaster/KB = new(src, user, PT)
		user.visible_message(
			"[user] clenches their hand into a fist, electric energy crackling around it before a kinetic blaster forms over it!",
			"You clench your hand into a fist, electric energy crackling around your fingers before a kinetic blaster forms over it!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(KB)


/mob/living/carbon/human/proc/cryo_kinetic_blaster()
	set category = "Psionic powers.Orbs"
	set name = "Cryo-Kinetic Orb (0)"
	set desc = "Create a cryo-kinetic orb in your hand at no cost to your psi points. It acts as a ranged weapon that grows in power with your cognition and uses four psi points per shot. \
	Deals no damage on its own, but the sudden blast of cold can stun your target for a short time."
	var/psi_point_cost = 0
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/gun/kinetic_blaster/cryo/KB = new(src, user, PT)
		user.visible_message(
			"[user] clenches their hand into a fist, electric energy crackling around it before a cryo-kinetic orb forms over it!",
			"You clench your hand into a fist, electric energy crackling around your fingers before a cryo-kinetic orb forms over it!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(KB)

/mob/living/carbon/human/proc/pyro_kinetic_blaster()
	set category = "Psionic powers.Orbs"
	set name = "Pyro-Kinetic Orb (0)"
	set desc = "Create a pyro-kinetic orb in your hand at no cost to your psi points. It acts as a ranged weapon that grows in power with your cognition and uses three psi points per shot. \
	The heat generated from pyro blasts fast enough to not cause fires, but the sudden expansion of hot air is highly explosive."
	var/psi_point_cost = 0
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/gun/kinetic_blaster/pyro/KB = new(src, user, PT)
		user.visible_message(
			"[user] clenches their hand into a fist, electric energy crackling around it before a pyro-kinetic orb forms over it!",
			"You clench your hand into a fist, electric energy crackling around your fingers before a pyro-kinetic orb forms over it!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(KB)

/mob/living/carbon/human/proc/electro_kinetic_blaster()
	set category = "Psionic powers.Orbs"
	set name = "Electro-Kinetic Orb (0)"
	set desc = "Create an electro-kinetic orb in your hand at no cost to your psi points. It acts as a ranged weapon that grows in power with your cognition and uses two psi points per shot. \
	Much stronger than kinetic blasts and doesn't need to travel towards its target, being electric."
	var/psi_point_cost = 0
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/gun/kinetic_blaster/electro/KB = new(src, user, PT)
		user.visible_message(
			"[user] clenches their hand into a fist, electric energy crackling around it before an electro-kinetic orb forms over it!",
			"You clench your hand into a fist, electric energy crackling around your fingers before an electro-kinetic orb forms over it!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(KB)

/mob/living/carbon/human/psionic_tumor/proc/needle_n_thread()
	set category = "Psionic powers.Healing"
	set name = "Psionic Suture (1)"
	set desc = "Spend a single psi point to create a psionic suture in hand, which can be used to stop bleeding and to close wounds."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/stack/medical/bruise_pack/psionic/PS = new(src, user)
		user.visible_message(
			"[user] swirls a finger in the air collecting string!",
			"You swirl a finger in the air, collecting string from your thoughts, producing a needle soon after."
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		var/suture_amount = 3

		if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
			suture_amount += 3
		if(user.stats.getPerk(PERK_PSI_HARMONY))
			suture_amount += 3

		PS.amount = suture_amount
		PS.update_icon()

		usr.put_in_active_hand(PS)

/mob/living/carbon/human/psionic_tumor/proc/psi_burn_cream()
	set category = "Psionic powers.Healing"
	set name = "Psionic Ointment (1)"
	set desc = "Spend a single psi point to create a psionic ointment in hand, which can be used to stop cleanse wounds and mend burns."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/obj/item/stack/medical/ointment/psionic/PO = new(src, user)
		user.visible_message(
			"[user] swirls a finger in the air collecting droplets of odd gel!",
			"You swirl a finger in the air, collecting mental plasm, balling it up."
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		var/ointment_amount = 3

		if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
			ointment_amount += 3
		if(user.stats.getPerk(PERK_PSI_HARMONY))
			ointment_amount += 3

		PO.amount = ointment_amount
		PO.update_icon()

		usr.put_in_active_hand(PO)

/mob/living/carbon/human/proc/psionic_powercell()
	set category = "Psionic powers.Summoning"
	set name = "Psionic Cell Creation (1)"
	set desc = "Spend one psi points to create a self-charging psion-cell. If you're already holding a psion-cell, it will upgrade it by one size."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	var/obj/item/active = usr.get_active_hand()
	if(istype(usr.get_active_hand(), /obj/item/cell/large/psionic))
		to_chat(usr, "You cannot upgrade the [active] into a larger cell.")
	else if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		if(istype(usr.get_active_hand(), /obj/item/cell/medium/psionic) || istype(usr.get_active_hand(), /obj/item/cell/small/psionic))
			var/obj/item/cell/newcell = new(src, user)
			if(istype(usr.get_active_hand(), /obj/item/cell/small/psionic))
				newcell = /obj/item/cell/medium/psionic
			else if(istype(usr.get_active_hand(), /obj/item/cell/medium/psionic))
				newcell = /obj/item/cell/large/psionic
			else
				to_chat(usr, "You have a failure of imagination while trying to think of what to turn [active] into.")
				return
			playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
			var/turf/T = get_turf(usr)
			do_sparks(8, 0, T)
			newcell = new newcell(T)
			usr.visible_message(
				SPAN_DANGER("[usr] claps [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : identifying_gender == "neuter" ? "its" : "their"] hand together, transforming the [active] into a [newcell]!"),
				SPAN_DANGER("You clap your hands together, transforming the [active] into a [newcell]!")
				)
			usr.drop_item()
			usr.put_in_active_hand(newcell)
			qdel(active)
		else

			var/obj/item/cell/newcell = new /obj/item/cell/small/psionic(src, user)
			playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
			var/turf/T = get_turf(usr)
			do_sparks(8, 0, T)
			usr.visible_message(
				SPAN_DANGER("[usr] claps [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : identifying_gender == "neuter" ? "its" : "their"] hand together, condensing psionic energies into a [newcell]!"),
				SPAN_DANGER("You clap your hands together, condensing psionic energies into a [newcell]!")
				)
			usr.put_in_active_hand(newcell)
	else
		to_chat(usr, "Your mind is too spent to form a powerful enough dynamo for the cell.")

