/datum/power/psion/proc/addPower(var/mob/living/carbon/human/themaster)
	to_chat(themaster, "DEBUG. Adding: [src] to the psion")

// Automatic powers
/obj/item/organ/internal/psionic_tumor/proc/psionic_healing()
	set category = "Psionic powers"
	set name = "Psychosomatic healing (1)"
	set desc = "Expend a single point of your psi essence to heal your body, the process however is extremely painful."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		owner.heal_overall_damage(40,40)
		owner.stun_effect_act(0, 200, BP_CHEST)
		owner.weakened = 10
		owner.visible_message(
			SPAN_DANGER("[src]'s flesh begins to hiss and bubble as their wounds mend!"),
			SPAN_DANGER("A wave of agony envelops you as your wounds begin to close!")
			)

/obj/item/organ/internal/psionic_tumor/proc/psionic_telepathy()
	set category = "Psionic powers"
	set name = "Telepathy (1)"
	set desc = "Expend a single point of your psi essence to send a message to someone. Cruciform users are shielded from this heresy."
	psi_point_cost = 1

	var/list/creatures = list() // Who we can talk to
	for(var/mob/living/carbon/h in world) // Check every players in the game
		if(!h.species?.reagent_tag != IS_SYNTHETIC && !h.get_core_implant(/obj/item/implant/core_implant/cruciform)) // Can't talk to robots or people with cruciforms
			creatures += h // Add the player to the list we can talk to
	var/mob/target = input("Who do you want to project your mind to ?") as null|anything in creatures
	if (isnull(target))
		return

	if(pay_power_cost(psi_point_cost))
		var/say = sanitize(input("What do you wish to say"))
		target.show_message("\blue You hear [usr.real_name]'s voice: [say]")
		usr.show_message("\blue You project your mind into [target.real_name]: [say]")
		log_say("[key_name(usr)] sent a telepathic message to [key_name(target)]: [say]")
		for(var/mob/observer/ghost/G in world)
			G.show_message("<i>Telepathic message from <b>[src]</b> to <b>[target]</b>: [say]</i>")

/obj/item/organ/internal/psionic_tumor/proc/psionic_omnitool()
	set category = "Psionic powers"
	set name = "Create Omnitool (1)"
	set desc = "Expend a single point of your psi essence to create a shitty omnitool."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		var/obj/item/tool/psionic_omnitool/tool = new /obj/item/tool/psionic_omnitool(src, owner)
		owner.visible_message(
			"[src] make a psionic omnitool!",
			"You make a psionic omnitool!"
			)
		usr.put_in_active_hand(tool)

/obj/item/organ/internal/psionic_tumor/proc/psionic_knife()
	set category = "Psionic powers"
	set name = "Create Knife (1)"
	set desc = "Expend a single point of your psi essence to create a Knife."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		var/obj/item/tool/knife/psionic_blade/knife = new /obj/item/tool/knife/psionic_blade(src, owner)
		owner.visible_message(
			"[src] make a psionic knife!",
			"You make a psionic knife!"
			)
		usr.put_in_active_hand(knife)

/obj/item/organ/internal/psionic_tumor/proc/psionic_weapon()
	set category = "Psionic powers"
	set name = "Create Weapon (2)"
	set desc = "Construct a weapon"
	psi_point_cost = 2

	var/obj/item/oddity/active = null
	if(usr.get_active_hand())
		if(istype(usr.get_active_hand(), /obj/item/oddity))
			active = usr.get_active_hand()
			if(!active.oddity_stats)
				to_chat(usr, "This oddity has no aspects to build a weapon from!")
				return
			var/list/LStats = active.oddity_stats
			var/obj/item/cultweaponchoice = pickweight(list(
				/obj/item/tool/sword/cult = (1 + LStats[STAT_ROB]),
				/obj/item/gun/projectile/automatic/sol/cult = (1 + LStats[STAT_VIG]),
				/obj/item/gun/energy/laser/cult = (1 + LStats[STAT_COG]),
				/obj/item/tool/hammer/homewrecker/cult= (1 + LStats[STAT_TGH]),
				/obj/item/gun/energy/plasma/cassad/cult = (1 + LStats[STAT_BIO]),
				/obj/item/tool/saw/chain/cult = (1 + LStats[STAT_MEC])))
			playsound(usr.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 50, 1, -3)
			var/turf/T = get_turf(usr)
			do_sparks(8, 0, T)
			cultweaponchoice = new cultweaponchoice(T)
			usr.visible_message(
				SPAN_DANGER("[usr] molds and twists the [active] like clay, transforming it into a [cultweaponchoice]!"),
				SPAN_DANGER("You mold and twist the [active] like clay, transforming it into a [cultweaponchoice]!")
				)
			usr.drop_item()
			usr.put_in_active_hand(cultweaponchoice)
			qdel(active)

		else
			to_chat(usr, "You must hold an oddity in your active hand.")
	else
		to_chat(usr, "You must hold an oddity in your active hand.")

/obj/item/organ/internal/psionic_tumor/proc/psionic_tool()
	set category = "Psionic powers"
	set name = "Create Tool (2)"
	set desc = "Construct a tool"
	psi_point_cost = 2

	var/obj/item/oddity/active = null
	if(usr.get_active_hand())
		if(istype(usr.get_active_hand(), /obj/item/oddity))
			active = usr.get_active_hand()
			if(!active.oddity_stats)
				to_chat(usr, "This oddity has no aspects to build a weapon from!")
				return
			var/list/LStats = active.oddity_stats
			var/obj/item/cultweaponchoice = pickweight(list(
				/obj/item/tool/saw/hyper = (1 + LStats[STAT_ROB]),
				/obj/item/tool/hammer/powered_hammer = (1 + LStats[STAT_VIG]),
				/obj/item/tool/multitool/advanced = (1 + LStats[STAT_COG]),
				/obj/item/tool/shovel/power = (1 + LStats[STAT_TGH]),
				/obj/item/tool/screwdriver/combi_driver = (1 + LStats[STAT_BIO]),
				/obj/item/tool/weldingtool/advanced = (1 + LStats[STAT_MEC])))
			playsound(usr.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 50, 1, -3)
			var/turf/T = get_turf(usr)
			do_sparks(8, 0, T)
			cultweaponchoice = new cultweaponchoice(T)
			usr.visible_message(
				SPAN_DANGER("[usr] molds and twists the [active] like clay, transforming it into a [cultweaponchoice]!"),
				SPAN_DANGER("You mold and twist the [active] like clay, transforming it into a [cultweaponchoice]!")
				)
			usr.drop_item()
			usr.put_in_active_hand(cultweaponchoice)
			qdel(active)

		else
			to_chat(usr, "You must hold an oddity in your active hand.")
	else
		to_chat(usr, "You must hold an oddity in your active hand.")

/*
/datum/power/psion/horrifying
	name = "Horrifying Visage"
	desc = "Infuses you with the aspect of the ship itself, causing you to drain sanity from anyone that observes you."

/datum/power/psion/horrifying/addPower(var/mob/living/carbon/human/themaster)
	themaster.sanity_damage += 5
	..()

/datum/power/psion/vblade
	name = "Voidmother's Blade"
	desc = "Transforms an oddity into a weapon for our cause."

/datum/power/psion/amoung
	name = "Among Them"
	desc = "Causes roaches to see you as one of their own."

/datum/power/psion/amoung/addPower(var/mob/living/carbon/human/themaster)
	themaster.faction = "roach"
	..()

// Lesser powers


/datum/power/psion/tranquility
	name = "Tranquility"
	desc = "End a breakdown immediately"
	psi_point_cost = 1

/datum/power/psion/candle
	name = "Like a Candle"
	desc = "Grants target a glimpse into the power of the void."
	psi_point_cost = 5

/datum/power/psion/wail
	name = "Unearthly Wail"
	desc = "Allows you to unleash a blood-curdling wail, draining sanity."
	psi_point_cost = 1

/datum/power/psion/darkness
	name = "Bring Darkness"
	desc = "Breaks all lights around you."
	psi_point_cost = 1

/datum/power/psion/banish
	name = "Banish Swarm"
	desc = "Banishes all roaches within 15 tiles of you to the nearest burrow."
	psi_point_cost = 1

/datum/power/psion/callswarm
	name = "Call Swarm"
	desc = "Calls a swarm of roaches to your location. They are not friendly to you."
	psi_point_cost = 1

/datum/power/psion/rust
	name = "Rust"
	desc = "Causes one object in your hand to rust and become useless."
	psi_point_cost = 1

/datum/power/psion/vfaith
	name = "Voidmother's Faith"
	desc = "Restores your sanity to full"
	psi_point_cost = 1

// Greater powers

/datum/power/psion/decay
	name = "Decay"
	desc = "Makes all objects on your person and in the inventory of your grabbed target rust and become useless."
	psi_point_cost = 4
	psipointcost = 40

/datum/power/psion/vshield
	name = "Voidmother's Shield"
	desc = "Grants you a black, oily substance that functions as powerful armor... permanently"
	psipointcost = 40

/datum/power/psion/initiate
	name = "Rite of Initiation"
	desc = "Induct a new psion to our ranks."
	psi_point_cost = 4
	psipointcost = 40

/datum/power/psion/kingofbeasts
	name = "King of Beasts"
	desc = "Summons a friendly kaiser roach to your location."
	psi_point_cost = 4
	psipointcost = 40

/datum/power/psion/viel
	name = "Tear the Veil"
	desc = "Rends the veil asunder for yourself and one other person."
	psi_point_cost = 6
	psipointcost = 40

/datum/power/psion/truthinblood
	name = "Truth in Blood"
	desc = "Covers the ground around you in blood and gore."
	psi_point_cost = 4
	psipointcost = 40

/datum/power/psion/breakfaith
	name = "Break the faith"
	desc = "Subvert an Obelisk to our cause."
	psi_point_cost = 4
	psipointcost = 40

/datum/power/psion/breakreality
	name = "Unseat Reality"
	desc = "Bring down the walls of reality around you."
	psi_point_cost = 4
	psipointcost = 40

/datum/power/psion/embracecorruption
	name = "Embrace Corruption"
	desc = "Sacrifice yourself to bring about a true fusion of man and machine."
	psi_point_cost = 0
	psipointcost = 40

/datum/power/psion/underworld
	name = "Path to the Underworld"
	desc = "Teleport yourself and anyone grabbed by you to the under-tunnels."
	psi_point_cost = 4
	psipointcost = 40

/datum/power/psion/theskies
	name = "The Skies are Buried Deep"
	desc = "Reveals the truth to everyone who can see you."
	psi_point_cost = 4
	psipointcost = 40
*/