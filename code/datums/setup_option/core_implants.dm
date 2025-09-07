/datum/category_item/setup_option/core_implant/cruciform
	name = "Vinculum Cruciform"
	desc = "The implant given to every disciple of the Absolute. This one is a standard Vinculum design, having the base-line of a normal cruciform."
	implant_type = /obj/item/implant/core_implant/cruciform
	restricted_jobs = list(
		/datum/job/rd,
		/datum/job/cmo,
		/datum/job/outsider,
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
		)
	allowed_depts = CHURCH
	allow_modifications = TRUE
	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CINDAR, FORM_CHURCHSYNTH, FORM_UNBRANDED, FORM_FBP)

/datum/category_item/setup_option/core_implant/psionic_tumor
	name = "Psionic Organ"
	desc = "An unusual organ implanted by the Soteria research or obtained through other methods. It is presently unknown what it is truly capable of and psions are entirely unknown outside of Nadezhda. \
	Those with this organ must maintain purity of their bodies, any implants, cruciforms, or synthetic limbs will be violently and painfully rejected while this organ exists in the body."
	implant_organ_type = "psionic tumor"
	restricted_jobs = list(
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
		)
	allow_modifications = FALSE
	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_MYCUS, FORM_FOLKEN, FORM_CHTMANT)

/datum/category_item/setup_option/core_implant/psionic_tumor_psychiatrist
	name = "Cultured Psionic Organ"
	desc = "An unusual organ implanted by the Soteria research or obtained through other methods. It is presently unknown what it is truly capable of and psions are entirely unknown outside of Nadezhda. \
	Those with this organ must maintain purity of their bodies, any implants, cruciforms, or synthetic limbs will be violently and painfully rejected while this organ exists in the body. This \
	particular organ is the result of development while inside the brain of someone who understands the mind intimiately, offering them expanded powers and abilities when working as a Soteria psych."
	implant_organ_type = "cultured tumor"
	restricted_jobs = list(
		/datum/job/doctor,
		/datum/job/recovery_team,
		/datum/job/medstudent,
		/datum/job/premier,
		/datum/job/pg,
		/datum/job/chaplain,
		/datum/job/chief_engineer,
		/datum/job/merchant,
		/datum/job/smc,
		/datum/job/swo,
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai,
		/datum/job/scientist,
		/datum/job/scistudent,
		/datum/job/roboticist,
		/datum/job/robostudent
	) // The way to restrict this to one job could be done cleaner but this way easier so fuck it. -Kaz
	allow_modifications = FALSE
	restricted_depts = SECURITY | BLACKSHIELD | PROSPECTORS | ENGINEERING | CHURCH | INDEPENDENT | CIVILIAN | LSS | LODGE
	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_MYCUS, FORM_FOLKEN, FORM_CHTMANT)

/datum/category_item/setup_option/core_implant/nanogate
	name = "Nanogate"
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses."
	implant_organ_type = "nanogate"
	restricted_jobs = list(
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
		)
	allow_modifications = TRUE
	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_AGSYNTH)

/datum/category_item/setup_option/core_implant/artificer_nanogate
	name = "Artificer Nanogate"
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses. This \
	particular design is made by the Artificer Guild, able to store more nanites for additional uses."
	implant_organ_type = "artificer nanogate"
	restricted_jobs = list(
		/datum/job/outsider, // Nanogates are only available to colonist or allies.
		/datum/job/premier,
		/datum/job/pg,
		/datum/job/chaplain,
		/datum/job/cmo,
		/datum/job/merchant,
		/datum/job/rd,
		/datum/job/smc,
		/datum/job/swo,
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
		)
	allow_modifications = TRUE
	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_AGSYNTH, FORM_UNBRANDED, FORM_FBP)
	restricted_depts = SECURITY | BLACKSHIELD | PROSPECTORS | MEDICAL | SCIENCE | CHURCH | INDEPENDENT | CIVILIAN | LSS | LODGE

/datum/category_item/setup_option/core_implant/opifex_nanogate
	name = "Opifex Nanogate"
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses. This \
	particular design is an opifex original and one of the best that can be found in the galaxy."
	implant_organ_type = "opifex nanogate"
	restricted_jobs = list(
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
		)
	allow_modifications = TRUE
	restricted_to_species = list(FORM_OPIFEX) // Opifex get their own fancy nanogate

/datum/category_item/setup_option/core_implant/cruciform/tessellate
	name = "Tessellate Cruciform"
	desc = "The implant given to every disciple of the Absolute. This one is made for those who walk the path of the Tessellate, disciples who promote unity and healing, it charges slightly faster \
	but has a smaller power reserve."
	implant_type = /obj/item/implant/core_implant/cruciform/tessellate

/datum/category_item/setup_option/core_implant/cruciform/lemniscate
	name = "Lemniscate Cruciform"
	desc = "The implant given to every disciple of the Absolute. This one is made for those who walk the path of the Lemniscate, disciples who promote the idea that change is itself circular in \
	nature and only through team work and the desire to work together can people prosper. This has the smallest power reserves but the fastest charge of any cruciform."
	implant_type = /obj/item/implant/core_implant/cruciform/lemniscate

/datum/category_item/setup_option/core_implant/cruciform/monomial
	name = "Monomial Cruciform"
	desc = "The implant given to every disciple of the Absolute. This one is made for those who walk the path of the Monomial, disciples who promote personal improvement and aesthetic living, \
	focusing more on personal self improvement. This has the largest power reserves of any cruciform but has an incredibly slow charge."
	implant_type = /obj/item/implant/core_implant/cruciform/monomial

/datum/category_item/setup_option/core_implant/cruciform/divisor
	name = "Divisor Cruciform"
	desc = "The implant given to every disciple of the Absolute. This one is made for those who walk the path of the Divisor, disciples who promote security of the church and its members, \
	those who walk this path desire to protect the flock through arms, functioning as an internal guard to the Absolute."
	implant_type = /obj/item/implant/core_implant/cruciform/divisor

/datum/category_item/setup_option/core_implant/cruciform/factorial
	name = "Factorial Cruciform"
	desc = "The implant given to every disciple of the Absolute. This one is made for those who walk the path of the Factorial, disciples who apprentice themselves to the machines and technology \
	of the church, so that they may improve upon the foundations of faith. This cruciform is similar to the standard model in power and reserves, but is mainly favored by church aligned synthetics."
	implant_type = /obj/item/implant/core_implant/cruciform/factorial
