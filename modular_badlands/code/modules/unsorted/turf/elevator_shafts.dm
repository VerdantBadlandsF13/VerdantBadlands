// Elevator Shaft
/turf/open/chasm/elevator
	name = "elevator shaft"
	desc = "Doesn't look too deep. Probably. Perhaps you could jump?"
	icon = 'icons/turf/floors/junglechasm.dmi'

/turf/open/chasm/elevator/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	underlay_appearance.icon = 'icons/fallout/turfs/floors.dmi'
	underlay_appearance.icon_state = "plating"
	return TRUE

/turf/open/chasm/elevator/Initialize()
	. = ..()
	var/turf/T = safepick(get_area_turfs(/area/f13/wasteland))
	if(T)
		set_target(T)

//Elevator Shaft 2
/turf/open/chasm/elevator_enc
	name = "elevator shaft"
	desc = "Doesn't look too deep. Probably. Perhaps you could jump?"
	icon = 'icons/turf/floors/junglechasm.dmi'

/turf/open/chasm/elevator_enc/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	underlay_appearance.icon = 'icons/fallout/turfs/floors.dmi'
	underlay_appearance.icon_state = "plating"
	return TRUE

/turf/open/chasm/elevator_enc/Initialize()
	. = ..()
	var/turf/T = safepick(get_area_turfs(/area/f13/wasteland))
	if(T)
		set_target(T)
