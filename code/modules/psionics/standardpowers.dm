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