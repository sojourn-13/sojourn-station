/obj/item/organ/internal/stomach
	name = "stomach"
	desc = "A bottomless pit."
	icon_state = "stomach"
	organ_efficiency = list(OP_STOMACH = 100)
	parent_organ_base = BP_CHEST
	price_tag = 700
	blood_req = 5
	max_blood_storage = 25
	oxygen_req = 5
	w_class = ITEM_SIZE_SMALL

/obj/item/organ/internal/stomach/prosthetic
	name = "prosthetic stomach"
	desc = "A metal stomach, work just as well as a normal one."
	//icon_state = "stomach-prosthetic" // No prosthetic stomach sprites.
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)
	organ_efficiency = list(OP_STOMACH = 100)

/obj/item/organ/internal/stomach/plant
	name = "enzyme pouch"
	desc = "An enzyme stomach, work just as well as a normal one, designed for plantoids."
	icon_state = "stomach_plant"

/obj/item/organ/internal/stomach/improved
	name = "improved stomach"
	desc = "A bottomless pit with extra bottoms tacked on."
	icon_state = "endless_stomach"
	organ_efficiency = list(OP_STOMACH = 150)
	price_tag = 1150


/obj/item/organ/internal/stomach/improved/exalt
	name = "exalt stomach"
	desc = "A bottomless pit for holding only the most refined of foods.\
	Likely worth more on the black market."

