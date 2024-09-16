/obj/item/storage/box/bloodpacks
	name = "blood packs bags"
	desc = "This box contains blood packs."
	icon_state = "box"
	illustration = "sterile"

/obj/item/storage/box/bloodpacks/populate_contents()
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)

/obj/item/reagent_containers/blood
	name = "blood pack"
	desc = "Contains blood used for transfusion."
	icon = 'icons/obj/bloodpack.dmi'
	icon_state = "bloodpack"
	volume = 200
	amount_per_transfer_from_this = REM // To avoid overdosing and emptying blood packs a bit too much. It's enough to keep someone alive over time. - Seb
	possible_transfer_amounts = list(REM,0.5,1,2) // In case the blood packs are to be filled with other chems somehow, or to change from slow drip to faster.
	reagent_flags = OPENCONTAINER
	filling_states = "25;50;75;100"
	var/blood_type = null

/obj/item/reagent_containers/blood/Initialize()
	. = ..()
	if(blood_type)
		reagents.add_reagent("blood", 200, list("donor"=null,"blood_DNA"=null,"blood_type"=blood_type,"resistances"=null,"trace_chem"=null))


/obj/item/reagent_containers/blood/on_reagent_change()
	..()
	update_name()


/obj/item/reagent_containers/blood/update_icon()
	cut_overlays()

	if(!reagents.total_volume)
		return

	var/mutable_appearance/filling = mutable_appearance(icon, "[icon_state][get_filling_state()]")
	filling.color = reagents.get_color()
	add_overlay(filling)

/obj/item/reagent_containers/blood/proc/update_name()
	var/list/data = reagents.get_data("blood")
	if(data)
		blood_type = data["blood_type"]
		name = "blood pack ([blood_type])"
	else
		name = "blood pack"

#define bloodtypeandpackname(bloodtype) name = "blood pack ("+bloodtype+")"; blood_type = bloodtype;
/obj/item/reagent_containers/blood/APlus
	bloodtypeandpackname("A+")

/obj/item/reagent_containers/blood/AMinus
	bloodtypeandpackname("A-")

/obj/item/reagent_containers/blood/BPlus
	bloodtypeandpackname("B+")

/obj/item/reagent_containers/blood/BMinus
	bloodtypeandpackname("B-")

/obj/item/reagent_containers/blood/OPlus
	bloodtypeandpackname("O+")

/obj/item/reagent_containers/blood/OMinus
	bloodtypeandpackname("O-")

/obj/item/reagent_containers/blood/empty
