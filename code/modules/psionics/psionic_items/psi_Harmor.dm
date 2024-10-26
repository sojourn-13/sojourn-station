//////////////////////////////
//			Psionic Heavy Armor
//////////////////////////////
// Psionic armor, seperate from weptools.dm because it uses a different type of vanishing code than temporary hand held items. -Kaz

/obj/item/clothing/suit/space/occulHtist //In line with the syndicate spacesuit except not able to be taken off. Maybe give it some other bonuses too?
	name = "psion heavy armor"
	icon_state = "armor"
	item_state = "armor"
	icon = 'icons/obj/psionic/occHicon.dmi'
	icon_override = 'icons/obj/psionic/occHmob.dmi'
	desc = "It is a black armor made of pure obsidian, wrapped with bronze branches of the tree of reason. Its contour is distorted and blurred in space, the universe itself is against the existence of this object. The incredible protective abilities of this heavy shell will allow the owner to take a break from using his mind, exposing the body to meet dangers. \
	This is a very good defense, but maintaining it requires constant concentration."
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_OCLOTHING
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|COVER_PREVENT_MANIPULATION
	matter = list()
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS //It has gloves, hood, and shoes for the rest of them
	slowdown = 2 //slightly faster then a juggernaut. But theres no point in upgrading it!
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 15,
		bomb = 100,
		bio = 100,
		rad = 90
	) //These are the same stats as the juggernaut suit. But no point in upgrading it like the juggernaut functionally giving it 40 less protection
	siemens_coefficient = 0.4
	can_breach = FALSE //This can't be taken off so we don't want it breaching.
	supporting_limbs = list()
	flags_inv = HIDEJUMPSUIT|HIDETAIL //Removed hide shoes and gloves because we want this so that you can see the shoes and stuff while keeping the spacesuit tags. Yes this is terrible, no there isn't a better way.
	//var/list/supporting_limbs = list(
	var/mob/living/carbon/human/occultHist //This is so we know who is wearing it.
	var/pointgranted = 0 //Did we give you your cog?
	var/pointremoved = 0 //Did we take you your cog?

/obj/item/clothing/suit/space/occulHtist/dropped()
	..()
	if(!pointremoved)
		occultHist.stats.changeStat(STAT_TGH, -5)
		pointremoved = TRUE
	spawn(2)
	qdel(src)

/obj/item/clothing/suit/space/occulHtist/equipped(var/mob/M)
	.=..()
	occultHist = M
	if(!pointgranted)
		occultHist.stats.changeStat(STAT_TGH, 5)
		pointgranted = 1

/obj/item/clothing/head/helmet/space/occultHhood
	name = "psion omni-visor"
	icon_state = "helmet"
	item_state = "helmet"
	icon = 'icons/obj/psionic/occHicon.dmi'
	icon_override = 'icons/obj/psionic/occHmob.dmi'
	desc = "This is a massive helmet with a large and durable visor, looking through which you see the world through the veil of nothingness itself. You are detached from reality and it cannot harm you. You control reality, it doesn't control you. \
	This is a very good defense, but maintaining it requires constant concentration. It's massive visor serves as a more powerful Witchlight."
	slot_flags = SLOT_HEAD
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|COVER_PREVENT_MANIPULATION|BLOCK_GAS_SMOKE_EFFECT
	matter = list()
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 15,
		bomb = 60,
		bio = 100,
		rad = 90
	)
	siemens_coefficient = 0.4
	light_color = "#5B0E4F"
	brightness_on = 10
	on = 0
	light_applied = 0
	var/mob/living/carbon/human/occultist
	var/pointgranted = 0 //Did we give you your cog?
	var/pointremoved = 0 //Did we take you your cog?

	action_button_name = "Toggle Witchlight" //reflavor this so I can make it purple to go in line with the guns - Sigma
	light_overlay = "helmet_heavy_occult" //Sadly this has to go in icons/obj/light_overlays because I can't figure out how to point it to a different one.
										  //Currently it's located in the icons/obj/light_overlays folder, proc is at /obj/item/clothing/head/on_update_icon(mob/user) -Sigma

/obj/item/clothing/head/helmet/space/occultHhood/dropped()
	..()
	if(!pointremoved)
		occultist.stats.changeStat(STAT_TGH, -5)
		pointremoved = TRUE
	spawn(2)
	qdel(src)

/obj/item/clothing/head/helmet/space/occultHhood/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_TGH, 5)
		pointgranted = 1

/obj/item/clothing/gloves/occultHgloves //We want them to not be snippable. Maybe make it some kind of rigsuit?
	name = "psion heavy gloves"
	desc = "Bronze solid plates covering the arms up to the shoulders. This protection seems much stronger than it might seem... Even the strongest blow will not leave a dent on the soft metal fed by the inflamed mind of the psion... \
	This is a very good defense, but maintaining it requires constant concentration."
	icon = 'icons/obj/psionic//occHicon.dmi'
	item_state = "gloves"
	icon_state = "gloves"
	icon_override = 'icons/obj/psionic/occHmob.dmi'
	slot_flags = SLOT_GLOVES
	siemens_coefficient = 0 //Insulated!
	matter = list()
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 15,
		bomb = 100,
		bio = 100,
		rad = 90
	)
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT //make these like spacesuit so it can be a real spacesuit
	var/mob/living/carbon/human/occultist
	var/pointgranted = 0 //Did we give you your cog?
	var/pointremoved = 0 //Did we take you your cog?

/obj/item/clothing/gloves/occultHgloves/dropped()
	..()
	if(!pointremoved)
		occultist.stats.changeStat(STAT_TGH, -5)
		pointremoved = TRUE
	spawn(2)
	qdel(src)

/obj/item/clothing/gloves/occultHgloves/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_TGH, 5)
		pointgranted = 1

/obj/item/clothing/gloves/occultHgloves/attackby(obj/item/W, mob/user) //Overwrite the gloves clip proc because we don't want these clipped off at all.
	if(istype(W, /obj/item/tool/wirecutters) || istype(W, /obj/item/tool/scalpel)) //Same check as normal gloves.
		to_chat(user, SPAN_NOTICE("Your tool bends away from the [src] impossibly.")) //These are made of something that shouldn't exist, no snip for you. Using [src] for later modularness.

/obj/item/clothing/shoes/occultHgreaves
	name = "psion heavy greaves"
	desc = "These are high boots made of obsidian, upholstered in bronze. Their durability is second to none. Without fear and pain, you can step on any danger, be it grenades or mines. These worldly dangers cannot harm your great essence. \
	This is a very good defense, but maintaining it requires constant concentration."
	icon = 'icons/obj/psionic/occHicon.dmi'
	item_state = "shoes"
	icon_state = "shoes"
	icon_override = 'icons/obj/psionic/occHmob.dmi'
	item_flags = THICKMATERIAL
	slot_flags = SLOT_FEET
	matter = list()
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 15,
		bomb = 100,
		bio = 100,
		rad = 90
	)
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|NOSLIP //make these like spacesuit so it can be a real spacesuit
	siemens_coefficient = 0 //Insulated!
	var/mob/living/carbon/human/occultist
	var/pointgranted = 0 //Did we give you your cog?
	var/pointremoved = 0 //Did we take you your cog?

/obj/item/clothing/shoes/occultHgreaves/dropped()
	..()
	if(!pointremoved)
		occultist.stats.changeStat(STAT_TGH, -5)
		pointremoved = TRUE
	spawn(2)
	qdel(src)

/obj/item/clothing/shoes/occultHgreaves/equipped(var/mob/M)
	.=..()
	occultist = M
	if(!pointgranted)
		occultist.stats.changeStat(STAT_TGH, 5)
		pointgranted = 1
