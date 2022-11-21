/obj/item/device/genetical_imprinter
	name = "Genetical imprinter"
	desc = "A strange device that contains bio-genetical modification of several genetical databases around the universe."
	icon_state = "hardware_imprinter"
	origin_tech = list(TECH_BIO = 1)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_GLASS = 2)
	matter_reagents = list("uncap nanites" = 1)
	var/perk_imprinting = PERK_SOMELLIER
	var/perk_imprinting_forbidden = PERK_SOMELLIER
	var/spent = FALSE
	price_tag = 50

/obj/item/device/genetical_imprinter/proc/imprint(mob/living/carbon/human/user)//Janked up Lamas code
	if(spent)//Is it already used up or not
		return

	if(user.stats.getPerk(perk_imprinting) || user.stats.getPerk(perk_imprinting_forbidden) || user.species.reagent_tag == IS_SYNTHETIC)//What perks stop this from being usable to prevent things like kriosans getting double recoil reduction
		return//Also no synths to prevent memes

	if(!istype(user) || user.incapacitated() || user.get_active_hand() != src)//Checks for sanity
		return

	if(length(user.get_covering_equipped_items(EYES))) //If we have covered eyes or not
		return

	user.stats.addPerk(perk_imprinting) //What perk we are imprinting
	to_chat(user, SPAN_DANGER("[src] plunges into your skin, modifying your very own DNA!"))
	playsound(usr, 'sound/effects/refill.ogg', 50, -5)

	spent = TRUE
	price_tag = 30

/obj/item/device/genetical_imprinter/attack(mob/M, mob/living/carbon/human/user, target_zone)//These are actually what affect if we can use it or not at all
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

/obj/item/device/genetical_imprinter/examine(mob/user)
	. = ..()
	if(spent)
		to_chat(user, SPAN_WARNING("It is spent."))//What message should show when we are examining it
