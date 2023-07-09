/*
This is for areas that cause injury to mobs, inherently, upon entering.
Stuff for sewers with gas buildup, lack of oxygen, etc.
Just a simple, cheap replacement to atmos in a few locations.
*/

/area/f13/hostile
	name = "MASTER AREA DO NOT USE"
	icon_state = "admin"
//	ambientsounds = list('sound/f13ambience/bird_1.ogg','sound/f13ambience/bird_2.ogg','sound/f13ambience/bird_3.ogg','sound/f13ambience/bird_4.ogg','sound/f13ambience/bird_5.ogg','sound/f13ambience/bird_6.ogg','sound/f13ambience/bird_7.ogg','sound/f13ambience/bird_8.ogg')
	blob_allowed = 0
	environment = 6
	grow_chance = 5
//	requires_power = TRUE

/area/f13/hostile/Entered(atom/movable/AM, atom/oldloc)
	. = ..()
	if(istype(wear_mask, /obj/item/clothing/mask/gas))

	for(var/mob/living/M as AM in arrived.GetAllContentsType(/mob/living))
		to_chat(enterer, span_userdanger("This was a bad idea..."))
		enterer.dust(TRUE, FALSE, TRUE)

	if(istype(wear_mask, /obj/item/clothing/mask/gas))
		if(C.get_breath_from_internal(0)) // check if we have internals on

	if(C.blood_volume <= (BLOOD_VOLUME_SURVIVE*C.blood_ratio))
		to_chat(C, "<span class='danger'>You ran out of blood!</span>")
		C.dust()
	var/area/A = get_area(C)
	if(istype(A, /area/chapel))
		to_chat(C, "<span class='danger'>You don't belong here!</span>")
		C.adjustFireLoss(5)
		C.adjust_fire_stacks(6)
		C.IgniteMob()

		throw_alert("not_enough_oxy", /obj/screen/alert/not_enough_oxy)
		SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "suffocation", /datum/mood_event/suffocation)


/*
/datum/status_effect/freon
	id = "frozen"
	duration = 100
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = /obj/screen/alert/status_effect/freon
	var/icon/cube
	var/can_melt = TRUE

/obj/screen/alert/status_effect/freon
	name = "Frozen Solid"
	desc = "You're frozen inside an ice cube, and cannot move! You can still do stuff, like shooting. Resist out of the cube!"
	icon_state = "frozen"

/datum/status_effect/freon/on_apply()
	RegisterSignal(owner, COMSIG_LIVING_RESIST, .proc/owner_resist)
	if(!owner.stat)
		to_chat(owner, "<span class='userdanger'>You become frozen in a cube!</span>")
	cube = icon('icons/effects/freeze.dmi', "ice_cube")
	owner.add_overlay(cube)
	owner.update_mobility()
	return ..()

/datum/status_effect/freon/tick()
	owner.update_mobility()
	if(can_melt && owner.bodytemperature >= BODYTEMP_NORMAL)
		qdel(src)

/datum/status_effect/freon/proc/owner_resist()
	to_chat(owner, "You start breaking out of the ice cube!")
	if(do_mob(owner, owner, 40))
		if(!QDELETED(src))
			to_chat(owner, "You break out of the ice cube!")
			owner.remove_status_effect(/datum/status_effect/freon)
			owner.update_mobility()

/datum/status_effect/freon/on_remove()
	if(!owner.stat)
		to_chat(owner, "The cube melts!")
	owner.cut_overlay(cube)
	owner.adjust_bodytemperature(100)
	owner.update_mobility()
	UnregisterSignal(owner, COMSIG_LIVING_RESIST)
	return ..()

/datum/status_effect/freon/watcher
	duration = 8
	can_melt = FALSE
*/
