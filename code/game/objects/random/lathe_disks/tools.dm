/obj/random/lathe_disk/tools
	name = "random tools lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/tools/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/misc = 6,
				/obj/item/computer_hardware/hard_drive/portable/design/adv_tools = 3,
				/obj/random/lathe_disk/medical = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/security = 5))

/obj/random/lathe_disk/tools/low_chance
	name = "low chance advanced lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80


/obj/random/lathe_disk/medical
	name = "random tools lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/medical/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/misc = 4,
				/obj/item/computer_hardware/hard_drive/portable/design/medical = 3,
				/obj/item/computer_hardware/hard_drive/portable/design/medical/advanced = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/surgery = 1))

/obj/random/lathe_disk/medical/low_chance
	name = "low chance advanced lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80
