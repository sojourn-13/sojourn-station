/obj/item/gavelhammer
	name = "gavel hammer"
	desc = "Designed for passing sentences, and maybe knocking people out."
	icon = 'icons/obj/items.dmi'
	icon_state = "gavelhammer"
	force = 5
	throwforce = 6
	w_class = 2
	attack_verb = list("bashed", "battered", "judged", "whacked")

/obj/item/gavelblock
	name = "gavel block"
	desc = "Smack it with a gavel hammer to bring order to the court."
	icon = 'icons/obj/items.dmi'
	icon_state = "gavelblock"
	force = 2
	throwforce = 2
	w_class = 1

/obj/item/gavelblock/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/gavelhammer))
		playsound(loc, 'sound/effects/gavel.ogg', 100, 1)
		user.visible_message("<span class='warning'>[user] strikes \the [src] with \the [I].</span>")

	else
		return
