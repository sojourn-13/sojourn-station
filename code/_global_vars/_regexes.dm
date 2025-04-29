GLOBAL_DATUM_INIT(is_http_protocol, /regex, regex("^https?://"))

//finds text strings recognized as links on discord. Mainly used to stop embedding.
GLOBAL_DATUM_INIT(has_discord_embeddable_links, /regex, regex("(https?://\[^\\s|<\]{2,})"))
