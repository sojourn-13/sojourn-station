//////////////////////////////
//			Psionic Light Armor 15% speed up
//////////////////////////////
//

/obj/item/clothing/suit/space/occulLtist
	name = "psion void cloak"
	icon_state = "armor"
	item_state = "armor"
	icon = 'icons/obj/psionic/occLicon.dmi'
	icon_override = 'icons/obj/psionic/occLmob.dmi'
	desc = "This cloak is made of thin and airy fabric. Putting it on, you feel an unusual, strange lightness, as if its weight lightens your burden. It seems to you that just by touching this material, you become faster."
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_OCLOTHING
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|COVER_PREVENT_MANIPULATION
	matter = list()
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS //It has gloves, hood, and shoes for the rest of them
	slowdown = -0.09 //with all three pieces figures out to 1.36 speed bonus, which is fairly high but also this shit is rare.
	armor_list = list(
		melee =7,
		bullet = 6,
		energy = 7,
		bomb = 25,
		bio = 100,
		rad = 30
	)
	siemens_coefficient = 0.4
	can_breach = FALSE //This can't be taken off so we don't want it breaching.
	supporting_limbs = list()
	flags_inv = HIDEJUMPSUIT|HIDETAIL //Removed hide shoes and gloves because we want this so that you can see the shoes and stuff while keeping the spacesuit tags. Yes this is terrible, no there isn't a better way.
	//var/list/supporting_limbs = list(
	var/mob/living/carbon/human/occultHist //This is so we know who is wearing it.
	var/pointgranted = 0 //Did we give you your cog?
	var/pointremoved = 0 //Did we take you your cog?

/obj/item/clothing/suit/space/occulLtist/dropped()
	..()
	if(!pointremoved)
		occultHist.stats.changeStat(STAT_COG, -5)
		pointremoved = TRUE
	spawn(2)
	qdel(src)

/obj/item/clothing/suit/space/occulLtist/equipped(var/mob/M)
	.=..()
	occultHist = M
	if(!pointgranted)
		occultHist.stats.changeStat(STAT_COG, 5)
		pointgranted = 1

/obj/item/clothing/head/helmet/space/occultLhood
	name = "psion void hood"
	icon_state = "helmet"
	item_state = "helmet"
	icon = 'icons/obj/psionic/occLicon.dmi'
	icon_override = 'icons/obj/psionic/occLmob.dmi'
	desc = "This is a hard hood made of dark fabric material. It is decorated with bronze slabs and has a strange ribbed texture. The crystal on its front part pulsates unusually as soon as the object is on the psion's head. A haze of hidden knowledge covers your face from unnecessary glances."
	slot_flags = SLOT_HEAD
	matter = list()
	slowdown = -0.09
	armor_list = list(
		melee =7,
		bullet = 6,
		energy = 7,
		bomb = 25,
		bio = 100,
		rad = 30
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

/obj/item/clothing/head/helmet/space/occultLhood/dropped()
	..()
	if(!pointremoved)
		occultist.stats.changeStat(STAT_COG, -5)
		pointremoved = TRUE
	spawn(2)
	qdel(src)


/obj/item/clothing/head/helmet/space/occultLhood/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_COG, 5)
		pointgranted = 1

/obj/item/clothing/gloves/occultLgloves //We want them to not be snippable. Maybe make it some kind of rigsuit?
	name = "psion void gloves"
	desc = "These are thin long gloves protected by bronze plates. Ancient formulas are engraved on the fingertips, helping to weave streams of thoughts into a single powerful desire"
	icon = 'icons/obj/psionic/occLicon.dmi'
	item_state = "gloves"
	icon_state = "gloves"
	icon_override = 'icons/obj/psionic/occLmob.dmi'
	slowdown = -0.09
	slot_flags = SLOT_GLOVES
	siemens_coefficient = 0 //Insulated!
	matter = list()
	armor_list = list(
		melee =7,
		bullet = 6,
		energy = 7,
		bomb = 25,
		bio = 100,
		rad = 30
	)
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT //make these like spacesuit so it can be a real spacesuit
	var/mob/living/carbon/human/occultist
	var/pointgranted = 0 //Did we give you your cog?
	var/pointremoved = 0 //Did we take you your cog?

/obj/item/clothing/gloves/occultLgloves/dropped()
	..()
	if(!pointremoved)
		occultist.stats.changeStat(STAT_COG, -5)
		pointremoved = TRUE
	spawn(2)
	qdel(src)

/obj/item/clothing/gloves/occultLgloves/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_COG, 5)
		pointgranted = 1

/obj/item/clothing/gloves/occultLgloves/attackby(obj/item/W, mob/user) //Overwrite the gloves clip proc because we don't want these clipped off at all.
	if(istype(W, /obj/item/tool/wirecutters) || istype(W, /obj/item/tool/scalpel)) //Same check as normal gloves.
		to_chat(user, SPAN_NOTICE("Your tool bends away from the [src] impossibly.")) //These are made of something that shouldn't exist, no snip for you. Using [src] for later modularness.

/obj/item/clothing/shoes/occultLgreaves
	name = "psion void greaves"
	desc = "These are unusual shoes made of bronze and black material, despite their massiveness, they do not weigh anything. Every step in them leaves behind a symbol from the lost formula of the King, irreversibly fading and dissolving into nothingness, without lingering in your great mind."
	icon = 'icons/obj/psionic/occLicon.dmi'
	item_state = "shoes"
	icon_state = "shoes"
	icon_override = 'icons/obj/psionic/occLmob.dmi'
	slot_flags = SLOT_FEET
	matter = list()
	slowdown = -1.09 //1.36% speed up with all parts! No! Wrong! Humans are +1 slowdown by default so that you are slower without shoes, this is why shoes have -1 slowdown. Needs to have -1 slowdown as BASE
	can_hold_knife = 1
	armor_list = list(
		melee = 6,
		bullet = 3,
		energy = 5,
		bomb = 15,
		bio = 100,
		rad = 30
	)
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|NOSLIP //make these like spacesuit so it can be a real spacesuit
	siemens_coefficient = 0 //Insulated!
	var/mob/living/carbon/human/occultist
	var/pointgranted = 0 //Did we give you your cog?
	var/pointremoved = 0 //Did we take you your cog?

/obj/item/clothing/shoes/occultLgreaves/dropped()
	..()
	if(!pointremoved)
		occultist.stats.changeStat(STAT_COG, 5)
		pointremoved = FALSE
	spawn(2)
	qdel(src)

/obj/item/clothing/shoes/occultLgreaves/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_COG, 5)
		pointgranted = 0
