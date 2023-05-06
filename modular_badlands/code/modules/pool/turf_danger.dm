/obj/effect/overlay/riverwater
	name = "river water"
	desc = "Shallow river water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = MOB_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	alpha = 90//Maybe not needed?

/turf/open/indestructible/sound/pool/river
	name = "riverbed"
	desc = "A downward sloping surface. Looks rather deep, so best be careful! <br>\
	<b>Drag and drop yourself onto it to climb in...</b>"
	icon = 'modular_badlands/code/modules/pool/icons/pool.dmi'
	icon_state = "riverbed"
	sound = 'modular_badlands/code/modules/pool/sound/sound_effects_splash.ogg'
	id = null
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/indestructible/sound/pool/river/Initialize(mapload)
	. = ..()
	water_overlay = new /obj/effect/overlay/riverwater(get_turf(src))

/turf/open/indestructible/sound/pool/river/Entered(atom/movable/AM, atom/oldloc)
	. = ..()
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		if(L.check_submerged() <= 0)
			return
		L.update_water()
		L.apply_effect(2, EFFECT_IRRADIATE, 0)
		L.adjustStaminaLoss(5)
	AM.water_act(5)

/turf/open/indestructible/sound/pool/river/Exited(atom/movable/AM, atom/newloc)
	. = ..()
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		if(L.check_submerged() <= 0)
			return
		L.update_water()
		L.apply_effect(2, EFFECT_IRRADIATE, 0)
		L.adjustStaminaLoss(5)

/turf/open/indestructible/sound/pool/river/Bumped(atom/movable/AM) //STOP RUNNING NEAR WATER >:(
	. = ..()
	if(ishuman(AM))
		var/mob/living/carbon/human/humanAM = AM
		if(humanAM.combat_flags & COMBAT_FLAG_SPRINT_ACTIVE)
			humanAM.disable_sprint_mode()
			humanAM.AdjustKnockdown(25)
			visible_message("<span class='warning'>[humanAM] falls into [src]!</span>")
			humanAM.throw_at(get_step_towards(src,humanAM), 3, 1)
