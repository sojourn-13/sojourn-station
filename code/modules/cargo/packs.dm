//SUPPLY PACKS
//NOTE: only secure crate types use the access var (and are lockable)
//NOTE: hidden packs only show up when the computer has been hacked.
//ANOTER NOTE: Contraband is obtainable through modified supplycomp circuitboards.
//BIG NOTE: Don't add living things to crates, that's bad, it will break the shuttle.
//NEW NOTE: Do NOT set the price of any crates below 7 points. Doing so allows infinite points.

var/list/all_supply_groups = list("Operations","Security","Hospitality","Engineering","Medical / Science","Hydroponics","Mining","Supply","Recreation","Clothing")

/datum/supply_pack
	var/name = "Crate"
	var/group = "Operations"
	var/true_manifest = ""
	var/hidden = FALSE
	var/contraband = FALSE
	var/cost = 400 // Minimum cost, or infinite points are possible.
	var/access = FALSE
	var/list/contains = null
	var/crate_name = "crate"
	var/containertype = /obj/structure/closet/crate
	var/dangerous = FALSE // Should we message admins?
	var/special = FALSE //Event/Station Goals/Admin enabled packs
	var/special_enabled = FALSE
	var/amount = 0

/datum/supply_pack/New()
	true_manifest += "<ul>"
	for(var/path in contains)
		if(!path)
			continue
		var/atom/movable/AM = path
		true_manifest += "<li>[initial(AM.name)]</li>"
	true_manifest += "</ul>"

/datum/supply_pack/proc/generate(turf/T)
	var/obj/structure/closet/crate/C = new containertype(T)
	C.name = crate_name
	if(access)
		C.req_access = list(access)

	fill(C)

	return C

/datum/supply_pack/proc/fill(obj/structure/closet/crate/C)
	for(var/item in contains)
		var/n_item = new item(C)
		if(src.amount && istype(n_item, /obj/item/stack/material/steel))
			var/obj/item/stack/material/n_sheet = n_item
			n_sheet.amount = src.amount

/datum/supply_pack/randomised/fill(obj/structure/closet/crate/C)
	var/list/L = contains.Copy()
	var/item
	if(num_contained <= L.len)
		for(var/i in 1 to num_contained)
			item = pick_n_take(L)
			new item(C)
	else
		for(var/i in 1 to num_contained)
			item = pick(L)
			new item(C)