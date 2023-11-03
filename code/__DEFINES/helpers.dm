/// Stringifies whatever you put into it.
#define STRINGIFY(argument) #argument

/// subtypesof(), typesof() without the parent path
#define subtypesof(typepath) ( typesof(typepath) - typepath )

/// Old method of sending signals, anything using this should be updated to work with SEND_SIGNAL()
#define SEND_SIGNAL_OLD(target, sigtype, arguments...) ( !target.comp_lookup?[sigtype] ? NONE : target._SendSignal(sigtype, list(##arguments)) )