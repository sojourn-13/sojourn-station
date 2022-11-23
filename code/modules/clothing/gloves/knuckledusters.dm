
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
		melee = 15, //Just a litttttle bit of armor so your not defenceless
		bullet = 5,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	price_tag = 20

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
		melee = 10, //Just a litttttle bit of armor so your not defenceless
		bullet = 5,
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
