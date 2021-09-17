/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat
	name = "Excelsior Popor Avtomat"
	desc = "The People's Machine! An advanced automaton created to enforce the will of the people over their capitalist overlords."
	icon = 'icons/mob/40x40.dmi'
	icon_state = "excelatomiton_unpowered"
	icon_living = "excelatomiton_unpowered"
	viewRange = 12
	environment_smash = 2
	break_stuff_probability = 95
	attacktext = "kicked"
	maxHealth = 2200
	health = 2200
	melee_damage_lower = 10
	melee_damage_upper = 15
	old_x = -16
	move_to_delay = 3.7
	var/setspeed = 3.7
	var/zoomeye = 7
	see_invisible = 15
	old_y = 0
	projectiletype = /obj/item/projectile/bullet/pistol_35
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	meat_amount = 6
	ranged_cooldown = 0
	var/loaded_ammo = 0 //What ammo do we have loaded in. 0 is SMG, 1 is AP, 2 is Fire, 3 is MG ,4 is Artillery
	var/apcooldown = 0
	var/firecooldown = 0
	var/mgcooldown = 0
	var/artileriacooldown = 0
	var/smokecooldown = 0
	var/nocooldown = 0 //If set to 1, we don't use cooldowns.
	rapid = 1
	can_burrow = FALSE
	mob_size =  3  // The same as Hivemind Tyrant

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/MiddleClickOn(mob/targetDD as mob)
	var /mob/living/simple_animal/hostile/shooter = src //We're the shooter.
	if(ranged_cooldown >= world.time)
		to_chat(src, "You gun isnt ready to fire!.")
		return
	if(loaded_ammo == 1)
		projectiletype = /obj/item/projectile/bullet/rifle_75/hv
		rapid = 0
		shooter.OpenFire(targetDD)
		visible_emote("fires an armor piercing shot!")
		playsound(src, 'sound/weapons/guns/fire/sniper_fire.ogg', 30, 1, -3)
		projectiletype = /obj/item/projectile/bullet/pistol_35
		rapid = 1
		loaded_ammo = 0
		icon_state = "excelatomiton_unpowered"
		icon_living = "excelatomiton_unpowered"
		return
	if(loaded_ammo == 2)
		projectiletype = /obj/item/projectile/flamer_lob
		rapid = 0
		shooter.OpenFire(targetDD)
		shooter.OpenFire(get_step_rand(targetDD))
		shooter.OpenFire(get_step_rand(targetDD))
		visible_emote("fires a spout of fire!")
		playsound(src, 'sound/items/Welder2.ogg', 30, 1, -3)
		rapid = 1
		projectiletype = /obj/item/projectile/bullet/pistol_35
		loaded_ammo = 0
		icon_state = "excelatomiton_unpowered"
		icon_living = "excelatomiton_unpowered"
		return
	if(loaded_ammo == 3)
		visible_emote("is preparing to unleash a powerful volley of bullets, take cover! RUN AND HIDE NOW!")
		move_to_delay = 8.5
		animate(src, alpha = 255, color = "#ffffcc", transform = matrix()*1.1, time = 2)
		playsound(src, 'sound/weapons/guns/interact/chaingun_cock.ogg', 30, 1, -3)
		sleep(5)
		animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
		sleep(3)
		animate(src, alpha = 255, color = "#fffffc", transform = matrix()*1.3, time = 2)
		sleep(3)
		animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
		sleep(4)
		animate(src, alpha = 255, color = "#ffffcc", transform = matrix()*1.1, time = 2)
		sleep(5)
		animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
		sleep(3)
		animate(src, alpha = 255, color = "#fffffc", transform = matrix()*1.3, time = 2)
		sleep(3)
		animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
		projectiletype = /obj/item/projectile/bullet/light_rifle_257
		playsound(src, 'sound/weapons/guns/fire/chaingun_fire.ogg', 30, 1, -3)
		shooter.OpenFire(targetDD)
		shooter.OpenFire(get_step_rand(targetDD))
		shooter.OpenFire(get_step_rand(targetDD))
		shooter.OpenFire(get_step_rand(targetDD))
		shooter.OpenFire(get_step_rand(targetDD))
		shooter.OpenFire(get_step_rand(targetDD))
		shooter.OpenFire(get_step_rand(targetDD))
		shooter.OpenFire(get_step_rand(targetDD))
		projectiletype = /obj/item/projectile/bullet/pistol_35
		loaded_ammo = 0
		move_to_delay = setspeed
		icon_state = "excelatomiton_unpowered"
		icon_living = "excelatomiton_unpowered"
		return
	if(loaded_ammo == 4)
		var/obj/item/grenade/explosive/artileria/g1 = new /obj/item/grenade/explosive/artileria(targetDD)
		playsound(src, 'sound/effects/Custom_flare.ogg', 30, 1, -3)
		var/obj/item/grenade/explosive/artileria/g2 = new /obj/item/grenade/explosive/artileria(get_step_rand(targetDD))
		playsound(src, 'sound/effects/Custom_flare.ogg', 30, 1, -3)
		var/obj/item/grenade/explosive/artileria/g3 = new /obj/item/grenade/explosive/artileria(get_step_rand(targetDD))
		playsound(src, 'sound/effects/Custom_flare.ogg', 30, 1, -3)
		loaded_ammo = 0
		icon_state = "excelatomiton_unpowered"
		icon_living = "excelatomiton_unpowered"
		sleep(380)
		g1.prime()
		g2.prime()
		g3.prime()
		return
	shooter.OpenFire(targetDD)
	playsound(src, 'sound/weapons/guns/fire/m41_shoot.ogg', 30, 1, -3)
	ranged_cooldown = world.time + 3

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/verb/loadapverb()
	set name = "Load AP Round"
	set category = "Abilities"
	src.loadap()

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/proc/loadap()
	if(world.time < apcooldown && nocooldown == 0)
		to_chat(usr, SPAN_NOTICE("You can not load an AP round just yet."))
		return
	say(pick("Lovdin' armura panait!.", "Zaryadka broneboynoy!.", "Gotovimsya k snosu!", "Slomat' stenu!"))
	loaded_ammo = 1
	icon_state = "excelatomiton"
	icon_living = "excelatomiton"
	playsound(src, 'sound/weapons/guns/interact/rifle_load.ogg', 30, 1, -3)
	apcooldown = 12 SECONDS + world.time

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/verb/loadfireverb()
	set name = "Load Flamethrower"
	set category = "Abilities"
	src.loadfire()

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/proc/loadfire()
	if(world.time < firecooldown && nocooldown == 0)
		to_chat(usr, SPAN_NOTICE("You can not load flamethrower just yet."))
		return
	say(pick("Capitalist burn now!", "Sozhgi kapitalista!", "Ogon' i ogon!", "Gori detka Gori!"))
	loaded_ammo = 2
	icon_state = "excelatomiton"
	icon_living = "excelatomiton"
	firecooldown = 20 SECONDS + world.time

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/verb/loadmgverb()
	set name = "Load Maxim Machinegun"
	set category = "Abilities"
	src.loadmg()

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/proc/loadmg()
	if(world.time < mgcooldown && nocooldown == 0)
		to_chat(usr, SPAN_NOTICE("You can not load the Maxim just yet."))
		return
	say(pick("Maksimum zagruzki!", "Pulemet!", "Pulya za puley!"))
	loaded_ammo = 3
	playsound(src, 'sound/weapons/guns/interact/chaingun_cock.ogg', 30, 1, -3)
	icon_state = "excelatomiton"
	icon_living = "excelatomiton"
	mgcooldown = 20 SECONDS + world.time

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/verb/loadartileriaverb()
	set name = "Load Artileria Flares"
	set category = "Abilities"
	src.loadartileria()

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/proc/loadartileria()
	if(world.time < artileriacooldown && nocooldown == 0)
		to_chat(usr, SPAN_NOTICE("You can not load Artilera Flares just yet."))
		return
	say(pick("Artilleriya!", "Gotov'te kanony!", "Minometnyy ogon'!"))
	loaded_ammo = 4
	icon_state = "excelatomiton"
	icon_living = "excelatomiton"
	artileriacooldown = 40 SECONDS + world.time

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/verb/smokeverb()
	set name = "Activate Smoke"
	set category = "Abilities"
	src.releasesmoke()

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/proc/releasesmoke()
	if(world.time < smokecooldown && nocooldown == 0)
		to_chat(usr, SPAN_NOTICE("You can not release smoke just yet."))
		return
	say(pick("Hide from capitalism!", "Run away!", "Dismissing!"))
	var/obj/item/grenade/explosive/artileria/s1 = new /obj/item/grenade/smokebomb(src)
	s1.prime()
	smokecooldown = 30 SECONDS + world.time

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/Bump(var/atom/obstacle)
	.=..()
	if(iscarbon(obstacle))
		var/mob/living/carbon/J = obstacle
		J.take_organ_damage(3)
		say(pick("Freedom kick!", "Udar svobody!", "Ukhodi!"))
		J.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(3,6),30)

/mob/living/carbon/superior_animal/robot/excelsior/poporavtomat/death(gibbed, deathmessage = "buzzes out and teleports out of its current location!")
	walk_to(src,0)
	target_mob = null
	icon_state = icon_dead
	density = 0
	return ..(gibbed,deathmessage)
