// v513 ships with "arctan()" builtin
#if DM_VERSION < 513
proc/arctan(x)
	var/y = arcsin(x/sqrt(1+x*x))
	return y
#endif

/// Call by name proc reference, checks if the proc exists on either the given type or as a global proc
#define TYPE_PROC_REF(TYPE, X) (NAMEOF(##TYPE.proc/##X))

