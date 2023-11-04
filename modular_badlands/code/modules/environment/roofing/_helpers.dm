GLOBAL_LIST_EMPTY(roofs_list) //list of all the roof IMAGES (not the object!!!)

/turf
	var/tmp/has_opaque_atom = FALSE // Not to be confused with opacity, this will be TRUE if there's any opaque atom on the tile.

/turf/New()
	. = ..()

	if (opacity)
		has_opaque_atom = TRUE

// Can't think of a good name, this proc will recalculate the has_opaque_atom variable.
/turf/proc/recalc_atom_opacity()
	has_opaque_atom = FALSE
	for (var/atom/A in contents + src) // Loop through every movable atom on our tile PLUS ourselves (we matter too...)
		if (A.opacity)
			has_opaque_atom = TRUE

// If an opaque movable atom moves around we need to potentially update visibility.
/turf/Entered(atom/movable/Obj, atom/OldLoc)
	. = ..()

	if (Obj && Obj.opacity)
		has_opaque_atom = TRUE // Make sure to do this before reconsider_lights(), incase we're on instant updates. Guaranteed to be on in this case.
		reconsider_lights()

/turf/Exited(atom/movable/Obj, atom/newloc)
	. = ..()

	if (Obj && Obj.opacity)
		recalc_atom_opacity() // Make sure to do this before reconsider_lights(), incase we're on instant updates.
		reconsider_lights()

/mob/living/carbon
	var/roofs_removed = TRUE

/mob/living/carbon/proc/process_static_roofs()
	if (!client)
		return
	var/area/A = get_area(loc)
	if (!A.outdoors)
		if (!roofs_removed)
			client.images = (client.images ^ GLOB.roofs_list)
			roofs_removed = TRUE
	else
		if (roofs_removed)
			client.images |= GLOB.roofs_list
			roofs_removed = FALSE

/mob/living/carbon/human/Life()
	process_static_roofs()
	. = ..()
