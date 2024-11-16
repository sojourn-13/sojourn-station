/obj/item/storage/pill_bottle/dice
	name = "pack of dice"
	desc = "It's a small container with dice inside."

/obj/item/storage/pill_bottle/dice/populate_contents()
	new /obj/item/dice(src)
	new /obj/item/dice/d20(src)

/*
 * Donut Box
 */

/obj/item/storage/box/donut
	name = "donut box"
	desc = "A small cardboard box for storing donuts."
	icon = 'icons/obj/food.dmi'
	icon_state = "donutbox"
	var/startswith = 6
	max_storage_space = 12 //The amount of starting donuts multiplied by the donut item size to keep only exact space requirement met.
	can_hold = list(/obj/item/reagent_containers/food/snacks/donut)
	foldable = /obj/item/stack/material/cardboard

/obj/item/storage/box/donut/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/food/snacks/donut/normal(src)
	update_icon()

/obj/item/storage/box/donut/update_icon()
	cut_overlays()
	var/i = 0
	for(var/obj/item/reagent_containers/food/snacks/donut/D in contents)
		add_overlay(image('icons/obj/food.dmi', "[i][D.overlay_state]"))
		i++

/obj/item/storage/box/donut/empty
	startswith = 0

/*
 * Emergency Ration Pack
 */

/obj/item/storage/ration_pack
	icon = 'icons/obj/food.dmi'
	icon_state = "erp_closed"
	name = "emergency ration pack"
	desc = "Silvery plastic package, with the letters \"ERP\" pasted onto the front. Seems air tight, and vacuumed sealed. \
	The packaging holds usage information within the fineprint: \
	\"Instructions: Remove contents from packaging, open both MRE container and ration can, use them in-hand to activate thermal heater. \
	Thermal insulation will keep them warm for over four hours. Nutrient paste and morale bar contains medicinal additives for field performance, DO NOT OVER-CONSUME.\""
	can_hold = list(
		/obj/item/reagent_containers/food/snacks,
		/obj/item/storage/fancy/mre_cracker,
		/obj/item/material/kitchen/utensil/spoon/mre
	)
	var/open = FALSE

/obj/item/storage/ration_pack/open(mob/user)
	if (!open)
		to_chat(user, SPAN_NOTICE("You tear \the [src] open."))
		icon_state = "erp_open"
		open = TRUE
	..()

/obj/item/storage/ration_pack/populate_contents()
	if(prob(50))
		new /obj/item/reagent_containers/food/snacks/openable/mre(src)
	else
		new /obj/item/reagent_containers/food/snacks/openable/mre/alt(src)
	new /obj/item/reagent_containers/food/snacks/openable/can(src)
	new /obj/item/storage/fancy/mre_cracker(src)
	new /obj/item/reagent_containers/food/snacks/openable/mre(src)
	new /obj/item/material/kitchen/utensil/spoon/mre(src)
	if(prob(50))
		new /obj/item/reagent_containers/food/snacks/mre_paste(src)
	else
		new /obj/item/reagent_containers/food/snacks/canned_peaches(src)
	if(prob(33))
		new /obj/item/reagent_containers/food/snacks/openable/candy
	else if(prob(33))
		new /obj/item/reagent_containers/food/snacks/openable/candy/shokoladka
	else
		new /obj/item/reagent_containers/food/snacks/openable/candy/dalococh

/obj/item/storage/chewables/tobacco/bad
	name = "can of Rredouane Cuts chewing tobacco"
	desc = "A cheap, widely used replacement for cigarettes finding popularity as an alternative to smoking amongst Solarian military personnel."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "chew_bad"
	item_state = "Fpacket"
	w_class = ITEM_SIZE_TINY
	throwforce = WEAPON_FORCE_HARMLESS
	slot_flags = SLOT_BELT
	storage_slots = 6
	can_hold = list(/obj/item/clothing/mask/chewable/tobacco)
	reagent_flags = REFILLABLE | NO_REACT

/obj/item/storage/chewables/tobacco/bad/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/clothing/mask/chewable/tobacco/bad(src)


/obj/item/storage/chewables/tobacco/deli
	name = "tin of Mendell Smooth chewing tobacco"
	desc = "Packaged and shipped straight from District 8, popularised by the city-slickers of Vega De Rosa."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "chew_deli"
	item_state = "Lpacket"
	w_class = ITEM_SIZE_TINY
	throwforce = WEAPON_FORCE_HARMLESS
	slot_flags = SLOT_BELT
	storage_slots = 6
	can_hold = list(/obj/item/clothing/mask/chewable/tobacco)
	reagent_flags = REFILLABLE | NO_REACT

/obj/item/storage/chewables/tobacco/deli/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/clothing/mask/chewable/tobacco/deli(src)

/obj/item/storage/chewables/tobacco/fine
	name = "tin of Taba-Kamu chewing tobacco"
	desc = "Said to be cultivated by employees of Nojusuru Foods in secret, the strand has been released for the public to enjoy."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "chew_fine"
	item_state = "Dpacket"
	w_class = ITEM_SIZE_TINY
	throwforce = WEAPON_FORCE_HARMLESS
	slot_flags = SLOT_BELT
	storage_slots = 6
	can_hold = list(/obj/item/clothing/mask/chewable/tobacco)
	reagent_flags = REFILLABLE | NO_REACT

/obj/item/storage/chewables/tobacco/fine/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/clothing/mask/chewable/tobacco/fine(src)

/obj/item/storage/chewables/tobacco/nico
	name = "box of Nico-Tine gum"
	desc = "A Sol-approved brand of nicotine gum. Cut out the middleman for your addiction fix."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "chew_nico"
	item_state = "Epacket"
	w_class = ITEM_SIZE_TINY
	throwforce = WEAPON_FORCE_HARMLESS
	slot_flags = SLOT_BELT
	storage_slots = 6
	can_hold = list(/obj/item/clothing/mask/chewable/tobacco)
	reagent_flags = REFILLABLE | NO_REACT

/obj/item/storage/chewables/tobacco/nico/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/clothing/mask/chewable/tobacco/nico(src)

/obj/item/storage/chewables/tobacco/dyn
	name = "tin of Dyn nicotine pouches"
	desc = "A cheaper and dubiously safer alternative to chewing tobacco alternatives."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "chew_dyn"
	item_state = "Ppacket"
	w_class = ITEM_SIZE_TINY
	throwforce = WEAPON_FORCE_HARMLESS
	slot_flags = SLOT_BELT
	storage_slots = 6
	can_hold = list(/obj/item/clothing/mask/chewable/tobacco)
	reagent_flags = REFILLABLE | NO_REACT

/obj/item/storage/chewables/tobacco/dyn/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/clothing/mask/chewable/tobacco/dyn(src)