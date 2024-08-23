//For now only for synths
/obj/item/organ_module/active/multitool/medical
	name = "embedded medical-aid multitool"
	desc = "A specialized arm implant for quick deploying of medical aid. \
	Has a holder for ointment and gauze as well as splints, a small syringe, a health scanner, a mini fire-b-gone and a clipboard."
	verb_name = "Deploy medical-aid tool"
	items = list(
		/obj/item/stack/medical/bruise_pack/non_consumable,
		/obj/item/stack/medical/ointment/non_consumable,
		/obj/item/stack/medical/splint/non_consumable,
		/obj/item/reagent_containers/syringe,
		/obj/item/device/scanner/health,
		/obj/item/extinguisher/mini,
		/obj/item/clipboard
	)
