/*
 * Crafting Items
 * Items used only in crafting other items
*/

/obj/item/rocket_engine
	name = "rocket engine"
	desc = "A singular rocket engine, used in assisted ballistics."
	icon_state = "rocket_engine"
	origin_tech = list(TECH_ENGINEERING = 3, TECH_POWER = 4)
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_GOLD = 1)

/obj/item/part
	icon ='icons/obj/crafts.dmi'
	price_tag = 300
	spawn_tags = SPAWN_TAG_PART

/obj/item/part/armor
	name = "armor part"
	desc = "Spare part of armor."
	icon_state = "armor_part"
	spawn_tags = SPAWN_TAG_PART_ARMOR
	matter = list(MATERIAL_PLASTIC = 5, MATERIAL_WOOD = 5, MATERIAL_CARDBOARD = 5, MATERIAL_STEEL = 5)

/obj/item/part/armor/artwork
	desc = "This is an artistically-made armor part."

/obj/item/part/armor/artwork/Initialize()
	name = get_weapon_name(capitalize = TRUE)
	AddComponent(/datum/component/atom_sanity, 0.2 + pick(0,0.1,0.2), "")
	price_tag += rand(0, 500)
	return ..()

/obj/item/part/armor/artwork/get_item_cost(export)
	. = ..()
	GET_COMPONENT(comp_sanity, /datum/component/atom_sanity)
	. += comp_sanity.affect * 100

/obj/item/part/gun
	name = "gun part"
	desc = "Spare part of gun."
	icon_state = "gun_part_1"
	spawn_tags = SPAWN_TAG_GUN_PART
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_PLASTEEL = 5)
	var/generic = TRUE

/obj/item/part/gun/Initialize()
	. = ..()
	if(generic)
		icon_state = "gun_part_[rand(1,6)]"

/obj/item/part/gun/artwork
	desc = "This is an artistically-made gun part."

/obj/item/part/gun/artwork/Initialize()
	name = get_weapon_name(capitalize = TRUE)
	AddComponent(/datum/component/atom_sanity, 0.2 + pick(0,0.1,0.2), "")
	price_tag += rand(0, 500)
	return ..()

/obj/item/part/gun/artwork/get_item_cost(export)
	. = ..()
	GET_COMPONENT(comp_sanity, /datum/component/atom_sanity)
	. += comp_sanity.affect * 100
