/datum/category_item/setup_option/core_implant/cruciform
	name = "Vinculum Cruciform"
	desc = "The implant given to every disciple of the Absolute. This one is a standard Vinculum design, having the base-line of a normal cruciform."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform
	restricted_jobs = list(
		/datum/job/merchant,
		/datum/job/swo,
		/datum/job/foreman,
		/datum/job/rd,
		/datum/job/cmo,
		/datum/job/chief_engineer,
		/datum/job/supsec,
		/datum/job/inspector,
		/datum/job/officer,
		/datum/job/smc
		)
	allowed_depts = CHURCH
	allow_modifications = TRUE

/datum/category_item/setup_option/core_implant/cruciform/tessellate
	name = "Tessellate Cruciform"
	desc = "The implant given to every disciple of the Absolute. This one is made for those who walk the path of the Tessellate, disciples who promote unity and healing, it charges slightly faster \
	but has a smaller power reserve."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform/tessellate

/datum/category_item/setup_option/core_implant/cruciform/lemniscate
	name = "Lemniscate Cruciform"
	desc = "The implant given to every disciple of the Absolute. This one is made for those who walk the path of the Lemniscate, disciples who promote the idea that change is itself circular in \
	nature. This has the smallest power reserves but the fastest charge of any cruciform."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform/lemniscate

/datum/category_item/setup_option/core_implant/cruciform/monomial
	name = "Monomial Cruciform"
	desc = "The implant given to every disciple of the Absolute. This one is made for those who walk the path of the Monomial, disciples who promote personal improvement and aesthetic living, \
	focusing more on personal self improvement. This has the largest power reserves of any cruciform but has an incredibly slow charge."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform/monomial