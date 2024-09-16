/obj/machinery/smartfridge/secure/medbay/organs
	name = "Organ Freezer"
	desc = "A refrigerated storage unit for organs."
	icon_state = "organfridge"
	icon_on = "organfridge"
	icon_off = "organfridge-off"
	icon_panel = "organfridge-panel"
	icon_fill10 = "organfridge-fill10"
	icon_fill20 = "organfridge-fill20"
	icon_fill30 = "organfridge-fill30"
	var/light_colors = list("red", "yellow", "green")

/obj/machinery/smartfridge/secure/medbay/organs/update_icon()
	..()

	if(!(panel_open && icon_panel))
		add_overlay(image(icon, "fridge_light-top_left-" + pick(light_colors)))
		add_overlay(image(icon, "fridge_light-top_right-" + pick(light_colors)))
		add_overlay(image(icon, "fridge_light-bottom_left-" + pick(light_colors)))
		add_overlay(image(icon, "fridge_light-bottom_right-" + pick(light_colors)))

/obj/machinery/smartfridge/secure/medbay/organs/accept_check(obj/item/O)
	if(istype(O, /obj/item/organ))
		return TRUE
	if(istype(O, /obj/item/modification/organ))
		return TRUE
	if(istype(O, /obj/item/storage/freezer))
		return TRUE
	if(istype(O, /obj/item/computer_hardware/hard_drive/portable/design/omg))
		return TRUE
	if(istype(O, /obj/item/computer_hardware/hard_drive/portable/design/medical))
		return TRUE
	if(istype(O, /obj/item/computer_hardware/hard_drive/portable/design/surgery))
		return TRUE	
	return FALSE

/obj/machinery/smartfridge/secure/medbay/organs/stocked
/obj/machinery/smartfridge/secure/medbay/organs/stocked/New()
	..()
	new /obj/item/storage/freezer(src)
	update_icon()

/obj/machinery/vending/organfridge_aberrant
	name = "Oh My Guts!"
	desc = "Grass-fed organic organs or your money back!"
	icon_state = "organfridge"
	product_slogans = "Don\'t be heartless!;Can you stomach these prices?!;You don\'t have the guts, pal!"
	product_ads = "Don\'t be heartless!;Can you stomach these prices?!;You don\'t have the guts, pal!"
	var/icon_on = "organfridge"
	var/icon_off = "organfridge-off"
	var/icon_panel = "organfridge-panel"
	var/icon_fill10 = "organfridge-fill10"
	var/icon_fill20 = "organfridge-fill20"
	var/icon_fill30 = "organfridge-fill30"
	var/light_colors = list("red", "yellow", "green")
	var/contents_current
	products = list(
		/obj/item/organ/internal/scaffold = 3,
		/obj/item/storage/freezer/medical = 5,
		/obj/item/tool/scalpel/laser = 1,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/input = 6,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/process = 8,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/output = 6
	)
	contraband = list(
		/obj/item/computer_hardware/hard_drive/portable/design/omg/teratoma = 1,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/special = 2,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/input/uncommon = 2,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/output/uncommon = 2
	)
	prices = list(
		/obj/item/organ/internal/scaffold = 100,
		/obj/item/storage/freezer/medical = 25,
		/obj/item/tool/scalpel/laser = 125,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/input = 200,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/process = 200,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/output = 200,
		/obj/item/computer_hardware/hard_drive/portable/design/omg/teratoma = 0,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/special = 200,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/input/uncommon = 300,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/output/uncommon = 300
	)

/obj/machinery/vending/organfridge_aberrant/New()
	..()
	var/light_color = pick(\
		COLOR_LIGHTING_RED_DARK,\
		COLOR_LIGHTING_BLUE_DARK,\
		COLOR_LIGHTING_GREEN_DARK,\
		COLOR_LIGHTING_ORANGE_DARK,\
		COLOR_LIGHTING_PURPLE_DARK,\
		COLOR_LIGHTING_CYAN_DARK\
		)
	set_light(1.4, 1, light_color)
	earnings_account = department_accounts[vendor_department]

	contents_current = 0
	for(var/i in products)
		contents_current += products[i]
	for(var/i in contraband)
		contents_current += contraband[i]

	wires = new /datum/wires/vending/intermediate(src)

	update_icon()

/obj/machinery/vending/organfridge_aberrant/update_icon()
	cut_overlays()
	if(stat & (BROKEN|NOPOWER))
		icon_state = icon_off
	else
		icon_state = icon_on

	if(panel_open && icon_panel)
		add_overlay(image(icon, icon_panel))
	else
		add_overlay(image(icon, "fridge_light-top_left-" + pick(light_colors)))
		add_overlay(image(icon, "fridge_light-top_right-" + pick(light_colors)))
		add_overlay(image(icon, "fridge_light-bottom_left-" + pick(light_colors)))
		add_overlay(image(icon, "fridge_light-bottom_right-" + pick(light_colors)))

	if(contents_current > 0)
		if(contents_current <= 10)
			add_overlay(image(icon, icon_fill10))
		else if(contents_current <= 20)
			add_overlay(image(icon, icon_fill20))
		else
			add_overlay(image(icon, icon_fill30))

	if(icon_state == icon_on)
		add_overlay(image(icon, "organfridge_screen-omg"))


/obj/machinery/vending/organfridge_aberrant/attackby()
	. = ..()
	update_icon()	// Vending code doesn't update the whole sprite when the panel is opened/closed

/obj/machinery/vending/organfridge_aberrant/vend()
	..()
	contents_current -= 1
	update_icon()

/obj/machinery/vending/organfridge_aberrant/stock()
	..()
	contents_current += 1
	update_icon()

/obj/machinery/vending/organfridge_aberrant/alt
	products = list(
		/obj/item/organ/internal/scaffold = 3,
		/obj/item/storage/freezer/medical = 5,
		/obj/item/tool/scalpel/laser = 1,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/input/uncommon = 6,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/process = 8,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/output/uncommon = 6
	)
	contraband = list(
		/obj/item/computer_hardware/hard_drive/portable/design/omg/teratoma_rare = 1,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/special = 2,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/input/rare = 2,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/output/rare = 2
	)
	prices = list(
		/obj/item/organ/internal/scaffold = 100,
		/obj/item/storage/freezer/medical = 25,
		/obj/item/tool/scalpel/laser = 125,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/input/uncommon = 300,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/output/uncommon = 300,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/process = 200,
		/obj/item/computer_hardware/hard_drive/portable/design/omg/teratoma_rare = 0,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/special = 200,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/input/rare = 400,
		/obj/item/organ/internal/scaffold/aberrant/teratoma/output/rare = 400
	)

/obj/machinery/vending/organfridge_aberrant/simple
	name = "OMG! The Classics"
	desc = "The classic organs from the original OMG! Mart. Oh My Guts!"
	product_slogans = "Do you have the guts?;Your liver will thank you!;It's what\'s on the inside that counts!"
	product_ads = "Do you have the guts?;Your liver will thank you!;It's what\'s on the inside that counts!"
	products = list(
		/obj/item/storage/freezer/medical = 5,
		/obj/item/organ/internal/scaffold/aberrant/scrub_toxin/blood = 3,
		/obj/item/organ/internal/scaffold/aberrant/scrub_toxin/ingest = 3,
		/obj/item/organ/internal/scaffold/aberrant/scrub_toxin/touch = 3
	)
	contraband = list(
		/obj/item/computer_hardware/hard_drive/portable/design/omg/simple = 1,
		/obj/item/organ/internal/scaffold/aberrant/gastric = 3,
		/obj/item/organ/internal/scaffold/aberrant/damage_response = 3
	)
	prices = list(
		/obj/item/storage/freezer/medical = 25,
		/obj/item/organ/internal/scaffold/aberrant/scrub_toxin/blood = 400,
		/obj/item/organ/internal/scaffold/aberrant/scrub_toxin/ingest = 400,
		/obj/item/organ/internal/scaffold/aberrant/scrub_toxin/touch = 400,
		/obj/item/computer_hardware/hard_drive/portable/design/omg/simple = 0,
		/obj/item/organ/internal/scaffold/aberrant/gastric = 400,
		/obj/item/organ/internal/scaffold/aberrant/damage_response = 400
	)

/obj/machinery/vending/organfridge_aberrant/alcoholic
	name = "OMG! Discount Organs"
	desc = "Humanely harvested discount organs! Oh My Guts!"
	product_slogans = "Get a heart on!;At least, you\'ll be beautiful on the inside!;No guts, no glory!"
	product_ads = "Get a heart on!;At least, you\'ll be beautiful on the inside!;No guts, no glory!"
	products = list(
		/obj/item/storage/freezer/medical = 10,
		/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/liver = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/stomach = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/kidney = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/liver = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/stomach = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/kidney = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/classy/liver = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/classy/stomach = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/classy/kidney = 3
	)
	contraband = list(
		/obj/item/computer_hardware/hard_drive/portable/design/omg/alcoholic = 1,
		/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater = 5,
		/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic = 5,
		/obj/item/organ/internal/scaffold/aberrant/dependent/classy = 5
	)
	prices = list(
		/obj/item/storage/freezer/medical = 25,
		/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/liver = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/stomach = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/kidney = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/liver = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/stomach = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/kidney = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/classy/liver = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/classy/stomach = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/classy/kidney = 750,
		/obj/item/computer_hardware/hard_drive/portable/design/omg/alcoholic = 0,
		/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater = 500,
		/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic = 500,
		/obj/item/organ/internal/scaffold/aberrant/dependent/classy = 500
	)

/obj/machinery/vending/organfridge_aberrant/addict
	name = "OMG! Refurbished Organs"
	desc = "Humanely harvested refurbished organs! Oh My Guts!"
	product_slogans = "Bad kidney? Sounds like you\'re in trouble.;You only liver once!;I've got you under my skin!"
	product_ads = "Bad kidney? Sounds like you\'re in trouble.;You only liver once!;I've got you under my skin!"
	products = list(
		/obj/item/storage/freezer/medical = 10,
		/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/blood_vessel = 6,
		/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/liver = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/muscle = 6,
		/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/blood_vessel = 6,
		/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/liver = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/kidney = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/blood_vessel = 6,
		/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/liver = 3,
		/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/muscle = 6
	)
	contraband = list(
		/obj/item/computer_hardware/hard_drive/portable/design/omg/addict = 1,
		/obj/item/organ/internal/scaffold/aberrant/dependent/mobster = 5,
		/obj/item/organ/internal/scaffold/aberrant/dependent/chemist = 5,
		/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary = 5
	)
	prices = list(
		/obj/item/storage/freezer/medical = 25,
		/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/blood_vessel = 500,
		/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/liver = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/muscle = 500,
		/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/blood_vessel = 500,
		/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/liver = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/kidney = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/blood_vessel = 600,
		/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/liver = 750,
		/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/muscle = 500,
		/obj/item/computer_hardware/hard_drive/portable/design/omg/addict = 0,
		/obj/item/organ/internal/scaffold/aberrant/dependent/mobster = 500,
		/obj/item/organ/internal/scaffold/aberrant/dependent/chemist = 500,
		/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary = 500
	)

// Unused organ slogan ideas: "Come back if you have a change of heart!;Broken heart? We've got you covered!;;I've got you deep in the heart of me!;Owner of a lonely heart?; Owner of a broken heart?"
//						 "Wanna liver 'nother day?;Cry me a liver!;You got a bone to pick with me?;Let liver let die!;Bone appetit!"
