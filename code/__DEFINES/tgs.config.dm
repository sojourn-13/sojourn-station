#define TGS_EXTERNAL_CONFIGURATION

// Globals
#define TGS_DEFINE_AND_SET_GLOBAL(Name, Value) GLOBAL_VAR_INIT(Name, Value)
#define TGS_READ_GLOBAL(Name) GLOB.Name
#define TGS_WRITE_GLOBAL(Name, Value) (GLOB.Name = Value)

// Logging functions
// TODO: Potentially investigate multiple logging levels instead of just log_debug?
#define TGS_INFO_LOG(message) (log_debug(message))
#define TGS_WARNING_LOG(message) (log_debug(message))
#define TGS_ERROR_LOG(message) (log_debug(message))

// Announcement and notifying
#define TGS_WORLD_ANNOUNCE(message) (to_world(message))
#define TGS_NOTIFY_ADMINS(event) (to_chat(admins, span_adminnotice(event)))

// Misc
#define TGS_CLIENT_COUNT (length(clients))
#define TGS_PROTECT_DATUM(Path) // Leave blank if your codebase doesn't give administrators code reflection capabilities
