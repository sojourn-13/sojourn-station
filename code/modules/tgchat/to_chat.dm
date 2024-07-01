/*!
 * Copyright (c) 2020 Aleksej Komarov
 * SPDX-License-Identifier: MIT
 */

/**
 * Handles legacy messages
 * TODO: Remove this when we get rid of all legacy messages (read: never)
 */
/proc/apply_chat_mitigations(target, html, handle_whitespace)
	if(handle_whitespace)
		html = replacetext(html, "\n", "<br>")
		html = replacetext(html, "\t", "[GLOB.TAB][GLOB.TAB]")

	//Replace expanded \icon macro with icon2html
	//regex/Replace with a proc won't work here because icon2html takes target as an argument and there is no way to pass it to the replacement proc
	//not even hacks with reassigning usr work
	var/regex/i = new(@/<IMG CLASS=icon SRC=(\[[^]]+])(?: ICONSTATE='([^']+)')?>/, "g")
	while(i.Find(html))
		html = copytext(html,1,i.index)+icon2html(locate(i.group[1]), target, icon_state=i.group[2])+copytext(html,i.next)
	html = symbols_to_unicode(
		strip_improper(
			color_macro_to_html(
				html
			)
		)
	)

	return html

/**
 * Circumvents the message queue and sends the message
 * to the recipient (target) as soon as possible.
 */
/proc/to_chat_immediate(
	target,
	html,
	type = null,
	text = null,
	avoid_highlighting = FALSE,
	handle_whitespace = TRUE,
)
	// Useful where the integer 0 is the entire message. Use case is enabling to_chat(target, some_boolean) while preventing to_chat(target, "")
	html = "[html]"
	text = "[text]"

	var/old_html = html
	if(html)
		html = apply_chat_mitigations(target, html, handle_whitespace)

	if(!target)
		return
	if(!html && !text)
		// TODO: Fix this outside of live
		// CRASH("Empty or null string in to_chat proc call.")
		return
	if(target == world)
		target = clients

	// Build a message
	var/message = list()
	if(type) message["type"] = type
	if(text) message["text"] = text
	if(html) message["html"] = html
	if(old_html) message["old_html"] = old_html
	if(avoid_highlighting) message["avoidHighlighting"] = avoid_highlighting

	// send it immediately
	SSchat.send_immediate(target, message)

/**
 * Sends the message to the recipient (target).
 *
 * Recommended way to write to_chat calls:
 * ```
 * to_chat(client,
 *     type = MESSAGE_TYPE_INFO,
 *     html = "You have found <strong>[object]</strong>")
 * ```
 */
/proc/to_chat(
	target,
	html,
	type = null,
	text = null,
	avoid_highlighting = FALSE,
	handle_whitespace = TRUE,
)
	if(isnull(Master) || !SSchat?.initialized || !MC_RUNNING(SSchat.init_stage))
		to_chat_immediate(target, html, type, text, avoid_highlighting)
		return

	// Useful where the integer 0 is the entire message. Use case is enabling to_chat(target, some_boolean) while preventing to_chat(target, "")
	html = "[html]"
	text = "[text]"

	var/old_html = html
	if(html)
		html = apply_chat_mitigations(target, html, handle_whitespace)

	if(!target)
		return
	if(!html && !text)
		CRASH("Empty or null string in to_chat proc call.")
	if(target == world)
		target = clients

	// Build a message
	var/message = list()
	if(type) message["type"] = type
	if(text) message["text"] = text
	if(html) message["html"] = html
	if(old_html) message["old_html"] = old_html
	if(avoid_highlighting) message["avoidHighlighting"] = avoid_highlighting
	SSchat.queue(target, message)
