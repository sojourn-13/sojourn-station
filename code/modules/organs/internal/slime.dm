/obj/item/organ/internal/bone/slime
	name = "Aulvae cytostructures"
	desc = "The Aulvae equivalent of a 'bone', this cartilaginous slime act as both bone, nerve & muscle all in one."
	icon_state = "blood_vessel-prosthetic"
	nature = MODIFICATION_SLIME
	blood_req = 5
	max_blood_storage = 7.5
	oxygen_req = 2.5
	nutriment_req = 4 // its a non breakable slime bone with muscle. We eat the owner.
	organ_efficiency = list(OP_BONE = 125, OP_MUSCLE = 125, OP_NERVE = 125, OP_HEART = 15) //We have slightly higher efficiency, but we also don't have a bone to protect us so any damage to the internals damages all of us. Heart efficiency is low as it is primely used to pump chems around our body- and each bone applies that bonus. With 7 cytostructures you get 105 efficiency total.
	price_tag = 200
	force = WEAPON_FORCE_NORMAL

/obj/item/organ/internal/bone/slime/removed_mob()
	..()
	visible_message(SPAN_NOTICE("the [src] lose cohesion and become a puddle of goo!"))
	Destroy()

//organs
/obj/item/organ/internal/stomach/slime
	name = "Aulvae lysosomes"
	desc = "A series of small organs found floating barely-visible within an Aulvae that assist in a variety of tasks relating to the processing of ingested matter."
	icon_state = "slime_stomach"
	nature = MODIFICATION_SLIME
	parent_organ_base = BP_HEAD
	organ_efficiency = list(OP_STOMACH = 150, OP_LIVER = 100, OP_KIDNEYS = 100) //we're *very* hungry bois and thusly can hold a lotta food. Why is max nutri only based on stomach efficiency? Lol! Lmao! That is all it seems to affect so this is a fine enough solution. This gives us approximately 600 nutri vs a humans 400.

/obj/item/organ/internal/stomach/slime/removed_mob()
	..()
	visible_message(SPAN_NOTICE("the [src] lose cohesion and become a puddle of goo!"))
	Destroy()

//Core(brain)
/obj/item/organ/internal/vital/brain/slime
	name = "Aulvae core"
	desc = "A complex, organic knot of jelly and crystalline particles."
	icon = 'icons/mob/slimes.dmi'
	icon_state = "bluespace slime extract"
//	organ_efficiency = list() //tbh not sure why we didn't just make the core do all these functions along with stomach. Oh well.
	nature = MODIFICATION_SLIME
	parent_organ_base = BP_CHEST
	blood_req = 0
	max_blood_storage = 0
	oxygen_req = 0

//very funny but this needs work.

/obj/item/organ/internal/vital/brain/slime/Process()
	remove_augments()

/obj/item/organ/internal/vital/brain/slime/proc/remove_augments()
	var/mob/living/carbon/human/wearer
	for(var/obj/O in wearer)
		if(istype(O, /obj/item/organ/external))
			var/obj/item/organ/external/R = O
			if(!BP_IS_ROBOTIC(R))
				continue

			if(R.owner != wearer)
				continue
			wearer.visible_message(SPAN_DANGER("[wearer]'s [R.name] tears off."),
			SPAN_DANGER("Your [R.name] tears off."))
			R.droplimb(TRUE, DROPLIMB_EDGE)
		if(istype(O, /obj/item/implant))
			if(O == src)
				continue
			var/obj/item/implant/R = O
			if(R.wearer != wearer)
				continue
			wearer.visible_message(SPAN_DANGER("[R.name] rips through [wearer]'s [R.part]."),\
			SPAN_DANGER("[R.name] rips through your [R.part]."))
			R.part.take_damage(rand(20,40))
			R.uninstall()
			R.malfunction = MALFUNCTION_PERMANENT
		if(istype(O, /obj/item/organ/internal))
			var/obj/item/organ/internal/I = O
			if(!LAZYLEN(I.item_upgrades))
				continue
			if(I.owner != wearer)
				continue
			for(var/mod in I.item_upgrades)
				var/atom/movable/AM = mod
				LEGACY_SEND_SIGNAL(AM, COMSIG_ITEM_DROPPED, I)
				I.take_damage(rand(6,12), BRUTE)
				if(I.parent)
					I.parent.take_damage(rand(2,5))
				wearer.visible_message(SPAN_NOTICE("<b>\The [AM]</b> rips through \the [wearer]'s flesh."), SPAN_NOTICE("<b>\The [AM]</b> rips through your flesh. Your [I.name] hurts."))

/*
This noise doesn't work, nor has it ever.
It is also obsolete as revival for slimepeople is now accomplished via
a tweak to plasma to make it affect dead slimes inmstead of going into the body
this code is maintained for postereity or incase someone wants to try it again themselves -cdb

	var/regenerating = FALSE
	var/revival_chem = "plasma"
	var/respawn_delay = 100 // Delay, in deciseconds (1/10th of a second), before the slime actually revive after being injected.

/obj/item/organ/internal/vital/brain/slime/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/reagent_containers/syringe) && !regenerating)
		var/obj/item/reagent_containers/syringe/S = I
		if(S.mode == 1 && S.reagents.remove_reagent(revival_chem, 5)) // We inject 5u of plasma // the 1 correspond to SYRINGE_INJECT, but we're before the define
			to_chat(user, SPAN_NOTICE("You inject [revival_chem] into [src]."))
			src.visible_message("[src] starts to wobble and wiggle...")
			regenerating = TRUE
			spawn(100) regen_body()

/obj/item/organ/internal/vital/brain/slime/proc/regen_body()
	if(loc != get_turf(src))
		forceMove(src, get_turf(src))
	var/mob/living/carbon/human/host = new(src, FORM_SLIME, FORM_SLIME)
	brainmob?.mind.transfer_to(host)

	src.visible_message("[src] expands into a humanoid form.")
*/
