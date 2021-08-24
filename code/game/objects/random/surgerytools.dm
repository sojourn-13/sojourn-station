/obj/random/surgery_tool
	name = "random surgery tool"
	icon_state = "meds-blue"

/obj/random/surgery_tool/item_to_spawn()
	return pick(/obj/item/tool/bonesetter,\
				/obj/item/tool/scalpel,\
				/obj/item/tool/scalpel/advanced,\
				/obj/item/tool/scalpel/laser,\
				/obj/item/tool/tape_roll/bonegel,\
				/obj/item/tool/cautery,\
				/obj/item/tool/retractor,\
				/obj/item/tool/saw/circular,\
				/obj/item/tool/hemostat)

/obj/random/surgery_tool/low_chance
	name = "low chance random surgery tool"
	icon_state = "meds-blue-low"
	spawn_nothing_percentage = 60
