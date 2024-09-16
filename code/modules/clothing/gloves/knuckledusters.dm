
/obj/item/clothing/gloves/dusters
	name = "steel knuckle dusters"
	desc = "More pain for them, less for you."
	description_info = "Have to be worn in your gloves slot to increase your punch damage."
	icon_state = "dusters"
	item_state = "dusters"
	var/punch_increase = 5
	var/dusters_givith = FALSE
	var/to_remove_givith = FALSE
	price_tag = 10

/obj/item/clothing/gloves/dusters/silver
	name = "silver knuckle dusters"
	desc = "More pain for them, more bling for you. Said to help protect the mind."
	icon_state = "dusters_silver"
	item_state = "dusters_silver"
	psi_blocking = 10
	price_tag = 30

/obj/item/clothing/gloves/dusters/plasteel
	name = "plasteel knuckle dusters"
	desc = "More pain for them, now doubled."
	icon_state = "dusters_plasteel"
	item_state = "dusters_plasteel"
	punch_increase = 10
	armor = list(
		melee = 3, //Just a litttttle bit of armor so your not defenceless
		bullet = 1,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	price_tag = 20

/obj/item/clothing/gloves/dusters/scav_gloves
	name = "scavenger gloves"
	desc = "A pair of reinforced combat gloves with plasteel knuckle dusters. \
			A jury-rigged work of art for those that value protection from whatever \
			they can scrap on the field, and throwing deadlier punches."
	icon_state = "scav_gloves"
	item_state = "scav_gloves"
	punch_increase = 8 //Armored so this should be weaker then the plasteel dust
	armor_list = list(
		melee = 8, // 10 more than combat, Plasteel reinforced
		bullet = 3,
		energy = 5, // No ablative materials means energy protection stays the same
		bomb = 10, // Plasteel protects a little bit against bombs
		bio = 0,
		rad = 0
	)
	price_tag = 200 // Combat gloves + plasteel knuckles price

/obj/item/clothing/gloves/dusters/scav_gloves/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Grey Standard"] = "scav_gloves"
	options["Tan Alternate"] = "scav_gloves_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You crack your knuckles and adjust your gloves' style to the [choice] look.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return TRUE

/obj/item/clothing/gloves/dusters/gold
	name = "golden knuckle dusters"
	desc = "More pain for them, more style for you."
	icon_state = "dusters_gold"
	item_state = "dusters_gold"
	punch_increase = 12
	price_tag = 50

/obj/item/clothing/gloves/dusters/platinum
	name = "spiked platinum knuckle dusters"
	desc = "Hurt like hell, and stylish as well."
	icon_state = "dusters_platinum"
	item_state = "dusters_platinum"
	punch_increase = 15
	price_tag = 30

/obj/item/clothing/gloves/dusters/gloves
	name = "knuckle gloves"
	desc = "Gloves with additional reinforcment on the knuckles. \
	These have plasteel powder sewn into the knuckles, adding more kinetic energy to your punches."
	icon_state = "knuckles"
	item_state = "knuckles"
	punch_increase = 10
	armor = list(
		melee = 2, //Just a litttttle bit of armor so your not defenceless
		bullet = 1,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	price_tag = 100

/obj/item/clothing/gloves/dusters/dropped(var/mob/M)
	..()
	update_dusters(M)

/obj/item/clothing/gloves/dusters/equipped(var/mob/M)
	.=..()
	update_dusters(M)


/obj/item/clothing/gloves/dusters/proc/update_dusters(mob/living/carbon/human/user)
	if(istype(user))
		if(user.gloves == src && !dusters_givith)
			user.punch_damage_increase += punch_increase
			dusters_givith = TRUE
			to_remove_givith = TRUE
		if(to_remove_givith && !(user.gloves == src))
			user.punch_damage_increase -= punch_increase
			dusters_givith = FALSE
			to_remove_givith = FALSE
