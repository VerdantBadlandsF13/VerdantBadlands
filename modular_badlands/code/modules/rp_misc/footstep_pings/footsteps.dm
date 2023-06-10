// Pulled from Aurora. Repurposed by us.
#define ALWAYS_FOOTSTEP_DISTANCE 2
#define MAX_FOOTSTEP_DISTANCE 5
#define RIPPLE_POSITION_BOUNDS 8
#define RIPPLE_START_RADIUS 10
#define RIPPLE_END_RADIUS 2
#define RIPPLE_START_SIZE 0
#define RIPPLE_END_SIZE 16

/client
	var/list/hidden_atoms = list()
	var/list/hidden_mobs = list()

/mob/proc/is_invisible_to(mob/viewer)
	return (!alpha || !mouse_opacity || viewer.see_invisible < invisibility || (viewer.client && (src in viewer.client.hidden_mobs)))

/mob/living/Move(atom/newloc, direct, glide_size_override)
	. = ..()

	for(var/viewer in oviewers(world.view, src))
		var/mob/living/M = viewer
		if(M.client && istype(M) && M.can_have_vision_cone)
			if(M.client.view != world.view && get_dist(M, src) > M.client.view)
				continue
			else
				var/turf/T = get_turf(M)
				var/turf/Ts = get_turf(src)
				if(Ts.InConeDirection(T, reverse_direction(M.dir)))
					if(!(src in M.client.hidden_mobs))
						if(M.InCone(T, M.dir))
							M.add_to_mobs_hidden_atoms(src)
					Ts.show_footsteps(M, T, src)
				else
					if(src in M.client.hidden_mobs)
						M.client.hidden_mobs -= src
						for(var/image in M.client.hidden_atoms)
							var/image/I = image
							if(I.loc == src)
								I.override = FALSE
								M.client.hidden_atoms -= I
								M.client.images -= I
								QDEL_IN(I, 1 SECONDS)

/turf/proc/show_footsteps(mob/viewer, turf/Tviewer, mob/M)
	var/dist = get_dist(src, Tviewer)

	if(src == Tviewer)
		return

	if(dist > MAX_FOOTSTEP_DISTANCE || prob(100*max(dist-ALWAYS_FOOTSTEP_DISTANCE,0) / MAX_FOOTSTEP_DISTANCE))
		return

/*
	if(isdeaf(viewer))
		return
*/

	if(viewer.stat || M.stat || M.lying)
		return

/*	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.is_noisy)
			return
*/

	var/image/marker = image(icon, src, icon_state, layer = layer)
	marker.overlays = overlays.Copy()
	marker.override = TRUE
	marker.filters += filter(type = "ripple", x=rand(-RIPPLE_POSITION_BOUNDS, RIPPLE_POSITION_BOUNDS), y=rand(-RIPPLE_POSITION_BOUNDS, RIPPLE_POSITION_BOUNDS), radius = RIPPLE_START_RADIUS, size = RIPPLE_START_SIZE, falloff = 0)

	viewer.client.images += marker
	QDEL_IN(marker, 1.5 SECONDS)
	animate(marker.filters[marker.filters.len], time = 1.5 SECONDS, radius = RIPPLE_END_RADIUS, size = RIPPLE_END_SIZE)

#undef ALWAYS_FOOTSTEP_DISTANCE
#undef MAX_FOOTSTEP_DISTANCE
#undef RIPPLE_POSITION_BOUNDS
#undef RIPPLE_START_RADIUS
#undef RIPPLE_END_RADIUS
#undef RIPPLE_START_SIZE
#undef RIPPLE_END_SIZE
