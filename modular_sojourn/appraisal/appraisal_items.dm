/obj/item/appraisal
	name = "cargo appraisal item"
	desc = "An item that your meant to apprase, but this one seems to be appraisalable..."
	icon = 'modular_sojourn/appraisal/appraisalsprites.dmi'
	icon_state = "bottler_box"
	w_class = ITEM_SIZE_NORMAL
	matter = list(MATTER_STEEL = 10, MATTER_GLASS = 10)
	var/is_counterfeit = FALSE
	var/appraised_value = 1
	var/min_value = 20
	price_tag = 10

/obj/item/appraisal/proc/appraisal_value()
	return

/obj/item/appraisal/proc/is_counterfeit()
	return

/obj/item/appraisal/get_item_cost(export)
	var/true_price = appraisal_value()

	if(appraised_value <= 0 || !appraised_value || appraised_value >= 1250) //Lets not make it do stupidly wrong math
		appraised_value = 1 //Keep it possitive

	var/failer_rate = appraised_value / true_price
	//message_admins("TP = [true_price] FR = [failer_rate] | [appraised_value] / [true_price]")
	if(failer_rate > 1.25 || failer_rate < 0.65)
		price_tag = min_value
		//message_admins("Failer Rate out of bonds")

	else
		price_tag = round(true_price * failer_rate) //Over rating gives spare credits well under rating will under sell the item
		if(failer_rate == 1)
			//flawless boost
			//message_admins("Flawless boost pre [price_tag]")
			price_tag += round(min_value * 2.5)
			//message_admins("Flawless boost post [price_tag]")

	. = ..()

/obj/item/appraisal/royal_brush
	name = "Kriosan Royal-Grade:tm: Hair Brush"
	desc = "A Kriosan Royal-Grade brush. No longer produced by the Heir of the Korsian House of Knen Arnehom." //cut up germxn words "worker" and "bone"
	icon_state = "brush"
	var/bone_type
	var/bristle_count
	var/broken_bristles = 0
	var/fake_silk_pad
	var/stone_handle
	var/screws
	var/broken_pad
	var/rusted_screw
	var/yellowed_bone
	var/handle_damage

	var/list/branch_options = list()

	var/list/pad_options = list()
	min_value = 45


/obj/item/appraisal/royal_brush/Initialize(mapload)
	. = ..()
	bone_type = pick("render", "buffalo", "bovine")
	bristle_count = pick(22, 38, 50, 30, 42, 56, 18)
	if(prob(70) && bristle_count)
		broken_bristles = rand(0, round(bristle_count/6))
	fake_silk_pad = prob(35)
	stone_handle = prob(40)
	screws = pick("brass", "tin", "bronze", "copper")
	broken_pad = prob(25)
	rusted_screw = prob(60)
	yellowed_bone = prob(80)
	handle_damage = prob(90)
	is_counterfeit = is_counterfeit()

	//Done like this so we can have compacted branches
	branch_options["Handle"] = "handle"
	branch_options["Bristle Count"] = "bristle"
	branch_options["Screws"] = "screws"
	branch_options["Brush Pad"] = "pad"
	branch_options["Give Appraisal"] = "appraisal"

	//Pad has a few options
	pad_options["Brush Pad Material"] = "pad_mat"
	pad_options["Brush Pad Condition"] = "pad_condition"
	pad_options["Cancle"] = "cancle"


	branch_options["Cancle"] = "cancle"


/obj/item/appraisal/royal_brush/is_counterfeit()
	if(fake_silk_pad)
		return TRUE
	if(stone_handle)
		return TRUE
	if(screws != "brass")
		return TRUE
	//Three values are faked, rest are real
	if(bristle_count == 22 || bristle_count == 18 || bristle_count == 56)
		return TRUE
	return FALSE

/obj/item/appraisal/royal_brush/attack_self(mob/user)
	..()
	var/check_choice = input(user,"What do you want to look at?") as null|anything in branch_options

	switch(check_choice)
		if("cancle")
			return
		if("Brush Pad")
			check_choice = input(user,"What about the pad needs to be checked?") as null|anything in pad_options
			switch(check_choice)
				if("cancle")
					return
				if("Brush Pad Material")
					if(fake_silk_pad)
						to_chat(user, "<span class='info'>The pad has a rough texture.</span>")
					else
						to_chat(user, "<span class='info'>The pad has a soft silky texture.</span>")
					if(broken_pad)
						to_chat(user, "<span class='info'>The pad has noticeable degration and is bearly holding onto the frame.</span>")
					return

				if("Brush Pad Condition")
					if(broken_pad)
						to_chat(user, "<span class='info'>The pad has a lot of fryed stitching and has noticeable degradation.</span>")
					else
						to_chat(user, "<span class='info'>The pad is well fitted, showing no signs of degradation or damage.</span>")
					return

		if("Screws")
			to_chat(user, "<span class='info'>The [screws] screws hold the frame tightly together.</span>")
			if(rusted_screw)
				to_chat(user, "<span class='info'>The screws have signs of rusting, stripping or other grime.</span>")
			return

		if("Bristle Count")
			to_chat(user, "<span class='info'>The bristle count of this brush is [bristle_count] with [broken_bristles] broken or missing bristles.</span>")
			return

		if("Handle")
			if(stone_handle)
				to_chat(user, "<span class='info'>The handle appears to be made out of a plaster then bone. [yellowed_bone ? "The plaster is still quite white and reflects some light." : "The plaster has yellowed over time."] \
				[handle_damage ? "The plaster has held up over time showing no visable signs of damage." : "The plaster has many cracks and scratches, a few flakes are missing as well."]</span>")
				return
			else
				to_chat(user, "<span class='info'>The [bone_type] handle [yellowed_bone ? "has been well preserved leading to its white sheen." : "has been yellowed over time to a noticeable degree."] \
				[handle_damage ? "The [bone_type] handle has no noticeable damages or structural issues." : "The handle has signs of stress, flexing fittings and parts are warn away from use."]</span>")
				return

		if("Give Appraisal")
			appraised_value = input(user,"What do you think this brush is worth?") as num|null
			if(appraised_value <= 0 || !appraised_value)
				appraised_value = 1 //Keep it possitive
			return

/obj/item/appraisal/royal_brush/appraisal_value()
	var/value = 40

	if(is_counterfeit)
		value -= 40
	switch(bristle_count)
		if(50)
			value += 150
		if(38)
			value += 100
		if(22)
			value += 60

	switch(bone_type)
		if("render")
			value += 120
		if("buffalo")
			value += 40
		if("bovine")
			value += 10

	value -= broken_bristles * 2
	if(broken_pad)
		value -= 20
	if(rusted_screw)
		value -= 5
	if(yellowed_bone || !handle_damage)
		value -= 40
	return max(min_value, value)

/obj/item/appraisal/tttk
	name = "Tact-Tract-Travel Kit"
	desc = "A pre-packed travel kit. Uses Cryo-Seal tech to preserve and maintain a stable enviroment inside. \
	Travel Kits fell out of common use after many complaints about its inablity to clean or groom."
	icon_state = "travel_kit"
	var/has_eye_drops = FALSE
	var/has_comb = FALSE
	var/shampoo_brand
	var/factory_line
	var/soap_color
	var/soap_weight
	var/toothbrush_type
	var/towel_color
	var/towel_size
	var/mirror_frame
	var/mirror_size
	var/towel_damaged
	var/soap_damaged
	var/razor_damaged
	var/shampoo_damaged
	var/toothbrush_damaged
	var/mirror_cracked
	var/mirror_dirty
	is_counterfeit = FALSE
	appraised_value = 1

	var/list/branch_options = list()
	var/list/contents_options = list()
	var/list/towel_options = list()
	var/list/mirror_options = list()
	min_value = 60

/obj/item/appraisal/tttk/Initialize(mapload)
	. = ..()
	has_eye_drops = !prob(33)
	has_comb = !prob(33)
	shampoo_brand = pick("ShaBubble", "Bubble-Buddy", "Sapple's Sam Shampoo", "NELLY Corp. 5-in-1", "ShampooCo", "HairInc Hygiene")
	factory_line = rand(1, 15)
	soap_color = pick("blue", "white", "green", "teal", "yellow", "red")
	soap_weight = pick(15, 15, 18, 10, 12, 7)
	toothbrush_type = pick("toothbrush", "toothbrush", "normal brush")
	towel_color = pick("white", "white", "yellow")
	towel_size = pick(3, 4, 6, 2, 5, 8)
	mirror_frame = pick("silver", "copper", "iron", "bone", "wooden", "glass", "lead", "brass")
	mirror_size = pick(3, 4, 6, 2, 5, 8)
	towel_damaged = prob(25)
	soap_damaged = prob(5)
	razor_damaged = prob(60)
	shampoo_damaged = prob(20)
	toothbrush_damaged = prob(1)
	mirror_cracked = prob(50)
	mirror_dirty = prob(10)
	is_counterfeit = is_counterfeit()

	branch_options["Kit Contents"] = "contents"
	branch_options["Towel"] = "towel"
	branch_options["Mirror"] = "mirror"
	branch_options["Factory Line"] = "batch"
	branch_options["Give Appraisal"] = "appraisal"
	branch_options["Cancel"] = "cancel"

	contents_options["Soap"] = "soap"
	contents_options["Shampoo"] = "shampoo"
	contents_options["Toothbrush"] = "toothbrush"
	contents_options["Razor Blades"] = "razor"
	contents_options["Eye Drops and Comb"] = "limited"
	contents_options["Cancel"] = "cancel"

	towel_options["Towel Color"] = "towel_color"
	towel_options["Towel Size"] = "towel_size"
	towel_options["Towel Condition"] = "towel_condition"
	towel_options["Cancel"] = "cancel"

	mirror_options["Frame and Size"] = "mirror_details"
	mirror_options["Mirror Condition"] = "mirror_condition"
	mirror_options["Cancel"] = "cancel"

/obj/item/appraisal/tttk/proc/damaged_product_count()
	var/count = 0
	if(towel_damaged)
		count++
	if(soap_damaged)
		count++
	if(razor_damaged)
		count++
	if(shampoo_damaged)
		count++
	if(toothbrush_damaged)
		count++
	if(mirror_cracked || mirror_dirty)
		count++
	return count

/obj/item/appraisal/tttk/is_counterfeit()
	if((has_eye_drops && !has_comb) || (!has_eye_drops && has_comb))
		return TRUE
	if(damaged_product_count())
		return TRUE
	if(!(shampoo_brand in list("ShaBubble", "Bubble-Buddy", "Sapple's Sam Shampoo", "NELLY Corp. 5-in-1")))
		return TRUE
	if(factory_line < 1 || factory_line > 12)
		return TRUE
	if(!(soap_color in list("blue", "white", "green", "teal")) || soap_weight != 15)
		return TRUE
	if(toothbrush_type != "toothbrush" || towel_color != "white" || !(towel_size in list(3, 4, 6)))
		return TRUE
	if(!(mirror_frame in list("silver", "copper", "iron")) || !(mirror_size in list(3, 4, 6)))
		return TRUE
	return FALSE

/obj/item/appraisal/tttk/attack_self(mob/user)
	..()
	var/check_choice = input(user, "What do you want to inspect?") as null|anything in branch_options
	switch(check_choice)
		if("Cancel")
			return
		if("Kit Contents")
			var/contents_choice = input(user, "Which contents do you want to check?") as null|anything in contents_options
			switch(contents_choice)
				if("Cancel")
					return
				if("Soap")
					to_chat(user, "<span class='info'>The soap is [soap_color] and weighs [soap_weight]g. [soap_damaged ? "It is dryed and poorly wrapped." : "It is soft and properly wrapped."]</span>")
				if("Shampoo")
					to_chat(user, "<span class='info'>The shampoo packet is marked [shampoo_brand]. [shampoo_damaged ? "The shampoo packet is leaky." : "The shampoo packet is clean and full."]</span>")
				if("Toothbrush")
					to_chat(user, "<span class='info'>The kit contains a [toothbrush_type]. [toothbrush_damaged ? "Its bristles are falling out." : "It appears to be in good condition."]</span>")
				if("Razor Blades")
					to_chat(user, "<span class='info'>The kit [razor_damaged ? "has rusted and nicked razor blades, some seem rather dull as well." : "has a complete, undamaged set of dulled razor blades."]</span>")
				if("Eye Drops and Comb")
					to_chat(user, "<span class='info'>[has_eye_drops ? "Eye drops are present." : "This kit lacks any eye drops."] [has_comb ? "A comb is present." : "This kit lacks a comb."].</span>")
			return
		if("Towel")
			var/towel_choice = input(user, "What about the towel do you want to check?") as null|anything in towel_options
			switch(towel_choice)
				if("Cancel")
					return
				if("Towel Color")
					to_chat(user, "<span class='info'>The towel is [towel_color].</span>")
				if("Towel Size")
					to_chat(user, "<span class='info'>The towel measures [towel_size] inches. Useless to accually dry anyone off.</span>")
				if("Towel Condition")
					to_chat(user, "<span class='info'>[towel_damaged ? "The towel is stained, torn, or otherwise damaged." : "The towel is clean and well preserved."]</span>")
			return
		if("Mirror")
			var/mirror_choice = input(user, "What about the mirror do you want to check?") as null|anything in mirror_options
			switch(mirror_choice)
				if("cancel")
					return
				if("Frame and Size")
					to_chat(user, "<span class='info'>The mirror has a [mirror_frame] frame and measures [mirror_size] inches.</span>")
				if("Mirror Condition")
					to_chat(user, "<span class='info'>[mirror_cracked ? "The mirror is cracked." : "The glass is not cracked."]</span>")
					to_chat(user, "<span class='info'>[mirror_dirty ? "The mirror is stained or dusty." : "The mirror is clean."]</span>")
			return
		if("Factory Line")
			to_chat(user, "<span class='info'>The package is marked factory line [factory_line].</span>")
			return
		if("Give Appraisal")
			appraised_value = input(user, "What do you think this travel kit is worth?") as num|null
			if(appraised_value <= 0 || !appraised_value)
				appraised_value = 1
			return

/obj/item/appraisal/tttk/appraisal_value()
	var/value = 120
	if(is_counterfeit) // less so counterfiet pre say and more so used/opened
		value = 80
	if(has_eye_drops && has_comb)
		value += 150
	if(shampoo_brand == "NELLY Corp. 5-in-1") //huge
		value += 200
	if(mirror_frame == "silver")
		value += 120
	else if(!(shampoo_brand in list("ShaBubble", "Bubble-Buddy", "Sapple's Sam Shampoo")))
		value -= 20 //Cheaper shampoo means less value
	value -= damaged_product_count() * 10
	return max(min_value, value)

/obj/item/appraisal/music_box
	name = "Occult Clockwork Music Box"
	desc = "A small, music box with a hand-cranked mechanism. \
	The music it could play is not meant for the ears, but for something greater."
	icon_state = "occult"
	var/maker_mark
	var/gear_material
	var/gear_worn
	var/tune
	var/reel_damaged
	var/case_material
	var/case_damaged
	var/case_lining
	var/winding_key_present
	var/key_worn
	var/list/inspection_options = list()
	var/list/clockwork_options = list()
	var/list/reel_options = list()
	var/list/case_options = list()
	min_value = 50

/obj/item/appraisal/music_box/Initialize(mapload)
	. = ..()
	maker_mark = pick("Big Brass Bands", "Branch Brass", "DOLL Makers", "Unmarked") //DOLL = Digital Operations Logic Listers
	gear_material = pick("brass", "brass", "steel", "steel", "steel")
	gear_worn = prob(65)
	tune = pick("The 1st Hand", "Tinker's Construct", "Wind Chimes on the City Streets", "Dreams of Brass")
	reel_damaged = prob(25)
	case_material = pick("rosewood", "walnut", "lacquered tin", "lacquered tin", "lacquered tin")
	case_damaged = prob(45)
	case_lining = pick("red velvet", "blue velvet", "faded silk", "cotton", "cotton", "cotton", "none", "none", "none")
	winding_key_present = !prob(15)
	if(winding_key_present)
		key_worn = prob(25)
	is_counterfeit = is_counterfeit()

	inspection_options["Maker's Mark"] = "mark"
	inspection_options["Clockwork"] = "mechanism"
	inspection_options["Music Reel"] = "reel"
	inspection_options["Case"] = "case"
	inspection_options["Give Appraisal"] = "appraisal"
	inspection_options["Cancel"] = "cancel"

	clockwork_options["Gear Material"] = "gear_material"
	clockwork_options["Gear Condition"] = "gear_condition"
	clockwork_options["Winding Key"] = "key"
	clockwork_options["Cancel"] = "cancel"

	reel_options["Tune"] = "tune"
	reel_options["Reel Condition"] = "reel_condition"
	reel_options["Cancel"] = "cancel"

	case_options["Case Material"] = "case_material"
	case_options["Case Condition"] = "case_condition"
	case_options["Interior Lining"] = "case_lining"
	case_options["Cancel"] = "cancel"

/obj/item/appraisal/music_box/is_counterfeit()
	return maker_mark != "DOLL Makers" || gear_material != "brass"

/obj/item/appraisal/music_box/attack_self(mob/user)
	..()
	var/check_choice = input(user, "What would you like to inspect?") as null|anything in inspection_options
	switch(check_choice)
		if("Cancel")
			return
		if("Maker's Mark")
			to_chat(user, "<span class='info'>The maker's mark reads '[maker_mark]'.</span>")
		if("Clockwork")
			var/clockwork_choice = input(user, "What part of the clockwork do you want to inspect?") as null|anything in clockwork_options
			switch(clockwork_choice)
				if("Cancel")
					return
				if("Gear Material")
					to_chat(user, "<span class='info'>The gears are made of [gear_material].</span>")
				if("Gear Condition")
					to_chat(user, "<span class='info'>[gear_worn ? "The gears grind and catch as they turn." : "The gears turn smoothly without catching."]</span>")
				if("Winding Key")
					to_chat(user, "<span class='info'>[!winding_key_present ? "The winding key is missing." : key_worn ? "The winding key is present, but its teeth are worn." : "The winding key is present and in good condition."]</span>")
		if("Music Reel")
			var/reel_choice = input(user, "What do you want to inspect about the music reel?") as null|anything in reel_options
			switch(reel_choice)
				if("Cancel")
					return
				if("Tune")
					to_chat(user, "<span class='info'>The music box plays '[tune]', according to the small reel inside.</span>")
				if("Reel Condition")
					to_chat(user, "<span class='info'>[reel_damaged ? "The music reel is bent and its pins are uneven, making the tune falter." : "The music reel is straight and its pins are evenly set."]</span>")
		if("Case")
			var/case_choice = input(user, "What do you want to inspect about the case?") as null|anything in case_options
			switch(case_choice)
				if("Cancel")
					return
				if("Case Material")
					to_chat(user, "<span class='info'>The case is made of [case_material].</span>")
				if("Case Condition")
					to_chat(user, "<span class='info'>[case_damaged ? "Its finish is scratched and the corners are chipped." : "The outer case has no signs of damage."]</span>")
				if("Interior Lining")
					to_chat(user, "<span class='info'>The inside of the case is lined with [case_lining].</span>")
		if("Give Appraisal")
			appraised_value = input(user, "What do you think this music box is worth?") as num|null
			if(appraised_value <= 0 || !appraised_value)
				appraised_value = 1

/obj/item/appraisal/music_box/appraisal_value()
	var/value = is_counterfeit ? 50 : 100
	if(gear_material == "brass")
		value += 70
	if(tune == "The 1st Hand")
		value += 120
	if(case_material == "rosewood")
		value += 90
	else if(case_material == "walnut")
		value += 40
	if(case_lining == "red velvet")
		value += 50
	else if(case_lining == "blue velvet")
		value += 40
	else if(case_lining == "faded silk")
		value += 25
	else if(case_lining == "none")
		value -= 10
	if(gear_worn)
		value -= 30
	if(reel_damaged)
		value -= 25
	if(case_damaged)
		value -= 35
	if(!winding_key_present)
		value -= 30
	else if(key_worn)
		value -= 15
	return max(min_value, value)

//Simple and easy one to quickly do to learn the system
/obj/item/appraisal/fish_food
	name = "can of fish pet food"
	desc = "A can of unpleasant fish scraps formulated for pets. Unhealthy and lacks any nutritional value for anything that isn't a fish."
	icon = 'icons/obj/food.dmi'
	icon_state = "ration_can"
	var/brand
	var/batch_code
	var/fish_contents
	var/net_weight
	var/dent_count
	var/rusted
	var/opened
	var/label_damaged
	var/seal_bloated
	var/best_before
	var/list/inspection_options = list()
	var/list/label_options = list()
	var/list/can_options = list()
	var/list/contents_options = list()
	min_value = 20

/obj/item/appraisal/fish_food/Initialize(mapload)
	. = ..()
	brand = pick("Guppy Grub", "Guppy Grub", "Mealtide", "Carp-E-Yum", "Unmarked")
	batch_code = rand(900, 9999)
	fish_contents = pick("glowfin scraps", "ice-carp offcuts", "void-eel viscera", "Titan kelp-koi mince", "phoron reef-guppy mash")
	net_weight = pick(250, 250, 300, 300, 300, 350, 400)
	dent_count = pick(0, 0, 1, 1, 2, 2, 3)
	rusted = prob(20)
	opened = prob(10)
	label_damaged = prob(35)
	seal_bloated = !opened && prob(8)
	best_before = pick("still in date", "recently expired", "long expired")
	is_counterfeit = is_counterfeit()
	if(opened)
		icon_state = "ration_can_open"

	inspection_options["Brand and Label"] = "label"
	inspection_options["Can Condition"] = "can"
	inspection_options["Seal and Contents"] = "contents"
	inspection_options["Give Appraisal"] = "appraisal"
	inspection_options["Cancel"] = "cancel"

	label_options["Brand"] = "brand"
	label_options["Batch Code"] = "batch"
	label_options["Label Condition"] = "label_condition"
	label_options["Cancel"] = "cancel"

	can_options["Dents"] = "dents"
	can_options["Rust"] = "rust"
	can_options["Cancel"] = "cancel"

	contents_options["Seal"] = "seal"
	contents_options["Net Weight"] = "weight"
	contents_options["Fish Contents"] = "fish"
	contents_options["Best-Before Date"] = "date"
	contents_options["Cancel"] = "cancel"

/obj/item/appraisal/fish_food/is_counterfeit()
	return brand == "Unmarked" || !(net_weight in list(250, 300)) || batch_code < 1000 || batch_code > 8999

/obj/item/appraisal/fish_food/attack_self(mob/user)
	..()
	var/check_choice = input(user, "What would you like to inspect?") as null|anything in inspection_options
	switch(check_choice)
		if("Cancel")
			return
		if("Brand and Label")
			var/label_choice = input(user, "What part of the label do you want to inspect?") as null|anything in label_options
			switch(label_choice)
				if("Cancel")
					return
				if("Brand")
					to_chat(user, "<span class='info'>The can is branded '[brand]'.</span>")
				if("Batch Code")
					to_chat(user, "<span class='info'>The printed batch code is [batch_code].</span>")
				if("Label Condition")
					to_chat(user, "<span class='info'>[label_damaged ? "The label is torn, stained, and difficult to read." : "The label is intact and legible."]</span>")
			return
		if("Can Condition")
			var/can_choice = input(user, "What do you want to check on the can?") as null|anything in can_options
			switch(can_choice)
				if("Cancel")
					return
				if("Dents")
					to_chat(user, "<span class='info'>The can has [dent_count] noticeable dents.</span>")
				if("Rust")
					to_chat(user, "<span class='info'>[rusted ? "Rust freckles the can, especially around the rim." : "The can has no visible rust."]</span>")
			return
		if("Seal and Contents")
			var/contents_choice = input(user, "What do you want to inspect?") as null|anything in contents_options
			switch(contents_choice)
				if("Cancel")
					return
				if("Seal")
					to_chat(user, "<span class='info'>[opened ? "The lid has been torn open and the factory seal is broken." : "The factory seal appears [seal_bloated ? "swollen and unsafe" : "intact"]."]</span>")
				if("Net Weight")
					to_chat(user, "<span class='info'>The can is stamped with a net weight of [net_weight]g.</span>")
				if("Fish Contents")
					to_chat(user, "<span class='info'>The label lists [fish_contents].</span>")
				if("Best-Before Date")
					to_chat(user, "<span class='info'>The can is [best_before].</span>")
			return
		if("Give Appraisal")
			appraised_value = input(user, "What do you think this can of pet food is worth?") as num|null
			if(appraised_value <= 0 || !appraised_value)
				appraised_value = 1

/obj/item/appraisal/fish_food/appraisal_value()
	var/value = is_counterfeit ? 20 : 35
	if(brand == "Carp-E-Yum")
		value += 10
	if(net_weight == 300)
		value += 25
	else if(net_weight == 250)
		value += 15
	if(batch_code >= 7100 && batch_code <= 7199)
		value += 25
	if(fish_contents == "glowfin scraps")
		value -= 20
	else if(fish_contents == "ice-carp offcuts")
		value += 10
	value -= dent_count * 6
	if(rusted)
		value -= 12
	if(label_damaged)
		value -= 8
	if(seal_bloated)
		value -= 25
	if(best_before == "recently expired")
		value -= 10
	else if(best_before == "long expired")
		value -= 20
	if(opened)
		value = min_value
	return max(min_value, value)
