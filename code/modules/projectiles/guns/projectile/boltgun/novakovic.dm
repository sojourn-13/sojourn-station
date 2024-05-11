/obj/item/gun/projectile/boltgun/sa
	name = "\"Novakovic\" boltgun"
	desc = "Weapon for hunting, or endless trench warfare. \
			If you're on a budget, it's a darn good rifle for just about everything. \
			This copy, in fact, is a reverse-engineered poor-quality copy of a more perfect copy of an ancient rifle"
	icon = 'icons/obj/guns/projectile/boltgun_wood.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	max_shells = 5
	price_tag = 450
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 10)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/boltgun/sawn/sa
	serial_type = "Hunt Inc."
	gun_parts = list(/obj/item/part/gun/frame/boltgun = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/lrifle/steel = 1)

/obj/item/gun/projectile/boltgun/sawn/sa
	name = "\"obrez\" boltgun"
	icon = 'icons/obj/guns/projectile/sawnoff/boltgun_wood.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	max_shells = 5
	init_recoil = HMG_RECOIL(0.8)
	matter = list(MATERIAL_STEEL = 10, MATERIAL_WOOD = 4)
	saw_off = FALSE
	serial_type = "Hunt Inc."
	gun_parts = list(/obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/stack/material/steel = 2)

