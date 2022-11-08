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
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 30,
		bio = 100,
		rad = 50
	) //These are the same stats as the blood red hardsuit.
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
		melee = 35,
		bullet = 35,
		energy = 35,
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
	light_overlay = "helmet_light_occult" //Sadly this has to go in icons/obj/light_overlays because I can't figure out how to point it to a different one.
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
	siemens_coefficient = 1 //Insulated!
	matter = list()
	armor_list = list(
		melee = 35,
		bullet = 35,
		energy = 35,
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
		melee = 35,
		bullet = 35,
		energy = 35,
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
