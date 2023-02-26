/datum/category_item/setup_option/core_implant/cruciform
	name = "Vinculum Cruciform"
	desc = "Имплант, который дается каждому ученику Абсолюта. Этот - стандартная конструкция Винкулума, имеющая основание в виде обычной крестообразной формы."
	implant_type = /obj/item/implant/core_implant/cruciform
	restricted_jobs = list(
		/datum/job/merchant,
		/datum/job/swo,
		/datum/job/foreman,
		/datum/job/rd,
		/datum/job/cmo,
		/datum/job/chief_engineer,
		/datum/job/smc,
		/datum/job/outsider,
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
		)
	allowed_depts = CHURCH
	allow_modifications = TRUE
	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CINDAR, FORM_CHURCHSYNTH)

/datum/category_item/setup_option/core_implant/psionic_tumor
	name = "Psionic Organ"
	desc = "Необычный орган, имплантированный в результате исследований Сотерии или полученный другими способами. В настоящее время неизвестно, на что он способен, а псионы совершенно неизвестны за пределами Надежды. \
	Обладатели этого органа должны поддерживать чистоту своего тела, любые имплантаты, крестоформы или синтетические конечности будут жестоко и болезненно отторгаться, пока этот орган существует в теле."
	implant_organ_type = "psionic tumor"
	restricted_jobs = list(
		/datum/job/outsider //Psions are only available to colonist or allies.
		)
	allow_modifications = FALSE
	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_MYCUS, FORM_FOLKEN, FORM_CHTMANT)

/datum/category_item/setup_option/core_implant/psionic_tumor_psychiatrist
	name = "Cultured Psionic Organ"
	desc = "Необычный орган, имплантированный в результате исследований Сотерии или полученный другими способами. В настоящее время неизвестно, на что он способен, а псионы совершенно неизвестны за пределами Надежды. \
	Обладатели этого органа должны поддерживать чистоту своего тела, любые имплантаты, крестообразные или синтетические конечности будут жестоко и болезненно отторгаться, пока этот орган существует в теле. Этот \
	орган является результатом развития внутри мозга того, кто близко понимает разум, что дает ему расширенные силы и способности при работе в качестве психотехника Сотерии."
	implant_organ_type = "cultured tumor"
	restricted_jobs = list(
		/datum/job/doctor,
		/datum/job/recovery_team,
		/datum/job/roboticist,//Coffee edit: Now RD can also do a little bit of psych-research and healing. Still, RD ain't starting with Mind Master(So no +5 Psi-Points)
		/datum/job/scientist,
		/datum/job/premier,
		/datum/job/pg,
		/datum/job/chaplain,
		/datum/job/chief_engineer,
		/datum/job/merchant,
		/datum/job/smc,
		/datum/job/swo,
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
	) // The way to restrict this to one job could be done cleaner but this way easier so fuck it. -Kaz
	allow_modifications = FALSE
	restricted_depts = SECURITY | PROSPECTORS | ENGINEERING | CHURCH | INDEPENDENT | CIVILIAN | LSS
	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_MYCUS, FORM_FOLKEN, FORM_CHTMANT)

/datum/category_item/setup_option/core_implant/nanogate
	name = "Nanogate"
	desc = "Наногейт, созданный на заказ по превосходным чертежам опифексов. Он имплантируется прямо в месте соединения позвоночника с черепом и предоставляет широкий спектр возможностей использования нанитов."
	implant_organ_type = "nanogate"
	restricted_jobs = list(
		/datum/job/outsider // Nanogates are only available to colonist or allies.
		)
	allow_modifications = TRUE
	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_AGSYNTH)

/datum/category_item/setup_option/core_implant/artificer_nanogate
	name = "Artificer Nanogate"
	desc = "Наногейт, созданный на заказ по превосходным чертежам опифексов. Он имплантируется прямо в месте соединения позвоночника с черепом и предоставляет широкий спектр возможностей использования нанитов. Эта \
	особая конструкция сделана Гильдией Изобретателей, способна хранить больше нанитов для дополнительного использования."
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
	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_AGSYNTH)
	restricted_depts = SECURITY | PROSPECTORS | MEDICAL | SCIENCE | CHURCH | INDEPENDENT | CIVILIAN | LSS

/datum/category_item/setup_option/core_implant/opifex_nanogate
	name = "Opifex Nanogate"
	desc = "Наногейт, созданный на заказ по превосходным чертежам опифексов. Он имплантируется прямо в месте соединения позвоночника с черепом и предоставляет широкий спектр возможностей использования нанитов. Этот \
	конкретный дизайн является опифексовым оригиналом и одним из лучших, которые можно сыскать в галактике."
	implant_organ_type = "opifex nanogate"
	restricted_jobs = list(
		/datum/job/outsider, // Nanogates are only available to colonist or allies.
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
		)
	allow_modifications = TRUE
	restricted_to_species = list(FORM_OPIFEX) // Opifex get their own fancy nanogate

/datum/category_item/setup_option/core_implant/cruciform/tessellate
	name = "Tessellate Cruciform"
	desc = "Имплантат, который дается каждому ученику Абсолюта. Этот создан для тех, кто идет по пути Мозаика, учеников, которые способствуют единству и исцелению, он заряжается немного быстрее. \
	но имеет меньший запас энергии."
	implant_type = /obj/item/implant/core_implant/cruciform/tessellate

/datum/category_item/setup_option/core_implant/cruciform/lemniscate
	name = "Lemniscate Cruciform"
	desc = "Имплант, который дается каждому ученику Абсолюта. Он предназначен для тех, кто идет по пути Лемнискаты, учеников, которые продвигают идею о том, что изменение само по себе является круговым в \
	природе, и только благодаря командной работе и желанию работать вместе люди могут процветать. У него самый маленький запас энергии, но самый быстрый заряд среди всех крестообразных."
	implant_type = /obj/item/implant/core_implant/cruciform/lemniscate

/datum/category_item/setup_option/core_implant/cruciform/monomial
	name = "Monomial Cruciform"
	desc = "TИмплант, который дается каждому ученику Абсолюта. Этот создан для тех, кто идет по пути Одночлена, учеников, которые способствуют личному совершенствованию и эстетической жизни, \
	уделяя больше внимания личному самосовершенствованию. Он имеет самый большой запас энергии среди всех крестообразных, но заряжается невероятно медленно."
	implant_type = /obj/item/implant/core_implant/cruciform/monomial

/datum/category_item/setup_option/core_implant/cruciform/divisor
	name = "Divisor Cruciform"
	desc = "Имплант, который дается каждому ученику Абсолюта. Он предназначен для тех, кто идет по пути Делителя, учеников, которые способствуют безопасности церкви и ее членов, \
	те, кто идет по этому пути, желают защищать стадо с помощью оружия, действуя как внутренняя стража Абсолюта."
	implant_type = /obj/item/implant/core_implant/cruciform/divisor

/datum/category_item/setup_option/core_implant/cruciform/factorial
	name = "Factorial Cruciform"
	desc = "Имплант, данный каждому ученику Абсолюта. Этот создан для тех, кто идет по пути Факториала, учеников, которые осваивают машины и технологии \
	церкви, чтобы они могли совершенствовать основы веры. По мощности и резервам этот крестоформ схож со стандартной моделью, но в основном его предпочитают синтетики, связанные с церковью."
	implant_type = /obj/item/implant/core_implant/cruciform/factorial
