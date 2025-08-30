/mob/living/carbon/superior/human/stillpoint
	name = "Stillpoint Keeper"
	desc = "Waring imposing sol federation reprosed gear."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "stillpoint_red"
	icon_dead = "stillpoint_red"
	faction = "Stillpoint"
	mob_size = MOB_LARGE
	attacktext = "slashed"
	var/charge_armor = 3

/mob/living/carbon/superior/human/stillpoint/Initialize(mapload)
	. = ..()
	do_sparks(3, 0, src.loc)
	//Uniquic perk for Stillpoint

/mob/living/carbon/superior/human/stillpoint/New()
	..()
	stats.addPerk(PERK_STILLPONT_CHARGE)
	//They are human, so why shouldnt they get perks?
	stats.addPerk(PERK_TENACITY)
	stats.addPerk(PERK_IWILLSURVIVE)
	stats.addPerk(PERK_BATTLECRY)
	stats.addPerk(PERK_DIVERSE_CULTURE)

//We teleport out
/mob/living/carbon/superior/human/stillpoint/death()
	..()
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)

/mob/living/carbon/superior/human/stillpoint/handle_ai()
	. = ..()

	if(stat == CONSCIOUS && target_mob)
		var/datum/perk/battlecry/BC = stats.getPerk(PERK_BATTLECRY)
		//They do know how to use perks
		if(BC)
			BC.invoke()

	if(stat == CONSCIOUS)
		if(health < maxHealth * 0.5)
			var/datum/perk/iwillsurvive/IWS = stats.getPerk(PERK_IWILLSURVIVE)
			//Of course we would use are perks!
			if(IWS)
				IWS.invoke()

		//Duh recharge it when you can
		var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
		if(SC)
			SC.invoke()


/mob/living/carbon/superior/human/stillpoint/getarmorablative(var/def_zone, var/type)
	var/total = 0
	var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
	if(SC)
		if(SC.charge >= 50)
			SC.charge -= 50
			total += charge_armor
	total += mob_ablative_armor

	return total

/mob/living/carbon/superior/human/stillpoint/wrath
	name = "Stillpoint Keeper"
	desc = "A Stillpoint Keeper waring an imposing sol federation reprosed heavy armor, this one wields a glave."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "stillpoint_red"
	icon_dead = "stillpoint_red"

	//When targeting a person we spend charge to load a bullet.
	limited_ammo = TRUE
	mags_left = 0
	rounds_left = 0
	projectiletype = /obj/item/projectile/bullet/still_point_glave
	fire_verb = "teleports a slashing motion"
	range_telegraph = "slashes the air towards"

	emote_see = list("looks around fittling with worn gear", "sighs \"How many innocent lives corrupted by evil here?\"", "looks around and states \"Such an evil bunker...\"",
	"swings their sword a few times \"Such an unstable planet... Truely full of madmen and cultists\"", "looks around and states \"I must strike down whoever caused this.\"")


	fire_delay = 0

	melee_damage_lower = 15
	melee_damage_upper = 20
	move_to_delay = 3
	status_flags = 0

	flash_resistances = 10
	armor_divisor = 2

	maxHealth = 300 * LEVIATHAN_HEALTH_MOD
	health = 300 * LEVIATHAN_HEALTH_MOD
	charge_armor = 5

	//We are not an easy target to take down
	armor = list(melee = 25, bullet = 18, energy = 16, bomb = 100, bio = 120, rad = 100, agony = 50)


/mob/living/carbon/superior/human/stillpoint/wrath/getTargets()
	. = ..()
	var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
	if(SC)
		if(SC.charge >= 250)
			SC.charge -= 250
			ranged = TRUE
			rounds_left += 1

/mob/living/carbon/superior/human/stillpoint/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return

	var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
	if(SC)
		if(SC.charge >= 150 + melee_damage_upper)
			SC.charge -= 150 + melee_damage_upper
			//Spend some charge to permiently increase are damage
			melee_damage_lower++
			melee_damage_upper++
		else
			//We ran out of charge, set are power way lower
			melee_damage_lower = 12
			melee_damage_upper = 15
			armor_divisor = 1
			//Start supporting this in direct attacks
			if(isliving(A))
				var/mob/living/L = A
				if(!L.stats.getPerk(PERK_STILLPONT_RUPTURE))
					L.stats.addPerk(PERK_STILLPONT_RUPTURE)
				if(L.stats.getPerk(PERK_STILLPONT_RUPTURE))
					var/datum/perk/cooldown/stillpoint_rupture/rupture = L.stats.getPerk(PERK_STILLPONT_RUPTURE)
					rupture.damage += 4

/mob/living/carbon/superior/human/stillpoint/gloom
	name = "Stillpoint Keeper"
	desc = "A Stillpoint Keeper waring an imposing sol federation reprosed heavy armor, this one wields a shimering knife."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "stillpoint_blue"
	icon_dead = "stillpoint_blue"

	emote_see = list("looks around fittling with worn gear", "sobs \"No one is innocent here...\"", "looks around and states \"What a vile place\"",
	"trys to trigger some gear and asks \"How far did we teleport?\"", "looks around and questions \"Why would anyone stoop so low?\"")


	melee_damage_lower = 5
	melee_damage_upper = 10
	move_to_delay = 1
	status_flags = 0

	flash_resistances = 10
	armor_divisor = 4

	fancy_glide = 6

	maxHealth = 200 * LEVIATHAN_HEALTH_MOD
	health = 200 * LEVIATHAN_HEALTH_MOD
	charge_armor = 7

	//We are not an easy target to take down
	armor = list(melee = 25, bullet = 18, energy = 16, bomb = 100, bio = 120, rad = 100, agony = 50)
	var/rupture_damage = 7

//We rapidly build up are rupture peak damage, using charge to add 7 otherwise a measly 2
/mob/living/carbon/superior/human/stillpoint/gloom/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return
	if(isliving(A))
		var/mob/living/L = A
		var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
		if(SC)
			if(SC.charge >= 750)
				SC.charge -= 750
				rupture_damage = 7

			if(!L.stats.getPerk(PERK_STILLPONT_RUPTURE))
				L.stats.addPerk(PERK_STILLPONT_RUPTURE)
			if(L.stats.getPerk(PERK_STILLPONT_RUPTURE))
				var/datum/perk/cooldown/stillpoint_rupture/rupture = L.stats.getPerk(PERK_STILLPONT_RUPTURE)
				rupture.damage += rupture_damage
			rupture_damage = 2

/mob/living/carbon/superior/human/stillpoint/glutteny
	name = "Stillpoint Keeper"
	desc = "A Stillpoint Keeper waring an imposing sol federation reprosed heavy armor, this one wields a spear."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "stillpoint_green"
	icon_dead = "stillpoint_green"

	melee_damage_lower = 15
	melee_damage_upper = 20
	move_to_delay = 7
	status_flags = 0

	emote_see = list("looks around fittling with worn gear", "bosts \"I shall strike down the must vile of them first.\"", "looks around and states \"Truely home to monsters!\"",
	"trys to trigger some gear and states \"Should be an easy clear.\"", "looks around and questions \"Why are they so incompident? Is this really the best they have?\"")


	flash_resistances = 10
	armor_divisor = 1

	maxHealth = 200 * LEVIATHAN_HEALTH_MOD
	health = 200 * LEVIATHAN_HEALTH_MOD
	charge_armor = 2

	//We are not an easy target to take down
	armor = list(melee = 25, bullet = 18, energy = 16, bomb = 100, bio = 120, rad = 100, agony = 50)
	var/cooldown = 0

//We are slow but teleport attack and then retreat, affectively ranged but melee
/mob/living/carbon/superior/human/stillpoint/glutteny/handle_ai()
	. = ..()

	if(isliving(target_mob?.resolve()) && cooldown <= 0)

		var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
		var/mob/living/L = target_mob?.resolve()
		if(SC)
			if(SC.charge >= 160)
				SC.charge -= 160
				cooldown = 181
				var/turf/T = get_turf(L)
				var/turf/T2 = get_turf(src)

				if(isturf(T) && isturf(T2))
					forceMove(T)
					UnarmedAttack(target_mob?.resolve(), TRUE)

					if(!L.stats.getPerk(PERK_STILLPONT_RUPTURE))
						L.stats.addPerk(PERK_STILLPONT_RUPTURE)
					if(L.stats.getPerk(PERK_STILLPONT_RUPTURE))
						var/datum/perk/cooldown/stillpoint_rupture/rupture = L.stats.getPerk(PERK_STILLPONT_RUPTURE)
						rupture.damage += 3

					var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
					s.set_up(3, 1, src)
					s.start()

					forceMove(T2)
			else
				//Rage mode, we are out of charge
				move_to_delay = 3
				melee_damage_lower = 25
				melee_damage_upper = 30
				armor_divisor = 1.2

				if(!L.stats.getPerk(PERK_STILLPONT_RUPTURE))
					L.stats.addPerk(PERK_STILLPONT_RUPTURE)
				if(L.stats.getPerk(PERK_STILLPONT_RUPTURE))
					var/datum/perk/cooldown/stillpoint_rupture/rupture = L.stats.getPerk(PERK_STILLPONT_RUPTURE)
					rupture.damage += 1

	cooldown--

/mob/living/carbon/superior/human/stillpoint/lust
	name = "Stillpoint Keeper"
	desc = "A Stillpoint Keeper waring an imposing sol federation reprosed heavy armor, this one wields an axe."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "stillpoint_orange"
	icon_dead = "stillpoint_orange"

	emote_see = list("looks around fittling with worn gear", "bosts \"I guess ill have to show off my Stillpoint Sweep Arts.\"", "looks around and states \"Hardly a place to show my skills!\"",
	"trys to trigger some gear and states \"When we get back I can't tell the new ones about such an easy mission.\"", "looks around and questions \"Huh? These vile beings are hardly able to keep up with us?\"")


	melee_damage_lower = 25
	melee_damage_upper = 25
	move_to_delay = 4
	status_flags = 0

	flash_resistances = 10
	armor_divisor = 1.1

	maxHealth = 200 * LEVIATHAN_HEALTH_MOD
	health = 200 * LEVIATHAN_HEALTH_MOD
	charge_armor = 4

	//We are not an easy target to take down
	armor = list(melee = 25, bullet = 18, energy = 16, bomb = 100, bio = 120, rad = 100, agony = 50)

//We are a bit wreckless, aoe attacks
/mob/living/carbon/superior/human/stillpoint/lust/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return
	if(isliving(A))
		var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
		if(SC)

			if(SC.charge >= 100)
				SC.charge -= 100

				var/obj/effect/effect/melee/swing/S = new(get_turf(src))
				S.dir = dir
				QDEL_IN(S, 2 SECONDS)
				flick("left_swing", S)
				var/obj/effect/effect/melee/swing/Z = new(get_turf(src))
				Z.dir = reverse_direction(dir)
				flick("left_swing", Z)
				QDEL_IN(Z, 2 SECONDS)

				for(var/mob/living/L in oview(2))
					if(SC.charge >= 20 && L.faction != faction && L.stat != DEAD && !L == src)
						SC.charge -= 20
						if(!L.stats.getPerk(PERK_STILLPONT_RUPTURE))
							L.stats.addPerk(PERK_STILLPONT_RUPTURE)
						if(L.stats.getPerk(PERK_STILLPONT_RUPTURE))
							var/datum/perk/cooldown/stillpoint_rupture/rupture = L.stats.getPerk(PERK_STILLPONT_RUPTURE)
							rupture.damage += 2

/mob/living/carbon/superior/human/stillpoint/envy
	name = "Stillpoint Keeper"
	desc = "A Stillpoint Keeper waring an imposing sol federation reprosed heavy armor, this one wields a pair small needle knife."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "stillpoint_purple"
	icon_dead = "stillpoint_purple"

	emote_see = list("looks around fittling with worn gear", "sighs \"I wish we had the same funding as these evil scientists.\"", "looks around and states \"What strong bunkers to hide away in.\"",
	"trys to trigger some gear and states \"If only we could come back easily to pick up some relics...\"", "looks around and questions \"Why not take back what we can?\"")


	melee_damage_lower = 5
	melee_damage_upper = 10
	move_to_delay = 2
	status_flags = 0

	flash_resistances = 10
	armor_divisor = 4

	fancy_glide = 3

	maxHealth = 200 * LEVIATHAN_HEALTH_MOD
	health = 200 * LEVIATHAN_HEALTH_MOD
	charge_armor = 2 //Really hard hitting

	//We are not an easy target to take down
	armor = list(melee = 25, bullet = 18, energy = 16, bomb = 100, bio = 120, rad = 100, agony = 50)
	var/rupture_damage = 4
	var/burn_damage = 3

//We rapidly build up are rupture peak damage, using charge to add 7 otherwise a measly 2
/mob/living/carbon/superior/human/stillpoint/envy/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return
	if(isliving(A))
		var/mob/living/L = A
		var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
		if(SC)
			if(SC.charge >= 750)
				SC.charge -= 750
				rupture_damage = 4
				burn_damage = 3

			if(!L.stats.getPerk(PERK_STILLPONT_BURN))
				L.stats.addPerk(PERK_STILLPONT_BURN)
			if(L.stats.getPerk(PERK_STILLPONT_BURN))
				var/datum/perk/cooldown/stillpoint_burn/burn = L.stats.getPerk(PERK_STILLPONT_BURN)
				burn.damage += burn_damage
				//Kill the perk deal a ton of frost damage and debuffs
				if(burn.damage >= 5)
					if(SC.charge >= 50)
						burn.perk_lifetime -= 1 MINUTES
						SC.charge -= 50

			if(!L.stats.getPerk(PERK_STILLPONT_RUPTURE))
				L.stats.addPerk(PERK_STILLPONT_RUPTURE)
			if(L.stats.getPerk(PERK_STILLPONT_RUPTURE))
				var/datum/perk/cooldown/stillpoint_rupture/rupture = L.stats.getPerk(PERK_STILLPONT_RUPTURE)
				rupture.damage += rupture_damage
			rupture_damage = 1
			burn_damage = 1

/mob/living/carbon/superior/human/stillpoint/pride
	name = "Stillpoint Keeper"
	desc = "A Stillpoint Keeper waring an imposing sol federation reprosed heavy armor, this one wields a small blade."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "stillpoint_darkblue"
	icon_dead = "stillpoint_darkblue"

	emote_see = list("looks around fittling with worn gear", "scans the area to say \"This should be quite the easy clear for me.\"", "looks around and states \"Are own suits are harder then whatever evil materals they can produce.\"",
	"trys to trigger some gear and states \"I don't think even the strongest person here could best me in fair combat.\"", "looks around and questions \"Why do I have to fight such discusting monsters?\"")


	melee_damage_lower = 22
	melee_damage_upper = 25
	move_to_delay = 3
	status_flags = 0

	flash_resistances = 10
	armor_divisor = 1

	maxHealth = 200 * LEVIATHAN_HEALTH_MOD
	health = 200 * LEVIATHAN_HEALTH_MOD
	charge_armor = 1 //Really hard hitting

	//We are not an easy target to take down
	armor = list(melee = 25, bullet = 18, energy = 16, bomb = 100, bio = 120, rad = 100, agony = 50)
	var/burn_damage = 6

//Massively build up burn style damage and soild damage
/mob/living/carbon/superior/human/stillpoint/pride/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return
	if(isliving(A))
		var/mob/living/L = A
		var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
		if(SC)
			if(SC.charge >= 550)
				SC.charge -= 550
				burn_damage = 6

			if(!L.stats.getPerk(PERK_STILLPONT_BURN))
				L.stats.addPerk(PERK_STILLPONT_BURN)
			if(L.stats.getPerk(PERK_STILLPONT_BURN))
				var/datum/perk/cooldown/stillpoint_burn/burn = L.stats.getPerk(PERK_STILLPONT_BURN)
				burn.damage += burn_damage

			burn_damage = 1


/mob/living/carbon/superior/human/stillpoint/sloth
	name = "Stillpoint Keeper"
	desc = "A Stillpoint Keeper waring an imposing sol federation reprosed heavy armor, this one wields a duel sided gauntlet blade."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "stillpoint_yellow"
	icon_dead = "stillpoint_yellow"

	emote_see = list("looks around fittling with worn gear", "scans the area to say \"Hrm another evil bunker.\"", "looks around and states \"I hate fighting in bunkers, cowardly monsters.\"",
	"trys to trigger some gear and states \"I really hate fighting in closed areas.\"", "looks around and questions \"Why do we have to fight such discusting roaches?\"")


	melee_damage_lower = 22
	melee_damage_upper = 25
	move_to_delay = 3
	status_flags = 0

	flash_resistances = 10
	armor_divisor = 1

	maxHealth = 200 * LEVIATHAN_HEALTH_MOD
	health = 200 * LEVIATHAN_HEALTH_MOD
	charge_armor = 1 //Really hard hitting

	//We are not an easy target to take down
	armor = list(melee = 25, bullet = 18, energy = 16, bomb = 100, bio = 120, rad = 100, agony = 50)

//Debuffer
/mob/living/carbon/superior/human/stillpoint/sloth/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return
	if(isliving(A))
		var/mob/living/L = A
		var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
		if(SC)
			if(SC.charge >= 750)
				SC.charge -= 750

				if(!L.stats.getPerk(PERK_STILLPONT_TREMER))
					L.stats.addPerk(PERK_STILLPONT_TREMER)
				if(L.stats.getPerk(PERK_STILLPONT_TREMER))
					L.stats.addPerk(PERK_STILLPONT_TREMER)
					var/datum/perk/cooldown/stillpoint_tremer/tremer = L.stats.getPerk(PERK_STILLPONT_TREMER)
					tremer.damage += 1

			if(!L.stats.getPerk(PERK_STILLPONT_RUPTURE))
				L.stats.addPerk(PERK_STILLPONT_RUPTURE)
			if(L.stats.getPerk(PERK_STILLPONT_RUPTURE))
				var/datum/perk/cooldown/stillpoint_rupture/rupture = L.stats.getPerk(PERK_STILLPONT_RUPTURE)
				rupture.damage += 3

/mob/living/carbon/superior/human/stillpoint/angst
	name = "Stillpoint Keeper"
	desc = "A Stillpoint Keeper waring an imposing sol federation reprosed heavy armor, this one wields a small claw blade."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "stillpoint_white"
	icon_dead = "stillpoint_white"

	melee_damage_lower = 2
	melee_damage_upper = 4
	move_to_delay = 3
	status_flags = 0

	emote_see = list("looks around fittling with worn gear", "scans the area", "looks around",
	"trys to trigger some gear")


	flash_resistances = 10
	armor_divisor = 4

	maxHealth = 200 * LEVIATHAN_HEALTH_MOD
	health = 200 * LEVIATHAN_HEALTH_MOD
	charge_armor = 2 //Really hard hitting

	//We are not an easy target to take down
	armor = list(melee = 25, bullet = 18, energy = 16, bomb = 100, bio = 120, rad = 100, agony = 50)

	var/tremer_damage = 3
	var/rupture_damage = 2
	var/burn_damage = 3

//Fist hitting fixed damage user
/mob/living/carbon/superior/human/stillpoint/angst/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return
	if(isliving(A))
		var/mob/living/L = A
		var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
		if(SC)
			if(SC.charge >= 150)
				SC.charge -= 150
				tremer_damage = 3
				rupture_damage = 2
				burn_damage = 3
			else
				tremer_damage = 1
				rupture_damage = 1
				burn_damage = 1

			if(!L.stats.getPerk(PERK_STILLPONT_TREMER))
				L.stats.addPerk(PERK_STILLPONT_TREMER)
			if(L.stats.getPerk(PERK_STILLPONT_TREMER))
				L.stats.addPerk(PERK_STILLPONT_TREMER)
				var/datum/perk/cooldown/stillpoint_tremer/tremer = L.stats.getPerk(PERK_STILLPONT_TREMER)
				tremer.damage += tremer_damage

			if(!L.stats.getPerk(PERK_STILLPONT_RUPTURE))
				L.stats.addPerk(PERK_STILLPONT_RUPTURE)
			if(L.stats.getPerk(PERK_STILLPONT_RUPTURE))
				var/datum/perk/cooldown/stillpoint_rupture/rupture = L.stats.getPerk(PERK_STILLPONT_RUPTURE)
				rupture.damage += rupture_damage

			if(!L.stats.getPerk(PERK_STILLPONT_BURN))
				L.stats.addPerk(PERK_STILLPONT_BURN)
			if(L.stats.getPerk(PERK_STILLPONT_BURN))
				var/datum/perk/cooldown/stillpoint_burn/burn = L.stats.getPerk(PERK_STILLPONT_BURN)
				burn.damage += burn_damage

//We read are targets movements, and if in melee combat take extra swipes at em
/mob/living/carbon/superior/human/stillpoint/angst/bullet_act(obj/item/projectile/proj)
	if(proj.original_firer == proj.original_firer && !proj.silenced) //Silenced weapons are cheating
		var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
		if(SC)
			if(proj.original_firer in view(1))
				if(SC.charge >= 350)
					SC.charge -= 350
					UnarmedAttack(proj.original_firer)
					visible_message("<b><font color='#ffaa00'>\The [src] charges their claws to swipes at [proj.original_firer].</font></b>")
		visible_message("<b><font color='#ffaa00'>\The [src] ducks and weaves past the [proj] as they watch [proj.original_firer].</font></b>")
		return PROJECTILE_FORCE_MISS
	..()

//We are the boss of the pack
/mob/living/carbon/superior/human/stillpoint/madness
	name = "Grade B Stillpoint Keeper"
	desc = "A Stillpoint Keeper waring an imposing sol federation reprosed heavy armor, this one wields a large lance and heaver combat gear."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "stillpoint_black"
	icon_dead = "stillpoint_black"

	emote_see = list("looks around fittling with worn gear", "scans the area", "looks around",
	"trys to trigger some gear")

	melee_damage_lower = 20
	melee_damage_upper = 24
	move_to_delay = 4
	status_flags = 0

	flash_resistances = 10
	armor_divisor = 0.9

	//We are agumented to hell
	maxHealth = 250 * LEVIATHAN_HEALTH_MOD
	health = 250 * LEVIATHAN_HEALTH_MOD
	charge_armor = 4 //We are the boss

	//We are not an easy target to take down
	armor = list(melee = 25, bullet = 22, energy = 18, bomb = 300, bio = 240, rad = 200, agony = 80)
	var/cooldown = 0

//We are a mix of lust, glutteny, angst and envy
/mob/living/carbon/superior/human/stillpoint/madness/handle_ai()
	. = ..()

	if(isliving(target_mob?.resolve()) && cooldown <= 0)

		var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
		if(SC)
			var/mob/living/L = target_mob?.resolve()
			if(SC.charge >= 160)
				SC.charge -= 160
				cooldown = 31
				var/turf/T = get_turf(L)
				var/turf/T2 = get_turf(src)
				if(isturf(T) && isturf(T2))
					forceMove(T)
					UnarmedAttack(target_mob?.resolve(), TRUE)

					if(!L.stats.getPerk(PERK_STILLPONT_RUPTURE))
						L.stats.addPerk(PERK_STILLPONT_RUPTURE)
					if(L.stats.getPerk(PERK_STILLPONT_RUPTURE))
						var/datum/perk/cooldown/stillpoint_rupture/rupture = L.stats.getPerk(PERK_STILLPONT_RUPTURE)
						rupture.damage += 3

					if(!L.stats.getPerk(PERK_STILLPONT_TREMER))
						L.stats.addPerk(PERK_STILLPONT_TREMER)
					if(L.stats.getPerk(PERK_STILLPONT_TREMER))
						L.stats.addPerk(PERK_STILLPONT_TREMER)
						var/datum/perk/cooldown/stillpoint_tremer/tremer = L.stats.getPerk(PERK_STILLPONT_TREMER)
						tremer.damage += 2
						if(tremer.damage >= 10)
							tremer.damage -= 1 //We use one to deal that damage
							L.adjustHalLoss(tremer.damage)

					if(!L.stats.getPerk(PERK_STILLPONT_BURN))
						L.stats.addPerk(PERK_STILLPONT_BURN)
					if(L.stats.getPerk(PERK_STILLPONT_BURN))
						var/datum/perk/cooldown/stillpoint_burn/burn = L.stats.getPerk(PERK_STILLPONT_BURN)
						burn.damage += 3

					forceMove(T2)
			else
				//Rage mode, we are out of charge
				move_to_delay = 5
				melee_damage_lower = 25
				melee_damage_upper = 26
				armor_divisor = 1.2

				if(!L.stats.getPerk(PERK_STILLPONT_RUPTURE))
					L.stats.addPerk(PERK_STILLPONT_RUPTURE)
				if(L.stats.getPerk(PERK_STILLPONT_RUPTURE))
					var/datum/perk/cooldown/stillpoint_rupture/rupture = L.stats.getPerk(PERK_STILLPONT_RUPTURE)
					rupture.damage += 1

				if(!L.stats.getPerk(PERK_STILLPONT_BURN))
					L.stats.addPerk(PERK_STILLPONT_BURN)
				if(L.stats.getPerk(PERK_STILLPONT_BURN))
					var/datum/perk/cooldown/stillpoint_burn/burn = L.stats.getPerk(PERK_STILLPONT_BURN)
					burn.damage += 1

	cooldown--

//We read are targets movements, and if in melee combat take extra swipes at em
/mob/living/carbon/superior/human/stillpoint/madness/bullet_act(obj/item/projectile/proj)
	if(proj.original_firer == proj.original_firer && !proj.silenced) //Silenced weapons are cheating
		var/datum/perk/stillpoint_charge/SC = stats.getPerk(PERK_STILLPONT_CHARGE)
		if(SC)
			if(proj.original_firer in view(1))
				if(SC.charge >= 350)
					SC.charge -= 350
					UnarmedAttack(proj.original_firer)
					UnarmedAttack(proj.original_firer)
					visible_message("<b><font color='#ffaa00'>\The [src] charges their lance to stab relencelessly at well [proj.original_firer].</font></b>")
		visible_message("<b><font color='#ffaa00'>\The [src] ducks and weaves past the [proj] as they watch [proj.original_firer].</font></b>")
		return PROJECTILE_FORCE_MISS
	..()