/datum/category_item/setup_option/core_implant/cruciform
	name = "Cruciform"
	desc = "The implant given to every disciple of the Absolute."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform
	restricted_jobs = list(
		/datum/job/merchant,
		/datum/job/swo,
		/datum/job/foreman,
		/datum/job/rd,
		/datum/job/cmo,
		/datum/job/chief_engineer,
		/datum/job/pro,
		/datum/job/salvager,
		/datum/job/supsec,
		/datum/job/inspector,
		/datum/job/officer
		)
	allowed_depts = CHURCH
	allow_modifications = TRUE
