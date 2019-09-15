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
	desc = "A durable gunnery sergeant's jumpsuit, designed to provide moderate combat protection."
	name = "ironhammer gunnery sergeant's jumpsuit"
	icon_state = "warden"
	item_state = "r_suit"

	siemens_coefficient = 0.9

/obj/item/clothing/head/rank/warden
	name = "ironhammer gunnery sergeant's helmet"
	desc = "A distinctive red military helmet signifying a gunnery sergeant rank."
	icon_state = "policehelm"
	body_parts_covered = 0

/obj/item/clothing/under/rank/warden/skirt
	name = "Gunnery Sergeant jumpskirt"
	desc = "It's made of a slightly sturdier material than standard jumpskirts, to allow for more robust protection. It has the words \"Gunnery Sergeant\" written on the shoulders."
	icon_state = "warden_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/rank/security
	name = "ironhammer operative's jumpsuit"
	desc = "A durable operative's jumpsuit, designed to provide moderate combat protection."
	icon_state = "security"
	item_state = "ba_suit"

	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/security/skirt
	name = "Ironhammer Operative's jumpskirt"
	desc = "It's made of a slightly sturdier material than standard jumpskirts, to allow for robust protection."
	icon_state = "security_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/rank/medspec
	name = "ironhammer medical specialist's jumpsuit"
	desc = "A durable medical specialist's jumpsuit, designed to provide moderate combat protection."
	icon_state = "medspec"
	item_state = "ba_suit"

	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/medspec/skirt
	name = "Medical Specialist's jumpskirt"
	desc = "It's made of a slightly sturdier material than standard jumpskirts, to allow for robust protection. It has the words \"Medical Specialist\" written on the shoulders."
	icon_state = "medspec_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/tactical
	name = "tactical turtleneck"
	desc = "A reinforced military turtleneck, designed to provide moderate combat protection."
	icon_state = "syndicate"

	siemens_coefficient = 0.9

/*
 * Detective
 */
/obj/item/clothing/under/rank/inspector
	name = "ironhammer inspector's turtleneck"
	desc = "A casual turtleneck and jeans serving as civilian inspector clothing."
	icon_state = "insp_under"
	item_state = "insp_under"

	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/inspector/suit
	name = "ironhammer inspector's suit"
	desc = "A rumpled white shirt combined with grey slacks and a tie worn by inspectors."
	icon_state = "detective"
	item_state = "det"

	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/inspector/uniform
	name = "ironhammer inspector's uniform"
	desc = "A tidy black uniform adorned with an ironhammer inspector insignia."
	icon_state = "det_corporate"
	item_state = "det_corporate"

	armor = list(melee = 15, bullet = 10, laser = 10,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/inspector/black
	icon_state = "detective3"

	//item_state = "sl_suit"
	desc = "An immaculate white dress shirt, paired with a pair of dark grey dress pants, a red tie, and a charcoal vest."

/obj/item/clothing/head/rank/inspector
	name = "fedora"
	desc = "A brown fedora - either the cornerstone of a detective's style or a poor attempt at looking cool, depending on the person wearing it."
	icon_state = "detective"
	item_state_slots = list(
		slot_l_hand_str = "det_hat",
		slot_r_hand_str = "det_hat",
		)
	allowed = list(/obj/item/weapon/reagent_containers/food/snacks/candy_corn, /obj/item/weapon/pen)
	armor = list(melee = 10, bullet = 5, energy = 10, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/rank/inspector/grey
	icon_state = "detective2"
	desc = "A grey fedora - either the cornerstone of a detective's style or a poor attempt at looking cool, depending on the person wearing it."

/*
 * Ironhammer Commander
 */
/obj/item/clothing/under/rank/ih_commander
	desc = "It's a jumpsuit worn by those few with the dedication to achieve the position of \"Ironhammer Commander\". It has additional armor to protect the wearer."
	name = "ironhammer commander's jumpsuit"
	icon_state = "hos"
	item_state = "r_suit"

	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/ih_commander/skirt
	name = "Ironhammer Commander's jumpskirt"
	desc = "It's a jumpskirt worn by those few with the dedication to achieve the position of \"Ironhammer Commander\". It has additional armor to protect the wearer."
	icon_state = "hos_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
/obj/item/clothing/head/rank/commander
	name = "ironhammer commander's Hat"
	desc = "The hat of the Ironhammer Commander. For showing the officers who's in charge."
	icon_state = "hoshat"
	body_parts_covered = 0
	siemens_coefficient = 0.8

/obj/item/clothing/head/rank/commander/dermal
	name = "dermal armor Patch"
	desc = "You're not quite sure how you manage to take it on and off, but it implants nicely in your head."
	icon_state = "dermal"
	siemens_coefficient = 0.6

/obj/item/clothing/suit/armor/hos
	name = "armored coat"
	desc = "A greatcoat enhanced with a special alloy for some protection and style."
	icon_state = "hos"
	item_state = "hos"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 50, bullet = 50, energy = 30, bomb = 25, bio = 0, rad = 0)
	flags_inv = HIDEJUMPSUIT
	siemens_coefficient = 0.6

//Jensen cosplay gear
/obj/item/clothing/under/rank/ih_commander/jensen
	desc = "You never asked for anything that stylish."
	name = "Ironhammer Commander's jumpsuit"
	icon_state = "jensen"
	item_state = "jensen"

	siemens_coefficient = 0.6

/obj/item/clothing/suit/armor/hos/jensen
	name = "armored trenchcoat"
	desc = "A trenchcoat augmented with a special alloy for some protection and style."
	icon_state = "jensencoat"
	item_state = "jensencoat"
	flags_inv = 0
	siemens_coefficient = 0.6
	body_parts_covered = UPPER_TORSO|ARMS

/*
 * Navy uniforms
 */

/obj/item/clothing/under/rank/cadet
	name = "Ironhammer Cadet's jumpskirt"
	desc = "It's a sailor's uniform used for cadets in training, though more frequently in acts of hazing."
	icon_state = "cadet"
	item_state = "cadet"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
