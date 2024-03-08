/*
This is for areas that cause injury to mobs, inherently, upon entering.
Stuff for sewers with gas buildup, lack of oxygen, etc.
Just a simple, cheap replacement to atmos in a few locations.
*/

/area/f13/hostile
	name = "MASTER AREA DO NOT USE"
	icon_state = "admin"
	blob_allowed = 0
	environment = 6
	grow_chance = 5

/area/f13/hostile/Entered(atom/movable/AM, atom/oldloc)
	. = ..()
	if(isliving(AM))
		var/datum/component/hazardous_location/H = AM.GetComponent(/datum/component/hazardous_location)
		if(!H)
			var/component_type = /datum/component/hazardous_location
			AM.AddComponent(component_type)

/area/f13/hostile/Exited(atom/movable/Obj)
	. = ..()
	var/area/oldA = get_area(get_turf(Obj))
	if(!isarea(oldA, /area/f13/hostile))
		var/datum/component/hazardous_location/H = Obj.GetComponent(/datum/component/hazardous_location) //Handling admin TPs here.
		H?.RemoveComponent()
