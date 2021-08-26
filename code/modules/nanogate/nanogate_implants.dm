// Here is where we store the implants made by the nanogate organ.

// Nanite Muscles. Increase walking speed.
/obj/item/organ_module/muscle/nanite
	name = "nanite mechanical muscles"
	desc = "A set of mechanical muscles designed to be implanted into legs, increasing speed beyond what human muscles are capable of."
	allowed_organs = list(BP_R_LEG, BP_L_LEG)
	icon_state = "muscle"
	var/mob/living/carbon/holder // Which mob has the augment?

/obj/item/organ_module/muscle/nanite/New(var/loc, var/mob/living/carbon/Maker)
	..()
	if(Maker)
		holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/organ_module/muscle/nanite/Process()
	..()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] turn into useless nanite goo.")
		qdel(src)
		return

/obj/item/organ_module/muscle/nanite/onInstall(obj/item/organ/external/E)
	E.tally -= 0.3

/obj/item/organ_module/muscle/nanite/onRemove(obj/item/organ/external/E)
	E.tally += 0.3

// Nanite Armor. Increase defense
/obj/item/organ_module/armor/nanite
	name = "nanite armor"
	desc = "A set of subdermal steel plates, designed to provide additional impact protection while remaining lightweight."
	allowed_organs = list(BP_CHEST)
	icon_state = "armor-chest"
	var/mob/living/carbon/holder // Which mob has the augment?

/obj/item/organ_module/armor/nanite/New(var/loc, var/mob/living/carbon/Maker)
	..()
	if(Maker)
		holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/organ_module/armor/nanite/Process()
	..()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] turn into useless nanite goo.")
		qdel(src)
		return

/obj/item/organ_module/armor/nanite/onInstall(obj/item/organ/external/E)
	E.brute_mod -= 0.5

/obj/item/organ_module/armor/nanite/onRemove(obj/item/organ/external/E)
	E.brute_mod += 0.5

// Nanite Razor Nails. An armblade.
/obj/item/organ_module/active/simple/nanite
	name = "nanite claws"
	desc = "An armblade made of nanites."
	verb_name = "Deploy embedded claws"
	icon_state = "wolverine"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/armblade/nanite
	var/mob/living/carbon/holder // Which mob has the augment?

/obj/item/organ_module/active/simple/nanite/New(var/loc, var/mob/living/carbon/Maker)
	..()
	if(Maker)
		holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/organ_module/active/simple/nanite/Process()
	..()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] turn into useless nanite goo.")
		qdel(src)
		return

/obj/item/tool/armblade/nanite
	icon_state = "wolverine"
	name = "nanite claws"
	desc = "A set of claws deployed from the tips of your fingers. Great for cutting people into ribbons."

// Opifex-only Engineering Omnitool
/obj/item/organ_module/active/simple/engineer/nanite
	name = "embedded manite omnitool"
	desc = "An all-in-one engineering tool implant. Convenient to use and more effective than the basics, but much less efficient than customized or more specialized tools."
	verb_name = "Deploy engineering omnitool"
	icon_state = "multitool"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/engimplant
	price_tag = 575
	var/mob/living/carbon/holder // Which mob has the augment?

/obj/item/organ_module/active/simple/engineer/nanite/New(var/loc, var/mob/living/carbon/Maker)
	..()
	if(Maker)
		holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/organ_module/active/simple/engineer/nanite/Process()
	..()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] turn into useless nanite goo.")
		qdel(src)
		return
