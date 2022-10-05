// This file contains all tips and tricks and shown when you are assigned that role
/tipsAndTricks/roles
    var/list/roles_list       //list of roles to which tip can be shown
    textColor = "purple"

/tipsAndTricks/roles/traitor_uplink
    roles_list = list(/datum/antagonist/traitor)
    tipText = "Как предатель, вы можете заказать все виды полезных вещей со своего КПК / гарнитуры / импланта аплинка, таких как оружие, устройства, экипировка, услуги и даже деньги!"

/tipsAndTricks/roles/antag_good_rp
    roles_list = list(/datum/antagonist)
    tipText = "Ролевые игры создают верных друзей и заслуживающих уважение противников. Все любят хорошего рассказчика, который вовлекает других в сюжет."

/tipsAndTricks/roles/antag_good_rp_two
    roles_list = list(/datum/antagonist)
    tipText = "Играйте, чтобы повеселиться и вовлечь в это веселье других. Если ваш раунд меньше похож на подборку убийств, а больше на научно-фантастический триллер, вы делаете все правильно."


/tipsAndTricks/roles/antag_good_rp_three
    roles_list = list(/datum/antagonist)
    tipText = "Просто убивать своих врагов выстрелом в спину - это так банально. Ты можешь сделать лучше. Заставь их умереть уставшими."

/tipsAndTricks/roles/antag_good_rp_four
    roles_list = list(/datum/antagonist)
    tipText = "Быть антагонистом - это не оправдание для того, чтобы избегать ролевой игры."

/tipsAndTricks/roles/bombs
    roles_list = list(/datum/antagonist)
    tipText = "Вы можете создавать очень мощные бомбы в лабораториях Сотерии. У вас также есть различные способы детонации на выбор."

/tipsAndTricks/roles/computerPrograms
    roles_list = list(/datum/antagonist/traitor)
    tipText = "Когда вы емагаете компьютер, он открывает доступ к некоторым уникальным программам. Дешифратор доступа - один из них. Обратите внимание, что большинство программ зависят от вычислительной мощности компьютера."

/tipsAndTricks/roles/borgEmag
    roles_list = list(/datum/antagonist/traitor)
    tipText = "Емагнув киборга, вы получаете могущественного союзника с полным доступом. Не забудьте сначала открыть его панель."

/tipsAndTricks/roles/siliconLaws
    roles_list = list(/datum/antagonist)
    tipText = "Искусственный интеллект колонии может выполнить ваши требования, если вы соответствующим образом обновите его законы. Это также может повлиять на киборгов, если они синхронизированы с ИИ."

