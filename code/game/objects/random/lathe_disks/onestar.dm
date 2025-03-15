
/obj/random/lathe_disk/advanced/onestar
	name = "random onestar lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/advanced/onestar/low_chance
	name = "low chance random onestar lathe disk"
	icon_state = "tech-green"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/advanced/onestar/item_to_spawn()
	return pickweight(list(/obj/item/pc_part/drive/disk/design/onestar/stockparts = 8,
						/obj/item/pc_part/drive/disk/design/onestar/cog = 5,
						/obj/item/pc_part/drive/disk/design/onestar = 5,
						/obj/item/pc_part/drive/disk/design/onestar/armor = 5,
						/obj/item/pc_part/drive/disk/design/onestar/spring = 5,
						/obj/item/pc_part/drive/disk/design/onestar/rivet = 4,
						/obj/item/pc_part/drive/disk/design/onestar/nail_gun = 3,
						/obj/item/pc_part/drive/disk/design/onestar/scaffold = 2,
						/obj/item/pc_part/drive/disk/design/onestar/rebar = 2,
						/obj/item/pc_part/drive/disk/design/onestar/trouble_shooter = 1))

