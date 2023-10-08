/*
For our purposes, mob spawners and /VERY/ large explosions can now trigger 'tremors'.
This means that a certain set of tiles, around landmarks that I'll have below, can check for a collapse possibility.
It keeps the map changing, and has various applications in the realm of RP. - Carl
*/
#define TREMOR_CHECK_RANGE 12

/obj/effect/landmark/tremor_area
	name = "tremor impact area"
	var/range = TREMOR_CHECK_RANGE //tile radius to spawn goop

/obj/effect/landmark/tremor_area/proc/tremor()

	for(var/turf/open/indestructible/ground/inside/TR in orange(range, get_turf(src)))
		TR.collapse_check()

	if(prob(80))
		SEND_SOUND(world, sound("sound/effects/explosioncreak[rand(1,2)].ogg", 75))
	else
		SEND_SOUND(world, sound('sound/effects/explosionfar.ogg', 75))

#undef TREMOR_CHECK_RANGE
