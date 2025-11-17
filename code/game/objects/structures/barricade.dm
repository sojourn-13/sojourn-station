//Barricades!
/obj/structure/barricade
	name = "barricade"
	desc = "An improvised barrier designed to block access."
	icon = 'icons/obj/structures.dmi'
	icon_state = "barricade"
	anchored = 1
	density = 1
	health = 100
	maxHealth = 100
	var/material/material
	var/cover_value = 85

/obj/structure/barricade/New(newloc, material_name)
	..(newloc)
	if(!material_name)
		material_name = "wood"
	material = get_material_by_name("[material_name]")
	if(!material)
		qdel(src)
		return
	name = "[material.display_name] barricade"
	desc = "This space is blocked off by a barricade made of [material.display_name]."
	color = material.icon_colour
	maxHealth = material.integrity
	health = maxHealth

/obj/structure/barricade/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)
	if(istype(user))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.do_attack_animation(src)
		visible_message(SPAN_DANGER("[user] smashes into [src]!"))
		take_damage(damage)
		return TRUE

/obj/structure/barricade/proc/take_damage(amount)
	health -= amount
	if(health <= 0)
		visible_message(SPAN_WARNING("\The [src] breaks down!"))
		playsound(loc, 'sound/effects/grillehit.ogg', 50, 1)
		dismantle()
		qdel(src)

/obj/structure/barricade/get_matter()
	. = ..()
	if(material)
		LAZYAPLUS(., material.name, 5)

/obj/structure/barricade/get_material()
	return material

/obj/structure/barricade/attackby(obj/item/W as obj, mob/user as mob)
	if(user.a_intent == I_HELP && istype(W, /obj/item/gun))
		var/obj/item/gun/G = W
		G.gun_brace(user, src)
		return
	if(istype(W, /obj/item/stack))
		var/obj/item/stack/D = W
		if(D.get_material_name() != material.name)
			return //hitting things with the wrong type of stack usually doesn't produce messages, and probably doesn't need to.
		if(health < maxHealth)
			if(D.get_amount() < 1)
				to_chat(user, SPAN_WARNING("You need one sheet of [material.display_name] to repair \the [src]."))
				return
			visible_message(SPAN_NOTICE("[user] begins to repair \the [src]."))
			if(do_after(user,20,src) && health < maxHealth)
				if(D.use(1))
					health = maxHealth
					visible_message(SPAN_NOTICE("[user] repairs \the [src]."))
				return
		return
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		switch(W.damtype)
			if("fire")
				health -= W.force * 1
			if("brute")
				health -= W.force * 0.75
			else
		if(health <= 0)
			visible_message(SPAN_DANGER("The barricade is smashed apart!"))
			dismantle()
			qdel(src)
			return
		..()

/obj/structure/barricade/proc/dismantle()
	drop_materials(drop_location())
	qdel(src)
	return

/obj/structure/barricade/ex_act(severity)
	switch(severity)
		if(1)
			visible_message(SPAN_DANGER("\The [src] is blown apart!"))
			qdel(src)
			return
		if(2)
			health -= 25
			if(health <= 0)
				visible_message(SPAN_DANGER("\The [src] is blown apart!"))
				dismantle()
			return

/obj/structure/barricade/proc/check_cover_dry(obj/item/projectile/Proj)
	if(!Proj)
		return

	if(Proj.testing)
		return TRUE

	//Flimsy grilles aren't so great at stopping projectiles. However they can absorb some of the impact
	var/damage = Proj.get_structure_damage()
	var/passthrough = FALSE

	if(!damage)
		return

	//are cheap and affective
	//Note that if we DIDNT roll cover_value twice we would be completely blocked.
	if(prob(cover_value))
		passthrough = TRUE
		bullet_weaken(Proj, subtractor_brute = 1, mult_brute = 0.9, subtractor_burn = 0, mult_burn = 0.8) //Lasers have a harder time

	if(passthrough)
		. = PROJECTILE_CONTINUE

	if(!passthrough)
		health -= damage*2
	else
		damage = between(0, (damage - Proj.get_structure_damage())*(Proj.damage_types[BRUTE] ? 0.4 : 1), 10) //if the bullet passes through then the grille avoids most of the damage

	healthCheck()

/obj/structure/barricade/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if(istype(mover,/obj/item/projectile))
		return (check_cover_dry(mover))

	if(air_group || (height==0))
		return TRUE
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return TRUE
	else
		return FALSE