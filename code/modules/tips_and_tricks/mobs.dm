// This file contains all mobs tips and tricks and shown when you spawn or your mind is transfered
/tipsAndTricks/mobs
    var/list/mobs_list       //list of mobs to which tip can be shown
    var/list/secondary_langs    //list of second languages, hack to make chtmant based tipsAndTricks
    textColor = "#957820"

/tipsAndTricks/mobs/breathing
    mobs_list = list(/mob/living/carbon/human)
    tipText = "As a humanoid, you need oxygen and pressure to breathe. Comfortable pressure for a humanoid is around 101kPa. Some gases, like plasma, are toxic to you. Some exceptions exist, like the opifex, who require nitrogen to breathe and treat oxygen as toxic."

/tipsAndTricks/mobs/chtmant_healing
    secondary_langs = list(/datum/language/chtmant)
    tipText = "As a cht'mant roaches may be your friends, but also delecious and healthy. Just don't indulge in to much raw meat or you'll get sick!"

/tipsAndTricks/mobs/chtmant_webbing
    secondary_langs = list(/datum/language/chtmant)
    tipText = "As a cht'mant that preferred spiders as friends, you can not only cross their webs with ease but also make your own! Stack multiple in the same spot to create pseudo walls and barricades that only you and the spiders can move through."

/tipsAndTricks/mobs/chtmant_channle
    secondary_langs = list(/datum/language/chtmant)
    tipText = "As a cht'mant, using '',o'' will talk into a hivemind letting all other cht'mants get your message. This does not need power and works even in deep jungles or down in mines."

/tipsAndTricks/mobs/chtmant_metal_bad
    secondary_langs = list(/datum/language/chtmant)
    tipText = "As a cht'mant, metal inside you is poision.  Prosthetics, augments and shrapnel will give you toxins and hallucinations, best to avoid them entirely."

/tipsAndTricks/mobs/chtmant_toxic
    secondary_langs = list(/datum/language/chtmant)
    tipText = "As a cht'mant, you can check yourself and if something feels not well within, that means you have some toxin damage."



