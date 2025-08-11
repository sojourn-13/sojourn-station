//Biosuit complete with shoes (in the item sprite)
/obj/item/clothing/head/bio_hood
	name = "bio hood"
	icon_state = "bio_general"
	item_state_slots = list(
		slot_l_hand_str = "bio_hood",
		slot_r_hand_str = "bio_hood",
		)
	desc = "A hood that protects the head and face from biological comtaminants."
	permeability_coefficient = 0.01
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 100,
		rad = 25
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES|EARS
	item_flags = COVER_PREVENT_MANIPULATION
	siemens_coefficient = 0.9
	price_tag = 50

/obj/item/clothing/suit/bio_suit
	name = "bio suit"
	desc = "A suit that protects against biological contamination."
	icon_state = "bio"
	item_state = "bio_suit"
	w_class = ITEM_SIZE_BULKY//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	item_flags = COVER_PREVENT_MANIPULATION
	slowdown = 0.4
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 100,
		rad = 25
	)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	siemens_coefficient = 0.9
	price_tag = 100


//Standard biosuit, orange stripe
/obj/item/clothing/head/bio_hood/general
	icon_state = "bio_general"

/obj/item/clothing/suit/bio_suit/general
	icon_state = "bio_general"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL

//Virology biosuit, green stripe
/obj/item/clothing/head/bio_hood/virology
	icon_state = "bio_virology"

/obj/item/clothing/suit/bio_suit/virology
	icon_state = "bio_virology"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL

//Security biosuit, grey with red stripe across the chest
/obj/item/clothing/head/bio_hood/security
	icon_state = "bio_security"

/obj/item/clothing/suit/bio_suit/security
	icon_state = "bio_security"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL

//Janitor's biosuit, grey with purple arms
/obj/item/clothing/head/bio_hood/janitor
	icon_state = "bio_general"

/obj/item/clothing/suit/bio_suit/janitor
	icon_state = "bio_janitor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL


//Scientist's biosuit, white with a pink-ish hue
/obj/item/clothing/head/bio_hood/scientist
	icon_state = "bio_janitor"

/obj/item/clothing/suit/bio_suit/scientist
	icon_state = "bio_scientist"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL

//CMO's biosuit, blue stripe
/obj/item/clothing/suit/bio_suit/cmo
	icon_state = "bio_cmo"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL

/obj/item/clothing/head/bio_hood/cmo
	icon_state = "bio_cmo"

//CMO/CRO biosuit, blue stripe. These ones are made with a disk
/obj/item/clothing/suit/bio_suit/cmo/si_made
	matter = list(
		MATERIAL_PLASTIC = 10,
		MATERIAL_GLASS = 5
	)

/obj/item/clothing/head/bio_hood/cmo/si_made
	matter = list(
		MATERIAL_PLASTIC = 20,
		MATERIAL_GLASS = 10
	)
