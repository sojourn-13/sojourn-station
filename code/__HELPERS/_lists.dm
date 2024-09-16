/*
 * Holds procs to help with list operations
 * Contains groups:
 * Misc
 * Sorting
 */

// Generic listoflist safe add and removal macros:
///If value is a list, wrap it in a list so it can be used with list add/remove operations
#define LIST_VALUE_WRAP_LISTS(value) (islist(value) ? list(value) : value)
///Add an untyped item to a list, taking care to handle list items by wrapping them in a list to remove the footgun
#define UNTYPED_LIST_ADD(list, item) (list += LIST_VALUE_WRAP_LISTS(item))
///Remove an untyped item to a list, taking care to handle list items by wrapping them in a list to remove the footgun
#define UNTYPED_LIST_REMOVE(list, item) (list -= LIST_VALUE_WRAP_LISTS(item))

/*
 * Misc
 */

///Initialize the lazylist
#define LAZYINITLIST(L) if (!L) { L = list(); }
///If the provided list is empty, set it to null
#define UNSETEMPTY(L) if (L && !length(L)) L = null
///If the provided key -> list is empty, remove it from the list
#define ASSOC_UNSETEMPTY(L, K) if (!length(L[K])) L -= K;
///Like LAZYCOPY - copies an input list if the list has entries, If it doesn't the assigned list is nulled
#define LAZYLISTDUPLICATE(L) (L ? L.Copy() : null )
///Remove an item from the list, set the list to null if empty
#define LAZYREMOVE(L, I) if(L) { L -= I; if(!length(L)) { L = null; } }
///Add an item to the list, if the list is null it will initialize it
#define LAZYADD(L, I) if(!L) { L = list(); } L += I;
///Add an item to the list if not already present, if the list is null it will initialize it
#define LAZYOR(L, I) if(!L) { L = list(); } L |= I;
///Returns the key of the submitted item in the list
#define LAZYFIND(L, V) (L ? L.Find(V) : 0)
///returns L[I] if L exists and I is a valid index of L, runtimes if L is not a list
#define LAZYACCESS(L, I) (L ? (isnum(I) ? (I > 0 && I <= length(L) ? L[I] : null) : L[I]) : null)
///Sets the item K to the value V, if the list is null it will initialize it
#define LAZYSET(L, K, V) if(!L) { L = list(); } L[K] = V;
///Sets the length of a lazylist
#define LAZYSETLEN(L, V) if (!L) { L = list(); } L.len = V;
///Returns the length of the list
#define LAZYLEN(L) length(L)
///Sets a list to null
#define LAZYNULL(L) L = null
///Adds to the item K the value V, if the list is null it will initialize it
#define LAZYADDASSOC(L, K, V) if(!L) { L = list(); } L[K] += V;
///This is used to add onto lazy assoc list when the value you're adding is a /list/. This one has extra safety over lazyaddassoc because the value could be null (and thus cant be used to += objects)
#define LAZYADDASSOCLIST(L, K, V) if(!L) { L = list(); } L[K] += list(V);
///Removes the value V from the item K, if the item K is empty will remove it from the list, if the list is empty will set the list to null
#define LAZYREMOVEASSOC(L, K, V) if(L) { if(L[K]) { L[K] -= V; if(!length(L[K])) L -= K; } if(!length(L)) L = null; }
///Accesses an associative list, returns null if nothing is found
#define LAZYACCESSASSOC(L, I, K) L ? L[I] ? L[I][K] ? L[I][K] : null : null : null
///Qdel every item in the list before setting the list to null
#define QDEL_LAZYLIST(L) for(var/I in L) qdel(I); L = null;
///Qdel every key and item in the list before setting the list to null
#define QDEL_LAZYLIST_ASSOC(L) for(var/I in L) { qdel(L[I]); qdel(I); }; L = null;
///Qdel every value but not key in the list before setting the list to null
#define QDEL_LAZYLIST_ASSOC_VAL(L) for(var/I in L) qdel(L[I]); L = null;
//These methods don't null the list
///Use LAZYLISTDUPLICATE instead if you want it to null with no entries
#define LAZYCOPY(L) (L ? L.Copy() : list() )
/// Consider LAZYNULL instead
#define LAZYCLEARLIST(L) if(L) L.Cut()
/// Pick a value from a lazylist, or null if the list is empty
#define LAZYPICK(L) ( L ? pick(L) : null )
///Returns the list if it's actually a valid list, otherwise will initialize it
#define SANITIZE_LIST(L) ( islist(L) ? L : list() )
#define reverseList(L) reverse_range(L.Copy())

/// Performs an insertion on the given lazy list with the given key and value. If the value already exists, a new one will not be made.
#define LAZYORASSOCLIST(lazy_list, key, value) \
	LAZYINITLIST(lazy_list); \
	LAZYINITLIST(lazy_list[key]); \
	lazy_list[key] |= value;

/// Passed into BINARY_INSERT to compare keys
#define COMPARE_KEY __BIN_LIST[__BIN_MID]
/// Passed into BINARY_INSERT to compare values
#define COMPARE_VALUE __BIN_LIST[__BIN_LIST[__BIN_MID]]

/****
	* Binary search sorted insert
	* INPUT: Object to be inserted
	* LIST: List to insert object into
	* TYPECONT: The typepath of the contents of the list
	* COMPARE: The object to compare against, usualy the same as INPUT
	* COMPARISON: The variable on the objects to compare
	* COMPTYPE: How should the values be compared? Either COMPARE_KEY or COMPARE_VALUE.
	*/
#define BINARY_INSERT(INPUT, LIST, TYPECONT, COMPARE, COMPARISON, COMPTYPE) \
	do {\
		var/list/__BIN_LIST = LIST;\
		var/__BIN_CTTL = length(__BIN_LIST);\
		if(!__BIN_CTTL) {\
			__BIN_LIST += INPUT;\
		} else {\
			var/__BIN_LEFT = 1;\
			var/__BIN_RIGHT = __BIN_CTTL;\
			var/__BIN_MID = (__BIN_LEFT + __BIN_RIGHT) >> 1;\
			var ##TYPECONT/__BIN_ITEM;\
			while(__BIN_LEFT < __BIN_RIGHT) {\
				__BIN_ITEM = COMPTYPE;\
				if(__BIN_ITEM.##COMPARISON <= COMPARE.##COMPARISON) {\
					__BIN_LEFT = __BIN_MID + 1;\
				} else {\
					__BIN_RIGHT = __BIN_MID;\
				};\
				__BIN_MID = (__BIN_LEFT + __BIN_RIGHT) >> 1;\
			};\
			__BIN_ITEM = COMPTYPE;\
			__BIN_MID = __BIN_ITEM.##COMPARISON > COMPARE.##COMPARISON ? __BIN_MID : __BIN_MID + 1;\
			__BIN_LIST.Insert(__BIN_MID, INPUT);\
		};\
	} while(FALSE)

/**
 * Custom binary search sorted insert utilising comparison procs instead of vars.
 * INPUT: Object to be inserted
 * LIST: List to insert object into
 * TYPECONT: The typepath of the contents of the list
 * COMPARE: The object to compare against, usualy the same as INPUT
 * COMPARISON: The plaintext name of a proc on INPUT that takes a single argument to accept a single element from LIST and returns a positive, negative or zero number to perform a comparison.
 * COMPTYPE: How should the values be compared? Either COMPARE_KEY or COMPARE_VALUE.
 */
#define BINARY_INSERT_PROC_COMPARE(INPUT, LIST, TYPECONT, COMPARE, COMPARISON, COMPTYPE) \
	do {\
		var/list/__BIN_LIST = LIST;\
		var/__BIN_CTTL = length(__BIN_LIST);\
		if(!__BIN_CTTL) {\
			__BIN_LIST += INPUT;\
		} else {\
			var/__BIN_LEFT = 1;\
			var/__BIN_RIGHT = __BIN_CTTL;\
			var/__BIN_MID = (__BIN_LEFT + __BIN_RIGHT) >> 1;\
			var ##TYPECONT/__BIN_ITEM;\
			while(__BIN_LEFT < __BIN_RIGHT) {\
				__BIN_ITEM = COMPTYPE;\
				if(__BIN_ITEM.##COMPARISON(COMPARE) <= 0) {\
					__BIN_LEFT = __BIN_MID + 1;\
				} else {\
					__BIN_RIGHT = __BIN_MID;\
				};\
				__BIN_MID = (__BIN_LEFT + __BIN_RIGHT) >> 1;\
			};\
			__BIN_ITEM = COMPTYPE;\
			__BIN_MID = __BIN_ITEM.##COMPARISON(COMPARE) > 0 ? __BIN_MID : __BIN_MID + 1;\
			__BIN_LIST.Insert(__BIN_MID, INPUT);\
		};\
	} while(FALSE)

#define SORT_FIRST_INDEX(list) (list[1])
#define SORT_COMPARE_DIRECTLY(thing) (thing)
#define SORT_VAR_NO_TYPE(varname) var/varname
/****
	* Even more custom binary search sorted insert, using defines instead of vars
	* INPUT: Item to be inserted
	* LIST: List to insert INPUT into
	* TYPECONT: A define setting the var to the typepath of the contents of the list
	* COMPARE: The item to compare against, usualy the same as INPUT
	* COMPARISON: A define that takes an item to compare as input, and returns their comparable value
	* COMPTYPE: How should the list be compared? Either COMPARE_KEY or COMPARE_VALUE.
	*/
#define BINARY_INSERT_DEFINE(INPUT, LIST, TYPECONT, COMPARE, COMPARISON, COMPTYPE) \
	do {\
		var/list/__BIN_LIST = LIST;\
		var/__BIN_CTTL = length(__BIN_LIST);\
		if(!__BIN_CTTL) {\
			__BIN_LIST += INPUT;\
		} else {\
			var/__BIN_LEFT = 1;\
			var/__BIN_RIGHT = __BIN_CTTL;\
			var/__BIN_MID = (__BIN_LEFT + __BIN_RIGHT) >> 1;\
			##TYPECONT(__BIN_ITEM);\
			while(__BIN_LEFT < __BIN_RIGHT) {\
				__BIN_ITEM = COMPTYPE;\
				if(##COMPARISON(__BIN_ITEM) <= ##COMPARISON(COMPARE)) {\
					__BIN_LEFT = __BIN_MID + 1;\
				} else {\
					__BIN_RIGHT = __BIN_MID;\
				};\
				__BIN_MID = (__BIN_LEFT + __BIN_RIGHT) >> 1;\
			};\
			__BIN_ITEM = COMPTYPE;\
			__BIN_MID = ##COMPARISON(__BIN_ITEM) > ##COMPARISON(COMPARE) ? __BIN_MID : __BIN_MID + 1;\
			__BIN_LIST.Insert(__BIN_MID, INPUT);\
		};\
	} while(FALSE)

///Returns a list in plain english as a string
/proc/english_list(list/input, nothing_text = "nothing", and_text = " and ", comma_text = ", ", final_comma_text = "" )
	var/total = length(input)
	switch(total)
		if (0)
			return "[nothing_text]"
		if (1)
			return "[input[1]]"
		if (2)
			return "[input[1]][and_text][input[2]]"
		else
			var/output = ""
			var/index = 1
			while (index < total)
				if (index == total - 1)
					comma_text = final_comma_text

				output += "[input[index]][comma_text]"
				index++

			return "[output][and_text][input[index]]"

/**
 * Checks for specific types in a list.
 *
 * If using zebra mode the list should be an assoc list with truthy/falsey values.
 * The check short circuits so earlier entries in the input list will take priority.
 * Ergo, subtypes should come before parent types.
 * Notice that this is the opposite priority of [/proc/typecacheof].
 *
 * Arguments:
 * - [type_to_check][/datum]: An instance to check.
 * - [list_to_check][/list]: A list of typepaths to check the type_to_check against.
 * - zebra: Whether to use the value of the mathing type in the list instead of just returning true when a match is found.
 */
/proc/is_type_in_list(datum/type_to_check, list/list_to_check, zebra = FALSE)
	if(!LAZYLEN(list_to_check) || !type_to_check)
		return FALSE
	for(var/type in list_to_check)
		if(istype(type_to_check, type))
			return !zebra || list_to_check[type] // Subtypes must come first in zebra lists.
	return FALSE

/**
 * Checks for specific paths in a list.
 *
 * If using zebra mode the list should be an assoc list with truthy/falsey values.
 * The check short circuits so earlier entries in the input list will take priority.
 * Ergo, subpaths should come before parent paths.
 * Notice that this is the opposite priority of [/proc/typecacheof].
 *
 * Arguments:
 * - path_to_check: A typepath to check.
 * - [list_to_check][/list]: A list of typepaths to check the path_to_check against.
 * - zebra: Whether to use the value of the mathing path in the list instead of just returning true when a match is found.
 */
/proc/is_path_in_list(path_to_check, list/list_to_check, zebra = FALSE)
	if(!LAZYLEN(list_to_check) || !path_to_check)
		return FALSE
	for(var/path in list_to_check)
		if(ispath(path_to_check, path))
			return !zebra || list_to_check[path]
	return FALSE

///Checks for specific types in specifically structured (Assoc "type" = TRUE|FALSE) lists ('typecaches')
#define is_type_in_typecache(A, L) (A && length(L) && L[(ispath(A) ? A : A:type)])

///returns a new list with only atoms that are in the typecache list
/proc/typecache_filter_list(list/atoms, list/typecache)
	RETURN_TYPE(/list)
	. = list()
	for(var/atom/atom_checked as anything in atoms)
		if (typecache[atom_checked.type])
			. += atom_checked

///return a new list with atoms that are not in the typecache list
/proc/typecache_filter_list_reverse(list/atoms, list/typecache)
	RETURN_TYPE(/list)
	. = list()
	for(var/atom/atom_checked as anything in atoms)
		if(!typecache[atom_checked.type])
			. += atom_checked

///similar to typecache_filter_list and typecache_filter_list_reverse but it supports an inclusion list and and exclusion list
/proc/typecache_filter_multi_list_exclusion(list/atoms, list/typecache_include, list/typecache_exclude)
	. = list()
	for(var/atom/atom_checked as anything in atoms)
		if(typecache_include[atom_checked.type] && !typecache_exclude[atom_checked.type])
			. += atom_checked

/**
 * Like typesof() or subtypesof(), but returns a typecache instead of a list.
 *
 * Arguments:
 * - path: A typepath or list of typepaths.
 * - only_root_path: Whether the typecache should be specifically of the passed types.
 * - ignore_root_path: Whether to ignore the root path when caching subtypes.
 */
/proc/typecacheof(path, only_root_path = FALSE, ignore_root_path = FALSE)
	if(isnull(path))
		return

	if(ispath(path))
		. = list()
		if(only_root_path)
			.[path] = TRUE
			return

		for(var/subtype in (ignore_root_path ? subtypesof(path) : typesof(path)))
			.[subtype] = TRUE
		return

	if(!islist(path))
		CRASH("Tried to create a typecache of [path] which is neither a typepath nor a list.")

	. = list()
	var/list/pathlist = path
	if(only_root_path)
		for(var/current_path in pathlist)
			.[current_path] = TRUE
	else if(ignore_root_path)
		for(var/current_path in pathlist)
			for(var/subtype in subtypesof(current_path))
				.[subtype] = TRUE
	else
		for(var/current_path in pathlist)
			for(var/subpath in typesof(current_path))
				.[subpath] = TRUE

/**
 * Like typesof() or subtypesof(), but returns a typecache instead of a list.
 * This time it also uses the associated values given by the input list for the values of the subtypes.
 *
 * Latter values from the input list override earlier values.
 * Thus subtypes should come _after_ parent types in the input list.
 * Notice that this is the opposite priority of [/proc/is_type_in_list] and [/proc/is_path_in_list].
 *
 * Arguments:
 * - path: A typepath or list of typepaths with associated values.
 * - single_value: The assoc value used if only a single path is passed as the first variable.
 * - only_root_path: Whether the typecache should be specifically of the passed types.
 * - ignore_root_path: Whether to ignore the root path when caching subtypes.
 * - clear_nulls: Whether to remove keys with null assoc values from the typecache after generating it.
 */
/proc/zebra_typecacheof(path, single_value = TRUE, only_root_path = FALSE, ignore_root_path = FALSE, clear_nulls = FALSE)
	if(isnull(path))
		return

	if(ispath(path))
		if (isnull(single_value))
			return

		. = list()
		if(only_root_path)
			.[path] = single_value
			return

		for(var/subtype in (ignore_root_path ? subtypesof(path) : typesof(path)))
			.[subtype] = single_value
		return

	if(!islist(path))
		CRASH("Tried to create a typecache of [path] which is neither a typepath nor a list.")

	. = list()
	var/list/pathlist = path
	if(only_root_path)
		for(var/current_path in pathlist)
			.[current_path] = pathlist[current_path]
	else if(ignore_root_path)
		for(var/current_path in pathlist)
			for(var/subtype in subtypesof(current_path))
				.[subtype] = pathlist[current_path]
	else
		for(var/current_path in pathlist)
			for(var/subpath in typesof(current_path))
				.[subpath] = pathlist[current_path]

	if(!clear_nulls)
		return

	for(var/cached_path in .)
		if (isnull(.[cached_path]))
			. -= cached_path


/**
 * Removes any null entries from the list
 * Returns TRUE if the list had nulls, FALSE otherwise
**/
/proc/list_clear_nulls(list/list_to_clear)
	var/start_len = list_to_clear.len
	var/list/new_list = new(start_len)
	list_to_clear -= new_list
	return list_to_clear.len < start_len

/*
 * Returns list containing all the entries from first list that are not present in second.
 * If skiprep = 1, repeated elements are treated as one.
 * If either of arguments is not a list, returns null
 */
/proc/difflist(list/first, list/second, skiprep=0)
	if(!islist(first) || !islist(second))
		return
	var/list/result = new
	if(skiprep)
		for(var/e in first)
			if(!(e in result) && !(e in second))
				result += e
	else
		result = first - second
	return result

/**
 * Picks a random element from a list based on a weighting system.
 * For example, given the following list:
 * A = 6, B = 3, C = 1, D = 0
 * A would have a 60% chance of being picked,
 * B would have a 30% chance of being picked,
 * C would have a 10% chance of being picked,
 * and D would have a 0% chance of being picked.
 */
/proc/pickweight(list/list_to_pick, base_weight = 1)
	var/total = 0
	var/item
	for(item in list_to_pick)
		if(!list_to_pick[item])
			list_to_pick[item] = base_weight
		total += list_to_pick[item]

	total = rand() * total
	for(item in list_to_pick)
		total -= list_to_pick[item]
		if(total <= 0 && list_to_pick[item])
			return item

	return null

/// Pick a random element from the list and remove it from the list.
/proc/pick_n_take(list/list_to_pick)
	RETURN_TYPE(list_to_pick[_].type)
	if(list_to_pick.len)
		var/picked = rand(1,list_to_pick.len)
		. = list_to_pick[picked]
		list_to_pick.Cut(picked,picked+1) //Cut is far more efficient that Remove()

///Returns the top(last) element from the list and removes it from the list (typical stack function)
/proc/pop(list/L)
	if(L.len)
		. = L[L.len]
		L.len--

/// Returns the top (last) element from the list, does not remove it from the list. Stack functionality.
/proc/peek(list/target_list)
	var/list_length = length(target_list)
	if(list_length != 0)
		return target_list[list_length]

/proc/popleft(list/L)
	if(L.len)
		. = L[1]
		L.Cut(1,2)

/proc/sorted_insert(list/L, thing, comparator)
	var/pos = L.len
	while(pos > 0 && call(comparator)(thing, L[pos]) > 0)
		pos--
	L.Insert(pos+1, thing)

/// Returns the next item in a list
/proc/next_list_item(item, list/inserted_list)
	var/i = inserted_list.Find(item)
	if(i == inserted_list.len)
		i = 1
	else
		i++
	return inserted_list[i]

/// Returns the previous item in a list
/proc/previous_list_item(item, list/inserted_list)
	var/i = inserted_list.Find(item)
	if(i == 1)
		i = inserted_list.len
	else
		i--
	return inserted_list[i]

///Randomize: Return the list in a random order
/proc/shuffle(list/inserted_list)
	if(!inserted_list)
		return
	inserted_list = inserted_list.Copy()

	for(var/i in 1 to inserted_list.len - 1)
		inserted_list.Swap(i, rand(i, inserted_list.len))

	return inserted_list

///same as shuffle, but returns nothing and acts on list in place
/proc/shuffle_inplace(list/inserted_list)
	if(!inserted_list)
		return

	for(var/i in 1 to inserted_list.len - 1)
		inserted_list.Swap(i, rand(i, inserted_list.len))

///Return a list with no duplicate entries
/proc/unique_list(list/inserted_list)
	. = list()
	for(var/i in inserted_list)
		. |= i

///same as unique_list, but returns nothing and acts on list in place (also handles associated values properly)
/proc/unique_list_in_place(list/inserted_list)
	var/temp = inserted_list.Copy()
	inserted_list.len = 0
	for(var/key in temp)
		if (isnum(key))
			inserted_list |= key
		else
			inserted_list[key] = temp[key]

///for sorting clients or mobs by ckey
/proc/sort_key(list/ckey_list, order=1)
	return sortTim(ckey_list, order >= 0 ? GLOBAL_PROC_REF(cmp_ckey_asc) : GLOBAL_PROC_REF(cmp_ckey_dsc))

///Specifically for record datums in a list.
/proc/sort_record(list/record_list, field = "name", order = 1)
	GLOB.cmp_field = field
	return sortTim(record_list, order >= 0 ? GLOBAL_PROC_REF(cmp_records_asc) : GLOBAL_PROC_REF(cmp_records_dsc))

///sort any value in a list
/proc/sort_list(list/list_to_sort, cmp=GLOBAL_PROC_REF(cmp_text_asc))
	return sortTim(list_to_sort.Copy(), cmp)

///uses sort_list() but uses the var's name specifically. This should probably be using mergeAtom() instead
/proc/sort_names(list/list_to_sort, order=1)
	return sortTim(list_to_sort.Copy(), order >= 0 ? GLOBAL_PROC_REF(cmp_name_asc) : GLOBAL_PROC_REF(cmp_name_dsc))

///Converts a bitfield to a list of numbers (or words if a wordlist is provided)
/proc/bitfield_to_list(bitfield = 0, list/wordlist)
	var/list/return_list = list()
	if(islist(wordlist))
		var/max = min(wordlist.len, 24)
		var/bit = 1
		for(var/i in 1 to max)
			if(bitfield & bit)
				return_list += wordlist[i]
			bit = bit << 1
	else
		for(var/bit_number = 0 to 23)
			var/bit = 1 << bit_number
			if(bitfield & bit)
				return_list += bit

	return return_list

/// Returns the key based on the index
#define KEYBYINDEX(L, index) (((index <= length(L)) && (index > 0)) ? L[index] : null)

///return the amount of items of the same type inside a list
/proc/count_by_type(list/inserted_list, type)
	var/i = 0
	for(var/item_type in inserted_list)
		if(istype(item_type, type))
			i++
	return i

/// Returns datum/data/record
/proc/find_record(field, value, list/inserted_list)
	for(var/datum/data/record/record_to_check in inserted_list)
		if(record_to_check.fields[field] == value)
			return record_to_check
	return null


/**
 * Move a single element from position from_index within a list, to position to_index
 * All elements in the range [1,to_index) before the move will be before the pivot afterwards
 * All elements in the range [to_index, L.len+1) before the move will be after the pivot afterwards
 * In other words, it's as if the range [from_index,to_index) have been rotated using a <<< operation common to other languages.
 * from_index and to_index must be in the range [1,L.len+1]
 * This will preserve associations ~Carnie
**/
/proc/move_element(list/inserted_list, from_index, to_index)
	if(from_index == to_index || from_index + 1 == to_index) //no need to move
		return
	if(from_index > to_index)
		++from_index //since a null will be inserted before from_index, the index needs to be nudged right by one

	inserted_list.Insert(to_index, null)
	inserted_list.Swap(from_index, to_index)
	inserted_list.Cut(from_index, from_index + 1)


/**
 * Move elements [from_index,from_index+len) to [to_index-len, to_index)
 * Same as moveElement but for ranges of elements
 * This will preserve associations ~Carnie
**/
/proc/move_range(list/inserted_list, from_index, to_index, len = 1)
	var/distance = abs(to_index - from_index)
	if(len >= distance) //there are more elements to be moved than the distance to be moved. Therefore the same result can be achieved (with fewer operations) by moving elements between where we are and where we are going. The result being, our range we are moving is shifted left or right by dist elements
		if(from_index <= to_index)
			return //no need to move
		from_index += len //we want to shift left instead of right

		for(var/i in 1 to distance)
			inserted_list.Insert(from_index, null)
			inserted_list.Swap(from_index, to_index)
			inserted_list.Cut(to_index, to_index + 1)
	else
		if(from_index > to_index)
			from_index += len

		for(var/i in 1 to len)
			inserted_list.Insert(to_index, null)
			inserted_list.Swap(from_index, to_index)
			inserted_list.Cut(from_index, from_index + 1)

///Move elements from [from_index, from_index+len) to [to_index, to_index+len)
///Move any elements being overwritten by the move to the now-empty elements, preserving order
///Note: if the two ranges overlap, only the destination order will be preserved fully, since some elements will be within both ranges ~Carnie
/proc/swap_range(list/inserted_list, from_index, to_index, len=1)
	var/distance = abs(to_index - from_index)
	if(len > distance) //there is an overlap, therefore swapping each element will require more swaps than inserting new elements
		if(from_index < to_index)
			to_index += len
		else
			from_index += len

		for(var/i in 1 to distance)
			inserted_list.Insert(from_index, null)
			inserted_list.Swap(from_index, to_index)
			inserted_list.Cut(to_index, to_index + 1)
	else
		if(to_index > from_index)
			var/a = to_index
			to_index = from_index
			from_index = a

		for(var/i in 1 to len)
			inserted_list.Swap(from_index++, to_index++)

///replaces reverseList ~Carnie
/proc/reverse_range(list/inserted_list, start = 1, end = 0)
	if(inserted_list.len)
		start = start % inserted_list.len
		end = end % (inserted_list.len + 1)
		if(start <= 0)
			start += inserted_list.len
		if(end <= 0)
			end += inserted_list.len + 1

		--end
		while(start < end)
			inserted_list.Swap(start++, end--)

	return inserted_list


///return first thing in L which has var/varname == value
///this is typecaste as list/L, but you could actually feed it an atom instead.
///completely safe to use
/proc/get_element_by_var(list/inserted_list, varname, value)
	varname = "[varname]"
	for(var/datum/checked_datum in inserted_list)
		if(!checked_datum.vars.Find(varname))
			continue
		if(checked_datum.vars[varname] == value)
			return checked_datum

///remove all nulls from a list
/proc/remove_nulls_from_list(list/inserted_list)
	while(inserted_list.Remove(null))
		continue
	return inserted_list

///Copies a list, and all lists inside it recusively
///Does not copy any other reference type
/proc/deep_copy_list(list/inserted_list)
	if(!islist(inserted_list))
		return inserted_list
	. = inserted_list.Copy()
	for(var/i in 1 to inserted_list.len)
		var/key = .[i]
		if(isnum(key))
			// numbers cannot ever be associative keys
			continue
		var/value = .[key]
		if(islist(value))
			value = deep_copy_list(value)
			.[key] = value
		if(islist(key))
			key = deep_copy_list(key)
			.[i] = key
			.[key] = value

/// A version of deep_copy_list that actually supports associative list nesting: list(list(list("a" = "b"))) will actually copy correctly.
/proc/deep_copy_list_alt(list/inserted_list)
	if(!islist(inserted_list))
		return inserted_list
	var/copied_list = inserted_list.Copy()
	. = copied_list
	for(var/key_or_value in inserted_list)
		if(isnum_safe(key_or_value) || !inserted_list[key_or_value])
			continue
		var/value = inserted_list[key_or_value]
		var/new_value = value
		if(islist(value))
			new_value = deep_copy_list_alt(value)
		copied_list[key_or_value] = new_value

///takes an input_key, as text, and the list of keys already used, outputting a replacement key in the format of "[input_key] ([number_of_duplicates])" if it finds a duplicate
///use this for lists of things that might have the same name, like mobs or objects, that you plan on giving to a player as input
/proc/avoid_assoc_duplicate_keys(input_key, list/used_key_list)
	if(!input_key || !istype(used_key_list))
		return
	if(used_key_list[input_key])
		used_key_list[input_key]++
		input_key = "[input_key] ([used_key_list[input_key]])"
	else
		used_key_list[input_key] = 1
	return input_key

///Make a normal list an associative one
/proc/make_associative(list/flat_list)
	. = list()
	for(var/thing in flat_list)
		.[thing] = TRUE

///Picks from the list, with some safeties, and returns the "default" arg if it fails
#define DEFAULTPICK(L, default) ((islist(L) && length(L)) ? pick(L) : default)

/* Definining a counter as a series of key -> numeric value entries

 * All these procs modify in place.
*/

/proc/counterlist_scale(list/L, scalar)
	var/list/out = list()
	for(var/key in L)
		out[key] = L[key] * scalar
	. = out

/proc/counterlist_sum(list/L)
	. = 0
	for(var/key in L)
		. += L[key]

/proc/counterlist_normalise(list/L)
	var/avg = counterlist_sum(L)
	if(avg != 0)
		. = counterlist_scale(L, 1 / avg)
	else
		. = L

/proc/counterlist_combine(list/L1, list/L2)
	for(var/key in L2)
		var/other_value = L2[key]
		if(key in L1)
			L1[key] += other_value
		else
			L1[key] = other_value

/// Turns an associative list into a flat list of keys
/proc/assoc_to_keys(list/input)
	var/list/keys = list()
	for(var/key in input)
		keys += key
	return keys

///compare two lists, returns TRUE if they are the same
/proc/compare_list(list/l,list/d)
	if(!islist(l) || !islist(d))
		return FALSE

	if(l.len != d.len)
		return FALSE

	for(var/i in 1 to l.len)
		if(l[i] != d[i])
			return FALSE

	return TRUE

#define LAZY_LISTS_OR(left_list, right_list)\
	( length(left_list)\
		? length(right_list)\
			? (left_list | right_list)\
			: left_list.Copy()\
		: length(right_list)\
			? right_list.Copy()\
			: null\
	)

///Returns a list with items filtered from a list that can call callback
/proc/special_list_filter(list/list_to_filter, datum/callback/condition)
	if(!islist(list_to_filter) || !length(list_to_filter) || !istype(condition))
		return list()
	. = list()
	for(var/i in list_to_filter)
		if(condition.Invoke(i))
			. |= i

///Returns a list with all weakrefs resolved
/proc/recursive_list_resolve(list/list_to_resolve)
	. = list()
	for(var/element in list_to_resolve)
		if(istext(element))
			. += element
			var/possible_assoc_value = list_to_resolve[element]
			if(possible_assoc_value)
				.[element] = recursive_list_resolve_element(possible_assoc_value)
		else
			. += list(recursive_list_resolve_element(element))

///Helper for /proc/recursive_list_resolve
/proc/recursive_list_resolve_element(element)
	if(islist(element))
		var/list/inner_list = element
		return recursive_list_resolve(inner_list)
	else if(isweakref(element))
		var/datum/weakref/ref = element
		return ref.resolve()
	else
		return element

#define REFIFY_KVPIFY_MAX_LENGTH 1000

/// Returns a copy of the list where any element that is a datum or the world is converted into a ref
/proc/refify_list(list/target_list)
	if(length(target_list) > REFIFY_KVPIFY_MAX_LENGTH)
		return "list\[[length(target_list)]\]"
	var/list/ret = list()
	for(var/i in 1 to target_list.len)
		var/key = target_list[i]
		var/new_key = key
		if(isdatum(key))
			new_key = "[key] [REF(key)]"
		else if(key == world)
			new_key = "world \ref[world]"
		else if(islist(key))
			new_key = refify_list(key)
		var/value
		if(istext(key) || islist(key) || ispath(key) || isdatum(key) || key == world)
			value = target_list[key]
		if(isdatum(value))
			value = "[value] [REF(value)]"
		else if(value == world)
			value = "world \ref[world]"
		else if(islist(value))
			value = refify_list(value)
		var/list/to_add = list(new_key)
		if(value)
			to_add[new_key] = value
		ret += to_add
	return ret

/**
 * Converts a list into a list of assoc lists of the form ("key" = key, "value" = value)
 * so that list keys that are themselves lists can be fully json-encoded
 */
/proc/kvpify_list(list/target_list, depth = INFINITY)
	if(length(target_list) > REFIFY_KVPIFY_MAX_LENGTH)
		return "list\[[length(target_list)]\]"
	var/list/ret = list()
	for(var/i in 1 to target_list.len)
		var/key = target_list[i]
		var/new_key = key
		if(islist(key) && depth)
			new_key = kvpify_list(key, depth-1)
		var/value
		if(istext(key) || islist(key) || ispath(key) || isdatum(key) || key == world)
			value = target_list[key]
		if(islist(value) && depth)
			value = kvpify_list(value, depth-1)
		if(value)
			ret += list(list("key" = new_key, "value" = value))
		else
			ret += list(list("key" = i, "value" = new_key))
	return ret

#undef REFIFY_KVPIFY_MAX_LENGTH

/// Compares 2 lists, returns TRUE if they are the same
/proc/deep_compare_list(list/list_1, list/list_2)
	if(!islist(list_1) || !islist(list_2))
		return FALSE

	if(list_1 == list_2)
		return TRUE

	if(list_1.len != list_2.len)
		return FALSE

	for(var/i in 1 to list_1.len)
		var/key_1 = list_1[i]
		var/key_2 = list_2[i]
		if (islist(key_1) && islist(key_2))
			if(!deep_compare_list(key_1, key_2))
				return FALSE
		else if(key_1 != key_2)
			return FALSE
		if(istext(key_1) || islist(key_1) || ispath(key_1) || isdatum(key_1) || key_1 == world)
			var/value_1 = list_1[key_1]
			var/value_2 = list_2[key_1]
			if (islist(value_1) && islist(value_2))
				if(!deep_compare_list(value_1, value_2))
					return FALSE
			else if(value_1 != value_2)
				return FALSE

	return TRUE

/*
 * Holds procs to help with list operations
 * Contains groups:
 *			Misc
 *			Sorting
 */

/*
 * Misc
 */

#define listequal(A, B) (A.len == B.len && !length(A^B))

#define LAZYISIN(L, I) (L ? (I in L) : FALSE)


//Adds value to the existing value of a key
#define LAZYAPLUS(L,K,V) if(!L) { L = list(); } if (!L[K]) { L[K] = 0; } L[K] += V;

//Subtracts value from the existing value of a key
#define LAZYAMINUS(L,K,V) if(L && L[K]) { L[K] -= V; if(!LAZYLEN(L[K])) { L -= K } }

//Returns list element or null. Should prevent "index out of bounds" error.
/proc/listgetindex(list/L, index)
	if(LAZYLEN(L))
		if(isnum(index) && ISINTEGER(index))
			if(ISINRANGE(index,1,L.len))
				return L[index]
		else if(index in L)
			return L[index]
	return

//Return either pick(list) or null if list is not of type /list or is empty
/proc/safepick(list/L)
	if(LAZYLEN(L))
		return pick(L)

//Checks if the list is empty
/proc/isemptylist(list/L)
	if(!L.len)
		return TRUE
	return FALSE

/proc/instances_of_type_in_list(var/A, var/list/L)
	var/instances = 0
	for(var/type in L)
		if(istype(A, type))
			instances++
	return instances

//Checks for a string in a list
/proc/is_string_in_list(string, list/L)
	if(!LAZYLEN(L) || !string)
		return
	for(var/V in L)
		if(string == V)
			return TRUE
	return

//Removes a string from a list
/proc/remove_strings_from_list(string, list/L)
	if(!LAZYLEN(L) || !string)
		return
	for(var/V in L)
		if(V == string)
			L -= V //No return here so that it removes all strings of that type
	return

//Empties the list by setting the length to 0. Hopefully the elements get garbage collected
/// this proc sucks. just run a for loop on the damn list and qdel each element first, before cutting the list. OR JUST RUN CUT() ~niko
/proc/clearlist(list/list)
	if(istype(list))
		list.len = 0

//Removes any null entries from the list
//Returns TRUE if the list had nulls, FALSE otherwise
/proc/listclearnulls(list/L)
	var/start_len = L.len
	var/list/N = new(start_len)
	L -= N
	return L.len < start_len

/*
 * Returns list containing entries that are in either list but not both.
 * If skipref = 1, repeated elements are treated as one.
 * If either of arguments is not a list, returns null
 */
/proc/uniquemergelist(list/first, list/second, skiprep = FALSE)
	if(!islist(first) || !islist(second))
		return
	var/list/result = new
	if(skiprep)
		result = difflist(first, second, skiprep)+difflist(second, first, skiprep)
	else
		result = first ^ second
	return result

//Picks a number of elements from a list based on weight.
//This is highly optimised and good for things like grabbing 200 items from a list of 40,000
//Much more efficient than many pickweight calls
/proc/pickweight_mult(list/L, quantity, base_weight = 1)
	//First we total the list as normal
	var/total = 0
	var/item
	for (item in L)
		if (!L[item])
			L[item] = base_weight
		total += L[item]

	//Next we will make a list of randomly generated numbers, called Requests
	//It is critical that this list be sorted in ascending order, so we will build it in that order
	//First one is free, so we start counting at 2
	var/list/requests = list(rand(1, total))
	for (var/i in 2 to quantity)
		//Each time we generate the next request
		var/newreq = rand()* total
		//We will loop through all existing requests
		for (var/j in 1 to requests.len)
			//We keep going through the list until we find an element which is bigger than the one we want to add
			if (requests[j] > newreq)
				//And then we insert the newqreq at that point, pushing everything else forward
				requests.Insert(j, newreq)
				break



	//Now when we get here, we have a list of random numbers sorted in ascending order.
	//The length of that list is equal to Quantity passed into this function
	//Next we make a list to store results
	var/list/results = list()

	//Zero the total, we'll reuse it
	total = 0

	//Now we will iterate forward through the items list, adding each weight to the total
	for (item in L)
		total += L[item]

		//After each item we do a while loop
		while (requests.len && total >= requests[1])
			//If the total is higher than the value of the first request
			results += item //We add this item to the results list
			requests.Cut(1,2) //And we cut off the top of the requests list

			//This while loop will repeat until the next request is higher than the total.
			//The current item might be added to the results list many times, in this process

	//By the time we get here:
		//Requests will be empty
		//Results will have a length of quality
	return results

//Pick a random element from the list by weight and remove it from the list.
//Result is returned as a list in the format list(key, value)
/proc/pickweight_n_take(list/L)
	if (L.len)
		. = pickweight(L)
		L.Remove(.)

/*
 * Sorting
 */

/proc/reverseRange(list/L, start=1, end=0)
	if(L.len)
		start = start % L.len
		end = end % (L.len+1)
		if(start <= 0)
			start += L.len
		if(end <= 0)
			end += L.len + 1

		--end
		while(start < end)
			L.Swap(start++,end--)

	return L

//Return a list with no duplicate entries
/proc/uniquelist(list/L)
	. = list()
	for(var/i in L)
		. |= i

//same, but returns nothing and acts on list in place (also handles associated values properly)
/proc/uniquelist_inplace(list/L)
	var/temp = L.Copy()
	L.len = 0
	for(var/key in temp)
		if (isnum(key))
			L |= key
		else
			L[key] = temp[key]

// Return a list of the values in an assoc list (including null)
/proc/list_values(list/L)
	. = list()
	for(var/e in L)
		. += L[e]

/proc/filter_list(list/L, type)
	. = list()
	for(var/entry in L)
		if(istype(entry, type))
			. += entry

//for sorting clients or mobs by ckey
/proc/sortKey(list/L, order=1)
	return sortTim(L, order >= 0 ? GLOBAL_PROC_REF(cmp_ckey_asc) : GLOBAL_PROC_REF(cmp_ckey_dsc))

//Specifically for record datums in a list.
/proc/sortRecord(list/L, field = "name", order = 1)
	GLOB.cmp_field = field
	return sortTim(L, order >= 0 ? GLOBAL_PROC_REF(cmp_records_asc) : GLOBAL_PROC_REF(cmp_records_dsc))
//SoJ edit
//Specifically for mutation datums in a list.
/proc/sortMutation(list/L, order = TRUE)
	return sortTim(L, (order ? GLOBAL_PROC_REF(cmp_mutations_asc) : GLOBAL_PROC_REF(cmp_mutations_dsc)))
//Soj edit end
//any value in a list
/proc/sortList(list/L, cmp=GLOBAL_PROC_REF(cmp_text_asc))
	return sortTim(L.Copy(), cmp)

//uses sortList() but uses the var's name specifically. This should probably be using mergeAtom() instead
/proc/sortNames(list/L, order=1)
	return sortTim(L, order >= 0 ? GLOBAL_PROC_REF(cmp_name_asc) : GLOBAL_PROC_REF(cmp_name_dsc))

//for sorting entries by their associated values, rather than keys.
/proc/sortAssoc(list/L, order=1)
	return sortTim(L, order >= 0 ? GLOBAL_PROC_REF(cmp_text_asc) : GLOBAL_PROC_REF(cmp_text_dsc), TRUE) //third argument for fetching L[L[i]] instead of L[i]

//returns an unsorted list of nearest map objects from a given list to sourceLocation using get_dist, acceptableDistance sets tolerance for distance
//result is intended to be used with pick()
/proc/nearestObjectsInList(list/L, sourceLocation, acceptableDistance = 0)
	if (L.len == 1)
		return L.Copy()

	var/list/nearestObjects = new
	var/shortestDistance = INFINITY
	for (var/object in L)
		var/distance = get_dist(sourceLocation,object)

		if (distance <= acceptableDistance)
			if (shortestDistance > acceptableDistance)
				shortestDistance = acceptableDistance
				nearestObjects.Cut()
			nearestObjects += object

		else if (shortestDistance > acceptableDistance)
			if (distance < shortestDistance)
				shortestDistance = distance
				nearestObjects.Cut()
				nearestObjects += object

			else if (distance == shortestDistance)
				nearestObjects += object

	return nearestObjects

/**
 *	Returns a list of the closest objects, relative to sourceLocation, and only the closest objects.
 *	Ex. if objects 1 and 2 are 3 tiles away, and object 4 is 5, only objects 1 and 2 will be returned.
 *
 *	Args:
 *	L: A given list.
 *	sourceLocation: What our search will be relative towards.
 *	maxRange: Anything further away than this distance, in tiles, will be disregarded.
 *	minRange: Anything closer than this distance, in tiles, will be disregarded.
**/
/proc/getClosestObjects(list/L, sourceLocation, maxRange = INFINITY, minRange = 0)
	if (L.len == 1)
		return L

	var/list/nearestObjects = list()
	var/shortestDistance = INFINITY
	for (var/object in L)
		var/distance = get_dist(sourceLocation, object)

		if (distance > shortestDistance)
			continue

		if ((distance > maxRange) || (distance < minRange))
			continue

		if (distance < shortestDistance)
			shortestDistance = distance
			nearestObjects.Cut()
			nearestObjects += object

		else if (distance == shortestDistance)
			nearestObjects += object

	return nearestObjects

/// [/proc/getClosestObjects], but for the furthest objects.
/proc/getFurthestObjects(list/L, sourceLocation, maxRange = INFINITY, minRange = 0)
	if (L.len == 1)
		return L

	var/list/furthestObjects = list()
	var/furthestDistance = 0
	for (var/object in L)
		var/distance = get_dist(sourceLocation, object)

		if (distance < furthestDistance)
			continue

		if ((distance > maxRange) || (distance < minRange))
			continue

		if (distance > furthestDistance)
			furthestDistance = distance
			furthestObjects.Cut()
			furthestObjects += object

		else if (distance == furthestDistance)
			furthestObjects += object

	return furthestObjects

// Macros to test for bits in a bitfield. Note, that this is for use with indexes, not bit-masks!
#define BITTEST(bitfield, index)  ((bitfield)  &   (1 << (index)))
#define BITSET(bitfield, index)   (bitfield)  |=  (1 << (index))
#define BITRESET(bitfield, index) (bitfield)  &= ~(1 << (index))
#define BITFLIP(bitfield, index)  (bitfield)  ^=  (1 << (index))

//Converts a bitfield to a list of numbers (or words if a wordlist is provided)
/proc/bitfield2list(bitfield = 0, list/wordlist)
	var/list/r = list()
	if(islist(wordlist))
		var/max = min(wordlist.len,16)
		var/bit = 1
		for(var/i in 1 to max)
			if(bitfield & bit)
				r += wordlist[i]
			bit = bit << 1
	else
		for(var/bit=1, bit<=65535, bit = bit << 1)
			if(bitfield & bit)
				r += bit

	return r

// Returns the key based on the index
/proc/get_key_by_index(list/L, index)
	var/i = 1
	for(var/key in L)
		if(index == i)
			return key
		i++

// Returns the key based on the index
/proc/get_key_by_value(list/L, value)
	var/I = LAZYFIND(L, value)
	if(I)
		return L[I]

/proc/dd_sortedObjectList(list/L, cache=list())
	if(L.len < 2)
		return L
	var/middle = L.len / 2 + 1 // Copy is first, second-1
	return dd_mergeObjectList(dd_sortedObjectList(L.Copy(0, middle), cache), dd_sortedObjectList(L.Copy(middle), cache), cache) //second parameter null = to end of list

/proc/dd_mergeObjectList(list/L, list/R, list/cache)
	var/Li=1
	var/Ri=1
	var/list/result = new()
	while(Li <= L.len && Ri <= R.len)
		var/LLi = L[Li]
		var/RRi = R[Ri]
		var/LLiV = cache[LLi]
		var/RRiV = cache[RRi]
		if(!LLiV)
			LLiV = LLi:dd_SortValue()
			cache[LLi] = LLiV
		if(!RRiV)
			RRiV = RRi:dd_SortValue()
			cache[RRi] = RRiV
		if(LLiV < RRiV)
			result += L[Li++]
		else
			result += R[Ri++]

	if(Li <= L.len)
		return (result + L.Copy(Li, 0))
	return (result + R.Copy(Ri, 0))

// Insert an object into a sorted list, preserving sortedness
/proc/dd_insertObjectList(list/L, O)
	var/min = 1
	var/max = L.len
	var/Oval = O:dd_SortValue()

	while(1)
		var/mid = min+round((max-min)/2)

		if(mid == max)
			L.Insert(mid, O)
			return

		var/Lmid = L[mid]
		var/midval = Lmid:dd_SortValue()
		if(Oval == midval)
			L.Insert(mid, O)
			return
		else if(Oval < midval)
			max = mid
		else
			min = mid+1

/proc/dd_sortedtextlist(list/incoming, case_sensitive = 0)
	// Returns a new list with the text values sorted.
	// Use binary search to order by sortValue.
	// This works by going to the half-point of the list, seeing if the node in question is higher or lower cost,
	// then going halfway up or down the list and checking again.
	// This is a very fast way to sort an item into a list.
	var/list/sorted_text = new()
	var/low_index
	var/high_index
	var/insert_index
	var/midway_calc
	var/current_index
	var/current_item
	var/list/list_bottom
	var/sort_result

	var/current_sort_text
	for (current_sort_text in incoming)
		low_index = 1
		high_index = sorted_text.len
		while (low_index <= high_index)
			// Figure out the midpoint, rounding up for fractions.  (BYOND rounds down, so add 1 if necessary.)
			midway_calc = (low_index + high_index) / 2
			current_index = round(midway_calc)
			if (midway_calc > current_index)
				current_index++
			current_item = sorted_text[current_index]

			if (case_sensitive)
				sort_result = sorttextEx(current_sort_text, current_item)
			else
				sort_result = sorttext(current_sort_text, current_item)

			switch(sort_result)
				if (1)
					high_index = current_index - 1	// current_sort_text < current_item
				if (-1)
					low_index = current_index + 1	// current_sort_text > current_item
				if (0)
					low_index = current_index		// current_sort_text == current_item
					break

		// Insert before low_index.
		insert_index = low_index

		// Special case adding to end of list.
		if (insert_index > sorted_text.len)
			sorted_text += current_sort_text
			continue

		// Because BYOND lists don't support insert, have to do it by:
		// 1) taking out bottom of list, 2) adding item, 3) putting back bottom of list.
		list_bottom = sorted_text.Copy(insert_index)
		sorted_text.Cut(insert_index)
		sorted_text += current_sort_text
		sorted_text += list_bottom
	return sorted_text


/proc/dd_sortedTextList(list/incoming)
	var/case_sensitive = 1
	return dd_sortedtextlist(incoming, case_sensitive)


/datum/proc/dd_SortValue()
	return "[src]"

/obj/machinery/dd_SortValue()
	return "[sanitize_old(name)]"

/obj/machinery/camera/dd_SortValue()
	return "[c_tag]"

/datum/alarm/dd_SortValue()
	return "[sanitize_old(last_name)]"

//creates every subtype of prototype (excluding prototype) and adds it to list L.
//if no list/L is provided, one is created.
/proc/init_subtypes(prototype, list/L)
	LAZYINITLIST(L)
	for(var/path in subtypesof(prototype))
		L += new path()
	return L

//Move a single element from position fromIndex within a list, to position toIndex
//All elements in the range [1,toIndex) before the move will be before the pivot afterwards
//All elements in the range [toIndex, L.len+1) before the move will be after the pivot afterwards
//In other words, it's as if the range [fromIndex,toIndex) have been rotated using a <<< operation common to other languages.
//fromIndex and toIndex must be in the range [1,L.len+1]
//This will preserve associations ~Carnie
/proc/moveElement(list/L, fromIndex, toIndex)
	if(fromIndex == toIndex || fromIndex+1 == toIndex)	//no need to move
		return
	if(fromIndex > toIndex)
		++fromIndex	//since a null will be inserted before fromIndex, the index needs to be nudged right by one

	L.Insert(toIndex, null)
	L.Swap(fromIndex, toIndex)
	L.Cut(fromIndex, fromIndex+1)


//Move elements [fromIndex,fromIndex+len) to [toIndex-len, toIndex)
//Same as moveElement but for ranges of elements
//This will preserve associations ~Carnie
/proc/moveRange(list/L, fromIndex, toIndex, len=1)
	var/distance = abs(toIndex - fromIndex)
	if(len >= distance)	//there are more elements to be moved than the distance to be moved. Therefore the same result can be achieved (with fewer operations) by moving elements between where we are and where we are going. The result being, our range we are moving is shifted left or right by dist elements
		if(fromIndex <= toIndex)
			return	//no need to move
		fromIndex += len	//we want to shift left instead of right

		for(var/i in 1 to distance)
			L.Insert(fromIndex, null)
			L.Swap(fromIndex, toIndex)
			L.Cut(toIndex, toIndex+1)
	else
		if(fromIndex > toIndex)
			fromIndex += len

		for(var/i in 1 to len)
			L.Insert(toIndex, null)
			L.Swap(fromIndex, toIndex)
			L.Cut(fromIndex, fromIndex+1)

//Move elements from [fromIndex, fromIndex+len) to [toIndex, toIndex+len)
//Move any elements being overwritten by the move to the now-empty elements, preserving order
//Note: if the two ranges overlap, only the destination order will be preserved fully, since some elements will be within both ranges ~Carnie
/proc/swapRange(list/L, fromIndex, toIndex, len=1)
	var/distance = abs(toIndex - fromIndex)
	if(len > distance)	//there is an overlap, therefore swapping each element will require more swaps than inserting new elements
		if(fromIndex < toIndex)
			toIndex += len
		else
			fromIndex += len

		for(var/i=0, i<distance, ++i)
			L.Insert(fromIndex, null)
			L.Swap(fromIndex, toIndex)
			L.Cut(toIndex, toIndex+1)
	else
		if(toIndex > fromIndex)
			var/a = toIndex
			toIndex = fromIndex
			fromIndex = a

		for(var/i=0, i<len, ++i)
			L.Swap(fromIndex++, toIndex++)

/*
Checks if a list has the same entries and values as an element of big.
*/
/proc/in_as_list(list/little, list/big)
	if(!LAZYLEN(big))
		return FALSE
	for(var/element in big)
		if(compare_list(little, big[element]))
			return TRUE
	return FALSE

// Return the index using dichotomic search
/proc/FindElementIndex(atom/A, list/L, cmp)
	var/i = 1
	var/j = L.len
	var/mid

	while(i < j)
		mid = round((i+j)/2)

		if(call(cmp)(L[mid],A) < 0)
			i = mid + 1
		else
			j = mid

	if(i == 1 || i ==  L.len) // Edge cases
		return (call(cmp)(L[i],A) > 0) ? i : i+1
	else
		return i

//Checks if list is associative (example '["temperature"] = 90')
/proc/is_associative(list/L)
	for(var/key in L)
		// if the key is a list that means it's actually an array of lists (stupid Byond...)
		if(isnum(key) || istype(key, /list))
			return FALSE

		if(!isnull(L[key]))
			return TRUE

	return FALSE

/proc/group_by(list/group_list, key, value)
	var/values = group_list[key]
	if(!values)
		values = list()
		group_list[key] = values

	values += value

/proc/duplicates(list/L)
	. = list()
	var/list/checked = list()
	for(var/value in L)
		if(value in checked)
			. |= value
		else
			checked += value

/proc/parse_for_paths(list/data)
	if(!islist(data) || !data.len)
		return list()
	var/list/types = list()
	if(is_associative(data))
		for(var/tag in data)
			if(ispath(tag))
				types.Add(tag)
			else if(islist(tag))
				types.Add(parse_for_paths(tag))

			if(ispath(data[tag]))
				types.Add(data[tag])
			else if(islist(data[tag]))
				types.Add(parse_for_paths(data[tag]))
	else
		for(var/value in data)
			if(ispath(value))
				types.Add(value)
			else if(islist(value))
				types.Add(parse_for_paths(value))
	return uniquelist(types)

//return first thing in L which has var/varname == value
//this is typecaste as list/L, but you could actually feed it an atom instead.
//completely safe to use
/proc/getElementByVar(list/L, varname, value)
	varname = "[varname]"
	for(var/datum/D in L)
		if(D.vars.Find(varname))
			if(D.vars[varname] == value)
				return D
//remove all nulls from a list
/proc/removeNullsFromList(list/L)
	while(L.Remove(null))
		continue
	return L

//Copies a list, and all lists inside it recusively
//Does not copy any other reference type
/proc/deepCopyList(list/l)
	if(!islist(l))
		return l
	. = l.Copy()
	for(var/i = 1 to l.len)
		var/key = .[i]
		if(isnum(key))
			// numbers cannot ever be associative keys
			continue
		var/value = .[key]
		if(islist(value))
			value = deepCopyList(value)
			.[key] = value
		if(islist(key))
			key = deepCopyList(key)
			.[i] = key
			.[key] = value

/proc/assoc_list_strip_value(list/input)
	var/list/ret = list()
	for(var/key in input)
		ret += key
	return ret

/proc/try_json_decode(t)
	. = list()
	if(istext(t))
		. = json_decode(t)
	else if(islist(t))
		. = t
	else if(t)
		. += t

/proc/recursiveLen(list/L)
	. = 0
	if(istext(L))
		L = try_json_decode(L)
	if(length(L))
		. += length(L)
		for(var/list/i in L)
			if(islist(i))
				. += recursiveLen(i)
			else if(islist(L[i]))
				. += recursiveLen(L[i])

/proc/RecursiveCut(list/L)
	for(var/list/l in L)
		if(islist(l))
			RecursiveCut(l)
		else
			var/list/b = L[l]
			if(islist(b))
				RecursiveCut(b)
	L.Cut()

/proc/matrix2d_x_sanitize(mathrix, x)
	if(!islist(mathrix))
		return
	else if(!islist(mathrix[x]))
		return
	return mathrix

/proc/get_2d_matrix_cell(mathrix, x, y)
	if(!matrix2d_x_sanitize(mathrix, x))
		return
	return mathrix[x][y]

/proc/set_2d_matrix_cell(mathrix, x, y, value)
	if(!matrix2d_x_sanitize(mathrix, x))
		return
	mathrix[x][y] = value
