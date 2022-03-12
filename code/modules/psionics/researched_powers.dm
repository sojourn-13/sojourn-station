// These powers are obtained through the Soteria via researching into new powers. They may be granted to the researcher and others.

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

/obj/item/organ/internal/psionic_tumor/proc/chosen_control()
	set category = "Psionic powers"
	set name = "Chosen Control (4)"
	set desc = "Expend four psi points to clear all effects that impede one's control. Remove stuns, paralysis, pain, agony, restrainments, and clears the users body of all chemicals and addictions."
	psi_point_cost = 4

	if(pay_power_cost(psi_point_cost))
		owner.visible_message(
			"[owner] shimmers strangely!",
			"You remind the universe that it bends to your will!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		if(owner.buckled)
			owner.buckled.unbuckle_mob()

		if (owner.handcuffed && !initial(owner.handcuffed))
			owner.drop_from_inventory(owner.handcuffed)
		owner.handcuffed = initial(owner.handcuffed)

		if (owner.legcuffed && !initial(owner.legcuffed))
			owner.drop_from_inventory(owner.legcuffed)
		owner.legcuffed = initial(owner.legcuffed)

		owner.SetParalysis(0)
		owner.SetStunned(0)
		owner.SetWeakened(0)
		owner.setHalLoss(0)
		owner.reagents.clear_reagents()
		for(var/datum/reagent/R in owner.metabolism_effects.addiction_list)
			to_chat(owner, SPAN_NOTICE("You don't crave for [R.name] anymore."))
			owner.metabolism_effects.addiction_list.Remove(R)
			qdel(R)

/obj/item/organ/internal/psionic_tumor/proc/detect_thoughts()
	set category = "Psionic powers"
	set name = "Locate Mind-Essence (5)"
	set desc = "Expend five points of essence to psionically detect the thoughts and location of another higher life form. Does not work on animals, cruciform bearers, synthetics, or those \
	wearing psionic protection. Can locate lingering echoes of thoughts in the deceased, allowing you to find bodies."
	psi_point_cost = 5

	var/list/creatures = list() // Who we can talk to
	for(var/mob/living/carbon/human/h in world) // Check every players in the game
		if(!h.species?.reagent_tag != IS_SYNTHETIC && !h.get_core_implant(/obj/item/implant/core_implant/cruciform) && !h.is_mannequin) // Can't talk to robots or people with cruciforms or mannequins
			creatures += h // Add the player to the list we can talk to
	var/mob/living/carbon/human/target = input("Who do you want to locate?") as null|anything in creatures
	if (isnull(target))
		return

	if(pay_power_cost(psi_point_cost))
		if(target.psi_blocking >= 10)
			owner.stun_effect_act(0, target.psi_blocking * 5, BP_HEAD)
			owner.weakened = target.psi_blocking
			usr.show_message(SPAN_DANGER("Your head pulsates with pain as your mind bashes against an unbreakable barrier!"))
		else
			var/area/t = get_area(target)
			usr.show_message("\blue You psionically locate [target.real_name], they are at : [target.x], [target.y], [target.z] in [t.name].")

/obj/item/organ/internal/psionic_tumor/proc/psychoactive_manipulation()
	set category = "Psionic powers"
	set name = "Psychoactive Manipulation (2)"
	set desc = "Expend two points of essence to psionically manipulate an oddity. Unlike other, more refined methods, this process is entirely random. The process could make the oddity or anomaly \
	better or worse."
	psi_point_cost = 2

	var/obj/item/oddity/O = owner.get_active_hand()
	if(!istype(O, /obj/item/oddity))
		to_chat(owner, SPAN_NOTICE("You're not holding an oddity or proper anomaly!"))
		return FALSE
	owner.visible_message("<b><font color='purple'>[owner] concentrates on the anomaly in their hand, something about it changing in a subtle way.</font><b>", "<b><font color='purple'>You focus on the energies around the object, swaying them to your will and trying to change it!</font><b>")

	if(O.oddity_stats)
		for(var/stat in O.oddity_stats)
			O.oddity_stats[stat] = rand(1, O.oddity_stats[stat])

	if(O.perk)
		O.perk = null
	if(prob(O.prob_perk))
		O.perk = get_oddity_perk()
