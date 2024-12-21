/obj/machinery/photocopier/faxmachine/proc/send_fax_embed_discord(
    var/mob/sender,
    var/obj/item/fax_item,
    var/department,          // Чтобы в тексте указать, куда был направлен факс
    var/optional_channel = "status" // Имя чата в TGS, куда отправляем
)
    /*
        sender        - тот, кто отправил факс
        fax_item      - фактический объект бумаги/фото/бандла
        department    - название департамента (или "Admin Fax")
        optional_channel - канальный тег, куда уйдёт сообщение. Можно сделать гибким.
    */

    var/title_text = "[department] Fax"
    var/body_text = ""
    body_text += "**Отправитель**: [sender ? sender.name : "Unknown"]\n"
    body_text += "**Департамент**: [department]\n\n"

    if (istype(fax_item, /obj/item/paper))
        var/obj/item/paper/P = fax_item
        body_text += "[P.info]\n"
        if (P.stamps)
            body_text += "\n_Stamps:_ [P.stamps]\n"
    else if (istype(fax_item, /obj/item/photo))
        var/obj/item/photo/Ph = fax_item
        body_text += "Получена фотография: [Ph.name].\n"
        if (Ph.scribble)
            body_text += "\n_Scribble:_ [Ph.scribble]\n"
    else if (istype(fax_item, /obj/item/paper_bundle))
        var/obj/item/paper_bundle/B = fax_item
        body_text += "Получен бумажный бандл: [B.name], [B.pages.len] страниц.\n"
    else
        body_text += "Неизвестный тип вложения.\n"

    var/datum/tgs_chat_embed/structure/embed = new()
    embed.title = title_text
    embed.description = body_text
    embed.colour = "#34a5c2"
    embed.timestamp = time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")

    var/datum/tgs_chat_embed/provider/author/author_obj = new("Fax Machine")
    author_obj.icon_url = "https://icon-library.com/images/fax-icon/fax-icon-14.jpg" // любой URL иконки
    embed.author = author_obj

    var/datum/tgs_chat_embed/footer/footer_obj = new("SS13 Fax Integration")
    footer_obj.icon_url = "https://cdn.discordapp.com/icons/..." // какой-нибудь URL иконки в футере
    embed.footer = footer_obj

    var/datum/tgs_message_content/msg_content = new()
    msg_content.embed = embed

    send2chat(msg_content, optional_channel)
