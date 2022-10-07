// This file contains all mobs tips and tricks and shown when you spawn or your mind is transfered
/tipsAndTricks/mobs
    var/list/mobs_list       //list of mobs to which tip can be shown
    var/list/species_that_we_are    //list of second languages, hack to make chtmant based tipsAndTricks
    textColor = "#957820"

/tipsAndTricks/mobs/breathing
    mobs_list = list(/mob/living/carbon/human)
    tipText = "Как среднестатистическому гуманоиду, вам нужен кислород и давление, чтобы дышать. Комфортное давление для гуманоида составляет около 101 кПа. Некоторые газы, такие как плазма, токсичны для вас. Существуют некоторые исключения, такие как опифекс, которым для дыхания требуется азот, а кислород считается токсичным."

/tipsAndTricks/mobs/chtmant_healing
    mobs_list = list(/mob/living/carbon/human)
    species_that_we_are = list(/datum/species/chtmant)
    tipText = "Как правило для Чти'Мантов, тараканы часто бывают вашими друзьями, но в их мясе содержатся целебные химические вещества. Употребление их в пищу всегда полезно, но убедитесь, что вы не едите слишком много, иначе у вас будет передозировка."

/tipsAndTricks/mobs/chtmant_webbing
    mobs_list = list(/mob/living/carbon/human)
    species_that_we_are = list(/datum/species/chtmant)
    tipText = "Как Чти'Мант, вы можете оказаться другом пауков. Вы никогда не попадетесь в паутину и можете создать свою собственную, но убедитесь, что не делаете этого в общественном месте, иначе маршалы могут вас арестовать!"

/tipsAndTricks/mobs/chtmant_channle
    mobs_list = list(/mob/living/carbon/human)
    species_that_we_are = list(/datum/species/chtmant)
    tipText = "Как Чти'Мант, использование ', o' позволит вам говорить внутри вашего канала улья, позволяя всем другим чт'мантам слышать вас независимо от того, где вы находитесь. Связь в любой точке мира!"

/tipsAndTricks/mobs/chtmant_metal_bad
    mobs_list = list(/mob/living/carbon/human)
    species_that_we_are = list(/datum/species/chtmant)
    tipText = "Как для Чти'Манта, металл токсичен для вас, когда он находится внутри вашего тела. Протезы, аугменты и шрапнель приведут к накоплению токсинов и галлюцинациям, лучше всего полностью избегать их..."

/tipsAndTricks/mobs/chtmant_toxic
    mobs_list = list(/mob/living/carbon/human)
    species_that_we_are = list(/datum/species/chtmant)
    tipText = "Как Чти'Мант, вы можете проверить себя и почувствовать, если что-то не так, часто предупреждая вас о повреждении токсинами, которое вы в противном случае не почувствовали бы из-за вашего иммунитета к боли."

