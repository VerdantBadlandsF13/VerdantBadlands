/obj/effect/mapping_helpers/ztrait_injector
	name = "ztrait injector"
	icon_state = "ztrait"
	/// List of traits to add to this.
	var/list/traits_to_add = list()

/obj/effect/mapping_helpers/ztrait_injector/Initialize()
	. = ..()
	var/datum/space_level/level = SSmapping.z_list[z]
	if(!level || !length(traits_to_add))
		return
	level.traits |= traits_to_add
	SSweather.update_z_level(level) //in case of someone adding a weather for the level, we want SSweather to update for that
