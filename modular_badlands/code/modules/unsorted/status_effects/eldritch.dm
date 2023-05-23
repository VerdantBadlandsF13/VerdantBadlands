// The define, to keep things modular. This should probably be cleaned up.
#define STATUS_EFFECT_CRUSADER_CURSE /datum/status_effect/crusader_curse
// Applies the Crusader's curse.
/mob/living/proc/apply_crusader_curse(set_curse)
	var/datum/status_effect/crusader_curse/C = has_status_effect(STATUS_EFFECT_CRUSADER_CURSE)
	if(!set_curse)
		set_curse = CURSE_WASTING
	if(QDELETED(C))
		apply_status_effect(STATUS_EFFECT_CRUSADER_CURSE, set_curse)
	else
		C.apply_curse(set_curse)
		C.duration += 3000 //additional curses add 5 minutes

// Contains the curse for the 'Crusader's Vow' item.
/datum/status_effect/crusader_curse
	id = "crusadercurse"
	duration = 2 MINUTES
	tick_interval = 50
	alert_type = /obj/screen/alert/status_effect/crusader_curse
	var/curse_flags = NONE
	var/obj/effect/temp_visual/curse/wasting_effect = new

/obj/screen/alert/status_effect/crusader_curse
	name = "\improper Crusader's Curse"
	desc = "<span class='warning'>You've caught the attention of something terrible.</span>"
	icon = 'modular_badlands/code/modules/unsorted/icons/items.dmi'
	icon_state = "reality_smash"

/datum/status_effect/crusader_curse/on_creation(mob/living/new_owner, set_curse, _duration)
	if(_duration)
		duration = _duration
	. = ..()
	if(.)
		apply_curse(set_curse)

/datum/status_effect/crusader_curse/Destroy()
	if(!QDELETED(wasting_effect))
		qdel(wasting_effect)
		wasting_effect = null
	return ..()

/datum/status_effect/crusader_curse/on_remove()
	. = ..()
	remove_curse(curse_flags)

/datum/status_effect/crusader_curse/proc/apply_curse(set_curse)
	curse_flags |= set_curse
	if(curse_flags & CURSE_WASTING)
		owner.overlay_fullscreen("curse", /obj/screen/fullscreen/curse, 1)

/datum/status_effect/crusader_curse/proc/remove_curse(remove_curse)
	if(remove_curse & CURSE_WASTING)
		owner.clear_fullscreen("curse", 50)
	curse_flags &= ~remove_curse

/datum/status_effect/crusader_curse/tick()
	if(owner.stat == DEAD)
		return
	if(curse_flags & CURSE_WASTING)
		wasting_effect.forceMove(owner.loc)
		wasting_effect.setDir(owner.dir)
		wasting_effect.transform = owner.transform //if the owner has been stunned the overlay should inherit that position
		wasting_effect.alpha = 255
		animate(wasting_effect, alpha = 0, time = 32)
		playsound(owner, 'sound/effects/curse5.ogg', 20, 1, -1)
		owner.adjustFireLoss(0.75)

/obj/effect/temp_visual/crusader_curse
	icon_state = "curse"

/obj/effect/temp_visual/crusader_curse/Initialize()
	. = ..()
	deltimer(timerid)

