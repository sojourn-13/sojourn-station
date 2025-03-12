# General

-   Where possible, large projects should be broken up into several smaller pull requests, and/or done in phases over time.
-   Pull requests should not contain commented code except TODOs and explanation comments.
-   Pull requests should not contain any debug output, variables or procs, unless these are of value to admins/coders for live debugging.
-   Pull requests should not contain changes that do not relate with functionality described in commit messages.
-   If pull request relates with existing github issue, it should be specified in commit message, for example, "Fix broken floor sprites, close #23" (see https://help.github.com/articles/closing-issues-via-commit-messages/ for additional info).
-   If pull request contains map files changes, it MUST be fitted for the correct format. External tools like StrongDMM automatically do this. Local in-code tools currently do not work so it is best to use proper tools than Dream Makers base. Pull request description should contain screenshots of map changes if it's not obvious from map files diff.
-   If pull request contains icon files changes, the pull request description should contain screenshots of changed icon files. While this isn't required, it's more preferred than digging into the file or checking the Actions Tools for your sprite changes.
-   If you have the permissions, please set appropriate labels on your PRs. Including, at the very least, Good-To-Merge to indicate that its done.

# Advice for new recruits

Start small! Make your first couple of PRs focus on bugfixes or small balance tweaks until you get used to the system. The repo is littered with failed projects from people who got overambitious and burned out.

Seek input before starting work on significant features. Your proposal may conflict with existing plans and need modified. Getting the approval of maintainers, and especially the head developer, is important for things which may affect game balance.

Be flexible. Very few submissions are accepted as-is, almost every PR will have some required modifications during the review process, sometimes to how the code works, or often to balance out mechanics.

Finish what you start. A project is only done when it's merged, not just when the PR is up. After submitting something, try to make some time to be available over the next week or so to fix any requested changes after its reviewed. We won't merge unfinished work.

Ask for help whenever you need it. No man is an island. Don't try to struggle alone, nobody will judge you for asking for help with even silly things.

# Changelog Entries

Any pull requests which add or change user-visible features should have a changelog written up. This is included with the changelog format. 

# Code Standards 

## DM Code Standards

### Do not use relative pathing
While DM allows for relative pathing, absolute pathing is far superior for debugging purpose and make it possible to actually search up where a variable or a proc was defined.

New relative pathing may not be introduced to the codebase, except in files that predominantly use relative pathing where refactoring or using absolute pathing will take too much effort. When in doubt, don't.

**_Good:_**

```
/obj/item/pistol/proc/fire()

/obj/item/pistol/proc/reload()
```

**_Bad:_**

```
/obj/item/pistol
	proc
	fire()

	proc/reload()
```

---

If, else, for, return, continue and break expressions should not be inline.

**_Good:_**

```
if(condition)
	foo()
```

```
for(var/object in objects)
	foo(object)
```

**_Bad:_**

```
if(condition) foo()
```

```
for(var/object in objects) foo(object)
```

---

### Spacing

Spaces are needed between function agruments (declaration and definition). Spaces are needed between the binary operator and arguments. Space is not needed when the operation is unary. Spaces are not needed near brackets. Spaces are needed around assignment operator.

**_Good:_**

```
/obj/item/pistol/fire(user, target)
	if(can_fire() && target)
		ammo--
		var/corpse = target
```

**_Bad:_**

```
/obj/item/pistol/fire(user,target)
	if ( can_fire()&&target )
		ammo --
		var/corpset=target
```

---

### Use Early Return / Guard Clause
Guard clauses are early returns in a proc for specific conditions. This is preferred to wrapping most of a proc’s behavior in an in-block, as procs will often check a handful of early conditions to bail out on.

This is bad:
```
/datum/datum1/proc/proc1()
    if(thing1)
        if(!thing2)
            if(thing3 == 30)
                do stuff
```
This is good:
```
/datum/datum1/proc/proc1()
    if(!thing1)
        return
    if(thing2)
        return
    if(thing3 != 30)
        return
    do stuff
```

### Avoid unnecessary return 
Don't have unnecessary return calls or return meaningless data.
If there's nothing after a return, and its not returning a specific value, you don't need a return at all.
The . var stores the return of a function and will be returned even without a specific return call.
**_Good:_**

```
/proc/do_thing()
	do_thing
	return result_of_doing_thing

/proc/do_thing()
	do_thing
	. = result_of_doing_thing

/proc/do_thing()
	do_thing
	do_other_thing
```

**_Bad:_**

```
/proc/do_thing()
	do_thing
	. = result_of_doing_thing
	return

/proc/do_thing()
	do_thing
	do_other_thing
	return
```

---
### Boolean
Boolean variables and return values should use TRUE and FALSE constans instead of 1 and 0.
**_Good:_**

```
/obj/item/pistol/
	var/broken = FALSE

/obj/item/pistol/proc/can_fire()
	return TRUE
```

**_Bad:_**

```
/obj/item/pistol/
	var/broken = 0

/obj/item/pistol/proc/can_fire()
	return 1
```

---

### Do not use colon operator
Using colon operator (:) for object property and procs access is not allowed. Dot operator is preferred.

**_Good:_**

```
var/obj = new obj()
var/count = obj.count
```

**_Bad:_**

```
var/obj = new obj()
if(hasvar(obj, "count"))
	var/count = obj:count
```

---

### Span instead of <<
Colorized text outputs should use `to_chat(target, text)` and html tags instead of `<<` and magic color symbols. Make use of our span defines when possible.

**_Good:_**

```
to_chat(player, SPAN_NOTICE("Everything is OK."))
to_chat(player, SPAN_WARNING("There's something wrong..."))
to_chat(player, SPAN_DANGER("Everything is fucked up!"))
```

**_Bad:_**

```
player << "\blue Everything is OK."
player << "\red \bold Everything is fucked up!"
```

---

del() usage is deprecated, use qdel() instead.

**_Good:_**

```
qdel(src)
```

**_Bad:_**

```
del(src)
```

---

### Naming
Avoid short, non-informative names for class variables. No acronyms or abbreviations.
These are fine to use for local variables within a proc though.

**_Good:_**

```
/obj/proximity_sensor/update_sprites()
var/count = 0
```

**_Bad:_**

```
/obj/prox_sensor/upd_sprites()
var/c = 1
```

---

### Name parameters properly 
Name your proc parameters properly to prevent name conflicts. Do not use src.variablename to circumvent this problem. 

**_Good:_**

```
/obj/set_name(newname)
	name = newname

```

**_Bad:_**

```
/obj/set_name(name)
	name = name
```

---

### Use snake case naming
Variables, types and methods should be named in snake case, where underscore _ is used to replace space between words, and all words are written in lower case. Constant values should be named in uppercase. 

**_Good:_**

```
/proc/redraw_icons()
#define SHIP_NAME "Eris"
```

**_Bad:_**

```
/proc/Reload_gun()
var/brigArea
```

---

### Procedure Arguments
Procedure arguments should not contain `var/`. Specified input type e.g. `some_turf as turf` is inadvisable.

**_Good:_**

```
/proc/rename_area(mob/user, area/A, new_name)

```

**_Bad:_**

```
/proc/rename_area(var/mob/user as mob, var/area/A as area, var/new_name as text)

```

### File Naming
- Where possible, avoid having files with the same names across folders 
- File names should be strictly lowercase to avoid issues on filesystems where case matters.
- New file names for .dm file should be in snake_case, and avoid using spaces or character that would require escpaing in a url. 

### No "Modular" Code 
Some SS13 servers adhere to "Modular Coding", which is a concept not related to the practice of modules coding - where code are organized in smaller, reusable and maintainable modules. This practice involves: 
- Creating a separate modular folder (Like modular_sojourn)
- The files are given file names that force them to load after the original files, like (zzzz_)
- Where edits to original files are needed, developers will add comments like // Equinox edit in order to make it easier to discern where code were edited. 

This practice is **Not Allowed** in Equinox and will not be expanded on and added to. Upstream changes will not be blindly pulled in or merged, and this practice slow down development and greatly increases debugging difficulty because of how it overrides existing procs and variables across two files - generally considered a bad practice. Without searching for these overrides, it is impossible to understand code behavior because it may or may not have been overridden somewhere. 

Existing modular codes should be gradually removed or decomissioned.


### TGUI / NanoUI
When you are adding a new interface, either use plain HTML (For admin interfaces that can't afford to go down, or in extremely rare case where it is justified), or uses TGUI. NanoUI is not maintained and is being phased out across SS13 due to its inability to be compiled at runtime and not following modern, reusable web development practices. 

---
