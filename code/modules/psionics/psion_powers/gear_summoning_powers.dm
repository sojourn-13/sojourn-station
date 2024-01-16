
//Psionic powers that summan items and when drop destory said item

/obj/item/organ/internal/psionic_tumor/proc/psionic_omnitool()
	set category = "Psionic powers"
	set name = "Telekinetic Omnitool (2)"
	set desc = "Expend two points of your psi essence to create an omnitool. It disappears when dropped or if it leaves your hand."
	psi_point_cost = 2
	var/stat_mec = 25
	var/stat_bio = 25
	var/stat_rob = 25

	if(pay_power_cost(psi_point_cost))
		var/obj/item/tool/psionic_omnitool/tool = new /obj/item/tool/psionic_omnitool(src, owner)
		if (owner.stats.getStat(STAT_MEC) > 32)
			stat_mec = owner.stats.getStat(STAT_MEC) * 0.8
			if (owner.stats.getStat(STAT_MEC) > 62)
				stat_mec = 50
		if (owner.stats.getStat(STAT_BIO) > 32)
			stat_bio = owner.stats.getStat(STAT_BIO) * 0.8
			if (owner.stats.getStat(STAT_BIO) > 62)
				stat_bio = 50
		if (owner.stats.getStat(STAT_ROB) > 32)
			stat_rob = owner.stats.getStat(STAT_ROB) * 0.8
			if (owner.stats.getStat(STAT_ROB) > 62)
				stat_rob = 50
		tool.tool_qualities = list(QUALITY_SCREW_DRIVING = stat_mec, QUALITY_BOLT_TURNING = stat_mec, QUALITY_DRILLING = stat_mec, QUALITY_WELDING = stat_mec, QUALITY_CAUTERIZING = stat_bio, QUALITY_PRYING = stat_mec, QUALITY_DIGGING = stat_rob, QUALITY_PULSING = stat_mec, QUALITY_WIRE_CUTTING = stat_mec, QUALITY_HAMMERING = stat_rob, QUALITY_SHOVELING = stat_rob, QUALITY_EXCAVATION = stat_rob, QUALITY_CLAMPING = stat_bio, QUALITY_RETRACTING = stat_bio, QUALITY_SAWING = stat_mec, QUALITY_BONE_SETTING = stat_bio, QUALITY_CUTTING = stat_bio, QUALITY_BONE_GRAFTING = stat_bio)
		owner.visible_message(
			"[owner] clenches their fist, electricity crackling before a telekinetic omnitool is shaped in their hand!",
			"You feel the rush of electric essence shocking your hand lightly before a telekinetic omnitool forms!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(tool)

/obj/item/organ/internal/psionic_tumor/proc/pyrokinetic_spark()
	set category = "Psionic powers"
	set name = "Pyrokinetic Spark (1)"
	set desc = "Expend a single point of your psi essence to create a tiny flickering fire in your hand that will shine light and ignite combustible materials, can be thrown but will extinguish quickly."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		var/obj/item/flame/pyrokinetic_spark/flame = new /obj/item/flame/pyrokinetic_spark(src, owner)
		owner.visible_message(
			"[owner] raises their arm, electricity crackling before a small flame juts from their hand!",
			"You feel the rush of electric essence shocking your arm lightly before a small flame forms in your hand!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(flame)

/obj/item/organ/internal/psionic_tumor/proc/psionic_knife()
	set category = "Psionic powers"
	set name = "Psychic Blade (1)"
	set desc = "Expend a single point of your psi essence to create a low quality but still deadly knife. It's power and damage scale with your robustness."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		var/obj/item/tool/knife/psionic_blade/knife = new /obj/item/tool/knife/psionic_blade(src, owner)
		owner.visible_message(
			"[owner] clenches their fist, electricity crackling before a psionic blade forms in their hand!",
			"You feel the rush of electric essence shocking your hand lightly before a psychic blade forms!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(knife)

/obj/item/organ/internal/psionic_tumor/proc/psionic_shield()
	set category = "Psionic powers"
	set name = "Psychic Shield (1)"
	set desc = "Expend a single point of your psi essence to create an energy shield capable of blocking bullets, energy beams, and melee attacks."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		var/obj/item/shield/riot/crusader/psionic/shield = new /obj/item/shield/riot/crusader/psionic(src, owner)
		owner.visible_message(
			"[owner] clenches their fist, electricity crackling before a psy-shield forms in their hand!",
			"You feel the rush of electric essence shocking your hand lightly before a psy-shield forms!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(shield)

/obj/item/organ/internal/psionic_tumor/proc/telekinetic_fist()
	set category = "Psionic powers"
	set name = "Telekinetic Fist (1)"
	set desc = "Expend a single point of your psi essence to create a telekinetic fist, hitting some with it in melee will damage and knock them back. It's knockback and power \
	scales with your physical robustness."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		var/obj/item/tool/hammer/telekinetic_fist/fist = new /obj/item/tool/hammer/telekinetic_fist(src, owner)
		owner.visible_message(
			"[owner] clenches their hand into a fist, electric energy crackling around it before a telekinetic fist forms over it!",
			"You clench your hand into a fist, electric energy crackling around your fingers before a telekinetic fist forms over it!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(fist)

/obj/item/organ/internal/psionic_tumor/proc/kinetic_barrier()
	set category = "Psionic powers"
	set name = "Kinetic Barrier (2)"
	set desc = "Expend two psi points to create a psychic barrier a short distance from where the psion is facing. It blocks all movement and projectiles, but not vision."
	psi_point_cost = 2
	var/timer = 10 SECONDS

	if(pay_power_cost(psi_point_cost))
		var/obj/item/shield_projector/line/psionic/shield = new(src, owner.stats.getStat(STAT_COG), owner.dir)
		owner.visible_message(
			"[owner] stares ahead as a psychic barrier forms from thin air!",
			"You focus your will and create an impassible barrier!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		spawn(timer) shield.Destroy() // Delete the shield after 10 seconds



// Psionic Orbs

/obj/item/organ/internal/psionic_tumor/proc/kinetic_blaster()
	set category = "Psionic powers"
	set name = "Kinetic Orb (0)"
	set desc = "Expend none of your essence to create a kinetic orb in hand, a ranged weapon that grows in power with your cognition and expends a single psi point per shot."
	psi_point_cost = 0

	if(pay_power_cost(psi_point_cost))
		var/obj/item/gun/kinetic_blaster/KB = new(src, owner, src)
		owner.visible_message(
			"[owner] clenches their hand into a fist, electric energy crackling around it before a kinetic blaster forms over it!",
			"You clench your hand into a fist, electric energy crackling around your fingers before a kinetic blaster forms over it!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(KB)


/obj/item/organ/internal/psionic_tumor/proc/cryo_kinetic_blaster()
	set category = "Psionic powers"
	set name = "Cryo-Kinetic Orb (0)"
	set desc = "Expend none of your essence to create a cryo-kinetic orb in hand, a ranged weapon that grows in power with your cognition and expends four psi points per shot. \
	Deals no damage on its own, but the sudden blast of cold stuns whoever it hits for a short time."
	psi_point_cost = 0

	if(pay_power_cost(psi_point_cost))
		var/obj/item/gun/kinetic_blaster/cryo/KB = new(src, owner, src)
		owner.visible_message(
			"[owner] clenches their hand into a fist, electric energy crackling around it before a cryo-kinetic orb forms over it!",
			"You clench your hand into a fist, electric energy crackling around your fingers before a cryo-kinetic orb forms over it!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(KB)

/obj/item/organ/internal/psionic_tumor/proc/pyro_kinetic_blaster()
	set category = "Psionic powers"
	set name = "Pyro-Kinetic Orb (0)"
	set desc = "Expend none of your essence to create a pyro-kinetic orb in hand, a ranged weapon that grows in power with your cognition and expends three psi points per explosive shot. \
	The heat generated from pyro blasts fast enough to not cause fires, but the sudden expansion of hot air is highly explosive."
	psi_point_cost = 0

	if(pay_power_cost(psi_point_cost))
		var/obj/item/gun/kinetic_blaster/pyro/KB = new(src, owner, src)
		owner.visible_message(
			"[owner] clenches their hand into a fist, electric energy crackling around it before a pyro-kinetic orb forms over it!",
			"You clench your hand into a fist, electric energy crackling around your fingers before a pyro-kinetic orb forms over it!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(KB)

/obj/item/organ/internal/psionic_tumor/proc/electro_kinetic_blaster()
	set category = "Psionic powers"
	set name = "Electro-Kinetic Orb (0)"
	set desc = "Expend none of your essence to create a electro-kinetic orb in hand, a ranged weapon that grows in power with your cognition and expends a two psi points per shot. \
	Much stronger than kinetic blasts and doesn't need to travel towards its target, being electric."
	psi_point_cost = 0

	if(pay_power_cost(psi_point_cost))
		var/obj/item/gun/kinetic_blaster/electro/KB = new(src, owner, src)
		owner.visible_message(
			"[owner] clenches their hand into a fist, electric energy crackling around it before an electro-kinetic orb forms over it!",
			"You clench your hand into a fist, electric energy crackling around your fingers before an electro-kinetic orb forms over it!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(KB)
