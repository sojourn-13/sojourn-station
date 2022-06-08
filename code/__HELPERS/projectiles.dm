/obj/item/projectile/proc/will_hit_target(atom/target, atom/firer, var/pass_flags=PASSTABLE|PASSGLASS|PASSGRILLE, flags=null)
	if (!target)
		return FALSE
	if (!firer)
		return FALSE


