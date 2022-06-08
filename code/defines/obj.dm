/obj/structure/signpost
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "signpost"
	anchored = 1
	density = 1

	attackby(obj/item/W as obj, mob/user as mob)
		return attack_hand(user)

	attack_hand(mob/user as mob)
		switch(alert("Travel back to ss13?", , "Yes", "No"))
			if("Yes")
				if(!Adjacent(user))
					return
				user.forceMove(pick_spawn_location())
			if("No")
				return
/* LETHALGHOSDT: WTF is this? Layer was set to 99
/obj/effect/mark
	var/mark = ""
	icon = 'icons/misc/mark.dmi'
	icon_state = "blank"
	anchored = 1
	mouse_opacity = 0
	unacidable = 1//Just to be sure.
*/
/obj/effect/beam
	name = "beam"
	density = 0
	unacidable = 1//Just to be sure.
	var/def_zone
	flags = PROXMOVE
	pass_flags = PASSTABLE


/obj/effect/begin
	name = "begin"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "begin"
	anchored = 1.0
	unacidable = 1

/obj/effect/laser
	name = "laser"
	desc = "IT BURNS!!!"
	icon = 'icons/obj/projectiles.dmi'
	var/damage = 0.0
	var/range = 10.0


/obj/effect/list_container
	name = "list container"

/obj/effect/list_container/mobl
	name = "mobl"
	var/master = null

	var/list/container = list(  )

/obj/effect/projection
	name = "Projection"
	desc = "This looks like a projection of something."
	anchored = 1.0


/obj/effect/shut_controller
	name = "shut controller"
	var/moving = null
	var/list/parts = list(  )

/obj/structure/showcase
	name = "cyborg statue"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "showcase_1"
	desc = "A stand with the empty body of a cyborg bolted to it."
	density = 1
	anchored = 1
	unacidable = 1//temporary until I decide whether the borg can be removed. -veyveyr

/obj/structure/showcase/cyborg_old
	name = "cyborg statue"
	desc = "An old cyborg model. It looks like it's been inactive a long time."
	icon = 'icons/mob/robots.dmi'
	icon_state = "robot_old"

/obj/structure/showcase/sign
	name = "WARNING: WILDERNESS"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "wilderness1"
	desc = "A large sign warning that the area beyond is dangerous."

/obj/structure/showcase/sign2
	name = "WARNING: HAZARDOUS"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "wilderness2"
	desc = "A large sign warning that the area beyond is dangerous."

/obj/structure/showcase/sign3
	name = "blank sign"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "wilderness3"
	desc = "A large blank sign. Perhaps someone forgot to paint it."

/obj/structure/showcase/television
	name = "television"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "wooden_tv_broken"
	desc = "An entertainment monitor with various channels."

/obj/structure/showcase/skeleton
	name = "hanging skeleton model"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "hangskele"
	desc = "It's an anatomical model of a human skeletal system made of plaster."
	anchored = 0
	density = 0

/obj/structure/showcase/horrific_experiment_cryo
	name = "horrific experiment"
	desc = "A large pod absolutely filled with blood. It looks like something else is inside, too..."
	icon = 'icons/obj/cryogenics.dmi'
	icon_state = "pod_g"

/obj/structure/showcase/horrific_experiment_cloning
	name = "horrific experiment"
	desc = "A small pod filled with blood and viscera. It's shaking quite violently, as if alive."
	icon = 'icons/obj/cloning.dmi'
	icon_state = "pod_g"

/obj/item/mouse_drag_pointer = MOUSE_ACTIVE_POINTER

/obj/item/beach_ball
	icon = 'icons/obj/toy.dmi'
	icon_state = "ball"
	name = "beach ball"
	item_state = "beachball"
	density = 0
	anchored = 0
	w_class = ITEM_SIZE_BULKY
	force = 0.0
	throwforce = 0.0
	throw_speed = 1
	throw_range = 20
	flags = CONDUCT

	afterattack(atom/target as mob|obj|turf|area, mob/user as mob)
		user.drop_item()
		src.throw_at(target, throw_range, throw_speed, user)

/obj/effect/stop
	var/victim = null
	icon_state = "empty"
	name = "Geas"
	desc = "You can't resist."
	// name = ""

/obj/effect/spawner
	name = "object spawner"
