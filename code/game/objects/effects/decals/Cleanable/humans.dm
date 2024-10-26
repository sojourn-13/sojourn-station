#define DRYING_TIME 5 * 36*10                        //for 1 unit of depth in puddle (amount var) should be 3 mins to dry

var/global/list/image/splatter_cache=list()

/obj/effect/decal/cleanable/blood
	name = "blood"
	var/dryname = "dried blood"
	desc = "It's thick and gooey. Perhaps it's the chef's cooking?"
	var/drydesc = "It's dry and crusty. Someone is not doing their job."
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	icon = 'icons/effects/blood.dmi'
	icon_state = "mfloor1"
	random_icon_states = list("mfloor1", "mfloor2", "mfloor3", "mfloor4", "mfloor5", "mfloor6", "mfloor7")
	var/base_icon = 'icons/effects/blood.dmi'
	blood_DNA = list()
	var/basecolor="#A10808" // Color when wet.
	var/amount = 5
	var/drytime
	sanity_damage = 0.25
	mergeable_decal = TRUE
	var/should_dry = TRUE
	// List of are shoe prints we got
	var/list/shoe_types = list()

/obj/effect/decal/cleanable/blood/bearfoot
	name = "bearfoot"

/obj/effect/decal/cleanable/blood/examine(mob/user)
	. = ..()
	if(iscarbon(user) || issilicon(user))
		if(shoe_types.len && (user.stats?.getPerk(PERK_EAR_OF_QUICKSILVER) || user.stats.getStat(STAT_VIG) >= STAT_LEVEL_EXPERT)) //Basiclly rangers are meant to do this so they have a bypass
			to_chat(user, "<span class='info'>There is traces of shoe prints that are likely from:</span>")
			for(var/shoe in shoe_types)
				var/obj/item/clothing/shoes/S = shoe
				to_chat(user, "<span class='info'>some <B>[initial(S.name)]</B> </B></span>") //as cool as  [icon2html(initial(S.icon) is it dosnt work well
		else
			to_chat(user, "<span class='info'>These footprints have no shoe prints that you can recognize.</span>")

/obj/effect/decal/cleanable/blood/reveal_blood()
	if(!fluorescent)
		fluorescent = TRUE
		basecolor = COLOR_LUMINOL
		update_icon()

/obj/effect/decal/cleanable/blood/clean_blood()
	fluorescent = FALSE
	if(invisibility != 100)
		invisibility = 100
		amount = 0
	..(ignore=TRUE)

/obj/effect/decal/cleanable/blood/Destroy()
	QDEL_NULL(weak_reference)
	return ..()

/obj/effect/decal/cleanable/blood/New()
	..()
	fall_to_floor()

/obj/effect/decal/cleanable/blood/Initialize()
	. = ..()
	update_icon()

	if(should_dry)
		drytime = world.time + DRYING_TIME * (amount+1)
		addtimer(CALLBACK(src, PROC_REF(dry)), drytime)

/obj/effect/decal/cleanable/blood/handle_merge_decal(obj/effect/decal/cleanable/blood/merger)
	. = ..()
	if(blood_DNA)
		LAZYOR(merger.blood_DNA, blood_DNA.Copy())
	if(shoe_types)
		LAZYOR(merger.shoe_types, shoe_types.Copy())

/obj/effect/decal/cleanable/blood/update_icon()
	if(basecolor == "rainbow") basecolor = get_random_colour(1)
	color = basecolor

/obj/effect/decal/cleanable/blood/Crossed(mob/living/carbon/human/perp)
	if (!istype(perp))
		return
	if(amount < 1)
		return

	var/obj/item/organ/external/l_leg = perp.get_organ(BP_L_LEG)
	var/obj/item/organ/external/r_leg = perp.get_organ(BP_R_LEG)
	var/hasfeet = 1
	if((!l_leg || l_leg.is_stump()) && (!r_leg || r_leg.is_stump()))
		hasfeet = 0
	if(perp.shoes && !perp.buckled)//Adding blood to shoes
		var/obj/item/clothing/shoes/S = perp.shoes
		if(S.flags & NOBLOODY)
			return
		if(istype(S))
			S.blood_color = basecolor
			S.track_blood = max(amount,S.track_blood)
			shoe_types |= S.type
			if(!S.blood_overlay)
				S.generate_blood_overlay()
			if(!S.blood_DNA)
				S.blood_DNA = list()
				S.blood_overlay.color = basecolor
				S.add_overlay(S.blood_overlay)
			if(S.blood_overlay && S.blood_overlay.color != basecolor)
				S.blood_overlay.color = basecolor
				S.cut_overlays()
				S.add_overlay(S.blood_overlay)
			S.blood_DNA |= blood_DNA.Copy()

	else if (hasfeet)//Or feet
		perp.feet_blood_color = basecolor
		perp.track_blood = max(amount,perp.track_blood)
		shoe_types |= /obj/effect/decal/cleanable/blood/bearfoot
		if(!perp.feet_blood_DNA)
			perp.feet_blood_DNA = list()
		perp.feet_blood_DNA |= blood_DNA.Copy()

	else if (perp.buckled && istype(perp.buckled, /obj/structure/bed/chair/wheelchair))
		var/obj/structure/bed/chair/wheelchair/W = perp.buckled
		W.bloodiness = 4

	perp.update_inv_shoes(1)
	amount--

/obj/effect/decal/cleanable/blood/proc/dry()
	name = dryname
	desc = drydesc
	color = adjust_brightness(color, -50)
	amount = 0

/obj/effect/decal/cleanable/blood/attack_hand(mob/living/carbon/human/user)
	..()
	if (amount && istype(user))
		add_fingerprint(user)
		if (user.gloves)
			return FALSE
		var/taken = rand(1,amount)
		amount -= taken
		to_chat(user, SPAN_NOTICE("You get some of \the [src] on your hands."))
		if (!user.blood_DNA)
			user.blood_DNA = list()
		user.blood_DNA |= blood_DNA.Copy()
		user.bloody_hands += taken
		user.hand_blood_color = basecolor
		user.update_inv_gloves(1)
		add_verb(user, /mob/living/carbon/human/proc/bloody_doodle)

/obj/effect/decal/cleanable/blood/splatter
	random_icon_states = list("mgibbl1", "mgibbl2", "mgibbl3", "mgibbl4", "mgibbl5")
	amount = 2

/obj/effect/decal/cleanable/blood/splatter/green
	amount = 1
	basecolor="#666600"

/obj/effect/decal/cleanable/blood/drip
	name = "drips of blood"
	desc = "It's red."
	gender = PLURAL
	icon = 'icons/effects/drip.dmi'
	icon_state = "1"
	random_icon_states = list("1","2","3","4","5")
	amount = 0
	var/list/drips = list()

/obj/effect/decal/cleanable/blood/drip/New()
	..()
	drips |= icon_state

/obj/effect/decal/cleanable/blood/writing
	icon_state = "tracks"
	desc = "It looks like a writing in blood."
	gender = NEUTER
	random_icon_states = list("writing1","writing2","writing3","writing4","writing5")
	amount = 0
	var/message

/obj/effect/decal/cleanable/blood/writing/New()
	..()
	if(LAZYLEN(random_icon_states))
		for(var/obj/effect/decal/cleanable/blood/writing/W in loc)
			LAZYREMOVE(random_icon_states, W.icon_state)
		if(LAZYLEN(random_icon_states))
			icon_state = pick(random_icon_states)
	else
		icon_state = "writing1"

/obj/effect/decal/cleanable/blood/writing/examine(mob/user)
	..(user)
	to_chat(user, "It reads: <font color='[basecolor]'>\"[message]\"</font>")

/obj/effect/decal/cleanable/blood/gibs
	name = "gibs"
	desc = "They look bloody and gruesome."
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	layer = LOW_OBJ_LAYER
	icon = 'icons/effects/blood.dmi'
	icon_state = "mgibbl5"
	random_icon_states = list("gib1", "gib2", "gib3", "gib5", "gib6")
	mergeable_decal = FALSE
	should_dry = FALSE
	var/fleshcolor = "#FFFFFF"

/obj/effect/decal/cleanable/blood/gibs/update_icon()

	var/image/giblets = new(base_icon, "[icon_state]_flesh", dir)
	if(!fleshcolor || fleshcolor == "rainbow")
		fleshcolor = get_random_colour(1)
	giblets.color = fleshcolor

	var/icon/blood = new(base_icon,"[icon_state]",dir)
	if(basecolor == "rainbow") basecolor = get_random_colour(1)
	blood.Blend(basecolor,ICON_MULTIPLY)

	icon = blood
	cut_overlays()
	add_overlay(giblets)

/obj/effect/decal/cleanable/blood/gibs/up
	random_icon_states = list("gib1", "gib2", "gib3", "gib5", "gib6","gibup1","gibup1","gibup1")

/obj/effect/decal/cleanable/blood/gibs/down
	random_icon_states = list("gib1", "gib2", "gib3", "gib5", "gib6","gibdown1","gibdown1","gibdown1")

/obj/effect/decal/cleanable/blood/gibs/body
	random_icon_states = list("gibhead", "gibtorso")

/obj/effect/decal/cleanable/blood/gibs/limb
	random_icon_states = list("gibleg", "gibarm")

/obj/effect/decal/cleanable/blood/gibs/core
	random_icon_states = list("gibmid1", "gibmid2", "gibmid3")


/obj/effect/decal/cleanable/blood/gibs/proc/streak(var/list/directions)
	spawn (0)
		var/direction = pick(directions)
		for (var/i = 0, i < pick(1, 200; 2, 150; 3, 50; 4), i++)
			sleep(3)
			if (i > 0)
				var/obj/effect/decal/cleanable/blood/splatter/b = new(loc)
				b.basecolor = basecolor
				b.update_icon()

			if (step_to(src, get_step(src, direction), 0))
				break


/obj/effect/decal/cleanable/mucus
	name = "mucus"
	desc = "Disgusting mucus."
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	icon = 'icons/effects/blood.dmi'
	icon_state = "mucus"
	random_icon_states = list("mucus")

	var/dry = FALSE // Keeps the lag down

/obj/effect/decal/cleanable/mucus/New()
	spawn(DRYING_TIME * 2)
		dry = TRUE

//This proc prevents blood on openspace tiles, by causing them to fall down until they hit the ground
/obj/effect/decal/cleanable/blood/proc/fall_to_floor()
	if (istype(loc, /turf/simulated/open))
		anchored = FALSE //Anchored things can't fall
		while (istype(loc, /turf/simulated/open))
			var/turf/simulated/open/T = loc
			T.fallThrough(src)

			//A failsafe. If falling through the floor somehow fails to send us anywhere new, we break out to avoid an infinite loop
			if (loc == T)
				break
	anchored = initial(anchored) //Reset it
