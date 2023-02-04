/obj/item/device/hardware_imprinter
	name = "hardware imprinter"
	desc = "A device of dubious origins and quality used to help install modules for cerebral interface."
	icon_state = "hardware_imprinter"
	origin_tech = list(TECH_BIO = 5, TECH_ILLEGAL = 2)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_GLASS = 2)
	matter_reagents = list("uncap nanites" = 10)
	var/perk_imprinting = PERK_SOMELLIER //Perk we are giving away with this
	var/perk_imprinting_forbidden = PERK_SOMELLIER //Perk we don't want to stack with this (IE: Smartlink incompatible with Instinctual Skill)
	var/spent = FALSE
	price_tag = 1200
	var/has_health_downside = TRUE
	var/has_blood_downside = TRUE
	var/has_nsa_downside = TRUE

/obj/item/device/hardware_imprinter/proc/imprint(mob/living/carbon/human/user)//Janked up mental imprinter code
	if(spent)//Is it already used up or not
		return

	if(user.stats.getPerk(perk_imprinting) || user.stats.getPerk(perk_imprinting_forbidden) || user.species.reagent_tag == IS_SYNTHETIC)//What perks stop this from being usable to prevent things like kriosans getting double recoil reduction
		return//Also no synths to prevent memes

	if(!istype(user) || user.incapacitated() || user.get_active_hand() != src)//Checks for sanity
		return

	if(length(user.get_covering_equipped_items(EYES))) //If we have covered eyes or not
		return

	user.stats.addPerk(perk_imprinting) //What perk we are imprinting
	to_chat(user, SPAN_DANGER("[src] plunges into your eye, installing new hardware!"))
	playsound(usr, 'sound/effects/refill.ogg', 50, -5)
	user.emote("painscream")//It is drilling into you so yeah bit painful

	spent = TRUE
	price_tag = 30

	if(has_health_downside)
		user.maxHealth -= 5
		user.health -= 5

	if(has_blood_downside)
		if(user.species && user.species.flags & NO_BLOOD) //We want the var for safety but we can do without the actual blood.
			return
		user.vessel.maximum_volume  -= 20
		user.drip_blood(20)

	if(has_nsa_downside)
		user.metabolism_effects.nsa_bonus -= 15
		user.metabolism_effects.calculate_nsa()


/obj/item/device/hardware_imprinter/attack(mob/M, mob/living/carbon/human/user, target_zone)//These are actually what affect if we can use it or not at all
	if(spent)//If it's spent we can't use it
		to_chat(user, SPAN_WARNING("[src] beeps, notifying you that it's spent!"))
		playsound(usr, 'sound/machines/buzz-two.ogg', 20, -5)
		return ..()
	if(user.stats.getPerk(perk_imprinting) || user.stats.getPerk(perk_imprinting_forbidden) || user.species.reagent_tag == IS_SYNTHETIC) //Reason we check for the perk we are printing too is that you don't waste one for nothing
		to_chat(user, SPAN_WARNING("[src] beeps, refusing you as host!"))//No synths
		playsound(usr, 'sound/machines/buzz-two.ogg', 20, -5)
		return ..()
	if(!istype(user) || M != user || target_zone != BP_EYES || user.incapacitated())
		to_chat(user, SPAN_WARNING("[src] beeps, being unable to operate on you under current conditions!"))
		playsound(usr, 'sound/machines/buzz-two.ogg', 20, -5)
		return ..()
	if(length(user.get_covering_equipped_items(EYES)))
		to_chat(user, SPAN_WARNING("You need to remove the eye covering first."))
		playsound(usr, 'sound/machines/buzz-two.ogg', 20, -5)
		return ..()//Beeps and messages to actually let player know that they need to do something to continue

	INVOKE_ASYNC(src, .proc/imprint, user)

/obj/item/device/hardware_imprinter/examine(mob/user)
	. = ..()
	if(spent)
		to_chat(user, SPAN_WARNING("It is spent."))//What message should show when we are examining it

/obj/item/device/hardware_imprinter/smartlink
	name = "smartlink imprinter"
	desc = "An installer for augment favored by professional mercenaries linking your brain throught your arms directly into your weapons allowing for god-like precision even from beginners."
	perk_imprinting = PERK_SMARTLINK
	perk_imprinting_forbidden = PERK_PERFECT_SHOT

/obj/item/device/hardware_imprinter/cogenhance
	name = "cognitive enhancer imprinter"
	desc = "An installer for augment used by both militaries and scientific groups. It boosts processing capacity of it's users brain allowing them to think way faster on their feet than most mortals can."
	perk_imprinting = PERK_COGENHANCE
	perk_imprinting_forbidden = PERK_INSPIRED

/obj/item/device/hardware_imprinter/chemneutral
	name = "chemical neutralizer imprinter"
	desc = "An installer for augment used by corporates to avoid headaches from partying too hard, due to it's price it's not affordable by most people that actually need it and as such is often demonized as enabler for hedonism."
	perk_imprinting = PERK_CHEMNEUTRAL
	perk_imprinting_forbidden = PERK_ADDICT//Not a way to cure your addiction sorry bud
	has_nsa_downside = FALSE //dosnt have the nsa limits as it affects nsa directly
