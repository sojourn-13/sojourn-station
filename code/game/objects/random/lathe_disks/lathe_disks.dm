/obj/random/lathe_disk
	name = "random lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/item_to_spawn() // pickweight is calculated from advanced list = / 2 - 1. If lower than 1 - delete from the list;
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/misc = 5,
				/obj/item/computer_hardware/hard_drive/portable/design/components = 7,
				/obj/random/lathe_disk/tools = 5,
				/obj/item/computer_hardware/hard_drive/portable/design/logistics = 6,
				/obj/item/computer_hardware/hard_drive/portable/design/computer = 6,
				/obj/random/lathe_disk/medical = 1,
				/obj/item/computer_hardware/hard_drive/portable/advanced/coin = 1, //Not to common to ruin the balance of that
				/obj/random/lathe_disk/any_gun = 10,
				/obj/random/lathe_disk/better_any_gun = 2))

/obj/random/lathe_disk/low_chance
	name = "low chance random lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/advanced
	name = "random advanced lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/advanced/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/adv_tools = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/medical/advanced = 2,
				/obj/random/lathe_disk/medical = 1,
				/obj/random/lathe_disk/any_gun = 5,
				/obj/random/lathe_disk/better_any_gun = 3))

/obj/random/lathe_disk/advanced/low_chance
	name = "low chance advanced lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80
