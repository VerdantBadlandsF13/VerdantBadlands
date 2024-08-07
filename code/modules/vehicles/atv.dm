/obj/vehicle/ridden/atv
	name = "all-terrain vehicle"
	desc = "An all-terrain vehicle built for traversing rough terrain with ease. One of the few old-Earth technologies that are still relevant on most planet-bound outposts."
	icon_state = "atv"
	key_type = /obj/item/key
	var/static/mutable_appearance/atvcover

/obj/vehicle/ridden/atv/Initialize()
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 1
	D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 4), TEXT_SOUTH = list(0, 4), TEXT_EAST = list(0, 4), TEXT_WEST = list( 0, 4)))
	D.set_vehicle_dir_layer(SOUTH, ABOVE_MOB_LAYER)
	D.set_vehicle_dir_layer(NORTH, OBJ_LAYER)
	D.set_vehicle_dir_layer(EAST, OBJ_LAYER)
	D.set_vehicle_dir_layer(WEST, OBJ_LAYER)

/obj/vehicle/ridden/atv/post_buckle_mob(mob/living/M)
	add_overlay(atvcover)
	return ..()

/obj/vehicle/ridden/atv/post_unbuckle_mob(mob/living/M)
	if(!has_buckled_mobs())
		cut_overlay(atvcover)
	return ..()

/obj/vehicle/ridden/atv/snowmobile
	name = "snowmobile"
	desc = "a tracked vehicle designed for use in the snow, it looks like it would have difficulty moving elsewhere, however."
	icon_state = "snowmobile"

/obj/vehicle/ridden/atv/snowmobile/Moved()
	. = ..()
	if(!loc || QDELETED(src))
		return
	var/static/list/snow_typecache = typecacheof(list(/turf/open/floor/plating/asteroid/snow/icemoon, /turf/open/floor/plating/snowed/smoothed/icemoon, /turf/open/floor/plating/snowed, /turf/open/floor/plating/asteroid/snow))
	var/datum/component/riding/E = LoadComponent(/datum/component/riding)
	if(snow_typecache[loc.type])
		E.vehicle_move_delay = 1
	else
		E.vehicle_move_delay = 2

/obj/vehicle/ridden/atv/snowmobile/snowcurity
	name = "security snowmobile"
	desc = "for when you want to look like even more of a tool than riding a secway."
	icon_state = "snowcurity"
	key_type = /obj/item/key/security
