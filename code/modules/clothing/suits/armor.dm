/*
 * Baseline Armor
 */

/obj/item/clothing/suit/armor
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	item_flags = THICKMATERIAL|DRAG_AND_DROP_UNEQUIP
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6
	price_tag = 200
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 1
	extra_allowed = list(/obj/item/tool/hammer/ironhammer)
	stiffness = 0

/obj/item/clothing/suit/armor/refresh_upgrades()
	var/obj/item/clothing/suit/armor/referencecarmor = new type()
	armor = referencecarmor.armor
	qdel(referencecarmor)
	..()

/*
 * Vests
 */

/obj/item/clothing/suit/armor/vest
	name = "armor vest"
	desc = "An armored vest that protects against some damage. Not designed for serious operations."
	icon_state = "armor"
	item_state = "armor"
	blood_overlay_type = "armor"
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 5,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/armor/vest/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "armor"
	options["Security"] = "armor_security"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/full
	name = "full body armor"
	desc = "A generic armor vest, but with shoulderpads and kneepads included to cover all parts of the body. Not designed for serious operations."
	icon_state = "armor_fullbody"
	item_state = "armor_fullbody"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/vest/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "armor_fullbody"
	options["Security"] = "armor_security_fullbody"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/handmade
	name = "handmade armor vest"
	desc = "An armored vest of dubious quality. Provides decent protection against physical damage, for a piece of crap."
	icon_state = "armor_handmade"
	armor_list = list(
		melee = 15, //Literally piece of scrap tied to a hazard vest
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	price_tag = 150

/obj/item/clothing/suit/armor/vest/handmade/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Orange"] = "armor_handmade"
	options["Black"] = "hm_armorvest_black"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/handmade/full
	name = "full handmade armor vest"
	desc = "An armored vest of dubious quality. This one has had metal sheets attached to the shoulders and knees to be used as makeshift shoulderpads and kneepads."
	icon_state = "armor_handmade_fullbody"
	item_state = "armor_handmade_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/vest/handmade/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Orange"] = "armor_handmade_fullbody"
	options["Black"] = "hm_armorvest_black_full"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

////////////

/*
 * Faction Vests
*/

/obj/item/clothing/suit/armor/vest/ironhammer
	name = "marshal armor vest"
	desc = "An armored vest that protects against some damage. This one has been done in marshal security colors. Not designed for serious operations."
	icon_state = "armor_ironhammer"

/obj/item/clothing/suit/armor/vest/ironhammer/full
	name = "marshal tactical unit armor"
	desc = "An armored vest painted in Marshals colors. This one has shoulderpads and kneepads included to protect all parts of the body."
	icon_state = "armor_ih_fullbody"
	item_state = "armor_ih_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/vest/ironhammer_wintercoat //pieced together thanks to Rebel's Supply spec coat - Dongels
	name = "security armored coat"
	desc = "An armored winter coat with vest that protects against some damage. This one has been done in marshal security colors. Not designed for serious operations. You're pretty sure the coat is just thick enough to keep warm, and that's all. Why you would want that on a planet like Amethyn is beyond thought."
	icon_state = "coatsecurity_long"

//Lonestar
/obj/item/clothing/suit/armor/vest/handmade/lonestar
	name = "lonestar hazard vest"
	desc = "A Lonestar hazard vest in grey and orange to be used in work zones."
	icon_state = "cargovest"
	item_state = "hazard"
	blood_overlay_type = "armor"
	extra_allowed = list(/obj/item/tool)
	armor_list = list(
		melee = 10,
		bullet = 10,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
)

/obj/item/clothing/suit/armor/vest/handmade/lonestar/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["standard"] = ""
	options["alt style"] = "_color"

	var/choice = input(M,"How would you like to wear your vest?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You alter your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/custodian
	name = "custodian armor"
	desc = "Someone's gotta clean this mess. While this armor is technically church property, Lonestar custodians often use it on loan to protect themselves from the colonies various dangerous pests."
	icon_state = "custodian"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor_list = list(melee = 30, bullet = 30, energy = 25, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEJUMPSUIT

////////////

/*
 * Factions
*/

/obj/item/clothing/suit/armor/vest/acolyte
	name = "vector armor"
	desc = "Worn, heavy, steadfast in the name of God."
	icon_state = "acolyte"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor_list = list(melee = 30, bullet = 30, energy = 25, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/vest/acolyte/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["vector default"] = "acolyte"
	options["tangent plate armor"] = "tangent_plate_armor"
	options["greater heart armor"] = "greater_heart"
	options["lemniscate armor"] = "lemniscate_armor"
	options["factorial armor"] = "factorial_armor"
	options["monomial armor"] = "monomial_armor"
	options["divisor armor"] = "divisor_armor"
	options["tessellate armor"] = "tessellate_armor"
	options["vector breastplate"] = "absolute_breast"
	options["vinculum dress garbs"] = "vinculum_cassock"
	options["tessellate plague garbs"] = "tessellate_plague_garbs"
	options["tessellate dark plague garbs"] = "tessellate_plague_garbs_dark"
	options["botanist default"] = "botanist"
	options["cosine brigantine armor"] = "cosine_brigantine_armor"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/path //No path ?
	name = "vinculum cassock"
	desc = "A heavy Cassock meant for the Vectors that possess no vows. This sturdy armor is made entirely out of biomatter and have no metal inner layer, but at the same time this sturdy armor is the thickest of any other armor made out of cloth, even thicker than a gambeson. But this armor is often used for rituals more than it is using for fighting, keeping the defensive properties only for emergencies."
	icon_state = "vinculum_cassock"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor_list = list(melee = 30, bullet = 30, energy = 25, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/vest/path/divisor
	name = "Divisor's Guardsmen Armor"
	desc = "The armour of the church arms forces of old - coming from the now extinct military of New Byzantine, this was an armour of pure efficiency in forms of springsteel. The inner layers has plates of biomatter-infused steel and chainmail, together with shoulder protection that elevates to protect the neck and fix it with the helmet of the same design. The garbs has been coloured red - rather than purple - to let it know who wears it is an Nadezdha's vector. This armor has been glorified by the church, as the people who once wears it was efficient warriors who battled the most powerful empire toe-to-toe, as it was vilified by Solfed propaganda, considered lunatics that know no pain or remorse."
	icon_state = "divisor_guardsmen_armor"

/obj/item/clothing/suit/armor/vest/path/divisor2
	name = "Divisor Plate Armor"
	desc = "The Nadezdha's church arm forces received proper armour made out of flexible, biomatter-imbued spring steel plates which provides protection which rivals kevlar all around while being cheaper to produce out of the bioprinter. The plate ensures no space for weapons to slide and reach an weak point while the enlarged faulds ensures free movement. The design came as an more ceremonial, less intimidating battle suit that differs from the old New Byzantine Guardsmen armor."
	icon_state = "divisor_plate_armor"

/obj/item/clothing/suit/armor/vest/path/tessallate
	name = "Tessellate Riding Habit"
	desc = "The Tessellate Riding Habit is an mixture of an well protective, efficient gambeson with inner chainmail that ensures the protection of it's user. Made by Nadezdha's church arms forces, it's the perfect mixture of an ceremonial garb and protective armor to the point of even not seemingly being protective at first. These armours has been made at first for an women-only healing sect - until it spread across all genders and anyone under the rite of Tessellate."
	icon_state = "tessellate_riding_habit"

/obj/item/clothing/suit/armor/vest/path/tessallate2
	name = "Tessellate Doctor Garbs"
	desc = "The garbs of old design set by the church during their years as an small presence in New Byzantine. The Doctors provided free medical care in an world where medical care was absent or absurdly costy, and work safety was all but a dream in risky mining operations to collect materials for the now almost forgotten technology of durasteel. The Tessellate Doctors was an major point for the survival of the church as a whole as during the war against Solfed as many civilians, ecclesiastical members and normal New Byzantine military would be deeply wounded by the constant, almost unstoppable bombing of cities and infrastructures."
	icon_state = "tessellate_doctor_garbs"

/obj/item/clothing/suit/armor/vest/path/lemniscate
	name = "Lemniscate Garbs"
	desc = "The well suited lemniscates garbs of new, made for the highest quality ceremonies by looking absurdly fancy. The biomatter silk is of highest quality and absurdly smooth to the touch to the point of almost making the soul cry. It's protective values are quite close to the design of an pourpoint with inner chainmail with golden ridges and lines that only reinforces it's fanciness value. The garbs extends towards almost all the body and ensures the protection of it's user while being loose fitting, allowing air to circulate, preventing sweat from evaporating too quickly and slowing dehydration in hot, dry hair. This allows many Lemniscates to not struggle as much while walking on an desert."
	icon_state = "lemniscate_garbs"

/obj/item/clothing/suit/armor/vest/path/lemniscate2
	name = "Lemniscate Caftan"
	desc = "As much as these before purple, now red fancy Caftans may show an degree of authority and ceremonial nature, the ecclesiastical and people that lived the wars of New Byzantine only knows sacrifice and famine. During severe attacks where the cities became all but rubble, Lemniscates ensured the mental well being and protection of the weak, the children and the old- in all bunkers and metros, many Lemniscates overworked themselves to gather food and drinks for their troops and civilians, many times killed by cold blood by Solfed machinegun and Solfed's scorched earth tactics. Stories of lemniscates being shot yet still coming back to the bunkers with the same amount of holes as swiss cheese, successfully delivering buckets of water and bread before dying from bloodloss or total organ failure was not unheard of."
	icon_state = "lemniscate_caftan"

/obj/item/clothing/suit/armor/vest/path/monomial
	name = "Monomial Kasaya"
	desc = "Kasaya are robes used by the Monks and Nuns of the church of the absolute, and most of the time used by hermits during their path towards the unknown. Used by the Devotees, it was once made for the ones that wanted to let clear their vows of poverty, being made with discarded fabric instead of biomatter. But with how the colony is a dangerous place, the Monomials needed to make do with the new reinforced biomatter cloth ordered by the Church while going on the upper colonies, yet this armor still respects the monomial vows by keeping one arm unprotected, while the other make do by reinforcing the armor rate in double."
	icon_state = "monomial_kasaya"

/obj/item/clothing/suit/armor/vest/path/monomial2
	name = "Monomial Gusoku"
	desc = "An old, repainted red armor piece with minor plates overlapping on the shoulders, waist and legs, with an large plate protecting the chest and belly. During times of extreme necessity of manpower during the Solfed war, many hermits and civilians took arms and made their own armor out of trash and steel from construction beams from the cities with nothing but welding tools and hammers after the outcome of Solfed bombings as certain people of the monomial path trained the population martial prowess when wall executions of civilians became common place for anyone with minimal relation to the church - the time where the population either died by starvation by Solfed's scorched earth tactics, or accepted Church's delivered biomatter meat, bread and water."
	icon_state = "monomial_gusoku"

/obj/item/clothing/suit/armor/vest/path/factorial
	name = "Factorial powergarb"
	desc = "Powergarbs are curious things made by the Nadezdha's church arms forces that are by no means made out of circuits, but rather have golem foundations. Such curious technology that almost only the church possess with great variety beyond xenobiology, what explains the EMP-Immune nature of the powergarbs even if, in fact, the lightweight clamping arms behind them are alive and are actually living golems that consented into becoming the protection of a Factorial. Well trained factorials are able to use such arms to lift themselves out of the ground for better combat support - but until now, only ERT forces are able to do such a thing."
	icon_state = "factorial_powergarb"

/obj/item/clothing/suit/armor/vest/path/factorial2
	name = "Factorial Vesselcrew Armor"
	desc = "The well protective against impact armor that suits better to protect the user from broken bones after receiving large, pressuring impacts against Freighter or Scout vessels. There's overlapping layers of various thin wedges of biomatter-infused steel with smaller springs just under it. There's an large plate protecting vital organs on the chest and an thick garb protecting the rest of the legs. The Vesselcrew are now an completely extinct fighters and engineers of New-Byzantine that fighted Solfed reinforcements in space with nothing but weaponised cargo ships that, even while extremely understaffed and in extreme technological disadvantage, managed to push off solfed vessels with surprise tactics and absurdly fast speed. They managed to make an difference in the war but was exterminated when the actual, powerful fleet of ships came - which they sacrificed themselves to give time for Augustine and many church members to leave New Byzantine before the portion of the planet would be glassed in radioactive explosions by Solfed."
	icon_state = "factorial_vesselcrew_armor"

/obj/item/clothing/suit/armor/vest/rosaria
	name = "rosaria armor"
	desc = "The Rosaria protects."
	icon_state = "rosaria_armor"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor_list = list(melee = 40, bullet = 40, energy = 40, bomb = 50, bio = 100, rad = 100)
	flags_inv = HIDEJUMPSUIT
	matter = list(MATERIAL_PLASTEEL = 60, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 5, MATERIAL_GOLD = 5)

/obj/item/clothing/suit/armor/vest/rosaria/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["rosaria default"] = "rosaria_armor"
	options["rosaria alt"] = "rosaria_alt_armor"


	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/prime
	name = "prime armor"
	desc = "Trust in god, but keep your armor on."
	icon_state = "prime"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor_list = list(melee = 40, bullet = 40, energy = 40, bomb = 50, bio = 100, rad = 100)
	flags_inv = HIDEJUMPSUIT
	matter = list(MATERIAL_PLASTEEL = 60, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 5, MATERIAL_GOLD = 5)

/obj/item/clothing/suit/armor/vest/prime/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["prime dark"] = "prime"
	options["prime royal"] = "prime_alt"
	options["prime saint"] = "prime_saint"
	options["prime paladin"] = "prime_paladin"
	options["prime paladin alt"] = "prime_paladin_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Guild
/obj/item/clothing/suit/armor/vest/technomancersuit
	name = "'Mark V' environmental protection suit"
	desc = "For working in hazardous environments. While it is built for most environments, one of those is not space. As a tradeoff, it can be modified more."
	icon_state = "technosuit"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor_list = list(melee = 40, bullet = 30, energy = 30, bomb = 50, bio = 100, rad = 100) //Expensive
	stiffness = MEDIUM_STIFFNESS
	max_upgrades = 2
	extra_allowed = list(/obj/item/extinguisher,
						 /obj/item/tool,
						 /obj/item/tool_upgrade,
						 /obj/item/stack/cable_coil,
						 /obj/item/device/t_scanner,
						 /obj/item/device/scanner/gas,
						 /obj/item/taperoll/engineering,
						 /obj/item/storage/toolbox)
	flags_inv = HIDEJUMPSUIT

/*
 * Plate Carriers *
*/

//Generics
/obj/item/clothing/suit/armor/platecarrier
	name = "plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes."
	icon_state = "platecarrier"
	item_state = "platecarrier"
	blood_overlay_type = "armor"
	armor_list = list(melee = 35, bullet = 45, energy = 20, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/platecarrier/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "platecarrier"
	options["Security"] = "platecarrier_ih"
	options["Green"] = "platecarrier_green"
	options["Tan"] = "platecarrier_tan"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/platecarrier/full
	name = "full body plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, in Blackshield colors. It has been improved by adding shoulderpads and kneepads for additional coverage."
	icon_state = "platecarrier_fullbody"
	item_state = "platecarrier_fullbody"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/platecarrier/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "platecarrier_fullbody"
	options["Security"] = "platecarrier_ih_fullbody"
	options["Green"] = "platecarrier_green_fullbody"
	options["Tan"] = "platecarrier_tan_fullbody"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Blackshield armor
/obj/item/clothing/suit/armor/platecarrier/militia
	name = "blackshield plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one bears the distinct IFF stripes of the Blackshield."
	icon_state = "platecarrier_mil"
	item_state = "platecarrier_mil"

/obj/item/clothing/suit/armor/platecarrier/militia/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Colours"] = "platecarrier_mil"
	options["Desert Combat"] = "platecarrier_tan_mil"
	options["Woodlands Blackshield Combat"] = "platecarrier_green_mil"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/suit/armor/platecarrier/militia/full
	name = "blackshield full body plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, as well as additional shoulderpads and kneepads, decorated with the IFF stripes of Blackshield."
	icon_state = "platecarrier_mil_fullbody"
	item_state = "platecarrier_mil_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/platecarrier/militia/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Colours"] = "platecarrier_mil_fullbody"
	options["Desert Combat"] = "platecarrier_tan_mil_fullbody"
	options["Woodlands Blackshield Combat"] = "platecarrier_green_mil_fullbody"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/platecarrier/corpsman
	name = "corpsman plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one is marked with Corpsman livery and has a stain resistant coating."
	icon_state = "platecarrier_corpsman"
	item_state = "platecarrier_corpsman"
	armor_list = list(melee = 35, bullet = 45, energy = 20, bomb = 10, bio = 20, rad = 0)

/obj/item/clothing/suit/armor/platecarrier/corpsman/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Colours"] = "platecarrier_corpsman"
	options["Desert Combat"] = "platecarrier_tan_corpsman"
	options["Woodlands Blackshield Combat"] = "platecarrier_green_corpsman"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/platecarrier/corpsman/full
	name = "corpsman full body plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one is marked with corpsman livery and has a stain resistant coating as well as additional shoulderpads and kneepads for added protection."
	icon_state = "platecarrier_corpsman_fullbody"
	item_state = "platecarrier_corpsman_fullbody"
	armor_list = list(melee = 35, bullet = 45, energy = 20, bomb = 10, bio = 20, rad = 0) // Just in case it doesn't inherit armor qualities
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/platecarrier/corpsman/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Colours"] = "platecarrier_corpsman_fullbody"
	options["Desert Combat"] = "platecarrier_tan_corpsman_fullbody"
	options["Woodlands Blackshield Combat"] = "platecarrier_green_corpsman_fullbody"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Warrant Officer
/obj/item/clothing/suit/armor/platecarrier/hos
	name = "advanced plate carrier"
	desc = "An armored vest carrying military grade trauma plates and advanced ballistic meshes."
	icon_state = "platecarrier_ih"
	item_state = "platecarrier_ih"
	blood_overlay_type = "armor"
	max_upgrades = 0
	armor_list = list(melee = 40, bullet = 50, energy = 30, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/platecarrier/hos/full
	name = "full body advanced plate carrier"
	desc = "An armored vest carrying military grade trauma plates and advanced ballistic meshes.This set has a set of equally advanced arm and leg-guards added for increased overall protection."
	icon_state = "platecarrier_ih_fullbody"
	item_state = "platecarrier_ih_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/*
 * Armored Coats *
*/

/obj/item/clothing/suit/armor/hos
	name = "warrant officer's armored coat"
	desc = "A greatcoat enhanced with a special alloy for some protection and style."
	icon_state = "hos"
	item_state = "hos"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = MEDIUM_STIFFNESS
	max_upgrades = 0
	armor_list = list(
		melee = 40,
		bullet = 40,
		energy = 40,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.6

/obj/item/clothing/suit/armor/hos/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Armored coat"] = "hos"
	options["Alt armored coat"] = "new_wo"
	options["Formal coat"] = "wo_formal"
	options["Formal coat alt"] = "wo_formallong"
	options["WO Greatcoat"] = "ihc_coat"
	options["WO Cloaked Greatcoat"] = "ihc_coat_cloak"
	options["WO Blue Greatcoat"] = "ihc_coat_blue"
	options["WO Blue Cloaked Greatcoat"] = "ihc_coat_cloak_blue"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/commander
	name = "commander's armored coat"
	desc = "A heavily armored combination of menacing style and cutting-edge body armor."
	icon_state = "commander_mil"
	item_state = "commander_mil"
	blood_overlay_type = "coat"
	permeability_coefficient = 0.50
	max_upgrades = 0
	armor_list = list(
		melee = 40,
		bullet = 40,
		energy = 40,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7
	stiffness = MEDIUM_STIFFNESS

/obj/item/clothing/suit/armor/commander/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Colours"] = "commander_mil"
	options["Desert Combat"] = "commander_tan"
	options["Woodlands Combat"] = "commander_green"
	options["Woodlands Blackshield Combat"] = "commander_green_mil"
	options["BC Cloaked Greatcoat"] = "mc_coat_cloak"
	options["BC Greatcoat"] = "mc_coat"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/storage/armor/militia_overcoat // Pockets for your hands on the cold.
	name = "blackshield armored overcoat"
	desc = "A blackshield greatcoat with kevlar weave and rank epaulettes. Worn in cold environments, guard duty or formal events."
	armor_list = list(melee = 20, bullet = 20, energy = 20, bomb = 10, bio = 0, rad = 0)
	stiffness = LIGHT_STIFFNESS
	max_upgrades = 0
	icon_state = "overcoat_bm"
	item_state = "overcoat_bm"

/obj/item/clothing/suit/storage/armor/marshal_coat
	name = "ranger armored greatcoat"
	desc = "A ranger greatcoat with armor weave. Part of the formal uniform of the security marshals."
	armor_list = list(melee = 20, bullet = 20, energy = 20, bomb = 10, bio = 0, rad = 0)
	stiffness = LIGHT_STIFFNESS
	max_upgrades = 0
	icon_state = "marshal_coat"
	item_state = "marshal_coat"

/obj/item/clothing/suit/storage/armor/marshal_coat_ss
	name = "supply specialist's jacket"
	desc = "Supply Specialist's jacket with an armored weave. For formality, protection and style."
	armor_list = list(melee = 25, bullet = 25, energy = 20, bomb = 10, bio = 0, rad = 0)//Cause he gets this instead of armor vest
	stiffness = LIGHT_STIFFNESS
	max_upgrades = 0
	icon_state = "marshal_coat_ss"
	item_state = "marshal_coat_ss"

/*
 * Specilized Armors *
*/

// Riot suit
/obj/item/clothing/suit/armor/riot
	name = "riot suit"
	desc = "A suit of armor with heavy padding to protect against melee attacks. Looks like it might impair movement."
	icon_state = "riot"
	item_state = "swat_suit"
	slowdown = 0.3
	max_upgrades = 0
	stiffness = MEDIUM_STIFFNESS
	armor_list = list(
		melee = 65,
		bullet = 20,
		energy = 0,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	price_tag = 250

/obj/item/clothing/suit/armor/riot/ironhammer
	name = "marshal riot suit"
	desc = "A suit of armor with heavy padding to protect against melee attacks. Looks like it might impair movement. This one is produced by Seinemetall Defense GmbH."
	icon_state = "riot_ironhammer"
	item_state = "riot_ironhammer"

//Bulletproof
/obj/item/clothing/suit/armor/bulletproof
	name = "bulletproof vest"
	desc = "A vest that excels in protecting the wearer against high-velocity solid projectiles."
	icon_state = "bulletproof"
	item_state = "armor"
	blood_overlay_type = "armor"
	slowdown = 0.2
	stiffness = LIGHT_STIFFNESS
	max_upgrades = 0
	armor_list = list(
		melee = 30,
		bullet = 65,
		energy = 5,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 250

/obj/item/clothing/suit/armor/bulletproof/full
	name = "bulletproof suit"
	desc = "A vest that excels in protecting the wearer against high-velocity solid projectiles with added shoulderpads and kneepads for extra coverage."
	icon_state = "bulletproof_fullbody"
	item_state = "bulletproof_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = MEDIUM_STIFFNESS
	slowdown = 0.3 // Heavier since it now covers more of the body

/obj/item/clothing/suit/armor/bulletproof/full/ironhammer
	name = "marshal bulletproof suit"
	desc = "A bulky vest that excels in protecting the wearer against high-velocity solid projectiles with added shoulderpads and kneepads for extra coverage produced by Seinemetall Defense GmbH."
	icon_state = "bulletproof_ironhammer"
	item_state = "bulletproof_ironhammer"

/obj/item/clothing/suit/armor/bulletproof/full/ironhammer/militia
	name = "blackshield bulletproof suit"
	desc = "A set of vest, shoulder guards and leg guards that excel at protecting against high-velocity, solid projectiles. \
			This particular set seems to have been taken straight from the armory of some low-budget P.D.F or Reserve force, repainted in \
			Blackshield colors and given their I.F.F markings."
	icon_state = "bulletproof_bs"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

//Ablatives / Laserproof

/obj/item/clothing/suit/armor/vest/ablative
	name = "ablative vest"
	desc = "An ablative vest with plates designed to absorb rather than reflect energy projectiles."
	icon_state = "northtech"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 20, MATERIAL_PLATINUM = 10)
	slowdown = 0.2
	stiffness = LIGHT_STIFFNESS
	max_upgrades = 0
	armor_list = list(
		melee = 10,
		bullet = 25,
		energy = 65,
		bomb = 10,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/armor/vest/ablative/ironhammer
	icon_state = "ablative_ironhammer"
	item_state = "ablative_ironhammer"

/obj/item/clothing/suit/armor/vest/ablative/militia
	name = "blackshield ablative plate"
	desc = "An outdated set of ablative armor, utilizing advanced materials to absorb rather than reflect energy projeciles and painted in Blackshield's colors. \
			A distinctive set of equipment, the MK-II 'Energy Defense Gear' sold more for its distinctive, and some would say 'flashy' \
			appearance than its capabilities. Despite its bad reputation as a tax-payer credit sink, it serves as a fairly adequate piece of gear."
	icon_state = "ablative_bs"
	stiffness = MEDIUM_STIFFNESS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	slowdown = 0.3

/obj/item/clothing/suit/armor/vest/ablative/iron_lock_security //Poor man's ablative
	name = "outdated ablative vest"
	desc = "An \"Iron Lock Security\" ablative vest with plates designed to absorb rather than reflect energy projectiles. Produced by Greyson Positronic."
	icon_state = "northtech"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 20, MATERIAL_PLATINUM = 5)
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 50,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/armor/laserproof
	name = "reflective armor vest"
	desc = "A vest that excels in protecting the wearer against energy projectiles."
	icon_state = "ablative"
	item_state = "ablative"
	blood_overlay_type = "armor"
	var/reflect_percentage = 40
	max_upgrades = 0
	slowdown = 0.3
	stiffness = MEDIUM_STIFFNESS //Pgood
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 60,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0
	price_tag = 325

/obj/item/clothing/suit/armor/laserproof/handle_shield(mob/user, damage, atom/damage_source = null, mob/attacker = null, def_zone = null, attack_text = "the attack") //TODO: Refactor this all into humandefense
	if(istype(damage_source, /obj/item/projectile/energy) || istype(damage_source, /obj/item/projectile/beam))
		var/obj/item/projectile/P = damage_source

		var/reflectchance = reflect_percentage - round(damage/3)
		if(!(def_zone in list(BP_CHEST, BP_GROIN)))
			reflectchance /= 2
		if(P.starting && prob(reflectchance))
			visible_message(SPAN_DANGER("\The [user]'s [src.name] reflects [attack_text]!"))

			// Find a turf near or on the original location to bounce to
			var/new_x = P.starting.x + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/new_y = P.starting.y + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/turf/curloc = get_turf(user)

			// redirect the projectile
			P.redirect(new_x, new_y, curloc, user)

			return PROJECTILE_CONTINUE // complete projectile permutation

/obj/item/clothing/suit/armor/laserproof/rnd
	name = "soteria reflective armor vest"
	desc = "A Soteria branded vest that excels in protecting the wearer against energy projectiles. While it is much better at defending against lasers compared to standard ablative armor it lacks as much protection against melee and bullets but can be modified more."
	icon_state = "ablative_ironhammer"
	reflect_percentage = 55
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 20, MATERIAL_PLATINUM = 15)
	price_tag = 650

//Flak Vests
/obj/item/clothing/suit/armor/flakvest
	name = "flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel."
	icon_state = "flakvest"
	item_state = "flakvest"
	blood_overlay_type = "armor"
	price_tag = 250
	stiffness = LIGHT_STIFFNESS
	slowdown = 0.2

	max_upgrades = 0

	armor_list = list(melee = 15, bullet = 25, energy = 0, bomb = 70, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/flakvest/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "flakvest"
	options["Green"] = "flakvest_green"
	options["Tan"] = "flakvest_tan"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/flakvest/full // Sic.
	name = "full body flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations, it protects well against explosives and shrapnel. This set has had kneepads and shoulderpads attached for more protection."
	icon_state = "flakvest_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = MEDIUM_STIFFNESS
	slowdown = 0.3 // Bulkier due to protecting more

/obj/item/clothing/suit/armor/flakvest/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "flakvest_fullbody"
	options["Green"] = "flakvest_green_fullbody"
	options["Tan"] = "flakvest_tan_fullbody"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/flakvest/militia
	name = "blackshield flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel. \
			This one is marked with the distinct IFF stripes of the Blackshield."
	icon_state = "flakvest_mil"
	item_state = "flakvest_mil"

/obj/item/clothing/suit/armor/flakvest/militia/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Colours"] = "flakvest_mil"
	options["Woodlands Blackshield Combat"] = "flakvest_green_mil"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/flakvest/militia/full
	name = "blackshield full flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel. \
			This one is marked with the distinct IFF stripes of the Blackshield, and offers additional coverage through shoulderpads and kneepads."
	icon_state = "flakvest_mil_fullbody"
	item_state = "flakvest_mil_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	slowdown = 0.3 // Bulkier due to protecting more
	stiffness = MEDIUM_STIFFNESS

/obj/item/clothing/suit/armor/flakvest/militia/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Colours"] = "flakvest_mil_fullbody"
	options["Woodlands Blackshield Combat"] = "flakvest_green_mil_fullbody"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/flakvest/commander
	name = "commander's flak vest"
	desc = "An armored, padded vest that's seen many long tours and is suited for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel. Smells of napalm and the sea."
	icon_state = "flakvest_mil"
	item_state = "flakvest_mil"
	blood_overlay_type = "armor"
	slowdown = 0.1
	armor_list = list(melee = 15, bullet = 45, energy = 0, bomb = 70, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/flakvest/commander/full
	name = "commander's full body flak vest"
	desc = "An armored, padded vest that's seen many long tours and is suited for heavy-duty operations. \
			Heavy and bulky, it protects well against explosive and shrapnel. Smells of napalm and the sea. \
			This model adds shoulder and thighs protection through additional layers of protective armor." // Thighington simps rejoice. - Seb
	icon_state = "commander_mil_fullbody"
	item_state = "commander_mil_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	slowdown = 0.2 // Bulkier due to protecting more
	stiffness = LIGHT_STIFFNESS
	armor_list = list(melee = 15, bullet = 45, energy = 0, bomb = 70, bio = 0, rad = 0)

/*
 * Heavy Armor Types
 */

/obj/item/clothing/suit/armor/heavy
	name = "heavy armor"
	desc = "A heavily armored suit that protects against moderate damage."
	icon_state = "heavy"
	item_state = "swat_suit"
	w_class = ITEM_SIZE_BULKY
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.9
	siemens_coefficient = 0.5
	item_flags = THICKMATERIAL|DRAG_AND_DROP_UNEQUIP|COVER_PREVENT_MANIPULATION|EQUIP_SOUNDS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	slowdown = 0.9
	max_upgrades = 2
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	armor_list = list(
		melee = 40,
		bullet = 35,
		energy = 40,
		bomb = 30,
		bio = 0,
		rad = 0
	)
	equip_delay = 2 SECONDS
	price_tag = 125

/obj/item/clothing/suit/armor/heavy/red
	name = "Thunderdome suit (red)"
	desc = "Reddish armor."
	icon_state = "tdred"
	item_state = "tdred"
	siemens_coefficient = 1

/obj/item/clothing/suit/armor/heavy/green
	name = "Thunderdome suit (green)"
	desc = "Pukish armor."
	icon_state = "tdgreen"
	item_state = "tdgreen"
	siemens_coefficient = 1


/*
 * Storage Types
 */
/obj/item/clothing/suit/storage/vest
	name = "webbed armor"
	desc = "An armored vest used for day-to-day operations. This one has various pouches and straps attached."
	icon_state = "webvest"
	price_tag = 250 //Normal vest is worth 200, this one is worth 250 because it also has storage space
	armor_list = list(
		melee = 15,
		bullet = 30,
		energy = 0,
		bomb = 5,
		bio = 0,
		rad = 0
	)

	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	item_flags = DRAG_AND_DROP_UNEQUIP|EQUIP_SOUNDS|THICKMATERIAL

	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6

/obj/item/clothing/suit/storage/vest/ironhammer
	name = "webbed operator armor"
	desc = "An armored vest that protects against some damage. This one has been done in Nadezhda Marshal colors and has various pouches and straps attached."
	icon_state = "webvest_ironhammer"

//Provides the protection of a merc voidsuit, but only covers the chest/groin, and also takes up a suit slot. In exchange it has no slowdown and provides storage.
/obj/item/clothing/suit/storage/vest/merc
	name = "heavy armor vest"
	desc = "A high-quality armor vest in a fetching tan. It is surprisingly flexible and light, even with the added webbing and armor plating."
	icon_state = "mercwebvest"
	item_state = "mercwebvest"
	max_upgrades = 0 //No upgrading this one
	tool_qualities = list()
	price_tag = 300
	armor_list = list(
		melee = 55,
		bullet = 55,
		energy = 55,
		bomb = 45,
		bio = 0,
		rad = 0
	)

//Has some armor and but is a mix of the scav suit and a webbing
/obj/item/clothing/suit/storage/vest/scav
	name = "armored rig"
	desc = "A simple plate carrier modified for personal use, additional pouches have been attached to its front, \
	with matching knee and arm pads to protect limbs without hindering movement. \
	Opening the plate pouch would reveal a sheet of some Greyson alloy, welded and forced into shape for the vest, \
	far lighter and offering more protection than it's more common ceramic counterparts. \
	Due to its jury-rigged yet robust design, it's able to take more armor plates than a standard heavy vest."
	icon_state = "forehead_armor"
	item_state = "forehead_armor"
	max_upgrades = 2 //Like all scav armor, this means investing into these will be better but buying gear will still be viable
	matter = list(MATERIAL_PLASTEEL = 24, MATERIAL_PLASTIC = 25, MATERIAL_SILVER = 8,  MATERIAL_STEEL = 40) //worth stealing
	price_tag = 1200
	body_parts_covered = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO
	cold_protection = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO
	armor_list = list(
		melee = 40,
		bullet = 35,
		energy = 40,
		bomb = 35,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/vest/scav/New()
	..()
	pockets = new/obj/item/storage/internal(src)
	pockets.storage_slots = 2	//two slots
	pockets.max_w_class = ITEM_SIZE_NORMAL		//fits two normal size items as its big pockets
	pockets.max_storage_space = 8
	pockets.cant_hold |= list(/obj/item/tool_upgrade/armor) //Prevents a bug

/obj/item/clothing/suit/storage/vest/scav/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Standard"] = "forehead_armor"
	options["Rust"] = "forehead_rust"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*
 * Reactive Armor
 */
//When the wearer gets hit, this armor will teleport the user a short distance away (to safety or to more danger, no one knows. That's the fun of it!)
/obj/item/clothing/suit/armor/reactive
	name = "reactive teleport armor"
	desc = "Someone separated our Research Director's head from their body!"
	var/active = FALSE
	icon_state = "reactiveoff"
	item_state = "reactiveoff"
	blood_overlay_type = "armor"
	armor_list = list(
		melee = 20,
		bullet = 20,
		energy = 20,
		bomb = 0,
		bio = 0,
		rad = 0
		)
	var/entropy_value = 2
	stiffness = MEDIUM_STIFFNESS

/obj/item/clothing/suit/armor/reactive/handle_shield(mob/user, damage, atom/damage_source = null, mob/attacker = null, def_zone = null, attack_text = "the attack")
	if(prob(50))
		user.visible_message(SPAN_DANGER("The reactive teleport system flings [user] clear of the attack!"))
		var/turf/TLoc = get_turf(user)
		var/turf/picked = get_random_secure_turf_in_range(src, 7, 1)
		if(!picked) return
		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		go_to_bluespace(TLoc, entropy_value, TRUE, user, picked)
		return PROJECTILE_FORCE_MISS
	return FALSE

/obj/item/clothing/suit/armor/reactive/attack_self(mob/user)
	src.active = !( src.active )
	if (src.active)
		to_chat(user, "\blue The reactive armor is now active.")
		src.icon_state = "reactive"
		src.item_state = "reactive"
	else
		to_chat(user, "\blue The reactive armor is now inactive.")
		src.icon_state = "reactiveoff"
		src.item_state = "reactiveoff"
		src.add_fingerprint(user)
	return

/obj/item/clothing/suit/armor/reactive/emp_act(severity)
	active = 0
	src.icon_state = "reactiveoff"
	src.item_state = "reactiveoff"
	..()

/// Hunting Lodge Armor

/obj/item/clothing/suit/armor/hunter
	name = "hunter armor"
	desc = "A lightly armored breastplate and knee-guards supplied by the local hunting-lodge. It appears to be rather crudely self made."
	icon_state = "hunter_armor"
	item_state = "hunter_armor"
	blood_overlay_type = "armor"
	armor_list = list(
		melee = 30,
		bullet = 20,
		energy = 20,
		bomb = 10,
		bio = 0,
		rad = 0 )
	body_parts_covered = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO
	cold_protection = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO

/obj/item/clothing/suit/armor/hunter/bone
	name = "hunter armor"
	desc = "A lightly armored breastplate with bone-reinforcements of animal ribs and skulls accompanied by knee-guards from an unknown animal, \
	supplied by the local hunting-lodge. It appears to be rather crudely self made. \ "
	icon_state = "hunter_armor_bone"
	item_state = "hunter_armor_bone"
	blood_overlay_type = "armor"
	armor_list = list(
		melee = 45,
		bullet = 25,
		energy = 25,
		bomb = 10,
		bio = 0,
		rad = 0)

/obj/item/clothing/suit/armor/hunter/reinforced
	name = "hunter armor"
	desc = "A heavily armored breastplate and knee-guards supplied by the local hunting-lodge. It appears to be rather crudely self made with steel plating functioning as make-shift kevlar plates."
	icon_state = "hunter_armor_reinforced"
	item_state = "hunter_armor_reinforced"
	blood_overlay_type = "armor"
	armor_list = list(
		melee = 30,
		bullet = 45,
		energy = 25,
		bomb = 10,
		bio = 0,
		rad = 0)

/obj/item/clothing/suit/armor/hunter/leather
	name = "hunter armor"
	desc = "A lightly armored breastplate, leather sleeves, and knee-guards supplied by the local hunting-lodge. It appears to be rather crudely self made, yet the extra leather reinforcement is not \
	only stylish but aids greatly is dispersing laser and plasma shots."
	icon_state = "hunter_armor_leather"
	item_state = "hunter_armor_leather"
	blood_overlay_type = "armor"
	armor_list = list(
		melee = 30,
		bullet = 25,
		energy = 45,
		bomb = 10,
		bio = 0,
		rad = 0)

/obj/item/clothing/suit/armor/vest/handmadewooden
	name = "wooden armor"
	desc = "A series of planks held into a relatively torso shaped form by cloth tied around the shoulders and waist. Then further padded with more cloth along the inside."
	icon_state = "hm_woodvest"
	item_state = "hm_woodvest"
	armor_list = list(
		melee = 25, //It's made of mostly wood and cloth, shittiest armor in the game easily, but does have bio and rad, giving it a rare but still possible boost over handmade. -Kaz
		bullet = 15, // Justifying keeping somewhat decent values on bullet just because I changed the recipe to include steel. - Seb
		energy = 10, // It's mostly made of wood, it will char easily.
		bomb = 10,
		bio = 25,
		rad = 25
	)
	price_tag = 50
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/paramedic
	name = "advanced paramedic armor"
	desc = "Lightweight and moderately armored suit meant to be used to rush into danger to save lives. Has a built in Acceleration, that when active gives a speed boost to save people faster."
	icon_state = "trauma_team"
	item_state = "trauma_team"
	matter = list(
		MATERIAL_PLASTEEL = 10,
		MATERIAL_STEEL = 5,
		MATERIAL_PLASTIC = 5,
		MATERIAL_PLATINUM = 3,
		MATERIAL_URANIUM = 4,
		MATERIAL_SILVER = 2
		)
	armor_list = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 10,
		bio = 100,
		rad = 50
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	action_button_name = "Toggle Acceleration"
	var/speed_boost_ready = TRUE
	var/speed_boost_active = FALSE
	var/speed_boost_power = -0.5
	var/speed_boost_length = 30 SECONDS
	var/speed_boost_cooldown = 5 MINUTES
	var/matching_helmet = /obj/item/clothing/head/helmet/faceshield/paramedic

/obj/item/clothing/suit/armor/paramedic/ui_action_click(mob/living/user, action_name)
	if(..())
		return TRUE

	trigger_speed_boost(user)

/obj/item/clothing/suit/armor/paramedic/proc/trigger_speed_boost(mob/living/carbon/human/user)
	if(!istype(user))
		return

	if(!speed_boost_ready)
		if(user.head && istype(user.head, matching_helmet))
			if(speed_boost_active)
				to_chat(usr, SPAN_WARNING("[user.head] beeps: 'Acceleration protocol active.'"))
			else
				to_chat(usr, SPAN_WARNING("[user.head] beeps: 'Acceleration protocol failture. Insufficient capacitor charge.'"))
		return

	speed_boost_ready = FALSE
	speed_boost_active = TRUE
	slowdown = speed_boost_power

	if(user.head && istype(user.head, matching_helmet))
		to_chat(usr, SPAN_WARNING("[user.head] beeps: 'Acceleration protocol initiated.'"))

	spawn(speed_boost_length)
		if(QDELETED(src))
			return
		slowdown = initial(slowdown)
		speed_boost_active = FALSE
		if(user.head && istype(user.head, matching_helmet))
			to_chat(usr, SPAN_WARNING("[user.head] beeps: 'Capacitors discharged. Acceleration protocol aborted.'"))

		spawn(speed_boost_cooldown)
			if(QDELETED(src))
				return
			speed_boost_ready = TRUE
			if(user.head && istype(user.head, matching_helmet))
				to_chat(usr, SPAN_WARNING("[user.head] beeps: 'Capacitors have been recharged.'"))
