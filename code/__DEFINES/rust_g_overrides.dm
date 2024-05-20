// RUSTG_OVERRIDE_BUILTINS is not used since the file APIs don't work well over Linux.
#define url_encode(text) rustg_url_encode("[text]")
#define url_decode(text) rustg_url_decode("[text]")
#define md5(thing) (isfile(thing) ? rustg_hash_file(RUSTG_HASH_MD5, "[thing]") : rustg_hash_string(RUSTG_HASH_MD5, thing))
