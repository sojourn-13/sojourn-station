// Here is where we store the items made by the nanogate organ.

/obj/item/tool/armblade/nanite
	icon_state = "wolverine"
	name = "nanite claws"
	desc = "A set of claws deployed from the tips of your fingers. Great for cutting people into ribbons."

/obj/item/tool/armblade/nanite/New(var/loc, var/mob/living/carbon/Maker)
	..()
	if(Maker)
		holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/tool/armblade/nanite/Process()
	..()
	if(loc != holder) // We're no longer in the holder.
		visible_message("The [src.name] turn into useless nanite goo.")
		qdel(src)
		return

