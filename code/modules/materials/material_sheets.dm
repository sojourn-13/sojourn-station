// Stacked resources. They use a material datum for a lot of inherited values.
/obj/item/stack/material
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_NORMAL
	icon = 'icons/obj/stack/material.dmi'
	throw_speed = 3
	throw_range = 3
	max_amount = 120

	var/default_type = MATERIAL_STEEL
	var/material/material
	var/apply_colour //temp pending icon rewrite

/obj/item/stack/material/New(loc, material_count=null)
	.=..(loc, material_count)
	//Make shards if there is a remainder for any reason. If it rounds down to zero, remove it.'
	var/remainder = amount - round(amount, 1)
	if(remainder != 0)
		log_debug("Item: [type] Initial amount:[amount] Remainder: [remainder]")
		amount -= remainder
		new /obj/item/material/shard(get_turf(src), default_type, remainder)
		if(amount == 0)
			qdel(src)
			return

/obj/item/stack/material/Initialize()
	. = ..()
	pixel_x = rand(0,10)-5
	pixel_y = rand(0,10)-5

	if(!default_type)
		default_type = MATERIAL_STEEL
	material = get_material_by_name("[default_type]")
	if(!material)
		return INITIALIZE_HINT_QDEL

	stacktype = material.stack_type
	if(islist(material.stack_origin_tech))
		origin_tech = material.stack_origin_tech.Copy()

	if(apply_colour)
		color = material.icon_colour

	if(material.conductive)
		flags |= CONDUCT

	matter = material.get_matter()
	update_strings()
/*
/obj/item/stack/material/get_matter()
	. = list()
	if(matter)
		for(var/i in matter)
			matter[i] = amount
		. = matter
*/
/obj/item/stack/material/attack_self(mob/living/user)
	user.craft_menu()

/obj/item/stack/material/get_material()
	return material

/obj/item/stack/material/proc/get_default_type()
	return default_type

/obj/item/stack/material/proc/update_strings()
	// Update from material datum.
	singular_name = material.sheet_singular_name

	if(amount>1)
		name = "[material.use_name] [material.sheet_plural_name]"
		desc = "A stack of [material.use_name] [material.sheet_plural_name]."
		gender = PLURAL
	else
		name = "[material.use_name] [material.sheet_singular_name]"
		desc = "A [material.sheet_singular_name] of [material.use_name]."
		gender = NEUTER

/obj/item/stack/material/use(var/used)
	. = ..()
	update_strings()
	return

/obj/item/stack/material/transfer_to(obj/item/stack/S, var/tamount=null, var/type_verified)
	var/obj/item/stack/material/M = S
	if(!M || !istype(M) || material.name != M.material.name)
		return 0
	var/transfer = ..(S,tamount,1)
	if(src) update_strings()
	if(M) M.update_strings()
	return transfer

/obj/item/stack/material/attack_self(var/mob/user)
	if(!material.build_windows(user, src))
		..()

/obj/item/stack/material/attackby(var/obj/item/W, var/mob/user)
	if(istype(W,/obj/item/stack/cable_coil))
		material.build_wired_product(user, W, src)
		return
	else if(istype(W, /obj/item/stack/rods))
		material.build_rod_product(user, W, src)
		return
	return ..()

/obj/item/stack/material/add(var/extra)
	..()
	update_strings()


/obj/item/stack/material/iron
	name = "iron"
	icon_state = "sheet-iron"
	default_type = MATERIAL_IRON
	price_tag = 1
	novariants = FALSE

/obj/item/stack/material/iron/random
	rand_min = 3
	rand_max = 8

/obj/item/stack/material/iron/full
	amount = 120

/obj/item/stack/material/iron/five
	name = "five iron bars"
	amount = 5

/obj/item/stack/material/iron/ten
	name = "ten iron bars"
	amount = 10

/obj/item/stack/material/sandstone
	name = "sandstone brick"
	icon_state = "sheet-sandstone"
	default_type = MATERIAL_SANDSTONE
	price_tag = 1

/obj/item/stack/material/sandstone/five
	name = "five sandstone brick"
	amount = 5

/obj/item/stack/material/sandstone/ten
	name = "ten sandstone brick"
	amount = 10

/obj/item/stack/material/marble
	name = "marble brick"
	icon_state = "sheet-marble"
	default_type = MATERIAL_MARBLE

/obj/item/stack/material/marble/five
	name = "five marble brick"
	amount = 5

/obj/item/stack/material/marble/ten
	name = "ten marble brick"
	amount = 10

/obj/item/stack/material/diamond
	name = "diamond"
	icon_state = "sheet-diamond"
	default_type = MATERIAL_DIAMOND
	price_tag = 25
	novariants = FALSE

/obj/item/stack/material/diamond/full
	amount = 120

/obj/item/stack/material/diamond/random
	rand_min = 1
	rand_max = 5

/obj/item/stack/material/diamond/tenstack
	rand_min = 10
	rand_max = 12

/obj/item/stack/material/durasteel
	name = "durasteel"
	icon_state = "sheet-durasteel"
	default_type = MATERIAL_DURASTEEL
	price_tag = 1000

/obj/item/stack/material/uranium
	name = MATERIAL_URANIUM
	icon_state = "sheet-uranium"
	default_type = MATERIAL_URANIUM
	price_tag = 10
	novariants = FALSE

/obj/item/stack/material/uranium/full
	amount = 120

/obj/item/stack/material/uranium/random
	rand_min = 2
	rand_max = 5

/obj/item/stack/material/plasma
	name = "solid plasma"
	icon_state = "sheet-plasma" //Sprites by CeUvi#1236
	default_type = MATERIAL_PLASMA
	price_tag = 8
	novariants = FALSE

/obj/item/stack/material/plasma/random
	rand_min = 3
	rand_max = 5

/obj/item/stack/material/plasma/full
	amount = 120

/obj/item/stack/material/plastic
	name = "plastic"
	icon_state = "sheet-plastic"
	default_type = MATERIAL_PLASTIC
	price_tag = 2
	novariants = FALSE

/obj/item/stack/material/plastic/five
	name = "five plastic sheets"
	amount = 5

/obj/item/stack/material/plastic/ten
	name = "ten plastic sheets"
	amount = 10

/obj/item/stack/material/plastic/full
	amount = 120

/obj/item/stack/material/plastic/random
	rand_min = 3
	rand_max = 10

/obj/item/stack/material/gold
	name = "gold"
	icon_state = "sheet-gold"
	default_type = MATERIAL_GOLD
	price_tag = 10
	novariants = FALSE

/obj/item/stack/material/gold/full
	amount = 120

/obj/item/stack/material/gold/random
	rand_min = 2
	rand_max = 6

/obj/item/stack/material/silver
	name = MATERIAL_SILVER
	icon_state = "sheet-silver"
	default_type = MATERIAL_SILVER
	price_tag = 5
	novariants = FALSE

/obj/item/stack/material/silver/random
	rand_min = 3
	rand_max = 8

/obj/item/stack/material/silver/full
	amount = 120

//Valuable resource, cargo can sell it.
/obj/item/stack/material/platinum
	name = "platinum"
	icon_state = "sheet-platinum"
	default_type = MATERIAL_PLATINUM
	price_tag = 20
	novariants = FALSE

/obj/item/stack/material/platinum/random
	rand_min = 1
	rand_max = 6

/obj/item/stack/material/platinum/full
	amount = 120

//Extremely valuable to Research.
/obj/item/stack/material/mhydrogen
	name = "metallic hydrogen"
	icon_state = "sheet-hydrogen"
	default_type = MATERIAL_MHYDROGEN
	price_tag = 10
	novariants = FALSE

/obj/item/stack/material/mhydrogen/full
	amount = 120

//Fuel for MRSPACMAN generator.
/obj/item/stack/material/tritium
	name = "tritium"
	icon_state = "sheet-silver"
	default_type = MATERIAL_TRITIUM
	apply_colour = 1
	price_tag = 10

/obj/item/stack/material/tritium/full
	amount = 120

/obj/item/stack/material/osmium
	name = "osmium"
	icon_state = "sheet-silver"
	default_type = MATERIAL_OSMIUM
	apply_colour = 1
	price_tag = 12

/obj/item/stack/material/osmium/full
	amount = 120

/obj/item/stack/material/steel
	name = MATERIAL_STEEL
	icon_state = "sheet-metal"
	default_type = MATERIAL_STEEL
	price_tag = 2
	novariants = FALSE

/obj/item/stack/material/steel/five
	name = "five steel sheets"
	amount = 5

/obj/item/stack/material/steel/ten
	name = "ten steel sheets"
	amount = 10

//A stack which starts with the max amount
/obj/item/stack/material/steel/full
	amount = 120

/obj/item/stack/material/steel/random
	rand_min = 3
	rand_max = 10

/obj/item/stack/material/plasteel
	name = "plasteel"
	icon_state = "sheet-plasteel"
	item_state = "sheet-metal"
	default_type = MATERIAL_PLASTEEL
	price_tag = 8
	novariants = FALSE

/obj/item/stack/material/plasteel/full
	amount = 120

/obj/item/stack/material/plasteel/random
	rand_min = 3
	rand_max = 8

/obj/item/stack/material/wood
	name = "wooden plank"
	icon_state = "sheet-wood"
	icon = 'icons/obj/stack/material.dmi'
	default_type = MATERIAL_WOOD
	price_tag = 1 //Way to easy to get on mass.

/obj/item/stack/material/wood/five
	name = "five wood plank"
	amount = 5

/obj/item/stack/material/wood/ten
	name = "ten wood plank"
	amount = 10

/obj/item/stack/material/wood/full
	amount = 120

/obj/item/stack/material/wood/random
	rand_min = 3
	rand_max = 10

/obj/item/stack/material/cloth
	name = "cloth"
	icon_state = "sheet-cloth"
	default_type = MATERIAL_CLOTH
	price_tag = 1

/obj/item/stack/material/cloth/five
	name = "five cloth sheets"
	amount = 5

/obj/item/stack/material/cloth/ten
	name = "ten cloth sheets"
	amount = 10

/obj/item/stack/material/cloth/random
	rand_min = 3
	rand_max = 7

/obj/item/stack/material/cloth/soteria
	amount = 4

/obj/item/stack/material/cloth/biogen
	amount = 5

/obj/item/stack/material/silk
	name = "silk"
	icon_state = "sheet_silk_bundle"
	default_type = MATERIAL_SILK //We dont work as cloth
	price_tag = 10

/obj/item/stack/material/cardboard
	name = "cardboard"
	icon_state = "sheet-card"
	default_type = MATERIAL_CARDBOARD
	price_tag = 3

/obj/item/stack/material/cardboard/five
	name = "five cardboard sheets"
	amount = 5

/obj/item/stack/material/cardboard/ten
	name = "ten cardboard sheets"
	amount = 10


/obj/item/stack/material/cardboard/full
	amount = 120

/obj/item/stack/material/cardboard/random
	rand_min = 5
	rand_max = 10

/obj/item/stack/material/leather
	name = "leather"
	desc = "The by-product of skinning local wildlife."
	icon_state = "sheet-leather"
	default_type = MATERIAL_LEATHER
	price_tag = 10

/obj/item/stack/material/leather/biogen
	amount = 5

/obj/item/stack/material/bone
	name = "bones"
	desc = "A collection of random bones and bits."
	icon_state = "sheet_bones"
	default_type = MATERIAL_BONE
	price_tag = 10

/obj/item/stack/material/glass
	name = MATERIAL_GLASS
	icon_state = "sheet-glass"
	default_type = MATERIAL_GLASS
	price_tag = 2
	novariants = FALSE

/obj/item/stack/material/glass/five
	name = "five glass sheets"
	amount = 5

/obj/item/stack/material/glass/ten
	name = "ten glass sheets"
	amount = 10

/obj/item/stack/material/glass/full
	amount = 120

/obj/item/stack/material/glass/random
	rand_min = 3
	rand_max = 15

/obj/item/stack/material/glass/reinforced
	name = "reinforced glass"
	icon_state = "sheet-rglass"
	default_type = MATERIAL_RGLASS

/obj/item/stack/material/glass/plasmaglass
	name = "borosilicate glass"
	desc = "This sheet is special plasma-glass alloy designed to withstand large temperatures"
	singular_name = "borosilicate glass sheet"
	icon_state = "sheet-plasmaglass"
	default_type = MATERIAL_PLASMAGLASS
	price_tag = 6

/obj/item/stack/material/glass/plasmaglass/full
	amount = 120

/obj/item/stack/material/glass/plasmaglass/random
	rand_min = 3
	rand_max = 8

/obj/item/stack/material/glass/plasmarglass
	name = "reinforced borosilicate glass"
	desc = "This sheet is special plasma-glass alloy designed to withstand large temperatures. It is reinforced with few rods."
	singular_name = "reinforced borosilicate glass sheet"
	icon_state = "sheet-plasmarglass"
	default_type = MATERIAL_RPLASMAGLASS
	price_tag = 12

/obj/item/stack/material/glass/plasmarglass/full
	amount = 120

/obj/item/stack/material/biomatter
	name = "biomatter"
	desc = "An another by-product of mob grinding. Feels soft and... Strange."
	singular_name = "biomatter sheet"
	icon_state = "sheet-biomatter"
	default_type = MATERIAL_BIOMATTER
	price_tag = 1 //to keep biomatter in the player economy as the church and science use it.
	novariants = FALSE
	var/biomatter_in_sheet = BIOMATTER_PER_SHEET // defined in solidifier.dm

/obj/item/stack/material/biomatter/random
	rand_min = 5
	rand_max = 8

/obj/item/stack/material/biomatter/full
	amount = 120

/obj/item/stack/material/compressed_matter
	name = "compressed matter"
	desc = "Useful matter that has been compressed and squeezed into cartridges."
	singular_name = "compressed matter cartridge"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "rcd"
	item_state = "rcdammo"
	default_type = MATERIAL_COMPRESSED_MATTER
	price_tag = 30

/obj/item/stack/material/compressed_matter/random
	rand_min = 15
	rand_max = 30

/obj/item/stack/material/compressed_matter/full
	amount = 120

/obj/item/stack/material/ameridian
	name = "ameridian shard"
	desc = "A weird green crystal that seems to grow on its own."
	singular_name = "ameridian crystal"
	icon = 'icons/obj/ameridian.dmi'
	icon_state = "ameridian_crystal_item"
	default_type = MATERIAL_AMERIDIAN
	novariants = TRUE
	price_tag = 50 // Ameridian mining is extremly dangerous and very profitable
	max_amount = 360

/obj/item/stack/material/ameridian/full
	amount = 360
