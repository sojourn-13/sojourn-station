/obj/item/device/mental_imprinter
	name = "mental imprinter"
	desc = "A device that is applied to an eye to imprint skills into one's mind."
	icon_state = "mental_imprinter"
	origin_tech = list(TECH_BIO = 5, TECH_ILLEGAL = 2)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_GLASS = 2)
	matter_reagents = list("uncap nanites" = 10)
	var/stat_increase = 5 //How many stats we gain
	var/apply_sanity_damage = 30
	var/spent = FALSE
	price_tag = 1200

/obj/item/device/mental_imprinter/proc/imprint(mob/living/carbon/human/user)
	var/stat = input(user, "Select stat to boost", "Mental imprinter") as null|anything in ALL_STATS_TO_IMPRINT
	if(!stat || spent || user.species.reagent_tag == IS_SYNTHETIC)//If it's spent we won't attempt to use it again
		return//No synths because of stat meme

	if(!istype(user) || !user.stats || user.incapacitated() || user.get_active_hand() != src || length(user.get_covering_equipped_items(EYES)))//Sanity
		return

	// User gains more and loses less if the base stat is fairly low
	if(user.stats.getStat(stat, pure=TRUE) <= STAT_LEVEL_BASIC)
		user.stats.changeStat(stat, stat_increase * 2)
		user.sanity.onPsyDamage(apply_sanity_damage / 2)
	else
		user.stats.changeStat(stat, stat_increase)
		user.sanity.onPsyDamage(apply_sanity_damage)

	to_chat(user, SPAN_DANGER("[src] plunges into your eye, imprinting your mind with new information!"))
	playsound(usr, 'sound/effects/refill.ogg', 50, -5)
	user.emote("painscream")//Flavor

	spent = TRUE
	price_tag = 30

/obj/item/device/mental_imprinter/attack(mob/M, mob/living/carbon/human/user, target_zone)//These are actually what affect if we can use it or not at all
	if(!istype(user) || M != user || target_zone != BP_EYES || user.incapacitated() || spent || user.species.reagent_tag == IS_SYNTHETIC)
		to_chat(user, SPAN_WARNING("[src] beeps, being unable to operate on you under current conditions!"))
		playsound(usr, 'sound/machines/buzz-two.ogg', 20, -5)
		return ..()
	if(length(user.get_covering_equipped_items(EYES)))
		to_chat(user, SPAN_WARNING("You need to remove the eye covering first."))
		playsound(usr, 'sound/machines/buzz-two.ogg', 20, -5)//Buzz go brr, just flavor
		return ..()

	INVOKE_ASYNC(src, PROC_REF(imprint), user)

/obj/item/device/mental_imprinter/examine(mob/user)
	. = ..()
	if(spent)
		to_chat(user, SPAN_WARNING("It is spent."))//What message should show when we are examining it

/obj/item/device/mental_imprinter/agent //this is JUST for getting agents brought up to high stat levels without the need to VV edit.
	name = "advanced mental imprinter"
	desc = "A potent and rare device from the heart of the Solarian Federation. Similar to its more primitive cousin, this device can push the users attributes for far longer periods of time than standard combat stimms, albeit at the cost of extended recovery."
	icon_state = "mental_imprinter"
	stat_increase = 25 //How many stats we gain
	apply_sanity_damage = 0
	price_tag = 2500

/obj/item/device/mental_imprinter/agent/strong
	name = "ultratech mental imprinter"
	desc = "An incredibly potent and rare device from the heart of the Solarian Federation. Similar to its more primitive cousin, this device can push the users attributes to the peak of human condition for hours at a time - though carrying an often days long recovery."
	stat_increase = 50 //How many stats we gain
	price_tag = 5000
