//Debug exsperimental conspectable boss like mechanics
//Sprite came to me in a dream, please do not replace it or remove. - Trilby

/mob/living/carbon/superior_animal/robot/fencer
	name = "Blue Fencer"
	desc = "Something that doesn't even match this worlds aesthetic."
	icon_state = "fencer" //Dream Sprite
	icon = 'modular_sojourn/fencer.dmi'

	turns_per_move = 3
	//Fake nonreal heath values they dont matter for this mob
	maxHealth = 100
	health = 100
	move_to_delay = 3.5

	melee_damage_lower = 15
	melee_damage_upper = 15
	armor_divisor = 2
	deathmessage = "Gives a short wave and steps forwards into nothing..."

	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 500, rad = 500, agony = 0)
	emp_damage = FALSE
	drop1 = /obj/item/tool/sword/saber/nightmare_saber //A true user of the nightmare
	//Who are we attacking? It goes by goes by TRUE NAME of the human its tracking, does not track non-humans
	var/tracker
	var/coins = 0
	var/death_hits = 0

/mob/living/carbon/superior_animal/robot/fencer/death()
	if(death_hits >= 3)
		visible_message("<b><font color='#ffaa00'>Gives a small bow before leaving blinking out, leaving behind a different sword.</font></b>")
		..()
	else
		visible_message("<b><font color='#ffaa00'>Glares a moment, before standing up strait still ready to fight.</font></b>")
		rejuvenate() //We do this to reset health from fake data
		death_hits += 1 //Allows brute force
		flick("fencer_glare",src)

//Retrieve whether or not are **single** pixel was clicked
/mob/living/carbon/superior_animal/robot/fencer/proc/getInput(params)
	var/list/click_params = params2list(params)
	var/input
	var/icon_x = text2num(click_params["icon-x"])
	var/icon_y = text2num(click_params["icon-y"])
	var/click_y_pickle_success = FALSE
	if(icon_y == 30 || icon_y == 29 || icon_y == 28)
		click_y_pickle_success = TRUE
	if(icon_x == 11 && click_y_pickle_success)
		input = TRUE
	else
		input = FALSE
//	log_debug("fencer returned area [input]. icon-x: [click_params["icon-x"]], icon-y: [click_params["icon-y"]]")

	return input

/mob/living/carbon/superior_animal/robot/fencer/attackby(obj/item/used_item, mob/user, params)
	var/center_selected = getInput(params)
	log_debug("fencer center_selected [center_selected]. params: [params]")
	if(center_selected)
		flick("fencer_hurt",src)
		death_hits += 1 //Typically takes 3 hits to bonk the fencer away
		..()
		return

	visible_message("<b><font color='#ffaa00'>[src] parries the [user]'s attack with easy then points to to the red flower pins core.</font></b>")
	if(tracker)
		if(ishuman(user))
			if(coins == 3)
				visible_message("<b><font color='#ffaa00'>The [src] bickers in an etheral voice \"Tenth Flow, Repose!\"</font></b>")
				UnarmedAttack(user, give_coins = FALSE)
	return

/mob/living/carbon/superior_animal/robot/fencer/bullet_act(obj/item/projectile/proj)
	visible_message("<b><font color='#ffaa00'>[src] ducks and weaves past the [proj], giving a glare at such a cheap trick.</font></b>")
	flick("fencer_glare",src)
	return PROJECTILE_FORCE_MISS


/mob/living/carbon/superior_animal/robot/fencer/UnarmedAttack(atom/A, proximity, give_coins = TRUE)
	flick("fencer_atk",src)

	if(coins > 5) //Congrats they just healed from that
		visible_message("<b><font color='#ffaa00'>The [src] sighs and then in an etheral voice \"Sixth stance, Recovery Arts Number 12.\"</font></b>")
		rejuvenate() //We do this to reset health from fake data
		death_hits = 0
		coins = 0

	//Little bit of maths
	if(coins)
		melee_damage_lower = 10 * coins
		melee_damage_upper = 10 * coins
	else
		melee_damage_lower = 15
		melee_damage_upper = 15

	armor_divisor = 2 * (coins + 1) //AP grows faster then raw damage

	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		if(H && !H.real_name == tracker)
			visible_message("<b><font color='#ffaa00'>The [src] echos in an etheral voice \"First Form, Tracking Arts Number 1.\"</font></b>")
			tracker = H.real_name
			coins = 0
			return // Do not attack
		if(give_coins)
			coins += 1
		if(coins == 2 && give_coins)
			if(H.has_shield())
				var/obj/item/shield/shield = H.has_shield()
				visible_message("<b><font color='#ffaa00'>The [src] echos in an etheral voice \"Second Form, Bulwark Buster Number 4.\"</font></b>")
				shield.adjustShieldDurability(-150, H)

		if(coins == 4 && give_coins)
			visible_message("<b><font color='#ffaa00'>The [src] echos in an etheral voice \"Third Stance, Saved Slash Number 8.\"</font></b>")
			UnarmedAttack(A, proximity, give_coins = FALSE)

		if(coins == 5 && give_coins)
			visible_message("<b><font color='#ffaa00'>The [src] echos in an etheral voice \"Fith Hand, Hilt Jab Numberless.\"</font></b>")
			H.adjustHalLoss(25)


	. = ..()
