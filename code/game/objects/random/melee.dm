/obj/random/knife
	name = "random knife"
	icon_state = "tool-red"

/obj/random/knife/item_to_spawn()
	return pickweight(list(/obj/item/weapon/material/butterfly = 1,
				/obj/item/weapon/material/butterfly/switchblade = 2,
				/obj/item/weapon/tool/knife = 1,
				/obj/item/weapon/tool/knife/boot = 0.5,
				/obj/item/weapon/tool/knife/hook = 2,
				/obj/item/weapon/tool/knife/ritual = 0.5,
				/obj/item/weapon/tool/scythe = 0.3,
				/obj/item/weapon/tool/sword = 0.2,
				/obj/item/weapon/tool/sword/machete = 0.5,
				/obj/item/weapon/tool/sword/saber/cutlass = 0.2,
				/obj/item/weapon/tool/sword/saber = 0.2,
				/obj/item/weapon/tool/sword/katana = 0.2,
				/obj/item/weapon/tool/knife/butch = 2))

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

/obj/random/melee
	name = "random bludgeon"
	icon_state = "tool-red"

/obj/random/melee/item_to_spawn()
	return pickweight(list(/obj/item/weapon/tool/homewrecker = 1,
				/obj/item/weapon/melee/telebaton = 2,
				/obj/item/weapon/melee/nailstick = 2,
				/obj/item/weapon/melee/toolbox_maul = 2,
				/obj/item/weapon/melee/classic_baton = 1,
				/obj/item/weapon/melee/chainofcommand = 0.3,
				/obj/item/weapon/shield/riot = 0.2,
				/obj/item/weapon/shield/riot/handmade = 0.5,
				/obj/item/weapon/shield/riot/handmade/tray = 0.2,
				/obj/item/weapon/shield/riot/handmade/lid = 0.2,
				/obj/item/weapon/material/baseballbat = 2))

/obj/random/melee/low_chance
	name = "low chance random bludgeon"
	icon_state = "tool-red-low"
	spawn_nothing_percentage = 80