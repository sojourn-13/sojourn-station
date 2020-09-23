// This file contains all mobs tips and tricks and shown when you spawn or your mind is transfered
/tipsAndTricks/mobs
    var/list/mobs_list       //list of mobs to which tip can be shown
    var/list/secondary_langs    //list of second languages, hack to make chtmant based tipsAndTricks
    textColor = "#957820"

/tipsAndTricks/mobs/breathing
    mobs_list = list(/mob/living/carbon/human)
    tipText = "As an average humanoid, you need oxygen and pressure to breathe. Comfortable pressure for a humanoid is around 101kPa. Some gases, like plasma, are toxic to you. Some exceptions exist, like the opifex, who require nitrogen to breathe and treat oxygen as toxic."

/tipsAndTricks/mobs/chtmant_healing
    secondary_langs = list(/datum/language/chtmant)
    tipText = "As a cht'mant, roaches are often times your friend but carry healing chemicals in their meat. Eating them is always beneficial but make sure you don't eat too much or you'll overdose."

/tipsAndTricks/mobs/chtmant_webbing
    secondary_langs = list(/datum/language/chtmant)
    tipText = "As a cht'mant, you may find yourself a friend of spiders. You never get caught in spider webs and can create your own, but make sure not to do that in a public space or security may arrest you!"

/tipsAndTricks/mobs/chtmant_channle
    secondary_langs = list(/datum/language/chtmant)
    tipText = "As a cht'mant, using ',o' will allow you to speak within your hivemind, allowing all other cht'mants to hear you no matter where you are at, including the deep forest, mines, and mountaintop!"
    
/tipsAndTricks/mobs/chtmant_metal_bad
    secondary_langs = list(/datum/language/chtmant)
    tipText = "As a cht'mant, metal is toxic when inside you.  Prosthetics, augments, and shrapnel will give you toxins and hallucinations, it is best to avoid them entirely."

/tipsAndTricks/mobs/chtmant_toxic
    secondary_langs = list(/datum/language/chtmant)
    tipText = "As a cht'mant, you can check yourself and feel if something is wrong, often times alerting you to toxin damage you would otherwise not feel due to your pain immunity."



