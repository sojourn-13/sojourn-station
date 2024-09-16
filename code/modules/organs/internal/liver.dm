/obj/item/organ/internal/liver
	name = "liver"
	icon_state = "liver"
	organ_efficiency = list(OP_LIVER = 100)
	parent_organ_base = BP_GROIN
	blood_req = 5
	max_blood_storage = 25
	oxygen_req = 7
	nutriment_req = 5
	price_tag = 800
	w_class = ITEM_SIZE_SMALL

/obj/item/organ/internal/liver/plant
	name = "plant sprout"
	desc = "A lively sprout of a plant that acts like a filter and processer for different reagents that it sucks up."
	icon_state = "liver_plant"

/obj/item/organ/internal/liver/prosthetic
	name = "prosthetic liver"
	desc = "A liver made of metal. Does the same job as a normal liver, and just as well."
	icon_state = "liver-prosthetic"
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)
	organ_efficiency = list(OP_LIVER = 100)

/obj/item/organ/internal/liver/big
	name = "big liver"
	icon_state = "liver_big"
	organ_efficiency = list(OP_LIVER = 150)
	specific_organ_size = 1.2
	price_tag = 900

/obj/item/organ/internal/liver/big/exalt
	name = "exalt liver"
	desc = "A robust liver for filtering robust chemicals."
	specific_organ_size = 1
