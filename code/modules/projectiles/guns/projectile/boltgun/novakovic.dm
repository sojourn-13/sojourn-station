/obj/item/gun/projectile/boltgun/sa
	name = "\"Novakovic\" boltgun"
	desc = "Weapon for hunting, or endless trench warfare. \
			If you're on a budget, it's a darn good rifle for just about everything. \
			This copy, in fact, is a reverse-engineered poor-quality copy of a more perfect copy of an ancient rifle"
	icon = 'icons/obj/guns/projectile/boltgun_wood.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	max_shells = 5
	price_tag = 300
	recoil_buildup = 12 //Slightly lower than the Kardeshev but not a 50% difference like the other.
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 10)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/boltgun/sawn/sa
	serial_type = "Hunt Inc."

/obj/item/gun/projectile/boltgun/sawn/sa
	name = "\"obrez\" boltgun"
	icon = 'icons/obj/guns/projectile/sawnoff/boltgun_wood.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	max_shells = 5
	one_hand_penalty = 10
	matter = list(MATERIAL_STEEL = 10, MATERIAL_WOOD = 4)
	saw_off = FALSE
	serial_type = "Hunt Inc."
