/*Ties*/

/obj/item/clothing/accessory
	name = "blue tie"
	desc = "A neosilk clip-on tie with a blue design."
	icon = 'icons/inventory/accessory/icon.dmi'
	icon_state = "bluetie"
	item_state = ""	//no inhands
	slot_flags = SLOT_ACCESSORY_BUFFER
	w_class = ITEM_SIZE_SMALL
	var/slot = "decor"
	var/obj/item/clothing/has_suit = null		//the suit the tie may be attached to
	var/image/inv_overlay = null	//overlay used when attached to clothing.
	var/image/mob_overlay = null
	var/overlay_state = null

/obj/item/clothing/accessory/Destroy()
	if(has_suit)
		on_removed()
	return ..()

/obj/item/clothing/accessory/proc/get_inv_overlay()
	if(!inv_overlay)
		if(!mob_overlay)
			get_mob_overlay()

		var/tmp_icon_state = "[overlay_state? "[overlay_state]" : "[icon_state]"]"
		if(icon_override)
			if("[tmp_icon_state]_tie" in icon_states(icon_override))
				tmp_icon_state = "[tmp_icon_state]_tie"
		inv_overlay = image(icon = mob_overlay.icon, icon_state = tmp_icon_state, dir = SOUTH)
	return inv_overlay

/obj/item/clothing/accessory/proc/get_mob_overlay()
	if(!mob_overlay)
		var/tmp_icon_state = "[overlay_state? "[overlay_state]" : "[icon_state]"]"
		if(icon_override)
			if("[tmp_icon_state]_mob" in icon_states(icon_override))
				tmp_icon_state = "[tmp_icon_state]_mob"
			mob_overlay = image("icon" = icon_override, "icon_state" = "[tmp_icon_state]")
		else
			mob_overlay = image("icon" = INV_ACCESSORIES_DEF_ICON, "icon_state" = "[tmp_icon_state]")
	return mob_overlay

//when user attached an accessory to S
/obj/item/clothing/accessory/proc/on_attached(var/obj/item/clothing/S, var/mob/user)
	if(!istype(S))
		return
	has_suit = S
	loc = has_suit
	has_suit.add_overlay(get_inv_overlay())

	to_chat(user, SPAN_NOTICE("You attach \the [src] to \the [has_suit]."))
	src.add_fingerprint(user)

/obj/item/clothing/accessory/proc/on_removed(var/mob/user)
	if(!has_suit)
		return
	has_suit.cut_overlay(get_inv_overlay())
	has_suit = null
	if(user)
		usr.put_in_hands(src)
		src.add_fingerprint(user)
	else
		src.forceMove(get_turf(src))

//default attackby behaviour
/obj/item/clothing/accessory/attackby(obj/item/I, mob/user)
	..()

//default attack_hand behaviour
/obj/item/clothing/accessory/attack_hand(mob/user as mob)
	if(has_suit)
		return	//we aren't an object on the ground so don't call parent
	..()

/obj/item/clothing/accessory/tie/black
	name = "black tie"
	desc = "A neosilk clip-on tie with a black design."
	icon_state = "blacktie"

/obj/item/clothing/accessory/tie/blue
	name = "blue tie"
	desc = "A neosilk clip-on tie with a blue design."
	icon_state = "bluetie"

/obj/item/clothing/accessory/tie/blueclip
	name = "blue clip tie"
	desc = "A neosilk clip-on tie with a striped blue design and clip."
	icon_state = "bluecliptie"

/obj/item/clothing/accessory/tie/bluestriped
	name = "blue striped tie"
	desc = "A neosilk clip-on tie with a striped blue design."
	icon_state = "bluelongtie"

/obj/item/clothing/accessory/tie/darkgreen
	name = "dark green tie"
	desc = "A neosilk clip-on tie with a dark green design."
	icon_state = "dgreentie"

/obj/item/clothing/accessory/tie/navy
	name = "navy tie"
	desc = "A neosilk clip-on tie with a navy design."
	icon_state = "navytie"

/obj/item/clothing/accessory/tie/red
	name = "red tie"
	desc = "A neosilk clip-on tie with a red design."
	icon_state = "redtie"

/obj/item/clothing/accessory/tie/redclip
	name = "red clip tie"
	desc = "A neosilk clip-on tie with a striped red design and clip."
	icon_state = "redcliptie"

/obj/item/clothing/accessory/tie/redstriped
	name = "red striped tie"
	desc = "A neosilk clip-on tie with a striped red design."
	icon_state = "redlongtie"

/obj/item/clothing/accessory/tie/white
	name = "white tie"
	desc = "A neosilk clip-on tie with a white design."
	icon_state = "whitetie"

/obj/item/clothing/accessory/tie/yellow
	name = "yellow tie"
	desc = "A neosilk clip-on tie with a yellow design."
	icon_state = "yellowtie"

/obj/item/clothing/accessory/tie
	name = "yellow large tie"
	desc = "A neosilk clip-on tie with a gaudy yellow design."
	icon_state = "horribletie"

/*Stethoscope*/

/obj/item/clothing/accessory/stethoscope
	name = "stethoscope"
	desc = "An outdated medical apparatus for listening to the sounds of the human body. It also makes you look like you know what you're doing."
	icon_state = "stethoscope"

/obj/item/clothing/accessory/stethoscope/attack(mob/living/carbon/human/M, mob/living/user)
	// TODO: baymed, rework this to use something like get_heartbeat()
	if(ishuman(M) && isliving(user))
		if(user.a_intent == I_HELP)
			var/body_part = parse_zone(user.targeted_organ)
			if(body_part)
				var/their = "their"
				switch(M.gender)
					if(MALE)	their = "his"
					if(FEMALE)	their = "her"

				var/sound = "heartbeat"
				var/sound_strength = "cannot hear"
				var/heartbeat = 0
				if(M.species && M.species.has_process[OP_HEART])
					var/obj/item/organ/internal/heart/heart = M.random_organ_by_process(OP_HEART)
					if(heart && !BP_IS_ROBOTIC(heart))
						heartbeat = 1
				if(M.stat == DEAD || (M.status_flags&FAKEDEATH))
					sound_strength = "cannot hear"
					sound = "anything"
				else
					switch(body_part)
						if(BP_CHEST)
							sound_strength = "hear"
							sound = "no heartbeat"
							if(heartbeat)
								var/obj/item/organ/internal/heart/heart = M.random_organ_by_process(OP_HEART)
								if(!heart)
									return
								if(heart.is_bruised() || M.getOxyLoss() > 50)
									sound = "[pick("odd noises in","weak")] heartbeat"
								else
									sound = "healthy heartbeat"

							if(!(M.organ_list_by_process(OP_LUNGS).len) || M.losebreath)
								sound += " and no respiration"
							else if(M.is_lung_ruptured() || M.getOxyLoss() > 50)
								sound += " and [pick("wheezing","gurgling")] sounds"
							else
								sound += " and healthy respiration"
						if(BP_EYES, BP_MOUTH)
							sound_strength = "cannot hear"
							sound = "anything"
						else
							if(heartbeat)
								sound_strength = "hear a weak"
								sound = "pulse"

				user.visible_message("[user] places [src] against [M]'s [body_part] and listens attentively.", "You place [src] against [their] [body_part]. You [sound_strength] [sound].")
	return ..(M,user)

/*Medals*/

/obj/item/clothing/accessory/medal
	name = "bronze medal"
	desc = "A bronze medal."
	icon_state = "bronze"
	price_tag = 250

/obj/item/clothing/accessory/medal/conduct
	name = "distinguished conduct medal"
	desc = "A bronze medal awarded for distinguished conduct. Whilst a great honor, this is most basic award on offer. It is often awarded by the council to a member of their crew."

/obj/item/clothing/accessory/medal/bronze_heart
	name = "bronze heart medal"
	desc = "A bronze heart-shaped medal awarded for sacrifice. It is often awarded posthumously or for severe injury in the line of duty."
	icon_state = "bronze_heart"

/obj/item/clothing/accessory/medal/nobel_science
	name = "nobel sciences award"
	desc = "A bronze medal which represents significant contributions to the field of science or engineering."

/obj/item/clothing/accessory/medal/silver
	name = "silver medal"
	desc = "A silver medal."
	icon_state = "silver"
	price_tag = 250

/obj/item/clothing/accessory/medal/silver/valor
	name = "medal of valor"
	desc = "A silver medal awarded for acts of exceptional valor."

/obj/item/clothing/accessory/medal/silver/security
	name = "robust security award"
	desc = "An award for distinguished combat and sacrifice in defence of the colony. Often awarded to security staff."

/obj/item/clothing/accessory/medal/gold
	name = "gold medal"
	desc = "A prestigious golden medal."
	icon_state = "gold"
	price_tag = 500

/obj/item/clothing/accessory/medal/gold/captain
	name = "medal of exceptional statecraft"
	desc = "A golden medal awarded exclusively to those who show distinguished duty as a premier. It signifies the codified responsibilities of the position and their undisputable qualities within it."

/obj/item/clothing/accessory/medal/gold/heroism
	name = "medal of exceptional heroism"
	desc = "An extremely rare golden medal awarded only by faction woners. To recieve such a medal is the highest honor and as such, very few exist. This medal is almost never awarded to anybody but commanders."

/*Capes*/
/obj/item/clothing/accessory/ccape
	name = "holographic capitoleum cape"
	desc = "A electronic cloak with a holographic interface lining it's stiff wiring. This cape is the only one feared by Castellans, not because of any might or power, but because it signifies one status of being from the capitol, and thus, one's ability to back-stab and lie."
	icon_state = "capital_cape"
	slot_flags = SLOT_ACCESSORY_BUFFER

/obj/item/clothing/accessory/ccape/soldier
	name = "soldier-lord trench cape"
	desc = "A cloak for a warrior from the land of the midnight sun, those who call themselves 'Nobles of the Sword', the Reichsritter of the castellans, who don't lead as generals, but as soldiers, ready to fight shoulder-to-shoulder for Kaiser and Homeland. Most died in the Battle of Krios, Sol Federation troopers were trained to put down the giant, gene-modded castellan knights who lead the vorhut soldiery. The few 'Nobles of the Sword' that survived mostly do-so as disgraced nobles, mercenaries, and duelist, one day knowing their martial bloodlines will die."
	icon_state = "krieg_cape"

/obj/item/clothing/accessory/cape
	name = "fluffy cape"
	desc = "A cloak of old money, comfy, furred, and decadent to all hell, for those who believe your worth as a man is the worth that you bring."
	icon_state = "erp_cape"
	slot_flags = SLOT_ACCESSORY_BUFFER

/obj/item/clothing/accessory/ccape/rural
	name = "farmer barons olive cape"
	desc = "A cloak that define's one status as humble, as humble as a feudal land lord can try. This green, copper clad cloak is commonly worn by échevins-lord houses, those who own great swathes of colonial and rural territory. It's in actuality a self-defence mechanism, the knowledge that if they don't conceal their wealth, the vorhut countryvolk and jaeger frontiersmen they rule over will burn their estates and steal from their coffers."
	icon_state = "pelinal_cape"

/obj/item/clothing/accessory/ccape/bleublood
	name = "admirals dress cape"
	desc = "A cloak lined with gold, and dyed in a noble blue. A proper cape of admirality, for many houses rely on the navy to exist, producing master navigator-captains who lead the otherwise meager Kriosan fleet to greatness. Ad Astra Per Aspera."
	icon_state = "bleu_cape"

/obj/item/clothing/accessory/cape/outsider
	name = "outcast's cloak"
	desc = "A raggedy cloak made of leather and reclaimed materials, can be worn over one's armor as a sign of pride for their outcast nature."
	icon_state = "outsider"
	slot_flags = SLOT_ACCESSORY_BUFFER

/obj/item/clothing/accessory/cape/scav
	name = "makeshift cape"
	desc = "A cape haphazardly cut from a large bolt of water resistant fabric, while some may wear it for the style, others would prefer it's use as a quick poncho, if it'll every rain."
	icon_state = "scav_mantle"
	slot_flags = SLOT_ACCESSORY_BUFFER

/obj/item/clothing/accessory/cape/black
	name = "attachable black cloak"
	desc = "A simple black cloak you can attach to your suit for all your edgy needs."
	icon_state = "cloak"
	slot_flags = SLOT_ACCESSORY_BUFFER

/obj/item/clothing/accessory/cape/blackedge
	name = "heavy black cloak"
	desc = "A rough and heavy black cloak for draping over yourself like some kind of cave dwelling royal."
	icon_state = "blackcloak"
	slot_flags = SLOT_ACCESSORY_BUFFER

/obj/item/clothing/accessory/cape/brown
	name = "heavy brown cloak"
	desc = "A rough and heavy brown cloak, perfectly suited to marching through the cold to the front door of an old friend."
	icon_state = "browncloak"
	slot_flags = SLOT_ACCESSORY_BUFFER

/obj/item/clothing/accessory/cape/blackalt
	name = "black greatcloak"
	desc = "A comfortable black greatcoat, perfect for winter, or simply showing off ones archaic fashion sense."
	icon_state = "cloakalt"
	slot_flags = SLOT_ACCESSORY_BUFFER

/*Scarves*/

/obj/item/clothing/accessory/scarf/black
	name = "black scarf"
	desc = "A stylish black scarf."
	icon_state = "blackscarf"

/obj/item/clothing/accessory/scarf/christmas
	name = "christmas scarf"
	desc = "A stylish red and green scarf."
	icon_state = "christmasscarf"

/obj/item/clothing/accessory/scarf/darkblue
	name = "dark blue scarf"
	desc = "A stylish dark blue scarf."
	icon_state = "darkbluescarf"

obj/item/clothing/accessory/scarf/green
	name = "green scarf"
	desc = "A stylish green scarf."
	icon_state = "greenscarf"

/obj/item/clothing/accessory/scarf/lightblue
	name = "light blue scarf"
	desc = "A stylish light blue scarf."
	icon_state = "lightbluescarf"

/obj/item/clothing/accessory/scarf/orange
	name = "orange scarf"
	desc = "A stylish orange scarf."
	icon_state = "orangescarf"

/obj/item/clothing/accessory/scarf/purple
	name = "purple scarf"
	desc = "A stylish purple scarf."
	icon_state = "purplescarf"

/obj/item/clothing/accessory/scarf/red
	name = "red scarf"
	desc = "A stylish red scarf."
	icon_state = "redscarf"

/obj/item/clothing/accessory/scarf/white
	name = "white scarf"
	desc = "A stylish white scarf."
	icon_state = "whitescarf"

/obj/item/clothing/accessory/scarf/yellow
	name = "yellow scarf"
	desc = "A stylish yellow scarf."
	icon_state = "yellowscarf"

/obj/item/clothing/accessory/scarf/zebra
	name = "zebra scarf"
	desc = "A stylish black and white scarf."
	icon_state = "zebrascarf"

/obj/item/clothing/accessory/scarf/furblack
	name = "black fur scarf"
	desc = "A furred scarf in a black color."
	icon_state = "furscarf_black"
	item_state = "furscarf_black"

/obj/item/clothing/accessory/scarf/furblue
	name = "blue fur scarf"
	desc = "A furred scarf in a blue color."
	icon_state = "furscarf_blue"
	item_state = "furscarf_blue"

/obj/item/clothing/accessory/scarf/furbrown
	name = "brown fur scarf"
	desc = "A furred scarf in a brown color."
	icon_state = "furscarf_brown"
	item_state = "furscarf_brown"

/obj/item/clothing/accessory/scarf/furcinnamon
	name = "cinnamon fur scarf"
	desc = "A furred scarf in a cinnamon color."
	icon_state = "furscarf_cinnamon"
	item_state = "furscarf_cinnamon"

/obj/item/clothing/accessory/scarf/furcream
	name = "cream fur scarf"
	desc = "A furred scarf in a cream color."
	icon_state = "furscarf_cream"
	item_state = "furscarf_cream"

/obj/item/clothing/accessory/scarf/furlbrown
	name = "light brown fur scarf"
	desc = "A furred scarf in a light brown color."
	icon_state = "furscarf_lbrown"
	item_state = "furscarf_lbrown"

/obj/item/clothing/accessory/scarf/furorange
	name = "orange fur scarf"
	desc = "A furred scarf in a orange color."
	icon_state = "furscarf_lasaga"
	item_state = "furscarf_lasaga"

/obj/item/clothing/accessory/scarf/furruddy
	name = "ruddy fur scarf"
	desc = "A furred scarf in a ruddy color."
	icon_state = "furscarf_ruddy"
	item_state = "furscarf_ruddy"

/obj/item/clothing/accessory/scarf/fursilver
	name = "silver fur scarf"
	desc = "A furred scarf in a silver color."
	icon_state = "furscarf_silver"
	item_state = "furscarf_silver"

/obj/item/clothing/accessory/scarf/neckblue
	name = "blue neck scarf"
	desc = "A blue neck scarf."
	icon_state = "blue_scarf"
	item_state = "blue_scarf"
	body_parts_covered = FACE
	item_flags = FLEXIBLEMATERIAL
	w_class = ITEM_SIZE_SMALL
	gas_transfer_coefficient = 0.90
	price_tag = 50

/obj/item/clothing/accessory/scarf/checkered
	name = "checkered neck scarf"
	desc = "A red and white checkered neck scarf."
	icon_state = "redwhite_scarf"
	item_state = "redwhite_scarf"

/obj/item/clothing/accessory/scarf/neckgreen
	name = "green neck scarf"
	desc = "A green neck scarf."
	icon_state = "green_scarf"
	item_state = "green_scarf"

/obj/item/clothing/accessory/scarf/neckred
	name = "red neck scarf"
	desc = "A red neck scarf."
	icon_state = "red_scarf"
	item_state = "red_scarf"

/obj/item/clothing/accessory/scarf/stripedblue
	name = "striped blue scarf"
	desc = "A striped blue scarf."
	icon_state = "stripedbluescarf"
	item_state = "stripedbluescarf"

/obj/item/clothing/accessory/scarf/stripedgreen
	name = "striped green scarf"
	desc = "A striped green scarf."
	icon_state = "stripedgreenscarf"
	item_state = "stripedgreenscarf"

/obj/item/clothing/accessory/scarf/stripedpurple
	name = "striped green scarf"
	desc = "A striped purple scarf."
	icon_state = "stripedpurplescarf"
	item_state = "stripedpurplescarf"

/obj/item/clothing/accessory/scarf
	name = "striped red scarf"
	desc = "A striped red scarf."
	icon_state = "stripedredscarf"
	item_state = "stripedredscarf"

/obj/item/clothing/accessory/ninjascarf /*Omitted from scarf selection because it's more of a costume piece.*/
	name = "ninja scarf"
	desc = "A stealthy, ominous scarf."
	icon_state = "ninja_scarf"
	item_state = "ninja_scarf"
	siemens_coefficient = 0

/*One-Off Stuff*/
/obj/item/clothing/accessory/necklace
	name = "metal necklace"
	desc = "A shiny steel chain with a vague metallic object dangling off it."
	icon_state = "tronket"
	item_state = "tronket"

/obj/item/clothing/accessory/dropstraps
	name = "drop straps"
	desc = "White suspenders worn over the shoulders."
	icon_state = "flops"
	item_state = "flops"

/obj/item/clothing/accessory/dogtags
	name = "dog tags"
	desc = "A pair of engraved metal identification tags."
	icon_state = "tags"
	item_state = "tags"

/obj/item/clothing/accessory/fractalrosary
	name = "Fractal Rosary"
	desc = "This is an insignia given out by the Church of Absolute to people who consider themself to be a Fractal: \
			An individual who believes and follows the Church but has not yet or cannot be inducted to full membership."
	icon_state = "fractal_rosary"
	item_state = "fractal_rosary"

/obj/item/clothing/accessory/legbrace
	name = "leg brace"
	desc = "A lightweight polymer frame designed to hold legs upright comfortably."
	icon_state = "legbrace"
	item_state = "legbrace"

/obj/item/clothing/accessory/neckbrace
	name = "neck brace"
	desc = "A lightweight polymer frame designed to hold a neck upright comfortably."
	icon_state = "neckbrace"
	item_state = "neckbrace"

/*Ranks*/

/obj/item/clothing/accessory/ranks/blank
	name = "shoulderboards (blank)"
	desc = "Blank red shoulderboards denoting a Blackshield cadet, or, rarely, an emergency volunteer or an off-duty Blackshield Trooper given provisional duty in an emergency."
	icon_state = "blank_tabs"
	item_state = "blank_tabs"

/obj/item/clothing/accessory/ranks/trooper
	name = "shoulderboards (trooper)"
	desc = "Red and silver shoulderboards denoting a Blackshield soldier with the rank of Trooper."
	icon_state = "trooper_tabs"
	item_state = "trooper_tabs"

/obj/item/clothing/accessory/ranks/corpsman
	name = "shoulderboards (corpsman)"
	desc = "Red and silver shoulderboards denoting a Blackshield soldier with the rank of Corpsman."
	icon_state = "corps_tabs"
	item_state = "corps_tabs"

/obj/item/clothing/accessory/ranks/sergeant
	name = "shoulderboards (sergeant)"
	desc = "Red and silver shoulderboards denoting a Blackshield soldier with the rank of Sergeant."
	icon_state = "sergeant_tabs"
	item_state = "sergeant_tabs"

/obj/item/clothing/accessory/ranks/sergeantmajor
	name = "shoulderboards (sergeant major)"
	desc = "Red and silver shoulderboards denoting a Blackshield soldier with the rank of Sergeant Major."
	icon_state = "sergeantm_tabs"
	item_state = "sergeantm_tabs"

/obj/item/clothing/accessory/ranks/commander
	name = "shoulderboards (commander)"
	desc = "Red and gold shoulderboards denoting a Blackshield soldier with the rank of Commander."
	icon_state = "commander_tabs"
	item_state = "commander_tabs"

/obj/item/clothing/accessory/ranks/major
	name = "shoulderboards (major)"
	desc = "Red and gold shoulderboards denoting a Blackshield soldier with the rank of Major."
	icon_state = "major_tabs"
	item_state = "major_tabs"

/obj/item/clothing/accessory/ranks/brigadier
	name = "shoulderboards (brigadier)"
	desc = "Red, gold, and silver shoulderboards denoting the Brigadier."
	icon_state = "brigadier_tabs"
	item_state = "brigadier_tabs"

/obj/item/clothing/accessory/patches/blackshield
	name = "blackshield patch"
	desc = "A black, blue, and silver patch made to represent the Blackshield regiment. For use on uniforms when active, or other clothing in other positions."
	icon_state = "blackshieldpatch"
	item_state = "blackshieldpatch"

/obj/item/clothing/accessory/patches/blackshield_blank
	name = "blackshield blank patch"
	desc = "A black, blue, and silver patch made to represent the Blackshield regiment. For use on uniforms when active, or other clothing in other positions."
	icon_state = "bs_blank"
	item_state = "bs_blank"

/obj/item/clothing/accessory/patches/blackshield_volunteer
	name = "blackshield volunteer patch"
	desc = "A black, blue, and silver patch made to represent the Blackshield regiment. For use on uniforms when active, or other clothing in other positions."
	icon_state = "bs_volunteer"
	item_state = "bs_volunteer"

/obj/item/clothing/accessory/patches/blackshield_trooper
	name = "blackshield trooper patch"
	desc = "A black, blue, and silver patch made to represent the Blackshield regiment. For use on uniforms when active, or other clothing in other positions."
	icon_state = "bs_trooper"
	item_state = "bs_trooper"

/obj/item/clothing/accessory/patches/blackshield_corpsman
	name = "blackshield corpsman patch"
	desc = "A black, blue, and silver patch made to represent the Blackshield regiment. For use on uniforms when active, or other clothing in other positions."
	icon_state = "bs_corpsman"
	item_state = "bs_corpsman"

/obj/item/clothing/accessory/patches/blackshield_sergeant
	name = "blackshield sergeant patch"
	desc = "A black, blue, and silver patch made to represent the Blackshield regiment. For use on uniforms when active, or other clothing in other positions."
	icon_state = "bs_sergeant"
	item_state = "bs_sergeant"

/obj/item/clothing/accessory/patches/blackshield_sergeantmajor
	name = "blackshield sergeant major patch"
	desc = "A black, blue, and silver patch made to represent the Blackshield regiment. For use on uniforms when active, or other clothing in other positions."
	icon_state = "bs_sergeantm"
	item_state = "bs_sergeantm"

/obj/item/clothing/accessory/patches/blackshield_commander
	name = "blackshield commander patch"
	desc = "A black, blue, and silver patch made to represent the Blackshield regiment. For use on uniforms when active, or other clothing in other positions."
	icon_state = "bs_commander"
	item_state = "bs_commander"

/obj/item/clothing/accessory/patches/blackshield_major
	name = "blackshield major patch"
	desc = "A black, blue, and silver patch made to represent the Blackshield regiment. For use on uniforms when active, or other clothing in other positions."
	icon_state = "bs_major"
	item_state = "bs_major"

/obj/item/clothing/accessory/patches/blackshield_brigadier
	name = "blackshield brigadier patch"
	desc = "A black, blue, and silver patch made to represent the Blackshield regiment. For use on uniforms when active, or other clothing in other positions."
	icon_state = "bs_brigadier"
	item_state = "bs_brigadier"
