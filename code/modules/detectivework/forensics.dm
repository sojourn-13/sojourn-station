/obj/item/forensics
	icon = 'icons/obj/forensics.dmi'
	w_class = ITEM_SIZE_TINY

//This is the output of the stringpercent(print) proc, and means about 80% of
//the print must be there for it to be complete.  (Prints are 32 digits)
var/const/FINGERPRINT_COMPLETE = 6
proc/is_complete_print(var/print)
	return stringpercent(print) <= FINGERPRINT_COMPLETE

atom/var/list/suit_fibers

atom/proc/add_fibers(mob/living/carbon/human/M)
	if(M.gloves && istype(M.gloves,/obj/item/clothing/gloves))
		var/obj/item/clothing/gloves/G = M.gloves
		if(G.transfer_blood) //bloodied gloves transfer blood to touched objects
			if(add_blood(G.bloody_hands_mob)) //only reduces the bloodiness of our gloves if the item wasn't already bloody
				G.transfer_blood--
	else if(M.bloody_hands)
		if(add_blood(M.bloody_hands_mob))
			M.bloody_hands--

	if(!suit_fibers) suit_fibers = list()
	var/fibertext
	var/item_multiplier = istype(src,/obj/item)?1.2:1
	var/suit_coverage = 0
	var/head_coverage = 0
	var/prevent_underlying = FALSE
	if(M.wear_suit)
		fibertext = "Material from \a [M.wear_suit]."
		if(prob(30*item_multiplier) && !(fibertext in suit_fibers))
			suit_fibers += fibertext
		suit_coverage = M.wear_suit.body_parts_covered
		if(istype(M.wear_suit, /obj/item/clothing/suit/bio_suit))
			prevent_underlying = TRUE

	// If the wearer has a bio hood, treat head coverage as part of the suit coverage
	if(M.head)
		head_coverage = M.head.body_parts_covered
		if(istype(M.head, /obj/item/clothing/head/bio_hood))
			prevent_underlying = TRUE

	var/total_coverage = suit_coverage | head_coverage

	// If the biosuit or biohood prevents underlying contamination, skip underlying uniform fibers
	if(!prevent_underlying && M.w_uniform && (M.w_uniform.body_parts_covered & ~total_coverage))
		fibertext = "Fibers from \a [M.w_uniform]."
		if(prob(45*item_multiplier) && !(fibertext in suit_fibers))
			suit_fibers += fibertext

	if(M.gloves && (M.gloves.body_parts_covered & ~total_coverage))
		var/obj/item/clothing/gloves/G = M.gloves
		// If gloves define a custom forensics fiber string, use that. Optionally mark glowing.
		if(G.forensics_fibers)
			fibertext = G.forensics_fibers
			// Gloves that declare forensics_fibers ALWAYS leave them (no probability)
			if(!(fibertext in suit_fibers))
				suit_fibers += fibertext
		else
			fibertext = "Material from a pair of [G.name]."
			if(prob(60*item_multiplier) && !(fibertext in suit_fibers))
				suit_fibers += fibertext

	// Shoes/boots can also leave fibers; skip them if the biosuit/hood prevents underlying contamination
	if(!prevent_underlying && M.shoes && (M.shoes.body_parts_covered & ~total_coverage))
		fibertext = "Fibers from [M.shoes.name]."
		if(prob(40*item_multiplier) && !(fibertext in suit_fibers))
			suit_fibers += fibertext

/datum/data/record/forensic
	name = "forensic data"
	var/uid

/datum/data/record/forensic/New(var/atom/A)
	uid = "\ref [A]"
	fields["name"] = sanitize(A.name)
	fields["area"] = sanitize("[get_area(A)]")
	fields["fprints"] = A.fingerprints ? A.fingerprints.Copy() : list()
	fields["fibers"] = A.suit_fibers ? A.suit_fibers.Copy() : list()
	fields["blood"] = A.blood_DNA ? A.blood_DNA.Copy() : list()
	fields["time"] = world.time

/datum/data/record/forensic/proc/merge(var/datum/data/record/other)
	var/list/prints = fields["fprints"]
	var/list/o_prints = other.fields["fprints"]
	for(var/print in o_prints)
		if(!prints[print])
			prints[print] = o_prints[print]
		else
			prints[print] = stringmerge(prints[print], o_prints[print])
	fields["fprints"] = prints

	var/list/fibers = fields["fibers"]
	var/list/o_fibers = other.fields["fibers"]
	fibers |= o_fibers
	fields["fibers"] = fibers

	var/list/blood = other.fields["blood"]
	var/list/o_blood = other.fields["blood"]
	blood |= o_blood
	fields["blood"] = blood

	fields["area"] = other.fields["area"]
	fields["time"] = other.fields["time"]

/datum/data/record/forensic/proc/update_prints(var/list/o_prints)
	var/list/prints = fields["fprints"]
	for(var/print in o_prints)
		if(prints[print])
			prints[print] = stringmerge(prints[print], o_prints[print])
			.=1
	fields["fprints"] = prints
