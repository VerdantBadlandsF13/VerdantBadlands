// Base chasm, defaults to oblivion but can be overridden
/obj/structure/badlands_props/open_manhole
	name = "open manhole"
	desc = "You can see no ladder. Is this safe?"
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/structures.dmi'
	icon_state = "manhole_open_fall"
	density = TRUE //This will prevent hostile mobs from pathing into chasms, while the canpass override will still let it function like an open turf

/obj/structure/badlands_props/open_manhole/Initialize()
	. = ..()
	AddComponent(/datum/component/chasm, SSmapping.get_turf_below(src))

/obj/structure/badlands_props/open_manhole/proc/set_target(turf/target)
	var/datum/component/chasm/chasm_component = GetComponent(/datum/component/chasm)
	chasm_component.target_turf = target

/obj/structure/badlands_props/open_manhole/proc/drop(atom/movable/AM)
	var/datum/component/chasm/chasm_component = GetComponent(/datum/component/chasm)
	chasm_component.drop(AM)

/obj/structure/badlands_props/open_manhole/CanAllowThrough(atom/movable/mover, border_dir)
	SHOULD_CALL_PARENT(FALSE)
	return TRUE
