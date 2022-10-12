// This file contains all gameplay tips that didnt fit into other categories
/tipsAndTricks/jobs
    var/list/jobs_list       //list of jobs to which tip can be shown
    textColor = "#22458d"

/tipsAndTricks/jobs/captain_boss
    jobs_list = list(/datum/job/premier)
    tipText = "Как Премьер этой колонии, вы выполняете функции агента внутренних дел, юриста и посредника."

/tipsAndTricks/jobs/ironhammer_theft
    jobs_list = list(/datum/job/smc, /datum/job/swo, /datum/job/supsec, /datum/job/inspector, /datum/job/medspec, /datum/job/trooper, /datum/job/officer, /datum/job/serg)
    tipText = "Как у сотрудника охраны, у вас есть широкий доступ к другим отделам. Это не означает, что вы можете взять все, к чему у вас есть доступ. Брать вещи из других отделов - это воровство!"

/tipsAndTricks/jobs/plants_are_dieing_gardener
    jobs_list = list(/datum/job/hydro)
    tipText = "Как садовник, вы должны поддерживать растения и вокруг колонии."

/tipsAndTricks/jobs/newsprint
    jobs_list = list(/datum/job/janitor)
    tipText = "В вашей пачке газетной бумаги никогда не кончится бумага, убедитесь, что вся станция оснащена газетами."

/tipsAndTricks/jobs/guild_resale_profit
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "Как член Lonestar, вы должны скупать ценные вещи у мусорщиков и перепродавать их с прибылью. Покупайте все ценное, что вам приносят."

/tipsAndTricks/jobs/guild_price_scanner
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "В колонии есть сканер цен, который может помочь вам оценить товары. На вашем КПК также установлен этот сканер."

/tipsAndTricks/jobs/mines_are_danger
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "В шахтах обычно много руды, но также и много опасности. Преследователи из ваших кошмаров, Пауки полные яда, Тараканы и другие монстры - обычное дело там, внизу."

/tipsAndTricks/jobs/custom_venders
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "Всегда старайтесь использовать Custom Vending Machines, когда это возможно, они могут продавать товары, когда вы заняты заключением новых сделок. Другие отделы будут рады, если вы создадите такой же и для них."

/tipsAndTricks/jobs/drillllls
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "Массивные сверла глубоко проникают в землю на том тайле, который они сверлят, модернизация увеличит их радиус до большего количества плиток."

/tipsAndTricks/jobs/diggyhole
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "Саму землю можно перекопать лопатой, чтобы получить больше руды, это, скорее всего, даст вам камни, которые можно отбивать молотком для получения большего количества осколков руды."

/tipsAndTricks/jobs/the_wall_of_ore
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "Вы можете использовать определенные типы кирок, чтобы пробивать стены шахт, которые до этого были непроходимы и неразрушимы, это даст больше осколков руды, без необходимости рушить камень."

/tipsAndTricks/jobs/surface_mining
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "Для тех, кто хочет избежать темных, одиноких, страшных шахт, вы можете подняться на поверхность и найти ближайшую пещеру на берегу озера, чтобы заняться добычей полезных ископаемых. К сожалению, это не даст вам больше руды, но может стать интересным выбором для исследований..."

/tipsAndTricks/jobs/survive
    jobs_list = list(/datum/job/foreman, /datum/job/mining, /datum/job/salvager, /datum/job/pro)
    tipText = "Не умирать... Ну хотя-бы не так быстро..."

/tipsAndTricks/jobs/scrap_stuff
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Сломанные устройства, металлолом и обгоревшие доски - все это стоит собирать, так как в них могут быть случайные материалы или, по крайней мере, немного стали, стекла и / или пластика."

/tipsAndTricks/jobs/scrap_ammo_uses
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Боеприпасы из хлама, хоть и наносят меньше урона, имеют большое применение благодаря своей доступности, например, сбивают замки всякий раз, когда инструмент для взлома недоступен."

/tipsAndTricks/jobs/pointy_thing
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Кинжалы и ножи, вонзенные в спину как монстров, так и людей, наносят больше урона, чем обычно. Нет ничего лучше чем ударить в спину друга, не так ли?"

/tipsAndTricks/jobs/sell_things_you_hoarding_goblins
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Продажа товаров другим отделам - это часть вашей работы. Черный щит и маршалы любят оружие и боеприпасы, Сотерия всегда будет рада получить материалы и исследовательские диски. Гильдия (особенно Гильдмастер) была бы признательна за редкости, кабельные катушки и материалы как пример... Ну или подарите им тостер, они отвлекутся на молитвы..."

/tipsAndTricks/jobs/your_perks_are_op
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "У вас есть перк, который позволяет вам с первого взгляда определить, как влияет аномалия на странности, вы можете продавать эти знания с прибылью!"

/tipsAndTricks/jobs/captain_leader
    jobs_list = list(/datum/job/premier)
    tipText = "К советам мудрого человека всегда прислушиваются, потому что мудрый человек никогда не даст плохого совета."

/tipsAndTricks/jobs/captain_free_access
    jobs_list = list(/datum/job/premier)
    tipText = "Вы выбрали эту роль только для карты с полным доступом, не так ли?"

/tipsAndTricks/jobs/captain_value_your_ship
    jobs_list = list(/datum/job/premier)
    tipText = "Когда два отдела вступают в конфликт, не стесняйтесь сглаживать ситуацию."

/tipsAndTricks/jobs/captain_is_overseer
    jobs_list = list(/datum/job/premier)
    tipText = "У вас есть жизненно важная роль вне персонажа; вы даете задания, если игрокам не хватает направления для развития, а колония становится беспокойной или скучающей, дайте им какое-нибудь продуктивное занятие.."

/tipsAndTricks/jobs/is_captain_right
    jobs_list = list(/datum/job/premier)
    tipText = "Прислушайтесь к своим коллегам - членам Совета. Их вклад неоценим, особенно в ситуациях, касающихся их области работы."

/tipsAndTricks/jobs/engies_tribe
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "С древних времен Гильдия готовила лучших Инженеров в галактике. Вот почему вас называют Мастером."

/tipsAndTricks/jobs/unlimitedpower
	jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
	tipText = "Солнечные батареи - не единственный способ обеспечить колонию энергией! На северной стороне Гильдии есть Плотина, управляемая компьютером, который уведомит вас по каналу связи Гильдии, когда вы сможете открыть шлюзы для выработки электроэнергии, а также дизельные генераторы и генераторы типа PACMAN, которые используют различные виды материалов в качестве топлива."

/tipsAndTricks/jobs/youaredamright
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "Компьютер, который управляет плотиной, может определить, правильно ли работают турбины. Если это не так, вручную проверьте их состояние, осмотрев их. Если турбину блокирует мусор, используйте лом, чтобы вытащить его. Если турбина заглохла, пульсирование с помощью мультитула вернет ее в рабочее состояние по умолчанию."

/tipsAndTricks/jobs/smithing
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "Побудите клиентов покупать у вас, напомнив им, что вы можете печатать ЛЮБЫЕ боеприпасы в bullet fabricator, а также создавать интересные моды для оружия, брони, инструментов и даже пылающий меч!"

//	Supermatter tips commented out because we have progressed past the need for a Supermatter.
//	Might want to re-add these if we ever get the opportunity to build our own Supermatter engines.

//	/tipsAndTricks/jobs/engies_suppermatter_one
//	jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
//	tipText = "Суперматерия - переменчивая властительница, и у каждой гильдии есть свой собственный метод настройки. Ни один метод не является строго неправильным; те, кто сделал такой неправильный выбор, наверняка были бы уже мертвы.. Как и вся колония, а может и планета"

//	/tipsAndTricks/jobs/engies_suppermatter_two
//	jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
//	tipText = "Выпуск перегретой охлаждающей жидкости из суперматерии может привести к немедленному снижению температуры, но без свежего охлаждающего газа суперматерия почти наверняка расслаивается. И делает бум."

//	tipsAndTricks/jobs/engies_suppermatter_three
//	jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
//	tipText = "Горе мастеру гильдии, который позволяет кристаллу расслаиваться каждый раз, ведь количество таких кристаллов сокращается. Любой, кто вызывает такой позор, должен разложиться вместе с двигателем, а не жить с этим клеймом позора"

/tipsAndTricks/jobs/engies_lifekeeper
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "Вы несете ответственность за поддержание этой колонии в рабочем состоянии, пригодной для жилья и с пригодным для дыхания воздухом. Убедитесь, что это остается таким всегда."

/tipsAndTricks/jobs/engies_glass_fire
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "В случае пожара разбейте стекло."

/tipsAndTricks/jobs/engies_firespacesuit
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "Ни один Адепт не проживет долго, не узнав, что противопожарные костюмы не выдержат вакуум космоса, и не все скафандры огнеупорны."

/tipsAndTricks/jobs/theBlackBox
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "Nano Forge может быть оснащен любой странностью, которая повышает знания в области механики, а также является Аномалией. В черном ящике Nano Forge всегда будет аномалия."

/tipsAndTricks/jobs/bullet_fab
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "The Bullet Fabricator генерирует очки полезных материалов на основе стоимости материала наличными. Чем дороже используемый материал, тем более полезный материал вы получите."

/tipsAndTricks/jobs/nanoforge
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "Nano Forge производит сжатую материю, это может служить топливом для РЦД и арбалетов с РЦД, но также стоит довольно много кредитов и является отличным топливом для изготовления пуль."

/tipsAndTricks/jobs/tric
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Инапровалин и Диловен можно смешать вместе, чтобы получить Трикордразин - мягкое регенерирующее соединение, которое может лечить грубые повреждения / ожоги / токсины и даже удушье. Однако будьте осторожны, более тридцати единиц вызовут смертельную передозировку, старайтесь также не забывать что химикаты смешиваются также и в теле!"

/tipsAndTricks/jobs/reagent_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "В ваш КПК встроен сканер реагентов."

/tipsAndTricks/jobs/medical_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "В ваш КПК встроен медицинский сканер."

/tipsAndTricks/jobs/cryo_bag_scanning
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Медицинские сканеры также работают через мешки для трупов, позволяя вам сканировать людей, находящихся в них в данный момент. Это также включает в себя стазисные мешки."

/tipsAndTricks/jobs/detox_chem_clering
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Диловен при введении выводит токсичные химические вещества, такие как соединения, вдыхаемые и общие токсины. При пероральном употреблении он не выводит эти яды, но все равно лечит накопление токсинов."

/tipsAndTricks/jobs/gas_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/technomancer)
    tipText = "Внутри вашего КПК установлен газовый сканер."

/tipsAndTricks/jobs/carbonPills
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Углерод можно принимать внутрь для лечения случаев отравления и случайной передозировки. 1 часть углерода удалит 1 часть всего, что находится в желудке. Однако это не приведет к удалению химических веществ из кровотока, и инъекция углерода не будет иметь такого же эффекта."

/tipsAndTricks/jobs/inaprov
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Инапровалин стабилизирует пациента во многих отношениях и является химическим средством для критических пациентов."

/tipsAndTricks/jobs/spooder
	jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
	tipText = "На Чт'мант не влияют Трикордазин, Келотан, Дилинг и Перидаксон, в то время как Бикаридин действует на них вдвое эффективнее. Любая другая химия, которая не является такой, излечит их нормально."

/tipsAndTricks/jobs/spooder2
	jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
	tipText = "Что касается Чт'манта, химические вещества, полученные из различных видов мяса тараканов, излечат их так же, как обычные целебные химикаты излечивают всех остальных. Выпускается в виде Трикордазина, Диплоптерума в виде Дексалина, Старкиллера в виде Бикаридина, Селигитилина в виде Келотана, Желатина в виде Диловена и Фюрерола в виде Перидаксона. Помните, что передозировка в 16 единиц может привести к летальному исходу!"

/tipsAndTricks/jobs/spooder3
	jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
	tipText = "Вы можете измельчить мясо таракана на своей промышленной мясорубке для получения полезных химических веществ. Отбивную и Диплоптерум можно получить практически из любого таракана, в то время как из других тараканов можно получить Селигитиллин, из ягеров - Гевалтин, из панцеров-старкеллин, а из Фюрероле - Фюрерс."

/tipsAndTricks/jobs/birb
	jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
	tipText = "Опифекс дышит азотом и отравляется кислородом. Ни в коем случае не пытайтесь снимать с них специальные маски, даже для обезболивания. Если вам необходимо провести операцию на одном из них, введите либо достаточно сильные обезболивающие с помощью инъекций или таблеток, либо снотворные, чтобы избежать их страданий во время процедуры."

/tipsAndTricks/jobs/overdose
	jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
	tipText = "Передозировка вызовет неблагоприятные (и даже смертельные) последствия для пациента до тех пор, пока из его организма не будет выведена каждая единица передозирующего химического вещества. Чтобы вылечить передозировку, сначала удалите передозирующее химическое вещество с помощью диализа или желудочного насоса у спящего, или используйте 1u Галоперидола для крови и угольные таблетки для желудка. Только когда все это исчезнет, устраните причиненный этим ущерб."

/tipsAndTricks/jobs/lid_draw
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Вы можете набирать реагенты из флаконов с помощью шприца даже через закрытую крышку."

/tipsAndTricks/jobs/crewMonitorHelp
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Вы можете использовать программу мониторинга экипажа на компьютерах, чтобы найти раненых колонистов. Его можно загрузить на планшеты или ноутбуки для портативного решения. В медицинском хранилище всегда есть один планшет для этой цели в начале каждой смены."

/tipsAndTricks/jobs/odysseus_boons
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Медицинская мех Odysseus - это надежное и быстрое транспортное средство, которое лучше всего используется парамедиками или врачами, выполняющими функции парамедиков. Модуль шприц-пистолета может сканировать и производить химические вещества для доставки на лету (при условии, что вы загружаете его шприцами), а модуль слипера позволяет транспортировать и дозировать пациентов внутри с основными химическими препаратами для стабилизации по пути в медотсек."

/tipsAndTricks/jobs/thermite
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Термит - отличный способ разрушить стены."

/tipsAndTricks/jobs/grenades
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Вы можете делать гранаты для различных целей, от вредных (например, взрыв или электромагнитное излучение) до полезных (например, уборка и уничтожение сорняков)."

/tipsAndTricks/jobs/cyborgsDontBreathe
    jobs_list = list(/datum/job/cyborg)
    tipText = "Как киборгу, вам не нужен кислород / давление, чтобы выжить. Вы также довольно устойчивы к высокой температуре. Используйте это в своих интересах."

/tipsAndTricks/jobs/cyborgsChargersAreAmazing
    jobs_list = list(/datum/job/cyborg)
    tipText = "Наличие зарядного устройства для киборгов с улучшенными манипуляторами позволит ему залечивать грубые повреждения и повреждения, основанные на ожогах. Однако это не приведет к ремонту сломанной обшивки или радиоприемников."

/tipsAndTricks/jobs/siliconRemoteControl
    jobs_list = list(/datum/job/cyborg, /datum/job/ai)
    tipText = "Силиконы обладают способностью дистанционно управлять машинами. Вы можете открывать воздушные шлюзы, не натыкаясь на них."

/tipsAndTricks/jobs/siliconShortcuts
    jobs_list = list(/datum/job/cyborg, /datum/job/ai)
    tipText = "У большинства машин есть сочетания клавиш. Попробуйте нажать alt / shift / ctrl на некоторых. Например - воздушные шлюзы, воздушная/пожарная сигнализация, APC."

/tipsAndTricks/jobs/siliconRemoteControlTwo
    jobs_list = list(/datum/job/cyborg, /datum/job/ai)
    tipText = "Вы можете получить доступ к некоторым компьютерным программам, не взаимодействуя с реальными компьютерами, используя свои 'Подсистемы', расположенные на вкладке silicon."

/tipsAndTricks/jobs/ai_can_controle_shells
    jobs_list = list(/datum/job/ai)
    tipText = "Как искусственный интеллект, вы можете дистанционно управлять снарядами дронов."

/tipsAndTricks/jobs/pda_paper_scanner
    jobs_list = list(/datum/job/premier, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/smc, /datum/job/pg, /datum/job/rd)
    tipText = "Ваш КПК оснащен встроенным сканером бумаги и принтером."

/tipsAndTricks/jobs/aiCanBeMoved
    jobs_list = list(/datum/job/ai)
    tipText = "Ядро искусственного интеллекта можно развернуть и переместить в более безопасное место, но его можно отслеживать по энергопотреблению."

/tipsAndTricks/jobs/expeditionsAreFUN
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Экспедиции - это ВЕСЕЛО! Попробуйте поучаствовать в одной из них."

/tipsAndTricks/jobs/prostheticsForTheMeek
    jobs_list = list(/datum/job/roboticist)
    tipText = "Вы можете улучшить человеческое тело, установив протезы и модификации."

/tipsAndTricks/jobs/chem_app
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist, /datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team)
    tipText = "В вашем КПК есть программа под названием SIRC (Внутренний Каталог Реагентов Сотерии), которая может помочь вам с химией."

/tipsAndTricks/jobs/drink_app
    jobs_list = list(/datum/job/clubworker, /datum/job/clubmanager)
    tipText = "В вашем КПК есть программа под названием Neon Cocktails, которая может помочь вам в приготовлении напитков."

/tipsAndTricks/jobs/upgrade_dispender
    jobs_list = list(/datum/job/clubworker, /datum/job/clubmanager)
    tipText = "Ваш диспенсер для выпивки и содовой можно взломать с помощью мультитула, чтобы предоставить больше вариантов напитков. Его также можно модернизировать с помощью усовершенствованных деталей, чтобы заряжать быстрее, удерживать больше энергии и даже готовить новые напитки или химическую продукцию."

/tipsAndTricks/jobs/upgrades
    jobs_list = list(/datum/job/rd, /datum/job/scientist)
    tipText = "Есть много машин, которые можно модернизировать, используйте на них RPED, чтобы узнать, какие детали он содержит, и обновите их более совершенными, чтобы повысить их эффективность."

/tipsAndTricks/jobs/upgrade_chemdispenders_sleeper
    jobs_list = list(/datum/job/rd, /datum/job/scientist)
    tipText = "Дозаторы химикатов обладают большей химической емкостью, чем выше емкость их ячеек. Омега (средние) клетки лучше всего подходят для них, не тратьте на них атомные клетки!"

/tipsAndTricks/jobs/bots
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Боты - это неутомимые слуги, которых вы можете создать. Нет уборщика? Чистый бот_инок спешит на помощь! Не хватает медицинского персонала? Медбот, по крайней мере, залатает их! Ленивый Садовник? Постройте для них Садового робота и взимайте с них дополнительную плату!"

/tipsAndTricks/jobs/ripley
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Мех Ripley - это универсальный инструмент для самых разных задач, будь то добыча полезных ископаемых, строительство или разрушение."

/tipsAndTricks/jobs/firefighter
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Ripley Firefighter - это улучшенная версия Ripley, имеющая больше брони и почти несгораемая."

/tipsAndTricks/jobs/odysseus
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Odysseus - это надежный медицинский робот, который может использоваться в качестве фельдшерского автомобиля или мобильной машины для оказания медицинской помощи."

/tipsAndTricks/jobs/gygax
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Гигакс - боевой мех. Это легкобронированный, но довольно мобильный кошмар для любых угроз, с которыми может столкнуться колония... Или же сама колония столкнется с Гигаксом"

/tipsAndTricks/jobs/durand
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Дюран - это боевой мех. Он сильно бронирован и особенно страшен в ограниченном пространстве из-за своего режима защиты."

/tipsAndTricks/jobs/phazon
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Фазон - это боевой мех. Он имеет самую высокую базовую скорость перемещения, хорошую броню и может проходить через что угодно благодаря стабильной технологии bluespace."

/tipsAndTricks/jobs/wall_obelisk
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "Вокруг некоторых частей станции есть настенные обелиски, они работают на биоматериале, поэтому, возможно, было бы разумно время от времени проверять их и пополнять."

/tipsAndTricks/jobs/church_wine_anti_toxin
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "Вино Absolutism Cahors можно пить, чтобы помочь бороться с токсинами, или вводить в качестве легкого обезболивающего."

/tipsAndTricks/jobs/best_dagger_ever
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "Ритуальный нож абсолютизма можно метать, это полезно для вонзания ножа в чью-то спину. Если его бросить в кого-то, кто также верует в абсолютизм, вероятность его внедрения будет меньше."

/tipsAndTricks/jobs/skyfall_timer
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "Утилизационный маяк имеет задержку в один час, прежде чем его можно будет использовать снова, что означает, что в продуктивную смену вы можете использовать его 8 раз до ее окончания."

/tipsAndTricks/jobs/plants_n_meat
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "Если вам когда-нибудь понадобится биоматерия, вы всегда можете купить или обменять ее на растения и мясо у Охотников или Садовников."

/tipsAndTricks/jobs/cleaning_carbine
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "Очищающий карабин, как следует из названия, стреляет очищающими гранулами, которые при попадании на что-либо образуют небольшое количество скользкой пены, которая очищает. Это можно использовать как в обороне, так и для длительного скольжения, чтобы уйти от более крупных врагов, и для обычной уборки станции, если поблизости нет уборщика."

/tipsAndTricks/jobs/hunter_meds
    jobs_list = list(/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)
    tipText = "Татонки, находящиеся в амбаре, можно выращивать из пшеницы, а затем разделывать на кости, кожу и части животных, которые можно превратить в лекарство в меню крафта."

/tipsAndTricks/jobs/hunter_knife
    jobs_list = list(/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)
    tipText = "Ваши инструменты священны, не позволяйте никому брать ваши ножи для снятия шкуры. Но вы все еще можете обменять свои алебарды, арбалет и доспехи."

/tipsAndTricks/jobs/hunter_stimulants
    jobs_list = list(/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)
    tipText = "Когда клаккеров разделывают, из них выпадает перо, которое можно превратить в болеутоляющее в меню крафта. Это может быть полезно в сочетании с молоком из татонки, чтобы повысить вашу защиту."

/tipsAndTricks/jobs/hunter_mutants
    jobs_list = list(/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)
    tipText = "У татонки и церберов есть небольшой шанс мутировать каждый раз, когда они взрослеют. Эти мутантные варианты гораздо более ценны и гораздо более востребованы, но довольно редки."

/tipsAndTricks/jobs/hunter_allies
    jobs_list = list(/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)
    tipText = "Гончие цербера - дальновидные и преданные животные, которые никогда не нападут на вас, они становятся отличными союзниками на охоте, отвлекая внимание от более крупных врагов и издавая рычание, когда замечают врагов, которых вы не заметили."
