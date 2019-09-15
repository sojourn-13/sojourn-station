/* Toys!
 * Contains:
 *		Balloons
 *		Fake telebeacon
 *		Fake singularity
 *		Toy crossbow
 *		Toy swords
 *		Toy bosun's whistle
 *      Toy mechs
 *		Snap pops
 *		Water flower
 *      Therapy dolls
 *      Toddler doll
 *      Inflatable duck
 *		Action figures
 *		Plushies
 *		Toy cult sword
 */


/obj/item/toy
	throwforce = 0
	throw_speed = 4
	throw_range = 20
	force = 0


/*
 * Balloons
 */
/obj/item/toy/junk/balloon
	name = "water balloon"
	desc = "A translucent balloon. There's nothing in it."
	icon = 'icons/obj/toy.dmi'
	icon_state = "waterballoon-e"
	item_state = "balloon-empty"

/obj/item/toy/junk/balloon/New()
	var/datum/reagents/R = new/datum/reagents(10)
	reagents = R
	R.my_atom = src

/obj/item/toy/junk/balloon/attack(mob/living/carbon/human/M as mob, mob/user as mob)
	return

/obj/item/toy/junk/balloon/afterattack(atom/A as mob|obj, mob/user as mob, proximity)
	if(!proximity) return
	if (istype(A, /obj/structure/reagent_dispensers/watertank) && get_dist(src,A) <= 1)
		A.reagents.trans_to_obj(src, 10)
		to_chat(user, SPAN_NOTICE("You fill the balloon with the contents of [A]."))
		src.desc = "A translucent balloon with some form of liquid sloshing around in it."
		src.update_icon()
	return

/obj/item/toy/junk/balloon/attackby(obj/O as obj, mob/user as mob)
	if(istype(O, /obj/item/weapon/reagent_containers/glass))
		if(O.reagents)
			if(O.reagents.total_volume < 1)
				to_chat(user, "The [O] is empty.")
			else if(O.reagents.total_volume >= 1)
				if(O.reagents.has_reagent("pacid", 1))
					to_chat(user, "The acid chews through the balloon!")
					O.reagents.splash(user, reagents.total_volume)
					qdel(src)
				else
					src.desc = "A translucent balloon with some form of liquid sloshing around in it."
					to_chat(user, SPAN_NOTICE("You fill the balloon with the contents of [O]."))
					O.reagents.trans_to_obj(src, 10)
	src.update_icon()
	return

/obj/item/toy/junk/balloon/throw_impact(atom/hit_atom)
	if(src.reagents.total_volume >= 1)
		src.visible_message(SPAN_WARNING("\The [src] bursts!"),"You hear a pop and a splash.")
		src.reagents.touch_turf(get_turf(hit_atom))
		for(var/atom/A in get_turf(hit_atom))
			src.reagents.touch(A)
		src.icon_state = "burst"
		spawn(5)
			if(src)
				qdel(src)
	return

/obj/item/toy/junk/balloon/update_icon()
	if(src.reagents.total_volume >= 1)
		icon_state = "waterballoon"
		item_state = "balloon"
	else
		icon_state = "waterballoon-e"
		item_state = "balloon-empty"


/obj/item/toy/junk/blink
	name = "electronic blink toy game"
	desc = "Blink.  Blink.  Blink. Ages 8 and up."
	icon = 'icons/obj/radio.dmi'
	icon_state = "beacon"
	item_state = "signaler"

/obj/item/toy/junk/spinningtoy
	name = "gravitational singularity"
	desc = "\"Singulo\" brand spinning toy."
	icon = 'icons/obj/singularity.dmi'
	icon_state = "singularity_s1"

/obj/item/toy/junk/stickhorse
	name = "stick horse"
	desc = "A pretend horse on a stick for any aspiring little cowboy to ride."
	icon = 'icons/obj/toy.dmi'
	icon_state = "stickhorse"

/obj/item/toy/junk/xmas_tree
	name = "Miniature Christmas tree"
	desc = "Tiny cute Christmas tree."
	icon = 'icons/obj/toy.dmi'
	icon_state = "tinyxmastree"

/*
 * Toy crossbow
 */

/obj/item/toy/weapon/crossbow
	name = "foam dart crossbow"
	desc = "A weapon favored by many overactive children. Ages 8 and up."
	icon = 'icons/obj/guns/energy.dmi'
	icon_state = "crossbow"
	item_state = "crossbow"
	item_icons = list(
		icon_l_hand = 'icons/mob/items/lefthand_guns.dmi',
		icon_r_hand = 'icons/mob/items/righthand_guns.dmi',
		)
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("attacked", "struck", "hit")
	var/bullets = 5

	examine(mob/user)
		if(..(user, 2) && bullets)
			to_chat(user, SPAN_NOTICE("It is loaded with [bullets] foam darts!"))

	attackby(obj/item/I as obj, mob/user as mob)
		if(istype(I, /obj/item/toy/ammo/crossbow))
			if(bullets <= 4)
				user.drop_item()
				qdel(I)
				bullets++
				to_chat(user, SPAN_NOTICE("You load the foam dart into the crossbow."))
			else
				to_chat(usr, SPAN_WARNING("It's already fully loaded."))


	afterattack(atom/target as mob|obj|turf|area, mob/user as mob, flag)
		if(!isturf(target.loc) || target == user) return
		if(flag) return

		if (locate (/obj/structure/table, src.loc))
			return
		else if (bullets)
			var/turf/trg = get_turf(target)
			var/obj/effect/foam_dart_dummy/D = new/obj/effect/foam_dart_dummy(get_turf(src))
			bullets--
			D.icon_state = "foamdart"
			D.name = "foam dart"
			playsound(user.loc, 'sound/items/syringeproj.ogg', 50, 1)

			for(var/i=0, i<6, i++)
				if (D)
					if(D.loc == trg) break
					step_towards(D,trg)

					for(var/mob/living/M in D.loc)
						if(!isliving(M))
							continue
						if(M == user)
							continue
						for(var/mob/O in viewers(world.view, D))
							O.show_message(SPAN_WARNING("\The [M] was hit by the foam dart!"), 1)
						new /obj/item/toy/ammo/crossbow(M.loc)
						qdel(D)
						return

					for(var/atom/A in D.loc)
						if(A == user) continue
						if(A.density)
							new /obj/item/toy/ammo/crossbow(A.loc)
							qdel(D)

				sleep(1)

			spawn(10)
				if(D)
					new /obj/item/toy/ammo/crossbow(D.loc)
					qdel(D)

			return
		else if (bullets == 0)
			user.Weaken(5)
			for(var/mob/O in viewers(world.view, user))
				O.show_message(SPAN_WARNING("\The [user] realized they were out of ammo and starting scrounging for some!"), 1)


	attack(mob/M as mob, mob/user as mob)
		src.add_fingerprint(user)

// ******* Check

		if (src.bullets > 0 && M.lying)

			for(var/mob/O in viewers(M, null))
				if(O.client)
					O.show_message(SPAN_DANGER("\The [user] casually lines up a shot with [M]'s head and pulls the trigger!"), 1, SPAN_WARNING("You hear the sound of foam against skull"), 2)
					O.show_message(SPAN_WARNING("\The [M] was hit in the head by the foam dart!"), 1)

			playsound(user.loc, 'sound/items/syringeproj.ogg', 50, 1)
			new /obj/item/toy/ammo/crossbow(M.loc)
			src.bullets--
		else if (M.lying && src.bullets == 0)
			for(var/mob/O in viewers(M, null))
				if (O.client)
					O.show_message(SPAN_DANGER("\The [user] casually lines up a shot with [M]'s head, pulls the trigger, then realizes they are out of ammo and drops to the floor in search of some!"), 1, SPAN_WARNING("You hear someone fall"), 2)
			user.Weaken(5)
		return

/obj/item/toy/ammo/crossbow
	name = "foam dart"
	desc = "It's nerf or nothing! Ages 8 and up."
	icon = 'icons/obj/toy.dmi'
	icon_state = "foamdart"
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS

/obj/effect/foam_dart_dummy
	name = ""
	desc = ""
	icon = 'icons/obj/toy.dmi'
	icon_state = "null"
	anchored = 1
	density = 0


/*
 * Toy swords
 */
/obj/item/toy/weapon/sword
	name = "toy sword"
	desc = "A cheap, plastic replica of an energy sword. Realistic sounds! Ages 8 and up."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "sword0"
	item_state = "sword0"
	var/active = 0.0
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("attacked", "struck", "hit")

	attack_self(mob/user as mob)
		src.active = !( src.active )
		if (src.active)
			to_chat(user, SPAN_NOTICE("You extend the plastic blade with a quick flick of your wrist."))
			playsound(user, 'sound/weapons/saberon.ogg', 50, 1)
			src.icon_state = "swordblue"
			src.item_state = "swordblue"
			src.w_class = ITEM_SIZE_LARGE
		else
			to_chat(user, SPAN_NOTICE("You push the plastic blade back down into the handle."))
			playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)
			src.icon_state = "sword0"
			src.item_state = "sword0"
			src.w_class = ITEM_SIZE_SMALL

		update_wear_icon()

		src.add_fingerprint(user)
		return

/obj/item/toy/weapon/katana
	name = "replica katana"
	desc = "Woefully underpowered in D20."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "katana"
	item_state = "katana"
	flags = CONDUCT
	slot_flags = SLOT_BELT | SLOT_BACK
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced")

/*
 * Snap pops
 */
/obj/item/toy/junk/snappop
	name = "snap pop"
	desc = "Wow!"
	icon = 'icons/obj/toy.dmi'
	icon_state = "snappop"
	w_class = ITEM_SIZE_TINY

	throw_impact(atom/hit_atom)
		..()
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, src)
		s.start()
		new /obj/effect/decal/cleanable/ash(src.loc)
		src.visible_message(SPAN_WARNING("The [src.name] explodes!"),SPAN_WARNING("You hear a snap!"))
		playsound(src, 'sound/effects/snap.ogg', 50, 1)
		qdel(src)

/obj/item/toy/junk/snappop/Crossed(H as mob|obj)
	if((ishuman(H))) //i guess carp and shit shouldn't set them off
		var/mob/living/carbon/M = H
		if(MOVING_QUICKLY(M))
			to_chat(M, SPAN_WARNING("You step on the snap pop!"))

			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(2, 0, src)
			s.start()
			new /obj/effect/decal/cleanable/ash(src.loc)
			src.visible_message(SPAN_WARNING("The [src.name] explodes!"),SPAN_WARNING("You hear a snap!"))
			playsound(src, 'sound/effects/snap.ogg', 50, 1)
			qdel(src)

/*
 * Water flower
 */
/obj/item/toy/weapon/waterflower
	name = "water flower"
	desc = "A seemingly innocent sunflower...with a twist."
	icon = 'icons/obj/device.dmi'
	icon_state = "sunflower"
	item_state = "sunflower"
	var/empty = 0
	flags

/obj/item/toy/weapon/waterflower/New()
	var/datum/reagents/R = new/datum/reagents(10)
	reagents = R
	R.my_atom = src
	R.add_reagent("water", 10)

/obj/item/toy/weapon/waterflower/attack(mob/living/carbon/human/M as mob, mob/user as mob)
	return

/obj/item/toy/weapon/waterflower/afterattack(atom/A as mob|obj, mob/user as mob)

	if (istype(A, /obj/item/weapon/storage/backpack ))
		return

	else if (locate (/obj/structure/table, src.loc))
		return

	else if (istype(A, /obj/structure/reagent_dispensers/watertank) && get_dist(src,A) <= 1)
		A.reagents.trans_to(src, 10)
		to_chat(user, SPAN_NOTICE("You refill your flower!"))
		return

	else if (src.reagents.total_volume < 1)
		src.empty = 1
		to_chat(user, SPAN_NOTICE("Your flower has run dry!"))
		return

	else
		src.empty = 0


		var/obj/effect/decal/D = new/obj/effect/decal/(get_turf(src))
		D.name = "water"
		D.icon = 'icons/obj/chemical.dmi'
		D.icon_state = "chempuff"
		D.create_reagents(5)
		src.reagents.trans_to_obj(D, 1)
		playsound(src.loc, 'sound/effects/spray3.ogg', 50, 1, -6)

		spawn(0)
			for(var/i=0, i<1, i++)
				step_towards(D,A)
				D.reagents.touch_turf(get_turf(D))
				for(var/atom/T in get_turf(D))
					D.reagents.touch(T)
					if(ismob(T) && T:client)
						to_chat(T:client, SPAN_WARNING("\The [user] has sprayed you with water!"))
				sleep(4)
			qdel(D)

		return

/obj/item/toy/weapon/waterflower/examine(mob/user)
	if(..(user, 0))
		to_chat(user, text("\icon[] [] units of water left!", src, src.reagents.total_volume))

/*
 * Bosun's whistle
 */

/obj/item/toy/junk/bosunwhistle
	name = "bosun's whistle"
	desc = "A genuine Admiral Krush Bosun's Whistle, for the aspiring ship's captain! Suitable for ages 8 and up, do not swallow."
	icon = 'icons/obj/toy.dmi'
	icon_state = "bosunwhistle"
	var/cooldown = 0
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS

/obj/item/toy/junk/bosunwhistle/attack_self(mob/user as mob)
	if(cooldown < world.time - 35)
		to_chat(user, SPAN_NOTICE("You blow on [src], creating an ear-splitting noise!"))
		playsound(user, 'sound/misc/boatswain.ogg', 20, 1)
		cooldown = world.time

/*
 * Mech prizes
 */
/obj/item/toy/figure/mecha
	icon = 'icons/obj/toy.dmi'
	icon_state = "blank"
	var/cooldown = 0

//all credit to skasi for toy mech fun ideas
/obj/item/toy/figure/mecha/attack_self(mob/user as mob)
	if(cooldown < world.time - 8)
		to_chat(user, SPAN_NOTICE("You play with [src]."))
		playsound(user, 'sound/mecha/mechstep.ogg', 20, 1)
		cooldown = world.time

/obj/item/toy/figure/mecha/attack_hand(mob/user as mob)
	if(loc == user)
		if(cooldown < world.time - 8)
			to_chat(user, SPAN_NOTICE("You play with [src]."))
			playsound(user, 'sound/mecha/mechturn.ogg', 20, 1)
			cooldown = world.time
			return
	..()

/obj/item/toy/figure/mecha/ripley
	name = "toy ripley"
	desc = "Mini-Mecha action figure! Collect them all! 1/11."
	icon_state = "ripleytoy"

/obj/item/toy/figure/mecha/fireripley
	name = "toy firefighting ripley"
	desc = "Mini-Mecha action figure! Collect them all! 2/11."
	icon_state = "fireripleytoy"

/obj/item/toy/figure/mecha/deathripley
	name = "toy deathsquad ripley"
	desc = "Mini-Mecha action figure! Collect them all! 3/11."
	icon_state = "deathripleytoy"

/obj/item/toy/figure/mecha/gygax
	name = "toy gygax"
	desc = "Mini-Mecha action figure! Collect them all! 4/11."
	icon_state = "gygaxtoy"

/obj/item/toy/figure/mecha/durand
	name = "toy durand"
	desc = "Mini-Mecha action figure! Collect them all! 5/11."
	icon_state = "durandprize"

/obj/item/toy/figure/mecha/honk
	name = "toy H.O.N.K."
	desc = "Mini-Mecha action figure! Collect them all! 6/11."
	icon_state = "honkprize"

/obj/item/toy/figure/mecha/marauder
	name = "toy marauder"
	desc = "Mini-Mecha action figure! Collect them all! 7/11."
	icon_state = "marauderprize"

/obj/item/toy/figure/mecha/seraph
	name = "toy seraph"
	desc = "Mini-Mecha action figure! Collect them all! 8/11."
	icon_state = "seraphprize"

/obj/item/toy/figure/mecha/mauler
	name = "toy mauler"
	desc = "Mini-Mecha action figure! Collect them all! 9/11."
	icon_state = "maulerprize"

/obj/item/toy/figure/mecha/odysseus
	name = "toy odysseus"
	desc = "Mini-Mecha action figure! Collect them all! 10/11."
	icon_state = "odysseusprize"

/obj/item/toy/figure/mecha/phazon
	name = "toy phazon"
	desc = "Mini-Mecha action figure! Collect them all! 11/11."
	icon_state = "phazonprize"

/*
 * Action figures
 */

/obj/item/toy/figure/character
	icon_state = "blank"
	icon = 'icons/obj/toy.dmi'
	var/cooldown = 0
	var/toysay = "What the fuck did you do?"

/obj/item/toy/figure/character/attack_self(mob/user as mob)
	if(cooldown < world.time)
		cooldown = (world.time + 30) //3 second cooldown
		user.visible_message("<span class='notice'>The [src] says \"[toysay]\".</span>")
		playsound(user, 'sound/machines/click.ogg', 20, 1)

/*Civilian*/

/obj/item/toy/figure/character/civilian/assistant
	name = "Assistant action figure"
	desc = "A \"Space Life\" brand Assistant action figure."
	icon_state = "assistant"

/obj/item/toy/figure/character/civilian/bartender
	name = "Bartender action figure"
	desc = "A \"Space Life\" brand Bartender action figure."
	icon_state = "bartender"

/obj/item/toy/figure/character/civilian/janitor
	name = "Janitor action figure"
	desc = "A \"Space Life\" brand Janitor action figure."
	icon_state = "janitor"

/obj/item/toy/figure/character/civilian/gardener
	name = "Gardener action figure"
	desc = "A \"Space Life\" brand Gardener action figure."
	icon_state = "gardener"

/obj/item/toy/figure/character/civilian/chaplain
	name = "Monochurch Preacher action figure"
	desc = "A \"Space Life\" brand Monochurch Preacher action figure."
	icon_state = "chaplain"

/obj/item/toy/figure/character/civilian/entertainer
	name = "entertainer action figure"
	desc = "A \"Space Life\" brand entertainer action figure."
	icon_state = "clown"

/obj/item/toy/figure/character/civilian/chef
	name = "Chef action figure"
	desc = "A \"Space Life\" brand Chef action figure."
	icon_state = "chef"

/*Moebius*/

/obj/item/toy/figure/character/moebius/cmo
	name = "Chief Medical Officer action figure"
	desc = "A \"Space Life\" brand Chief Medical Officer action figure."
	icon_state = "cmo"

/obj/item/toy/figure/character/moebius/rd
	name = "Research Director action figure"
	desc = "A \"Space Life\" brand Research Director action figure."
	icon_state = "rd"

/obj/item/toy/figure/character/moebius/md
	name = "Medical Doctor action figure"
	desc = "A \"Space Life\" brand Medical Doctor action figure."
	icon_state = "md"

/obj/item/toy/figure/character/moebius/roboticist
	name = "Roboticist action figure"
	desc = "A \"Space Life\" brand Roboticist action figure."
	icon_state = "roboticist"

/obj/item/toy/figure/character/moebius/scientist
	name = "Scientist action figure"
	desc = "A \"Space Life\" brand Scientist action figure."
	icon_state = "scientist"

/obj/item/toy/figure/character/moebius/chemist
	name = "Chemist action figure"
	desc = "A \"Space Life\" brand Chemist action figure."
	icon_state = "chemist"

/obj/item/toy/figure/character/moebius/borg
	name = "Cyborg action figure"
	desc = "A \"Space Life\" brand Cyborg action figure."
	icon_state = "borg"

/obj/item/toy/figure/character/moebius/psychologist
	name = "Psychologist action figure"
	desc = "A \"Space Life\" brand Psychologist action figure."
	icon_state = "psychologist"

/obj/item/toy/figure/character/moebius/paramedic
	name = "Paramedic action figure"
	desc = "A \"Space Life\" brand Paramedic action figure."
	icon_state = "paramedic"

/*Command*/

/obj/item/toy/figure/character/command/captain
	name = "Captain action figure"
	desc = "A \"Space Life\" brand Captain action figure."
	icon_state = "captain"

/obj/item/toy/figure/character/command/firstofficer
	name = "Head of Personel action figure"
	desc = "A \"Space Life\" brand Head of Personel action figure."
	icon_state = "hop"

/obj/item/toy/figure/character/command/corgi
	name = "Corgi action figure"
	desc = "A \"Space Life\" brand Corgi action figure."
	icon_state = "ian"

/obj/item/toy/figure/character/command/ai
	name = "ai action figure"
	desc = "A \"Space Life\" brand AI action figure."
	icon_state = "ian"

/*Guild*/

/obj/item/toy/figure/character/guild/qm
	name = "Quartermaster action figure"
	desc = "A \"Space Life\" brand Quartermaster action figure."
	icon_state = "qm"

/obj/item/toy/figure/character/guild/cargotech
	name = "Cargo Technician action figure"
	desc = "A \"Space Life\" brand Cargo Technician action figure."
	icon_state = "cargotech"

/obj/item/toy/figure/character/guild/miner
	name = "Shaft Miner action figure"
	desc = "A \"Space Life\" brand Shaft Miner action figure."
	icon_state = "miner"

/*Technomancer*/

/obj/item/toy/figure/character/technomancer/ce
	name = "Chief Engineer action figure"
	desc = "A \"Space Life\" brand Chief Engineer action figure."
	icon_state = "ce"

/obj/item/toy/figure/character/technomancer/engineer
	name = "Technomancer action figure"
	desc = "A \"Space Life\" brand Technomancer action figure."
	icon_state = "engineer"

/*Ironhammer*/

/obj/item/toy/figure/character/ironhammer/hos
	name = "Ironhammer Commander action figure"
	desc = "A \"Space Life\" brand Ironhammer Commander action figure."
	icon_state = "hos"

/obj/item/toy/figure/character/ironhammer/secofficer
	name = "Security Officer action figure"
	desc = "A \"Space Life\" brand Security Officer action figure."
	icon_state = "secofficer"

/obj/item/toy/figure/character/ironhammer/warden
	name = "Warden action figure"
	desc = "A \"Space Life\" brand Warden action figure."
	icon_state = "warden"

/obj/item/toy/figure/character/ironhammer/detective
	name = "Detective action figure"
	desc = "A \"Space Life\" brand Detective action figure."
	icon_state = "detective"

/*Discontinued*/

/obj/item/toy/figure/character/discontinued/agent
	name = "Internal Affairs Agent action figure"
	desc = "A \"Space Life\" brand Internal Affairs Agent action figure."
	icon_state = "agent"

/obj/item/toy/figure/character/discontinued/librarian
	name = "Librarian action figure"
	desc = "A \"Space Life\" brand Librarian action figure."
	icon_state = "librarian"

/obj/item/toy/figure/character/discontinued/mime
	name = "Mime action figure"
	desc = "A \"Space Life\" brand Mime action figure."
	icon_state = "mime"

/obj/item/toy/figure/character/discontinued/dsquad
	name = "Space Commando action figure"
	desc = "A \"Space Life\" brand Space Commando action figure."
	icon_state = "dsquad"

/obj/item/toy/figure/character/discontinued/geneticist
	name = "Geneticist action figure"
	desc = "A \"Space Life\" brand Geneticist action figure, which was recently dicontinued."
	icon_state = "geneticist"

/obj/item/toy/figure/character/discontinued/atmos
	name = "Atmospheric Technician action figure"
	desc = "A \"Space Life\" brand Atmospheric Technician action figure."
	icon_state = "atmos"

/*Villains*/

/obj/item/toy/figure/character/villains/ninja
	name = "Space Ninja action figure"
	desc = "A \"Space Life\" brand Space Ninja action figure."
	icon_state = "ninja"

/obj/item/toy/figure/character/villains/wizard
	name = "Wizard action figure"
	desc = "A \"Space Life\" brand Wizard action figure."
	icon_state = "wizard"

/obj/item/toy/figure/character/villains/syndie
	name = "Doom Operative action figure"
	desc = "A \"Space Life\" brand Doom Operative action figure."
	icon_state = "syndie"

/obj/item/toy/figure/character/villains/alien
	name = "alien action figure"
	desc = "A \"Space Life\" brand Space Ninja action figure."
	icon_state = "aliencharacter"

/obj/item/toy/figure/character/villains/owl
	name = "owl-man action figure"
	desc = "A \"Space Life\" brand Space Ninja action figure."
	icon_state = "owlprize"

/obj/item/toy/figure/character/villains/griffin
	name = "griffin-man action figure"
	desc = "A \"Space Life\" brand Space Ninja action figure."
	icon_state = "griffinprize"

/*D&D*/

/obj/item/toy/figure/character/rpg/warrior
	name = "warrior miniature"
	desc = "That sword would make a decent toothpick."
	icon_state = "warriorcharacter"

/obj/item/toy/figure/character/rpg/cleric
	name = "cleric miniature"
	desc = "A wee little cleric, with his wee little staff."
	icon_state = "clericcharacter"

/obj/item/toy/figure/character/rpg/thief
	name = "thief miniature"
	desc = "Hey, where did my wallet go!?"
	icon_state = "thiefcharacter"

/obj/item/toy/figure/character/rpg/wizard
	name = "wizard miniature"
	desc = "MAGIC!"
	icon_state = "wizardcharacter"

/obj/item/toy/figure/character/rpg/voidone
	name = "void one miniature"
	desc = "The dark lord has risen!"
	icon_state = "darkmastercharacter"

/obj/item/toy/figure/character/rpg/lich
	name = "lich miniature"
	desc = "Murderboner extraordinaire."
	icon_state = "lichcharacter"


/*
 * Plushies
 */

//Large plushies.
/obj/structure/plushie
	name = "generic plush"
	desc = "A very generic plushie. It seems to not want to exist."
	icon = 'icons/obj/toy.dmi'
	icon_state = "ianplushie"
	anchored = 0
	density = 1
	var/phrase = "I don't want to exist anymore!"

/obj/structure/plushie/attack_hand(mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(user.a_intent == I_HELP)
		user.visible_message(SPAN_NOTICE("<b>\The [user]</b> hugs [src]!"),SPAN_NOTICE("You hug [src]!"))
	else if (user.a_intent == I_HURT)
		user.visible_message(SPAN_WARNING("<b>\The [user]</b> punches [src]!"),SPAN_WARNING("You punch [src]!"))
	else if (user.a_intent == I_GRAB)
		user.visible_message(SPAN_WARNING("<b>\The [user]</b> attempts to strangle [src]!"),SPAN_WARNING("You attempt to strangle [src]!"))
	else
		user.visible_message(SPAN_NOTICE("<b>\The [user]</b> pokes the [src]."),SPAN_NOTICE("You poke the [src]."))
		visible_message("[src] says, \"[phrase]\"")

/obj/structure/plushie/ian
	name = "plush corgi"
	desc = "A plushie of an adorable corgi! Don't you just want to hug it and squeeze it and call it \"Ian\"?"
	icon_state = "ianplushie"
	phrase = "Arf!"

/obj/structure/plushie/drone
	name = "plush drone"
	desc = "A plushie of a happy drone! It appears to be smiling, and has a small tag which reads \"N.D.V. Icarus Gift Shop\"."
	icon_state = "droneplushie"
	phrase = "Beep boop!"

/obj/structure/plushie/carp
	name = "plush carp"
	desc = "A plushie of an elated carp! Straight from the wilds of the Nyx frontier, now right here in your hands."
	icon_state = "carpplushie"
	phrase = "Glorf!"

/obj/structure/plushie/beepsky
	name = "plush Officer Sweepsky"
	desc = "A plushie of a popular industrious cleaning robot! If it could feel emotions, it would love you."
	icon_state = "beepskyplushie"
	phrase = "Ping!"

//Small plushies.
/obj/item/toy/plushie
	name = "diona nymph plushie"
	desc = "A plushie of an adorable diona nymph!"
	icon = 'icons/obj/toy.dmi'
	icon_state = "nymphplushie"
	var/phrase = "I don't want to exist anymore!"

/obj/item/toy/plushie/attack_self(mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(user.a_intent == I_HELP)
		user.visible_message(SPAN_NOTICE("<b>\The [user]</b> hugs [src]!"),SPAN_NOTICE("You hug [src]!"))
	else if (user.a_intent == I_HURT)
		user.visible_message(SPAN_WARNING("<b>\The [user]</b> punches [src]!"),SPAN_WARNING("You punch [src]!"))
	else if (user.a_intent == I_GRAB)
		user.visible_message(SPAN_WARNING("<b>\The [user]</b> attempts to strangle [src]!"),SPAN_WARNING("You attempt to strangle [src]!"))
	else
		user.visible_message(SPAN_NOTICE("<b>\The [user]</b> pokes the [src]."),SPAN_NOTICE("You poke the [src]."))
		visible_message("[src] says, \"[phrase]\"")

/obj/item/toy/plushie/verb/rename_plushie()
	set name = "Name Plushie"
	set category = "Object"
	set desc = "Give your plushie a cute name!"
	var/mob/M = usr
	if(!M.mind)
		return 0

	var/input = sanitizeSafe(input("What do you want to name the plushie?", ,""), MAX_NAME_LEN)

	if(src && input && !M.stat && in_range(M,src))
		name = input
		to_chat(M, "You name the plushie [input], giving it a hug for good luck.")
		return 1

/obj/item/toy/plushie/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/toy/plushie) || istype(I, /obj/item/organ/external/head))
		user.visible_message("<span class='notice'>[user] makes \the [I] kiss \the [src]!.</span>", \
		"<span class='notice'>You make \the [I] kiss \the [src]!.</span>")
	return ..()

/obj/item/toy/plushie/mouse
	name = "mouse plushie"
	desc = "A plushie of a delightful mouse! What was once considered a vile rodent is now your very best friend."
	icon_state = "mouseplushie"

/obj/item/toy/plushie/kitten
	name = "kitten plushie"
	desc = "A plushie of a cute kitten! Watch as it purrs it's way right into your heart."
	icon_state = "kittenplushie"

/obj/item/toy/plushie/lizard
	name = "lizard plushie"
	desc = "A plushie of a scaly lizard! Very controversial, after being accused as \"racist\" by some Unathi."
	icon_state = "lizardplushie"

/obj/item/toy/plushie/spider
	name = "spider plushie"
	desc = "A plushie of a fuzzy spider! It has eight legs - all the better to hug you with."
	icon_state = "spiderplushie"

/obj/item/toy/plushie/farwa
	name = "farwa plushie"
	desc = "A farwa plush doll. It's soft and comforting!"
	icon_state = "farwaplushie"

/obj/item/toy/plushie/corgi
	name = "corgi plushie"
	icon_state = "corgi"
	phrase = "Woof!"

/obj/item/toy/plushie/corgi/girly
	name = "corgi girly plushie"
	icon_state = "girlycorgi"
	phrase = "Arf!"

/obj/item/toy/plushie/corgi/robo
	name = "corgi borg plushie"
	icon_state = "robotcorgi"
	phrase = "Bark."

/obj/item/toy/plushie/octopus
	name = "octopus plushie"
	icon_state = "loveable"
	phrase = "Squish!"

/obj/item/toy/plushie/face_hugger
	name = "facehugger plushie"
	icon_state = "huggable"
	phrase = "Hug!"

/obj/item/toy/plushie/fox
	name = "fox red plushie"
	icon_state = "redfox"
	phrase = "Gecker!"

/obj/item/toy/plushie/fox/black
	name = "fox black plushie"
	icon_state = "blackfox"
	phrase = "Ack!"

/obj/item/toy/plushie/fox/marble
	name = "fox marble plushie"
	icon_state = "marblefox"
	phrase = "Awoo!"

/obj/item/toy/plushie/fox/blue
	name = "fox blue plushie"
	icon_state = "bluefox"
	phrase = "Yoww!"

/obj/item/toy/plushie/fox/orange
	name = "fox orange plushie"
	icon_state = "orangefox"
	phrase = "Yagh!"

/obj/item/toy/plushie/fox/coffee
	name = "fox coffee plushie"
	icon_state = "coffeefox"
	phrase = "Gerr!"

/obj/item/toy/plushie/fox/pink
	name = "fox pink plushie"
	icon_state = "pinkfox"
	phrase = "Yack!"

/obj/item/toy/plushie/fox/purple
	name = "fox purple plushie"
	icon_state = "purplefox"
	phrase = "Whine!"

/obj/item/toy/plushie/fox/crimson
	name = "fox crimson plushie"
	icon_state = "crimsonfox"
	phrase = "Auuu!"

/obj/item/toy/plushie/deer
	name = "deer plushie"
	icon_state = "deer"
	phrase = "Bleat!"

/obj/item/toy/plushie/cat
	name = "cat black plushie"
	icon_state = "blackcat"
	phrase = "Mlem!"

/obj/item/toy/plushie/cat/grey
	name = "cat grey plushie"
	icon_state = "greycat"
	phrase = "Mraw!"

/obj/item/toy/plushie/cat/white
	name = "cat white plushie"
	icon_state = "whitecat"
	phrase = "Mew!"

/obj/item/toy/plushie/cat/orange
	name = "cat orange plushie"
	icon_state = "orangecat"
	phrase = "Meow!"

/obj/item/toy/plushie/cat/siamese
	name = "cat siamese plushie"
	icon_state = "siamesecat"
	phrase = "Mrew?"

/obj/item/toy/plushie/cat/tabby
	name = "cat tabby plushie"
	icon_state = "tabbycat"
	phrase = "Purr!"

/obj/item/toy/plushie/cat/tuxedo
	name = "cat tuxedo plushie"
	icon_state = "tuxedocat"
	phrase = "Mrowww!!"

/obj/item/toy/plushie/squid
	name = "squid green plushie"
	desc = "A small, cute and loveable squid friend. This one is green."
	icon_state = "greensquid"
	slot_flags = SLOT_HEAD
	phrase = "Squrr!"

/obj/item/toy/plushie/squid/mint
	name = "squid mint plushie"
	desc = "A small, cute and loveable squid friend. This one is mint."
	icon_state = "mintsquid"
	slot_flags = SLOT_HEAD
	phrase = "Blurble!"

/obj/item/toy/plushie/squid/blue
	name = "squid blue plushie"
	desc = "A small, cute and loveable squid friend. This one is blue."
	icon = 'icons/obj/toy.dmi'
	icon_state = "bluesquid"
	slot_flags = SLOT_HEAD
	phrase = "Blob!"

/obj/item/toy/plushie/squid/orange
	name = "squid orange plushie"
	desc = "A small, cute and loveable squid friend. This one is orange."
	icon_state = "orangesquid"
	slot_flags = SLOT_HEAD
	phrase = "Squash!"

/obj/item/toy/plushie/squid/yellow
	name = "squid yellow plushie"
	desc = "A small, cute and loveable squid friend. This one is yellow."
	icon_state = "yellowsquid"
	slot_flags = SLOT_HEAD
	phrase = "Glorble!"

/obj/item/toy/plushie/squid/pink
	name = "squid pink plushie"
	desc = "A small, cute and loveable squid friend. This one is pink."
	icon_state = "pinksquid"
	slot_flags = SLOT_HEAD
	phrase = "Wobble!"

/obj/item/toy/plushie/therapy
	name = "therapy red doll"
	desc = "A toy for therapeutic and recreational purposes. This one is red."
	icon_state = "therapyred"
	item_state = "egg4" // It's the red egg in items_left/righthand
	w_class = ITEM_SIZE_TINY

/obj/item/toy/plushie/therapy/purple
	name = "therapy purple doll"
	desc = "A toy for therapeutic and recreational purposes. This one is purple."
	icon_state = "therapypurple"
	item_state = "egg1" // It's the magenta egg in items_left/righthand
	w_class = ITEM_SIZE_TINY

/obj/item/toy/plushie/therapy/blue
	name = "therapy blue doll"
	desc = "A toy for therapeutic and recreational purposes. This one is blue."
	icon_state = "therapyblue"
	item_state = "egg2" // It's the blue egg in items_left/righthand
	w_class = ITEM_SIZE_TINY

/obj/item/toy/plushie/therapy/yellow
	name = "therapy yellow doll"
	desc = "A toy for therapeutic and recreational purposes. This one is yellow."
	icon_state = "therapyyellow"
	item_state = "egg5" // It's the yellow egg in items_left/righthand
	w_class = ITEM_SIZE_TINY

/obj/item/toy/plushie/therapy/orange
	name = "therapy orange doll"
	desc = "A toy for therapeutic and recreational purposes. This one is orange."
	icon_state = "therapyorange"
	item_state = "egg4" // It's the red one again, lacking an orange item_state and making a new one is pointless
	w_class = ITEM_SIZE_TINY

/obj/item/toy/plushie/therapy/green
	name = "therapy green doll"
	desc = "A toy for therapeutic and recreational purposes. This one is green."
	icon_state = "therapygreen"
	item_state = "egg3" // It's the green egg in items_left/righthand
	w_class = ITEM_SIZE_TINY

/obj/item/toy/plushie/carp
	name = "carp space plushie"
	desc = "An adorable stuffed toy that resembles a space carp."
	icon_state = "basecarp"
	attack_verb = list("bitten", "eaten", "fin slapped")
	var/bitesound = 'sound/weapons/bite.ogg'

// Attack mob
/obj/item/toy/plushie/carp/attack(mob/M as mob, mob/user as mob)
	playsound(loc, bitesound, 20, 1)	// Play bite sound in local area
	return ..()

// Attack self
/obj/item/toy/plushie/carp/attack_self(mob/user as mob)
	playsound(src.loc, bitesound, 20, 1)
	return ..()


/obj/random/carp_plushie
	name = "Random Carp Plushie"
	desc = "This is a random plushie"
	icon = 'icons/obj/toy.dmi'
	icon_state = "basecarp"

/obj/random/carp_plushie/item_to_spawn()
	return pick(typesof(/obj/item/toy/plushie/carp)) //can pick any carp plushie, even the original.

/obj/item/toy/plushie/carp/ice
	name = "carp ice plushie"
	icon_state = "icecarp"

/obj/item/toy/plushie/carp/silent
	name = "carp monochrome plushie"
	icon_state = "silentcarp"

/obj/item/toy/plushie/carp/electric
	name = "carp electric plushie"
	icon_state = "electriccarp"

/obj/item/toy/plushie/carp/gold
	name = "carp golden plushie"
	icon_state = "goldcarp"

/obj/item/toy/plushie/carp/toxin
	name = "carp toxic plushie"
	icon_state = "toxincarp"

/obj/item/toy/plushie/carp/dragon
	name = "carp dragon plushie"
	icon_state = "dragoncarp"

/obj/item/toy/plushie/carp/pink
	name = "carp pink plushie"
	icon_state = "pinkcarp"

/obj/item/toy/plushie/carp/candy
	name = "carp candy plushie"
	icon_state = "candycarp"

/obj/item/toy/plushie/carp/nebula
	name = "carp nebula plushie"
	icon_state = "nebulacarp"

/obj/item/toy/plushie/carp/void
	name = "carp void plushie"
	icon_state = "voidcarp"

//Toy cult sword
/obj/item/toy/weapon/cultsword
	name = "foam sword"
	desc = "An arcane weapon (made of foam) wielded by the followers of the hit Saturday morning cartoon \"King Nursee and the Acolytes of Heroism\"."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "cultblade"
	item_state = "cultblade"
	w_class = ITEM_SIZE_LARGE
	attack_verb = list("attacked", "slashed", "stabbed", "poked")

/obj/item/weapon/inflatable_duck
	name = "inflatable duck"
	desc = "No bother to sink or swim when you can just float!"
	icon_state = "inflatable"
	item_state = "inflatable"
	icon = 'icons/inventory/belt/icon.dmi'
	slot_flags = SLOT_BELT


//////////////////////////////////////////////////////
//				Magic 8-Ball / Conch				//
//////////////////////////////////////////////////////

/obj/item/toy/junk/eight_ball
	name = "\improper Magic 8-Ball"
	desc = "Mystical! Magical! Ages 8+!"
	icon = 'icons/obj/toy.dmi'
	icon_state = "eight-ball"
	var/use_action = "shakes the ball"
	var/cooldown = 0
	var/list/possible_answers = list("Definitely.", "All signs point to yes.", "Most likely.", "Yes.", "Ask again later.", "Better not tell you now.", "Future unclear.", "Maybe.", "Doubtful.", "No.", "Don't count on it.", "Never.")

/obj/item/toy/junk/eight_ball/attack_self(mob/user as mob)
	if(!cooldown)
		var/answer = pick(possible_answers)
		user.visible_message("<span class='notice'>[user] focuses on their question and [use_action]...</span>")
		user.visible_message("<span class='notice'>The [src] says \"[answer]\"</span>")
		spawn(30)
			cooldown = 0
		return

/obj/item/toy/junk/eight_ball/conch
	name = "Magic Conch shell"
	desc = "All hail the Magic Conch!"
	icon_state = "conch"
	use_action = "pulls the string"
	possible_answers = list("Yes.", "No.", "Try asking again.", "Nothing.", "I don't think so.", "Neither.", "Maybe someday.")
