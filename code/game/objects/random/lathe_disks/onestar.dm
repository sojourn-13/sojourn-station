
/obj/random/lathe_disk/advanced/onestar
	name = "random onestar lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/advanced/onestar/low_chance
	name = "low chance random onestar lathe disk"
	icon_state = "tech-green"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/advanced/onestar/item_to_spawn()
	return pickweight(list(/obj/item/computer_hardware/hard_drive/portable/design/onestar/stockparts = 8,
						/obj/item/computer_hardware/hard_drive/portable/design/onestar/cog = 5,
						/obj/item/computer_hardware/hard_drive/portable/design/onestar = 5,
						/obj/item/computer_hardware/hard_drive/portable/design/onestar/armor = 5,
						/obj/item/computer_hardware/hard_drive/portable/design/onestar/spring = 5,
						/obj/item/computer_hardware/hard_drive/portable/design/onestar/rivet = 4,
						/obj/item/computer_hardware/hard_drive/portable/design/onestar/nail_gun = 3,
						/obj/item/computer_hardware/hard_drive/portable/design/onestar/scaffold = 2,
						/obj/item/computer_hardware/hard_drive/portable/design/onestar/rebar = 2,
						/obj/item/computer_hardware/hard_drive/portable/design/onestar/trouble_shooter = 1))

