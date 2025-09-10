//////////////////////////////
//			Psionic Armor
//////////////////////////////
// Psionic armor, seperate from weptools.dm because it uses a different type of vanishing code than temporary hand held items. -Kaz

/obj/item/clothing/suit/space/occultist //In line with the syndicate spacesuit except not able to be taken off. Maybe give it some other bonuses too?
	name = "psion robes"
	icon_state = "armor"
	item_state = "armor"
	icon = 'icons/obj/psionic/occicon.dmi'
	icon_override = 'icons/obj/psionic/occmob.dmi'
	desc = "A black fabric robe inset with hardened bronze plates, shaped from the mind of a psion. Wearing the complete set is said to enhance the cognitive powers of a psion. \
	It is durable, capable of surviving space and protecting one from many of the things that would do one harm. \
	Is it durable because the mind is the last thing to die? Why must it appear so, if it is but a reflection of our thoughts?"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_OCLOTHING
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL
	matter = list()
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS //It has gloves, hood, and shoes for the rest of them
	slowdown = 0.3 //Slightly faster than the red suit. Maybe do it at 0.2?
	armor_list = list(
		melee =8,
		bullet = 8,
		energy = 8,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.4
	can_breach = FALSE //This can't be taken off so we don't want it breaching.
	supporting_limbs = list()
	flags_inv = HIDEJUMPSUIT|HIDETAIL //Removed hide shoes and gloves because we want this so that you can see the shoes and stuff while keeping the spacesuit tags. Yes this is terrible, no there isn't a better way.
	//var/list/supporting_limbs = list(
	var/mob/living/carbon/human/occultist //This is so we know who is wearing it.
	var/pointgranted = 0 //Did we give you your cog?
	var/pointremoved = 0 //Did we take you your cog?

/obj/item/clothing/suit/space/occultist/dropped()
	..()
	if(!pointremoved)
		occultist.stats.changeStat(STAT_COG, -5)
		pointremoved = TRUE
	spawn(2)
	qdel(src)

/obj/item/clothing/suit/space/occultist/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_COG, 5)
		pointgranted = 1

/obj/item/clothing/head/helmet/space/occulthood
	name = "psion hood"
	icon_state = "hood"
	item_state = "hood"
	icon = 'icons/obj/psionic/occicon.dmi'
	icon_override = 'icons/obj/psionic/occmob.dmi'
	desc = "A black fabric hood inset with hardened bronze plates, shaped from the mind of a psion. It is durable, capable of surviving space and protecting one from many of the things that would do one harm. \
	Strange, it seems to have far more room on the inside than one would think."
	slot_flags = SLOT_HEAD
	matter = list()
	armor_list = list(
		melee =8,
		bullet = 8,
		energy = 8,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.4
	light_color = "#5B0E4F"
	brightness_on = 8
	on = 0
	light_applied = 0
	var/mob/living/carbon/human/occultist
	var/pointgranted = 0 //Did we give you your cog?
	var/pointremoved = 0 //Did we take you your cog?

	action_button_name = "Toggle Witchlight" //reflavor this so I can make it purple to go in line with the guns - Sigma
	light_overlay = "helmet_occult" //Sadly this has to go in icons/obj/light_overlays because I can't figure out how to point it to a different one.
										  //Currently it's located in the icons/obj/light_overlays folder, proc is at /obj/item/clothing/head/on_update_icon(mob/user) -Sigma

/obj/item/clothing/head/helmet/space/occulthood/dropped()
	..()
	if(!pointremoved)
		occultist.stats.changeStat(STAT_COG, -5)
		pointremoved = TRUE
	spawn(2)
	qdel(src)

/obj/item/clothing/head/helmet/space/occulthood/attack_self(mob/user) //Reflavoring because this is light from a place that does not know it.
	if(brightness_on)
		if(!isturf(user.loc))
			to_chat(user, "Your cannot hear your thoughts while in this [user.loc]")
			return
		on = !on
		to_chat(user, "With a single thought and urging of your psychic power, you [on ? "enkindle" : "extinguish"] the hood's unnatural light.")
		update_occult_flashlight(user)
	else
		return ..(user)

/obj/item/clothing/head/helmet/space/occulthood/proc/update_occult_flashlight(mob/user = null)
	if(on && !light_applied)
		set_light(brightness_on, l_color = "#5B0E4F")
		light_applied = 1
	else if(!on && light_applied)
		set_light(0)
		light_applied = 0
	update_icon(user)
	user.update_action_buttons()

/obj/item/clothing/head/helmet/space/occulthood/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_COG, 5)
		pointgranted = 1

/obj/item/clothing/gloves/occultgloves //We want them to not be snippable. Maybe make it some kind of rigsuit?
	name = "psion gloves"
	desc = "A black fabric pair of gloves inset with hardened bronze plates, shaped from the mind of a psion. It is durable, capable of surviving space and protecting one from many of the things that \
	would do one harm. It does one well to protect their hands."
	icon = 'icons/obj/psionic//occicon.dmi'
	item_state = "gloves"
	icon_state = "gloves"
	icon_override = 'icons/obj/psionic/occmob.dmi'
	slot_flags = SLOT_GLOVES
	siemens_coefficient = 0 //Insulated!
	matter = list()
	armor_list = list(
		melee =8,
		bullet = 8,
		energy = 8,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT //make these like spacesuit so it can be a real spacesuit
	var/mob/living/carbon/human/occultist
	var/pointgranted = 0 //Did we give you your cog?
	var/pointremoved = 0 //Did we take you your cog?

/obj/item/clothing/gloves/occultgloves/dropped()
	..()
	if(!pointremoved)
		occultist.stats.changeStat(STAT_COG, -5)
		pointremoved = TRUE
	spawn(2)
	qdel(src)

/obj/item/clothing/gloves/occultgloves/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_COG, 5)
		pointgranted = 1

/obj/item/clothing/gloves/occultgloves/attackby(obj/item/W, mob/user) //Overwrite the gloves clip proc because we don't want these clipped off at all.
	if(istype(W, /obj/item/tool/wirecutters) || istype(W, /obj/item/tool/scalpel)) //Same check as normal gloves.
		to_chat(user, SPAN_NOTICE("Your tool bends away from the [src] impossibly.")) //These are made of something that shouldn't exist, no snip for you. Using [src] for later modularness.

/obj/item/clothing/shoes/occultgreaves
	name = "psion greaves"
	desc = "A black fabric set of greaves inset with hardened bronze plates, shaped from the mind of a psion. It is durable, capable of surviving space and protecting one from many of the things that would do one harm. \
	Is it durable because the mind is the last thing to die? Why must it appear so, if it is but a reflection of our thoughts?"
	icon = 'icons/obj/psionic/occicon.dmi'
	item_state = "shoes"
	icon_state = "shoes"
	icon_override = 'icons/obj/psionic/occmob.dmi'
	slot_flags = SLOT_FEET
	matter = list()
	armor_list = list(
		melee = 8,
		bullet = 8,
		energy = 8,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|NOSLIP //make these like spacesuit so it can be a real spacesuit
	siemens_coefficient = 0 //Insulated!
	var/mob/living/carbon/human/occultist
	var/pointgranted = 0 //Did we give you your cog?
	var/pointremoved = 0 //Did we take you your cog?

/obj/item/clothing/shoes/occultgreaves/dropped()
	..()
	if(!pointremoved)
		occultist.stats.changeStat(STAT_COG, -5)
		pointremoved = TRUE
	spawn(2)
	qdel(src)

/obj/item/clothing/shoes/occultgreaves/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_COG, 5)
		pointgranted = 1

//Deepmaints debuffing ones
/obj/item/clothing/mask/deepmaints_debuff
	name = "startled psionic mask"
	desc = "A psionic mask stitched into the victum mind. This one has a shocked expression."
	icon_state = "tiki_eyebrow"
	item_state = "tiki_eyebrow"

	var/mob/living/carbon/human/victim
	var/pointgranted = 0 //Did we give you your stat?
	var/pointremoved = 0 //Did we take you your stat?
	var/pointamounts = 10
	var/damage_to_sanity = 5
	var/stat_to_change = STAT_VIG
	color = "#5B0E4F" //spooooky!!!!!
	matter = list()

//Small intraction you can do!
//Get the mask, level up to stat cap, take it off, proofit!

/obj/item/clothing/mask/deepmaints_debuff/dropped()
	..()
	if(!pointremoved)
		victim.stats.changeStat_withcap(stat_to_change, pointamounts)
		pointremoved = TRUE
	victim.sanity.onPsyDamage(damage_to_sanity)
	spawn(2)
	qdel(src)

/obj/item/clothing/mask/deepmaints_debuff/equipped(var/mob/M)
	.=..()
	victim = M
	if(!pointgranted)
		victim.stats.changeStat_withcap(stat_to_change, -pointamounts)
		pointgranted = 1

/obj/item/clothing/mask/deepmaints_debuff/angry
	name = "angry psionic mask"
	desc = "A psionic mask stitched into the victim mind. This one looks furious about something."
	icon_state = "tiki_angry"
	item_state = "tiki_angry"
	stat_to_change = STAT_BIO //WHY CANT I INJECT MY NEEEEDLEEEEEEE!!!!!!!!

/obj/item/clothing/mask/deepmaints_debuff/confused
	name = "confused psionic mask"
	desc = "A psionic mask stitched into the victim mind. This one doesn't seem very sure of itself."
	icon_state = "tiki_confused"
	item_state = "tiki_confused"
	stat_to_change = STAT_COG
	pointamounts = 15

/obj/item/clothing/mask/deepmaints_debuff/happy
	name = "happy psionic mask"
	desc = "A psionic mask stitched into the victim mind. This one is smiling with joy."
	icon_state = "tiki_happy"
	item_state = "tiki_happy"
	stat_to_change = STAT_VIV
	damage_to_sanity = -5 //Should *heal* sanity not damage
	pointamounts = 30 //Hope you didnt have combat chems

//Deepmaints buffing ones
/obj/item/clothing/mask/deepmaints_buff
	name = "psionic breath mask"
	desc = "A psionic mask stitched onto the user's mouth. This one lets makes your breath steady helping with aim."
	icon_state = "breath_psion"
	item_state = "breath_psion"

	var/mob/living/carbon/human/masked_person
	var/pointgranted = 0 //Did we give you your stat?
	var/pointremoved = 0 //Did we take you your stat?
	var/pointamounts = 5
	var/heal_to_sanity = 15
	var/stat_to_change = STAT_VIG
	color = "#5B0E4F" //spooooky!!!!!
	matter = list()

/obj/item/clothing/mask/deepmaints_buff/bio
	desc = "A psionic mask stitched onto the user's mouth. This one is rather clinical and smells of a medical bay."
	stat_to_change = STAT_BIO

/obj/item/clothing/mask/deepmaints_buff/cog
	desc = "A psionic mask stitched onto the user's mouth. The gas mix for this mask allows you to think better."
	stat_to_change = STAT_COG
	pointamounts = 10

/obj/item/clothing/mask/deepmaints_buff/viv
	desc = "A psionic mask stitched onto the user's mouth. The gas mix is rather relaxing allowing your body to handle more chemicals.."
	stat_to_change = STAT_VIV
	pointamounts = 20
	heal_to_sanity = 30

/obj/item/clothing/mask/deepmaints_buff/dropped()
	..()
	if(!pointremoved)
		masked_person.stats.changeStat_withcap(stat_to_change, -pointamounts)
		pointremoved = TRUE
	masked_person.sanity.onPsyDamage(-heal_to_sanity)
	spawn(2)
	qdel(src)


/obj/item/clothing/mask/deepmaints_buff/equipped(var/mob/M)
	.=..()
	masked_person = M
	if(!pointgranted)
		masked_person.stats.changeStat_withcap(stat_to_change, pointamounts)
		pointgranted = 1

//The anti-psion hat
/obj/item/clothing/head/psionic/tinfoil
	name = "Blue-Ink Psionic Shielding Apparatus"
	icon_state = "tinfoil"
	desc = "The product of an eccentric scientist who was fed up with telepathic cat-calls. This device shields the wearer from recieving \
	telepathic messages, but also prevents psions from using their abilities altogether when worn. The perfect Psionic Containment device. \
	Despite the advanced technology involved, it looks a little like a tin-foil hat."
	origin_tech = list(TECH_MAGNET = 6)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_SILVER = 0.5)
	psi_blocking = 10
	price_tag = 150

/obj/item/clothing/under/psionic_cloths
	name = "S8.9-Type Outfit" // S for silk
	icon_state = "psi_uniform"
	item_state = "psi_uniform"
	icon = 'icons/obj/psionic/occicon.dmi'
	icon_override = 'icons/obj/psionic/occmob.dmi'

	desc = "A set of experimental cloths made of rare materials and silk, allowing psionic users to more effectively channel psionic essence."
	matter = list(MATERIAL_SILK = 5)
	var/cognitive_potential = 0.1 //cube sink

/obj/item/clothing/under/psionic_cloths/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/device/psionic_catalyst))
		var/obj/item/device/psionic_catalyst/PC = I
		if(!PC.stored_power)
			to_chat(user, "[PC] has no stored power!")
			return
		if(cognitive_potential >= 1)
			to_chat(user, "The [src] are already as tuned as can be.")
			return
		to_chat(user, "The power stored in [PC] leaks out into the cold void as the [src] is tuned.")
		PC.stored_power = null //Nom!
		PC.resonances = "Null"
		PC.icon_state = "psi_catalyst_dull"
		cognitive_potential += 0.1
		//Idk how to word this without it being videogamey
		to_chat(user, "The [src] shimmers and adjusts for a moment to better allow psionic channeling.")
	..()

/obj/item/clothing/under/psionic_cloths/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Basic Cloth"] = "psi_uniform"
	options["Basic Cloth rolled sleeves"] = "psi_uniform_rs"
	options["Psionic Toga"] = "psi_toga"
	options["Psionic White Toga"] = "psi_toga_white"
	options["Psionic Vest"] = "psi_vest"
	options["Psionic Dress"] = "psi_dress"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You rethink your cloth's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/gloves/psionic_ring
	name = "Ring of Dispelling"
	desc = "A sacred ring of metal, said to have been used in the production of the original cruciform prototypes. The Cartographer has blessed it, giving it powerful anti-psionic properties, and bestowed it to the upper church for use in psionic crises. It is irreplacable."
	icon_state = "ring_of_dispel"
	price_tag = 1000
	psi_blocking = 50

/obj/item/clothing/ears/psionic_ear_rings
	name = "Earrings P-3.1" // P for plasma
	desc = "A set of experimental earrings designed to aid people that are less able to build up psionic power."
	icon_state = "psionic_earring"
	icon = 'icons/inventory/ears/icon.dmi'
	slot_flags = SLOT_EARS
	//returns are spars,
	matter = list(MATERIAL_GLASS = 1, MATERIAL_PLASMA = 1, MATERIAL_DIAMOND = 1)
	var/storage_addition = 1

/obj/item/clothing/ears/psionic_ear_rings/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/device/psionic_catalyst))
		var/obj/item/device/psionic_catalyst/PC = I
		if(!PC.stored_power)
			to_chat(user, "[PC] has no stored power!")
			return
		if(storage_addition >= 2)
			to_chat(user, "These earrings are already as tuned as can be.")
			return
		to_chat(user, "The power stored in [PC] leaks out into the cold void as the [src] is tuned.")
		PC.stored_power = null //Nom!
		PC.resonances = "Null"
		PC.icon_state = "psi_catalyst_dull"
		storage_addition += 1
		to_chat(user, "The [src] seem to help build up psionic power even better now.")
	..()

/obj/item/clothing/glasses/psionic_lens
	name = "Glasses P-22.1 LR" //LR for low risk, P for plasma
	desc = "A set of stablized experimental light pink glasses made of somewhat rare materials, designed to assist Psions in collecting essence slightly faster."
	icon_state = "psionic_lens"
	item_state = "psionic_lens"
	prescription = 1
	var/psionic_seconds = 5
	matter = list(MATERIAL_GLASS = 1, MATERIAL_PLASMA = 1)

/obj/item/clothing/glasses/psionic_lens/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/device/psionic_catalyst))
		var/obj/item/device/psionic_catalyst/PC = I
		if(!PC.stored_power)
			to_chat(user, "[PC] has no stored power!")
			return
		if(psionic_seconds >= 15)
			to_chat(user, "The lens is already as tuned as can be.")
			return
		to_chat(user, "The power stored in [PC] leaks out into the cold void as the [src] is tuned.")
		PC.stored_power = null //Nom!
		PC.resonances = "Null"
		PC.icon_state = "psi_catalyst_dull"
		psionic_seconds += 5 //Two lens
		to_chat(user, "The [src] seem to help collect essence slightly faster now.")

	..()