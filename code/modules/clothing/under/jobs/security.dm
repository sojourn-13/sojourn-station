/*
 * Contains:
 *		Security
 *		Detective
 *		Ironhammer Commander
 */

/*
 * Security
 */
/obj/item/clothing/under/rank/warden
	desc = "A durable supply specialist's jumpsuit, designed to provide moderate combat protection."
	name = "supply specialist's jumpsuit"
	icon_state = "warden"
	item_state = "r_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/head/rank/warden
	name = "supply specialist's helmet"
	desc = "A distinctive red military helmet signifying a supply specialist rank."
	icon_state = "policehelm"
	body_parts_covered = 0

/obj/item/clothing/under/rank/warden/skirt
	name = "supply specialist's jumpskirt"
	desc = "It's made of a slightly sturdier material than standard jumpskirts, to allow for more robust protection. It has the words \"Supply Specialist\" written on the shoulders."
	icon_state = "warden_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/rank/security
	name = "marshal officer's jumpsuit"
	desc = "A durable officer's jumpsuit, designed to provide moderate combat protection."
	icon_state = "security"
	item_state = "ba_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/security/cadet
	name = "Junior Marshal's jumpsuit"
	desc = "A durable jumpsuit for fresh-faced Junior Officers, designed to provide moderate combat protection."
	icon_state = "seccadet"
	item_state = "seccadet"

/obj/item/clothing/under/rank/security/cadet/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["cadet default"] = "seccadet"
	options["cadet alt"] = "seccadetalt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/security/skirt
	name = "marshal officer's jumpskirt"
	desc = "A durable officer's jumpsuit, designed to provide moderate combat protection."
	icon_state = "security_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/rank/security/turtleneck
	name = "Marshal officers turtleneck"
	desc = "Military style turtleneck, made of a slightly sturdier material than standard jumpsuits, to allow for robust protection"
	icon_state = "securityrturtle"

/obj/item/clothing/under/rank/medspec
	name = "militia corpmen's jumpsuit"
	desc = "A durable corpsman's jumpsuit, designed to provide moderate combat protection."
	icon_state = "medspec"
	item_state = "ba_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/medspec/skirt
	name = "militia corpmen's jumpskirt"
	desc = "It's made of a slightly sturdier material than standard jumpskirts, to allow for robust protection. It has the words \"Corpsman\" written on the shoulders."
	icon_state = "medspec_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/tactical
	name = "tactical turtleneck"
	desc = "A reinforced military turtleneck, designed to provide moderate combat protection."
	icon_state = "syndicate"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/bdu/marshal
	name = "marshal officer's BDU"
	desc = "A durable officer's Battle Dress Uniform, designed to provide moderate combat protection."
	icon_state = "bdumarshal"
	item_state = "bdumarshal"

/obj/item/clothing/under/rank/bdu/marshal/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["suit up"] = ""
	options["suit down"] = "_pants"
	options["sleeves up"] = "_rolled"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You roll your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*
 * Detective
 */
/obj/item/clothing/under/rank/inspector
	name = "ranger's turtleneck"
	desc = "A casual turtleneck and jeans serving as civilian ranger clothing."
	icon_state = "insp_under"
	item_state = "insp_under"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/inspector/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Ranger's Turtleneck"] = "detective"
	options["Patrol Uniform"] = "det_corporate"
	options["Detective Pants"] = "detective"
	options["Detective Skirt"] = "detective_f"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1 //Or you could just use this instead of making another subtype just for races

/obj/item/clothing/head/rank/inspector
	name = "fedora"
	desc = "A brown fedora - either the cornerstone of a detective's style or a poor attempt at looking cool, depending on the person wearing it."
	icon_state = "detective"
	item_state_slots = list(
		slot_l_hand_str = "det_hat",
		slot_r_hand_str = "det_hat",
		)
	allowed = list(/obj/item/reagent_containers/food/snacks/candy_corn, /obj/item/pen)
	armor_list = list(
		melee = 10,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.8
	body_parts_covered = 0

/obj/item/clothing/head/rank/inspector/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Brown"] = "detective"
	options["Black"] = "detective3"
	options["Gray"] = "detective2"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1 //Or you could just use this instead of making another subtype just for races


/*
 * Ironhammer Commander
 */
/obj/item/clothing/under/rank/ih_commander
	desc = "It's a jumpsuit worn by those few with the dedication to achieve the position of \"Warrant Officer\". It has additional armor to protect the wearer."
	name = "warrant officer's jumpsuit"
	icon_state = "hos"
	item_state = "r_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/ih_commander/skirt
	name = "warrant officer's jumpskirt"
	desc = "It's a jumpskirt worn by those few with the dedication to achieve the position of \"Warrant Officer\". It has additional armor to protect the wearer."
	icon_state = "hos_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/head/rank/commander
	name = "warrant officer's Hat"
	desc = "The hat of the Warrant Officer. For showing the officers who's in charge."
	icon_state = "hoshat"
	body_parts_covered = 0
	siemens_coefficient = 0.6

/obj/item/clothing/head/rank/mcommander
	name = "commander's Hat"
	desc = "The hat of the blackshield commander. Has a scent of napalm. Smells like victory."
	icon_state = "hoshat"
	body_parts_covered = 0
	siemens_coefficient = 0.6

/obj/item/clothing/head/rank/commander/dermal
	name = "dermal armor Patch"
	desc = "You're not quite sure how you manage to take it on and off, but it implants nicely in your head."
	icon_state = "dermal"
	siemens_coefficient = 0.6

//Jensen cosplay gear
/obj/item/clothing/under/rank/jensen
	desc = "You never asked for anything that stylish."
	name = "stylish augmented jumpsuit"
	icon_state = "jensen"
	item_state = "jensen"

/obj/item/clothing/suit/armor/jensen
	name = "armored trenchcoat"
	desc = "A trenchcoat augmented with a special alloy for some protection and style."
	icon_state = "jensencoat"
	item_state = "jensencoat"
	flags_inv = 0
	body_parts_covered = UPPER_TORSO|ARMS

/*
 * Navy uniforms
 */

/obj/item/clothing/under/rank/cadet
	name = "marshal cadet's jumpskirt"
	desc = "It's a sailor's uniform used for cadets in training, though more frequently in acts of hazing."
	icon_state = "cadet"
	item_state = "cadet"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
