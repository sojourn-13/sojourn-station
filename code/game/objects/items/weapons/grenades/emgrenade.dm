/obj/item/grenade/empgrenade
	name = "HS EMP grenade \"Frye\""
	desc = "EMP grenade, designed to disable electronics, augmentations and energy weapons."
	icon_state = "emp"
	item_state = "empgrenade"
	origin_tech = list(TECH_MATERIAL = 2, TECH_MAGNET = 3)
	var/pluse_range_h = 4
	var/pluse_range_l = 10

/obj/item/grenade/empgrenade/prime()
	..()
	if(empulse(src, pluse_range_h, pluse_range_l))
		icon_state = "emp_off"
		desc = "[initial(desc)] It has already been used."
	return

/obj/item/grenade/empgrenade/low_yield
	name = "HS EMP grenade \"Power Zapper\" - C"
	desc = "A weaker variant of the \"Frye\" emp grenade, with lesser radius."
	icon_state = "lyemp"
	item_state = "empgrenade"
	pluse_range_h = 1
	pluse_range_l = 4

/obj/item/grenade/empgrenade/impact
	name = "HS EMP-I grenade \"Pluser\" - C"
	desc = "A weaker variant of the \"Power Zapper\" emp grenade, with even lesser radius."
	pluse_range_h = 0
	pluse_range_l = 2
	impact = TRUE