//Incredibly old system for turf spillover.
//Pretty sure this is originally from VG.
//Silly modifications for our use. - Carl
#define TURF_HAS_EDGES		1
#define TURF_HAS_CORNERS	2

GLOBAL_LIST_EMPTY(flooring_cache)

// State values:
// [icon_base]: initial base icon_state without edges or corners.
// if has_base_range is set, append 0-has_base_range ie.
//   [icon_base][has_base_range]
// [icon_base]_edges: directional overlays for edges.
// [icon_base]_corners: directional overlays for non-edge corners.

/turf/open
	var/icon_base
	var/has_base_range
	var/spillover_flags
/*
/turf/open/update_icon(update_neighbors)
	. = ..()

	if(!icon_base)
		icon_base = icon_state
	if(has_base_range)
		icon_state = "[icon_state][rand(0,has_base_range)]"

	// Apply edges, corners, and inner corners.
	overlays.Cut()
	var/has_border = 0
	if(spillover_flags & TURF_HAS_EDGES)
		for(var/step_dir in GLOB.cardinals)
			var/turf/open/T = get_step(src, step_dir)
			if(!istype(T) || T.name != name)
				has_border |= step_dir
				overlays |= get_flooring_overlay("[icon_base]-edge-[step_dir]", "[icon_base]_edges", step_dir)

		if((has_border & NORTH) && (has_border & EAST))
			overlays |= get_flooring_overlay("[icon_base]-edge-[NORTHEAST]", "[icon_base]_edges", NORTHEAST)
		if((has_border & NORTH) && (has_border & WEST))
			overlays |= get_flooring_overlay("[icon_base]-edge-[NORTHWEST]", "[icon_base]_edges", NORTHWEST)
		if((has_border & SOUTH) && (has_border & EAST))
			overlays |= get_flooring_overlay("[icon_base]-edge-[SOUTHEAST]", "[icon_base]_edges", SOUTHEAST)
		if((has_border & SOUTH) && (has_border & WEST))
			overlays |= get_flooring_overlay("[icon_base]-edge-[SOUTHWEST]", "[icon_base]_edges", SOUTHWEST)

		if(spillover_flags & TURF_HAS_CORNERS)
			if(!(has_border & NORTH))
				if(!(has_border & EAST))
					var/turf/open/T = get_step(src, NORTHEAST)
					if(!(istype(T) && T.name == name))
						overlays |= get_flooring_overlay("[icon_base]-corner-[NORTHEAST]", "[icon_base]_corners", NORTHEAST)
				if(!(has_border & WEST))
					var/turf/open/T = get_step(src, NORTHWEST)
					if(!(istype(T) && T.name == name))
						overlays |= get_flooring_overlay("[icon_base]-corner-[NORTHWEST]", "[icon_base]_corners", NORTHWEST)
			if(!(has_border & SOUTH))
				if(!(has_border & EAST))
					var/turf/open/T = get_step(src, SOUTHEAST)
					if(!(istype(T) && T.name == name))
						overlays |= get_flooring_overlay("[icon_base]-corner-[SOUTHEAST]", "[icon_base]_corners", SOUTHEAST)
				if(!(has_border & WEST))
					var/turf/open/T = get_step(src, SOUTHWEST)
					if(!(istype(T) && T.name == name))
						overlays |= get_flooring_overlay("[icon_base]-corner-[SOUTHWEST]", "[icon_base]_corners", SOUTHWEST)

	if(update_neighbors)
		for(var/turf/open/F in range(src, 1))
			if(F == src)
				continue
			F.update_icon()

/turf/open/proc/get_flooring_overlay(cache_key, icon_base, icon_dir = 0, layer = TURF_DECAL_LAYER)
	if(!flooring_cache[cache_key])
		var/image/I = image(icon = icon, icon_state = icon_base, dir = icon_dir)
		I.layer = layer
		flooring_cache[cache_key] = I
	return flooring_cache[cache_key]
*/
