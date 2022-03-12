/datum/power/psion/proc/addPower(var/mob/living/carbon/human/themaster)
	to_chat(themaster, "DEBUG. Adding: [src] to the psion")

// NOTES ON BALANCE
// Psionic powers are maintained and balanced by the long cooldown per psi point gained. It takes 10 minutes to gain a psi point and you're maximum pool is Cog/10
// Since you will rarely have a fuck ton of psi points outside specializing (scientist/mar'qua/background choices/etc) and they take a long time to refill when spent.
// The cooldowns are not based in a hard number but how much you want to risk by using a slowly recharging but limited pool. -Kazkin

// Do account for the fact that psi points can be restored using cerebrix inhalers or injections of cerebrix. Powers that are inherently strong or spammable should come with drawbacks.
// Agony or stat penalties are the usual go to. Failing that, dealing damage a psion can't restore with his powers.

// Lesser powers - These powers should never exceed a cost of 1 point.
/obj/item/organ/internal/psionic_tumor/proc/psionic_healing()
	set category = "Psionic powers"
	set name = "Psychosomatic healing (1)"
	set desc = "Expend a single point of your psi essence to heal your body, the process however is extremely painful."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		owner.heal_overall_damage(40,40)
		if(!owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
			owner.stun_effect_act(0, 200, BP_CHEST)
			owner.weakened = 10
		else
			owner.stun_effect_act(0, 100, BP_CHEST)
			owner.weakened = 5
		owner.visible_message(
			SPAN_DANGER("[owner]'s flesh begins to hiss and bubble as their wounds mend!"),
			SPAN_DANGER("A wave of agony envelops you as your wounds begin to close!")
			)

/obj/item/organ/internal/psionic_tumor/proc/psionic_telepathy()
	set category = "Psionic powers"
	set name = "Telepathic projection (1)"
	set desc = "Expend a single point of your psi essence to send a message to someone. Cruciform users are shielded from this heresy and synthetics lack the flesh for it."
	psi_point_cost = 1

	var/list/creatures = list() // Who we can talk to
	for(var/mob/living/carbon/human/h in world) // Check every players in the game
		if(!h.species?.reagent_tag != IS_SYNTHETIC && !h.get_core_implant(/obj/item/implant/core_implant/cruciform) && !h.is_mannequin) // Can't talk to robots or people with cruciforms or mannequins
			creatures += h // Add the player to the list we can talk to
	var/mob/living/carbon/human/target = input("Who do you want to project your mind to ?") as null|anything in creatures
	if (isnull(target))
		return

	if(owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(owner, "Your psionic attunement allows you to bypass fully using your essence.")
		psi_point_cost = 0

	if(pay_power_cost(psi_point_cost))
		var/say = sanitize(input("What do you wish to say"))
		if(target.psi_blocking >= 10)
			owner.stun_effect_act(0, target.psi_blocking * 5, BP_HEAD)
			owner.weakened = target.psi_blocking
			usr.show_message(SPAN_DANGER("Your head pulsates with pain as your mind bashes against an unbreakable barrier!"))
		else
			target.show_message("\blue <b><font size='3px'> You hear [usr.real_name]'s voice: [say] </font></b>")
			usr.show_message("\blue You project your mind into [target.real_name]: [say]")
			log_say("[key_name(usr)] sent a telepathic message to [key_name(target)]: [say]")
			for(var/mob/observer/ghost/G in world)
				G.show_message("<i>Telepathic message from <b>[owner]</b> to <b>[target]</b>: [say]</i>")

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

/obj/item/organ/internal/psionic_tumor/proc/psychosomatictransfer()
	set category = "Psionic powers"
	set name = "Psychosomatic Transference (1)"
	set desc = "Expend a single point of your psi essence to fill your stomach with cannibalized proteins from your own body. Beware, this will generate toxins and expend some of your blood."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		if(!owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
			owner.nutrition = 400
			owner.adjustToxLoss(15)
			owner.drip_blood(54)
		else
			owner.nutrition = 400
			owner.adjustToxLoss(7.5)
			owner.drip_blood(26)
		to_chat(owner, "You feel sick and woozy, a sudden full sensation in your gut almost making you want to vomit.")

/obj/item/organ/internal/psionic_tumor/proc/telekineticprowress()
	set category = "Psionic powers"
	set name = "Telekinetic Prowess (1)"
	set desc = "Expend a single point of your psi essence to gain telekinesis. Lasts indefinitely unless a genetics lab or you yourself willingly end it."
	psi_point_cost = 1

	if(owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(owner, "Your psionic attunement allows you to bypass fully using your essence.")
		psi_point_cost = 0

	if (!(TK in owner.mutations)) // We can't get TK if we already have TK
		if(pay_power_cost(psi_point_cost))
			owner.mutations.Add(TK)
			to_chat(owner, "You feel your abilities expanding, your mind growing outward, allowing you to manipulate and move objects with your mind.")
	else
		to_chat(owner, "You already have telekinesis.")

/obj/item/organ/internal/psionic_tumor/proc/telekineticprowress_end()
	set category = "Psionic powers"
	set name = "End Telekinesis (0)"
	set desc = "End your telekinesis at will, at no essence cost. Beware, you will need to expend more to get telekinesis back."
	psi_point_cost = 0

	if ((TK in owner.mutations)) // We can't remove TK if we don't already have TK
		if(pay_power_cost(psi_point_cost))
			owner.mutations.Remove(TK)
			to_chat(owner, "You feel your telekinetic powers becoming dormant as your mind withdraws into itself, for now.")
	else
		to_chat(owner, "You do not have telekinesis.")

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
