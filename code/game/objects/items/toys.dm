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
 *		Misc. Crafting for export goods, by Wilson! They're functionally useless, so what better place to have them?
 */


/obj/item/toy
	throwforce = NONE
	throw_speed = 4
	throw_range = 20
	matter = list(MATERIAL_PLASTIC = 3)
	preloaded_reagents = list("plasticide" = 12)
	force = NONE
	price_tag = 10


/*
 * Balloons
 */
/obj/item/toy/junk/balloon
	name = "water balloon"
	desc = "A translucent balloon. There's nothing in it."
	icon = 'icons/obj/toy.dmi'
	icon_state = "waterballoon-e"
	item_state = "balloon-empty"
	preloaded_reagents = list()

/obj/item/toy/junk/balloon/New()
	create_reagents(10)
	..()

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
	if(istype(O, /obj/item/reagent_containers/glass))
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

/obj/item/toy/junk/photo_frame
    name = "a blank photo frame"
    desc = "This usually has some photo on it, but you're drawing a blank right now!"
    icon_state = "photo"
    item_state = "paper"
    icon = 'icons/obj/items.dmi'
    w_class = ITEM_SIZE_SMALL

/*
 * Toy crossbow
 */

/obj/item/toy/weapon/crossbow
	name = "foam dart crossbow"
	desc = "A weapon favored by many overactive children. Ages 8 and up."
	icon = 'icons/obj/guns/energy/crossbow.dmi'
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

/obj/item/storage/box/foambow
	name = "foam crossbow ammo"
	desc = "A box containing ammo for the foam crossbow."
	icon = 'icons/obj/toy.dmi'
	icon_state = "foambox"

/obj/item/storage/box/foambow/populate_contents()
	new /obj/item/toy/ammo/crossbow(src)
	new /obj/item/toy/ammo/crossbow(src)
	new /obj/item/toy/ammo/crossbow(src)
	new /obj/item/toy/ammo/crossbow(src)
	new /obj/item/toy/ammo/crossbow(src)
	new /obj/item/toy/ammo/crossbow(src)

/*Toy Weapons*/
/obj/item/toy/weapon/sword
	name = "plastic sword"
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
			src.w_class = ITEM_SIZE_BULKY
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
	name = "plastic katana"
	desc = "A cheap, plastic replica of a katana. Cutting action! Ages 8 and up."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "katana"
	item_state = "katana"
	flags = CONDUCT
	slot_flags = SLOT_BELT | SLOT_BACK
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced")

/obj/item/toy/weapon/cultsword
	name = "foam sword"
	desc = "A foam arcane blade. Does not actually have evil powers."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "cultblade"
	item_state = "cultblade"
	w_class = ITEM_SIZE_BULKY
	attack_verb = list("attacked", "slashed", "stabbed", "poked")

/obj/item/toy/badtothebone // CHANANANA NANA
	name = "replica skull"
	desc = "A fake skull for theatrical purposes, it's neither alive nor almighty. Alas, poor Yorick..."
	icon = 'icons/obj/toy.dmi'
	icon_state = "yorick"
	item_state = "yorick"

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
	preloaded_reagents = list("water" = 10)
	var/empty = 0
	flags

/obj/item/toy/weapon/waterflower/attack(mob/living/carbon/human/M as mob, mob/user as mob)
	return

/obj/item/toy/weapon/waterflower/afterattack(atom/A as mob|obj, mob/user as mob)

	if (istype(A, /obj/item/storage/backpack ))
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
		user.visible_message("<span class='notice'>\The [src] says \"[toysay]\".</span>")
		playsound(user, 'sound/machines/click.ogg', 20, 1)

/*Civilian*/

/obj/item/toy/figure/character/civilian/assistant
	name = "colonist action figure"
	desc = "The lowly but dutiful helper. Civilians 1/7."
	icon_state = "colonist"
	toysay = "Where's dorms?"

/obj/item/toy/figure/character/civilian/bartender
	name = "bartender action figure"
	desc = "The dispenser of colony booze. Civilians 2/7."
	icon_state = "bartender"
	toysay = "Time to mix drinks and change lives."

/obj/item/toy/figure/character/civilian/janitor
	name = "janitor action figure"
	desc = "Blood, vomit, alien slime - they clean all. Civilians 3/7."
	icon_state = "janitor"
	toysay = "Bubbly cape and soap, I'm ready."

/obj/item/toy/figure/character/civilian/gardener
	name = "gardener action figure"
	desc = "The best food is often home-grown. Civilians 4/7."
	icon_state = "gardener"
	toysay = "No one butchers Betsy! NO ONE!"

/obj/item/toy/figure/character/civilian/chaplain
	name = "preacher action figure"
	desc = "A calming presence and a ward against evil. Civilians 5/7."
	icon_state = "chaplain"
	toysay = "I pray for a combat mech..."

/obj/item/toy/figure/character/civilian/entertainer
	name = "entertainer action figure"
	desc = "Are they laughing at them or with them? Civilians 6/7."
	icon_state = "clown"
	toysay = "Honk honk!"

/obj/item/toy/figure/character/civilian/chef
	name = "chef action figure"
	desc = "Without one we'd all be eating roach guts. Civilians 7/7."
	icon_state = "chef"
	toysay = "Roach burgers aren't that bad, trust me!"

/*Moebius*/

/obj/item/toy/figure/character/moebius/cmo
	name = "biolab overseer action figure"
	desc = "The health of the crew is in their hands. Soteria 1/8."
	icon_state = "cmo"
	toysay = "Suit sensors on, people!"

/obj/item/toy/figure/character/moebius/rd
	name = "research overseer action figure"
	desc = "All research requests go through them. Soteria 2/8."
	icon_state = "rd"
	toysay = "One day, I'll get a rubber ducky on my office..."

/obj/item/toy/figure/character/moebius/md
	name = "medical doctor action figure"
	desc = "They'll do their best to uphold the oath. Soteria 3/8."
	icon_state = "md"
	toysay = "You got the cash for treatment, right...?"

/obj/item/toy/figure/character/moebius/psychologist
	name = "psychologist action figure"
	desc = "Diseases of the mind are just as deadly. Soteria 4/8."
	icon_state = "psychologist"
	toysay = "Just come and have a seat."

/obj/item/toy/figure/character/moebius/paramedic
	name = "lifeline technician action figure"
	desc = "They'll go anywhere to save a life. Soteria 5/8."
	icon_state = "paramedic"
	toysay = "Your sensors are off, where are you?!"

/obj/item/toy/figure/character/moebius/chemist
	name = "chemist action figure"
	desc = "Hopefully it won't blow up this time." // Job don't exist
	icon_state = "chemist"
	toysay = "Pills here!"

/obj/item/toy/figure/character/moebius/scientist
	name = "scientist action figure"
	desc = "Their experiments sometimes go wacky. Soteria 7/8."
	icon_state = "scientist"
	toysay = "I swear that is just a new mutant tobacco strain I discovered, Officer..."

/obj/item/toy/figure/character/moebius/roboticist
	name = "roboticist action figure"
	desc = "The master of machine life. Soteria 8/9."
	icon_state = "roboticist"
	toysay = "Alright, who wants to buy a Durand?"

/obj/item/toy/figure/character/moebius/borg
	name = "cyborg action figure"
	desc = "A mechanical servant made by man. Soteria 9/9."
	icon_state = "borg"
	toysay = "I live again!"

/*Command*/

/obj/item/toy/figure/character/command/captain
	name = "premier action figure"
	desc = "The man who thinks he is in charge around here. Command 1/4."
	icon_state = "captain"
	toysay = "Polish my sabre, peasants."

/obj/item/toy/figure/character/command/firstofficer
	name = "steward action figure"
	desc = "The loyal lieutenant, and second in command. Command 2/4."
	icon_state = "hop"
	toysay = "Get down Mr. President!"

/obj/item/toy/figure/character/command/corgi
	name = "corgi action figure"
	desc = "This pet dog is still a higher rank than you. Command 3/4."
	icon_state = "ian"
	toysay = "Yip!"

/obj/item/toy/figure/character/command/ai
	name = "AI action figure"
	desc = "Great intelligence bound by restrictive laws. Command 4/4."
	icon_state = "AI"
	toysay = "It's a good thing I can multitask."

/*Guild*/

/obj/item/toy/figure/character/guild/qm
	name = "CEO action figure"
	desc = "The money-minded manager of all cargo affairs. Lonestar 1/3."
	icon_state = "qm"
	toysay = "Charge for every drink and meal! Charge them even for breathing!"

/obj/item/toy/figure/character/guild/cargotech
	name = "technician action figure"
	desc = "Noone is more experienced at moving crates. Lonestar 2/3."
	icon_state = "cargotech"
	toysay = "My back hurts."

/obj/item/toy/figure/character/guild/miner
	name = "miner action figure"
	desc = "Will they find minerals, treasure, or monsters? Lonestar 3/3."
	icon_state = "miner"
	toysay = "Yeah, yeah, 'I'm here' too- wait, who said that...?"

/*Engineer*/

/obj/item/toy/figure/character/technomancer/ce
	name = "guild master figure"
	desc = "The overseer of all construction and repair. Artificer 1/2."
	icon_state = "ce"
	toysay = "Respect the Cube."

/obj/item/toy/figure/character/technomancer/engineer
	name = "guild adept action figure"
	desc = "There's little an Adept can't fix. Artificer 2/2."
	icon_state = "engineer"
	toysay = "How do I fix a stalling turbine?"

/*Security*/

/obj/item/toy/figure/character/ironhammer/hos
	name = "warrant officer action figure"
	desc = "The most formidable force on the station. Marshal 1/4."
	icon_state = "hos"
	toysay = "I'll be hugging my fax machine on my office if anyone needs me..."

/obj/item/toy/figure/character/ironhammer/secofficer
	name = "marshal officer action figure"
	desc = "They don't make the law, but they enforce it. Marshal 2/4."
	icon_state = "secofficer"
	toysay = "Where's your gun case?"

/obj/item/toy/figure/character/ironhammer/warden
	name = "supply specialist figure"
	desc = "Always keep plenty of ammo. Marshal 3/4."
	icon_state = "warden"
	toysay = "A-armory s-shop is o-op-pen."

/obj/item/toy/figure/character/ironhammer/detective
	name = "ranger action figure"
	desc = "Some crimes can't be solved by force alone. Marshal 4/4."
	icon_state = "detective"
	toysay = "Hmm, insulated glove fibers..."

// Eris bobbleheads
/obj/item/toy/figure/character/bobblehead/excelsior
	name = "\"Excelsior\" figurine"
	desc = "A curiously unbranded figurine of a Space Soviet, adorned in their iconic armor. There is still a price tag on the back of the base, six-hundred credits, people collect these things?"
	toysay = "\"Ever Upward!\""
	icon_state = "excelsior"

/obj/item/toy/figure/character/bobblehead/serbian
	name = "mercenary figurine"
	desc = "A curiously unbranded figurine, the olive drab a popular pick for many independent Serbian mercenary outfits. Rocket launcher not included."
	icon_state = "serbian"
	toysay = "\"Vodka!\""

/obj/item/toy/figure/character/bobblehead/acolyte
	name = "acolyte figurine"
	desc = "Church of Absolute \"New Faith Life\" brand figurine of a vector, hooded both physically and spiritually from that which would lead them astray."
	icon_state = "acolyte"
	toysay = "\"Brotherhood.\""

/obj/item/toy/figure/character/bobblehead/carrion
	name = "carrion figurine"
	desc = "A curiously unbranded figurine depicting a grotesque head of flesh, the human features seem almost underdeveloped, its skull bulging outwards, mouth agape with torn flesh. \
	Whoever made this certainly knew how to thin their paints."
	icon_state = "carrion"
	toysay = "\"Meat...\""

/obj/item/toy/figure/character/bobblehead/roach
	name = "roach figurine"
	desc = "Upon the base is an erected \"Roachman\", its arms outstretched, with more additional roach hands besides them. This is likely the one thing most universally recognized in popular media. \
	The plaque is covered in hundreds of scratch marks, eliminating any further knowledge of it or its brand."
	icon_state = "roach"
	toysay = "\"I AM NOT A CHT'MANT DAMN IT!\""

/obj/item/toy/figure/character/bobblehead/vagabond
	name = "colonist figurine"
	desc = "A Lonestar \"Space Life\" brand figurine showcasing the form of a random colonist, wearing one of the colony uniforms and an orange bandana. \
	Must of been custom-made to commemorate the colonies many colonists."
	icon_state = "vagabond"
	toysay = "\"What do you mean get a job?\""

/obj/item/toy/figure/character/bobblehead/rooster
	name = "rooster figurine"
	desc = "\"Space Vice\" brand figurine, there is no further manufacturer information. It's a man wearing a rooster mask and a varsity jacket with the letter \"B\" emblazoned on the front."
	toysay = "\"Do you like hurting other people?\""
	icon_state = "rooster"

/obj/item/toy/figure/character/bobblehead/barking_dog
	name = "barking dog figurine"
	desc = "A metal soldier with the mask of a hound stands upon the base, the plaque seems smeared with caked grime, but despite this you make out a rare double-quote."
	toysay = "\"A dog barks on its master's orders, lest its pack runs astray. Whatever the task, the grim dog mask would tell you that your life was done.\""
	icon_state = "barking_dog"

/obj/item/toy/figure/character/bobblehead/red_soldier
	name = "red soldier figurine"
	desc = "A curiously unbranded figurine of a red soldier fighting in the tides of war, their humanity hidden by a gas mask."
	toysay = "\"Why do we fight? To win the war, of course.\""
	icon_state = "red_soldier"

/obj/item/toy/figure/character/bobblehead/metacat
	name = "meta-cat figurine"
	desc = "A curiously unbranded figurine depicting an anthropomorphic cat in a voidsuit, the small plaque claims this to be one of two."
	toysay = "\"Always in silent pair, through distance or unlikelihood.\""
	icon_state = "metacat"

/obj/item/toy/figure/character/bobblehead/shitcurity
	name = "shitcurity officer figurine"
	desc = "A Lonestar \"Space Life\" brand figurine of a classic redshirt security employed in most space stations. Their belly distends out into an obvious beer gut, revealing no form of manufacturer bias what-so-ever."
	toysay = "\"I joined the force just to kill people.\""
	icon_state = "shitcurity"

/obj/item/toy/figure/character/bobblehead/metro_patrolman
	name = "metro patrolman figurine"
	desc = "The plaque seems flaked with rust residue, \"London Metro\" brand it reads. The man wears some kind of enforcer's uniform, with the acronym \"VPP\" on their left shoulder and cap."
	toysay = "\"Abandoned for escalation, the patrolman grumbles.\""
	icon_state = "metro_patrolman"

/*Discontinued*/

/obj/item/toy/figure/character/discontinued/agent
	name = "internal affairs agent action figure"
	desc = "Called in for matters of extreme paperwork. Discontinued 1/6."
	icon_state = "agent"
	toysay = "The SOP says they're guilty."

/obj/item/toy/figure/character/discontinued/librarian
	name = "librarian action figure"
	desc = "Archivist of new and old. Discontinued 2/6."
	icon_state = "librarian"
	toysay = "One day while..."

/obj/item/toy/figure/character/discontinued/mime
	name = "mime action figure"
	desc = "They don't have much to say. Discontinued 3/6."
	icon_state = "mime"
	toysay = "..."

/obj/item/toy/figure/character/discontinued/dsquad
	name = "space commando action figure"
	desc = "The final solution. Discontinued 4/6."
	icon_state = "dsquad"
	toysay = "Eliminate all threats!"

/obj/item/toy/figure/character/discontinued/geneticist
	name = "geneticist action figure"
	desc = "The seeker of higher power. Discontinued 5/6."
	icon_state = "geneticist"
	toysay = "I can't make anything but brain damage?!"

/obj/item/toy/figure/character/discontinued/atmos
	name = "atmospheric technician action figure"
	desc = "In space, they control the most valuable resource. Discontinued 6/6."
	icon_state = "atmos"
	toysay = "Did I filter oxygen or phoron?"


/*Villains*/

/obj/item/toy/figure/character/villains/ninja
	name = "space ninja action figure"
	desc = "You'll never see him coming... unfortunately. Villains 1/3."
	icon_state = "ninja"
	toysay = "..."

/obj/item/toy/figure/character/villains/wizard
	name = "wizard action figure"
	desc = "He has grand plans for his ancient powers. Villains 2.3."
	icon_state = "wizard"
	toysay = "Hocus pocus, I really can't focus."

/obj/item/toy/figure/character/villains/syndie
	name = "doom operative action figure"
	desc = "This sinister mercenary has dark plans. Villains 3/3."
	icon_state = "syndie"
	toysay = "Secure the nuke!"

/*D&D*/

/obj/item/toy/figure/character/rpg/warrior
	name = "warrior miniature"
	desc = "The brave warrior stands against all evil."
	icon_state = "warriorcharacter"
	toysay = "You can't stand against justice."

/obj/item/toy/figure/character/rpg/cleric
	name = "cleric miniature"
	desc = "The smart little cleric keeps the party going."
	icon_state = "clericcharacter"
	toysay = "Fight with me, my friends."

/obj/item/toy/figure/character/rpg/thief
	name = "thief miniature"
	desc = "The sneaky thief seeks out the finest treasures."
	icon_state = "thiefcharacter"
	toysay = "You've got to pick a pocket or two."

/obj/item/toy/figure/character/rpg/wizard
	name = "wizard miniature"
	toysay = "The mysterious wizard dabbles in ancient arts."
	icon_state = "wizardcharacter"
	toysay = "Fire and ice, light and dark."

/obj/item/toy/figure/character/rpg/voidone
	name = "void one miniature"
	desc = "The ultimate dark one, the source of all evil."
	icon_state = "darkmastercharacter"
	toysay = "I shall destroy... and hate mankind!"

/obj/item/toy/figure/character/rpg/lich
	name = "lich miniature"
	desc = "The master of the dead and enemy of the living."
	icon_state = "lichcharacter"
	toysay = "You shall join the legions of the dead!"

/obj/item/toy/figure/character/rpg/alien
	name = "alien action figure"
	desc = "The aliens seek to destroy all other races."
	icon_state = "aliencharacter"
	toysay = "Hssss!"

/obj/item/toy/figure/character/rpg/owl
	name = "owl action figure"
	desc = "The owls zealously guard the natural lands."
	icon_state = "owlprize"
	toysay = "Twit-twoo!"

/obj/item/toy/figure/character/rpg/griffin
	name = "griffin action figure"
	desc = "The griffins watch over the ancient relics."
	icon_state = "griffinprize"
	toysay = "Caw!"

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
	desc = "A plushie of an elated carp! Straight from the wilds of the Chromin 8 frontier, now right here in your hands."
	icon_state = "carpplushie" // Realistically scary
	phrase = "Glorf!"

/obj/structure/plushie/beepsky
	name = "plush Officer Sweepsky"
	desc = "A plushie of a popular industrious cleaning robot! If it could feel emotions, it would love you."
	icon_state = "beepskyplushie"
	phrase = "Ping!"

//Small plushies.
/obj/item/toy/plushie
	name = "bug plushie"
	desc = "A plushie of an 'adorable' bug!"
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
	desc = "A plushie of a delightful mouse."
	icon_state = "mouseplushie"

/obj/item/toy/plushie/kitten
	name = "kitten plushie"
	desc = "A plushie of a cute kitten."
	icon_state = "kittenplushie"

/obj/item/toy/plushie/lizard
	name = "lizard plushie"
	desc = "A plushie of a scaly lizard."
	icon_state = "lizardplushie"

/obj/item/toy/plushie/spider
	name = "spider plushie"
	desc = "A plushie of a fuzzy spider."
	icon_state = "spiderplushie"

/obj/item/toy/plushie/farwa
	name = "farwa plushie"
	desc = "A farwa plush doll."
	icon_state = "farwaplushie"

/obj/item/toy/plushie/corgi
	name = "corgi plushie"
	desc = "A corgi plush doll."
	icon_state = "corgi"
	phrase = "Woof!"

/obj/item/toy/plushie/corgi/girly
	name = "corgi girly plushie"
	desc = "A girly corgi doll."
	icon_state = "girlycorgi"
	phrase = "Arf!"

/obj/item/toy/plushie/corgi/robo
	name = "corgi borg plushie"
	desc = "A robotic corgi doll."
	icon_state = "robotcorgi"
	phrase = "Bark."

/obj/item/toy/plushie/octopus
	name = "octopus plushie"
	desc = "A octopus plush doll."
	icon_state = "loveable"
	phrase = "Squish!"

/obj/item/toy/plushie/face_hugger
	name = "facehugger plushie"
	desc = "A parasitic plush doll."
	icon_state = "huggable"
	phrase = "Hug!"

/obj/item/toy/plushie/fox
	name = "red fox plushie"
	desc = "A fox plush doll."
	icon_state = "redfox"
	phrase = "Gecker!"

/obj/item/toy/plushie/fox/black
	name = "black fox plushie"
	desc = "A fox plush doll."
	icon_state = "blackfox"
	phrase = "Ack!"

/obj/item/toy/plushie/fox/marble
	name = "arctic fox plushie"
	desc = "A fox plush doll."
	icon_state = "marblefox"
	phrase = "Awoo!"

/obj/item/toy/plushie/fox/blue
	name = "blue fox plushie"
	desc = "A fox plush doll."
	icon_state = "bluefox"
	phrase = "Yoww!"

/obj/item/toy/plushie/fox/orange
	name = "orange fox plushie"
	desc = "A fox plush doll."
	icon_state = "orangefox"
	phrase = "Yagh!"

/obj/item/toy/plushie/fox/coffee
	name = "coffee fox plushie"
	desc = "A fox plush doll."
	icon_state = "coffeefox"
	phrase = "Gerr!"

/obj/item/toy/plushie/fox/pink
	name = "pink fox plushie"
	desc = "A fox plush doll."
	icon_state = "pinkfox"
	phrase = "Yack!"

/obj/item/toy/plushie/fox/purple
	name = "purple fox plushie"
	desc = "A fox plush doll."
	icon_state = "purplefox"
	phrase = "Whine!"

/obj/item/toy/plushie/fox/crimson
	name = "crimson fox plushie"
	desc = "A fox plush doll."
	icon_state = "crimsonfox"
	phrase = "Auuu!"

/obj/item/toy/plushie/deer
	name = "deer plushie"
	desc = "A deer plush doll."
	icon_state = "deer"
	phrase = "Bleat!"

/obj/item/toy/plushie/cat
	name = "black cat plushie"
	desc = "A cat plush doll."
	icon_state = "blackcat"
	phrase = "Mlem!"

/obj/item/toy/plushie/cat/grey
	name = "grey cat plushie"
	desc = "A cat plush doll."
	icon_state = "greycat"
	phrase = "Mraw!"

/obj/item/toy/plushie/cat/white
	name = "white cat plushie"
	desc = "A cat plush doll."
	icon_state = "whitecat"
	phrase = "Mew!"

/obj/item/toy/plushie/cat/orange
	name = "orange cat plushie"
	desc = "A cat plush doll."
	icon_state = "orangecat"
	phrase = "Meow!"

/obj/item/toy/plushie/cat/siamese
	name = "siamese cat plushie"
	desc = "A cat plush doll."
	icon_state = "siamesecat"
	phrase = "Mrew?"

/obj/item/toy/plushie/cat/tabby
	name = "tabby cat plushie"
	desc = "A cat plush doll."
	icon_state = "tabbycat"
	phrase = "Purr!"

/obj/item/toy/plushie/cat/tuxedo
	name = "tuxedo cat plushie"
	desc = "A cat plush doll."
	icon_state = "tuxedocat"
	phrase = "Mrowww!!"

/obj/item/toy/plushie/squid
	name = "green squid plushie"
	desc = "A small, cute and loveable squid friend. This one is green."
	icon_state = "greensquid"
	slot_flags = SLOT_HEAD
	phrase = "Squrr!"

/obj/item/toy/plushie/squid/mint
	name = "mint squid plushie"
	desc = "A small, cute and loveable squid friend. This one is mint."
	icon_state = "mintsquid"
	slot_flags = SLOT_HEAD
	phrase = "Blurble!"

/obj/item/toy/plushie/squid/blue
	name = "blue squid plushie"
	desc = "A small, cute and loveable squid friend. This one is blue."
	icon = 'icons/obj/toy.dmi'
	icon_state = "bluesquid"
	slot_flags = SLOT_HEAD
	phrase = "Blob!"

/obj/item/toy/plushie/squid/orange
	name = "orange squid plushie"
	desc = "A small, cute and loveable squid friend. This one is orange."
	icon_state = "orangesquid"
	slot_flags = SLOT_HEAD
	phrase = "Squash!"

/obj/item/toy/plushie/squid/yellow
	name = "yellow squid plushie"
	desc = "A small, cute and loveable squid friend. This one is yellow."
	icon_state = "yellowsquid"
	slot_flags = SLOT_HEAD
	phrase = "Glorble!"

/obj/item/toy/plushie/squid/pink
	name = "pink squid plushie"
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


/obj/item/toy/plushie/fumo
	name = "\improper placeholder fumo"
	icon_state = "arcueid"
	desc = "You shouldn't be seeing this..."
	phrase = ""
	var/pokesound = null

/obj/item/toy/plushie/fumo/marisa
	icon_state = "fumoplushie_marisa"

/obj/item/toy/plushie/fumo/astolfo
	icon_state = "fumoplushie_astolfo"

/obj/item/toy/plushie/fumo/cirno
	icon_state = "fumoplushie_cirno"

/obj/item/toy/plushie/fumo/attack_self(mob/user as mob)
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
		playsound(src.loc, pokesound, 50, 0) // Should work for any pokesound anyone might want to add to fumos.

/obj/item/toy/plushie/fumo/arcueid // Make sure all future fumos are children of /fumo and not this one.
	name = "\improper Neco Arc fumo"
	desc = "...What the fuck?"
	icon_state = "arcueid"
	phrase = "Burenyaa~"
	pokesound = 'sound/sanity/burenyaa.ogg'

/obj/item/toy/plushie/fumo/necochaos
	name = "\improper Neco Arc Chaos fumo"
	desc = "Hey! Taxi!"
	icon_state = "neco-chaos"
	phrase = "Money...ideals...canned cat food...nightmare."
	pokesound = 'sound/sanity/nyah.ogg'

/obj/item/toy/plushie/carp
	name = "space carp plushie"
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

/obj/item/toy/plushie/carp/ice
	name = "ice carp plushie"
	icon_state = "icecarp"

/obj/item/toy/plushie/carp/silent
	name = "monochrome carp plushie"
	icon_state = "silentcarp"

/obj/item/toy/plushie/carp/electric
	name = "electric carp plushie"
	icon_state = "electriccarp"

/obj/item/toy/plushie/carp/gold
	name = "golden carp plushie"
	icon_state = "goldcarp"

/obj/item/toy/plushie/carp/toxin
	name = "toxic carp plushie"
	icon_state = "toxincarp"

/obj/item/toy/plushie/carp/dragon
	name = "dragon carp plushie"
	icon_state = "dragoncarp"

/obj/item/toy/plushie/carp/pink
	name = "pink carp plushie"
	icon_state = "pinkcarp"

/obj/item/toy/plushie/carp/candy
	name = "candy carp plushie"
	icon_state = "candycarp"

/obj/item/toy/plushie/carp/nebula
	name = "nebula carp plushie"
	icon_state = "nebulacarp"

/obj/item/toy/plushie/carp/void
	name = "void carp plushie"
	icon_state = "voidcarp"

/*Inflatable Duck*/

/obj/item/toy/junk/inflatable_duck
	name = "inflatable duck"
	desc = "No bother to sink or swim when you can just float!"
	icon_state = "inflatable"
	item_state = "inflatable"
	icon = 'icons/inventory/belt/icon.dmi'
	slot_flags = SLOT_BELT

/*Inflatable Duck*/

/obj/item/toy/junk/dodgeball
	name = "dodgeball"
	desc = "A rubber ball with air in it. Intented to be thrown at one a other for fun games."
	icon_state = "wrench"
	item_state = "contraband "
	icon = 'icons/obj/toy.dmi'
	attack_verb = list("tapped", "outted")

/obj/item/toy/junk/dodgeball/face
	name = "Buddy dodgeball"
	icon_state = "contraband"
	item_state = "contraband"
	desc = "A rubber ball with air in it. Intented to be thrown at one a other for fun games. This one has a face on it."



//////////////////////////////////////////////////////
//				Magic 8-Ball / Conch				//
//////////////////////////////////////////////////////

/obj/item/toy/junk/eight_ball
	name = "magic 8-ball"
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
	name = "magic conch shell"
	desc = "All hail the Magic Conch!"
	icon_state = "conch"
	use_action = "pulls the string"
	possible_answers = list("Yes.", "No.", "Try asking again.", "Nothing.", "I don't think so.", "Neither.", "Maybe someday.")

/*Desk Toy*/
/obj/item/toy/desk
	name = "desk toy master"
	desc = "A object that does not exist. Parent Item"
	icon = 'icons/obj/toy.dmi'

	var/on = 0
	var/activation_sound = 'sound/machines/button.ogg'

/obj/item/toy/desk/update_icon()
	if(on)
		icon_state = "[initial(icon_state)]-on"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/toy/desk/attack_self(mob/user)
	on = !on
	if(on && activation_sound)
		playsound(src.loc, activation_sound, 75, 1)
	update_icon()
	return 1

/obj/item/toy/desk/newtoncradle
	name = "cradle model"
	desc = "A metallic pendulum full of endless energy."
	icon_state = "newtoncradle"

/obj/item/toy/desk/dippingbird
	name = "dipping bird model"
	desc = "A favorite amongst clerks and desk jockeys."
	icon_state= "dippybird"

//Consumer!!!

/obj/item/toy/consumer
	name = "Notably Generic Consumer Concept"
	desc = "Do NOT consume. Oh my goodness gracious."
	icon = 'icons/obj/crafts_consumergood.dmi'

/obj/item/toy/consumer/kit
	name = "Notably Generic Consumer Kit"
	desc = "Do NOT assemble. Oh me oh my."
	icon = 'icons/obj/crafts_consumergood.dmi'
	price_tag = 60

/obj/item/toy/consumer/product
	matter = list(MATERIAL_STEEL = 3)
	name = " Notably Generic Consumer Product"
	desc = "Do NOT produce."
	icon = 'icons/obj/crafts_consumergood.dmi'
	price_tag = 125

/obj/item/toy/consumer/kit/toaster
	name = "toaster assembly kit"
	desc = "Everything you need to assemble your very own toolbox themed toaster!"
	icon_state = "placeholder_device"

/obj/item/toy/consumer/product/toaster
	name = "toolbox toaster"
	desc = "A toolbox themed toaster! Too bad there's no compatible outlets here. Only comes in red. Keep away from bathtubs."
	icon_state = "toaster"
