/obj/random/knife
	name = "random knife"
	icon_state = "tool-red"

/obj/random/knife/item_to_spawn()
	return pickweight(list(/obj/item/weapon/material/butterfly = 1,
				/obj/item/weapon/material/butterfly/switchblade = 2,
				/obj/item/weapon/material/knife = 1,
				/obj/item/weapon/material/knife/boot = 0.5,
				/obj/item/weapon/material/knife/hook = 2,
				/obj/item/weapon/material/knife/ritual = 0.5,
				/obj/item/weapon/material/knife/butch = 2))

/obj/random/knife/low_chance
	name = "low chance random knife"
	icon_state = "tool-red-low"
	spawn_nothing_percentage = 80

/obj/random/mat_katana
	name = "random katana"
	icon_state ="tool-red"

/obj/random/mat_katana/item_to_spawn()
	return pickweight(list(/obj/item/weapon/material/sword/katana = 1,
				/obj/item/weapon/material/sword/katana/iron = 1,
				/obj/item/weapon/material/sword/katana/plasteel = 1,
				/obj/item/weapon/material/sword/katana/silver = 1,
				/obj/item/weapon/material/sword/katana/gold = 1,
				/obj/item/weapon/material/sword/katana/platinum = 1,
				/obj/item/weapon/material/sword/katana/uranium = 1,
				/obj/item/weapon/material/sword/katana/plastic = 1,
				/obj/item/weapon/material/sword/katana/diamond = 1))

/obj/random/claymore
	name = "random claymore"
	icon_state = "tool-red"

/obj/random/claymore/item_to_spawn()
	return pickweight(list(/obj/item/weapon/material/sword = 1,
				/obj/item/weapon/material/sword/iron = 1,
				/obj/item/weapon/material/sword/plasteel = 1,
				/obj/item/weapon/material/sword/silver = 1,
				/obj/item/weapon/material/sword/gold = 1,
				/obj/item/weapon/material/sword/platinum = 1,
				/obj/item/weapon/material/sword/uranium = 1,
				/obj/item/weapon/material/sword/plastic = 1,
				/obj/item/weapon/material/sword/diamond = 1))
