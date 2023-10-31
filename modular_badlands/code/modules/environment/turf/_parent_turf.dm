/*
I really, really don't want to do it this way. Forgive me.
*/

/turf/open/indestructible/ground/bl
	icon = 'modular_badlands/code/modules/environment/icons/bl_turf.dmi'
	icon_state = "ERROR"
	has_base_range = FALSE// Nadda. Not for the moment.
	// Desert tile copypaste.
	var/dug = FALSE
	var/pit_sand = 1
	var/storedindex = 0			//amount of stored items
	var/mob/living/gravebody	//is there a body in the pit?
	var/obj/structure/closet/crate/coffin/gravecoffin //or maybe a coffin?
	var/obj/salvage //or salvage
	var/pitcontents // Lazylist of pit contents.
	var/obj/dugpit/mypit
	var/unburylevel = 0
	var/static/list/loots = list(
						/obj/item/stack/crafting/metalparts/five = 30,
						/obj/item/stack/crafting/goodparts/five = 30,
						/obj/item/stack/ore/blackpowder/twenty = 10
						)

/turf/open/indestructible/ground/bl/Initialize()
	. = ..()
	if(prob(2))
		salvage = pickweight(loots)

/turf/open/indestructible/ground/bl/outside
	slowdown = 0.4
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/indestructible/ground/bl/outside/Initialize()
	. = ..()
	flags_2 |= GLOBAL_LIGHT_TURF_2
