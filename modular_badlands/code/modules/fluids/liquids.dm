/*
The base is fluid tile stuff, pulled from TGMC.
Heavily repurposed for our use, with a smidge of pool code and jank. - Carl
*/
///The alpha mask used on mobs submerged in liquid turfs
#define MOB_LIQUID_TURF_MASK "mob_liquid_turf_mask"
///The height of the mask itself in the icon state. Changes to the icon requires a change to this define
#define MOB_LIQUID_TURF_MASK_HEIGHT 32

/turf/open/liquid //Basic liquid turf parent
	name = "seashallow"
	icon = 'modular_badlands/code/modules/fluids/icons/fluids.dmi'
	///Multiplier on any slowdown applied to a mob moving through this turf
	var/slowdown_multiplier = 1
	///How high up on the mob water overlays sit
	var/mob_liquid_height = 11
	///How far down the mob visually drops down when in water
	var/mob_liquid_depth = -5
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/liquid/AfterChange()
	. = ..()
	baseturfs = type

/turf/open/liquid/attackby()
	return

/turf/open/liquid/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	if(has_catwalk)
		return FALSE
	. = TRUE

	if(!ismob(arrived))
		return

	if(length(canSmoothWith))
		return

	var/mob/arrived_mob = arrived
	var/icon/mob_icon = icon(arrived_mob.icon)
	var/height_to_use = (64 - mob_icon.Height()) * 0.5 //gives us the right height based on carbon's icon height relative to the 64 high alpha mask

	if(arrived_mob.get_filter(MOB_LIQUID_TURF_MASK))
		var/turf/open/liquid/old_turf = old_loc
		if(!istype(old_turf))
			CRASH("orphaned liquid alpha mask")
		if(mob_liquid_height != old_turf.mob_liquid_height)
			animate(arrived_mob.get_filter(MOB_LIQUID_TURF_MASK), y = ((64 - mob_icon.Height()) * 0.5) - (MOB_LIQUID_TURF_MASK_HEIGHT - mob_liquid_height), time = arrived_mob.cached_multiplicative_slowdown )
		if(mob_liquid_depth != old_turf.mob_liquid_depth)
			animate(arrived_mob, pixel_y = arrived_mob.pixel_y + mob_liquid_depth - old_turf.mob_liquid_depth, time = arrived_mob.cached_multiplicative_slowdown, flags = ANIMATION_PARALLEL)
		return

	//The mask is spawned below the mob, then the animate() raises it up, giving the illusion of dropping into water, combining with the animate to actual drop the pixel_y into the water
	arrived_mob.add_filter(MOB_LIQUID_TURF_MASK, 1, alpha_mask_filter(0, height_to_use - MOB_LIQUID_TURF_MASK_HEIGHT, icon('modular_badlands/code/modules/fluids/icons/pool_64.dmi', "liquid_alpha"), null, MASK_INVERSE))

	animate(arrived_mob.get_filter(MOB_LIQUID_TURF_MASK), y = height_to_use - (MOB_LIQUID_TURF_MASK_HEIGHT - mob_liquid_height), time = arrived_mob.cached_multiplicative_slowdown)
	animate(arrived_mob, pixel_y = arrived_mob.pixel_y + mob_liquid_depth, time = arrived_mob.cached_multiplicative_slowdown, flags = ANIMATION_PARALLEL)

/turf/open/liquid/Exited(atom/movable/leaver, direction)
	. = ..()
	if(!ismob(leaver))
		return
	var/mob/mob_leaver = leaver
	if(!mob_leaver.get_filter(MOB_LIQUID_TURF_MASK))
		return

	var/turf/open/liquid/new_turf = mob_leaver.loc
	if(istype(new_turf))
		if(length(new_turf.canSmoothWith))
			if(!new_turf.has_catwalk)
				return
		else if(!new_turf.has_catwalk)
			return

	var/icon/mob_icon = icon(mob_leaver.icon)
	animate(mob_leaver.get_filter(MOB_LIQUID_TURF_MASK), y = ((64 - mob_icon.Height()) * 0.5) - MOB_LIQUID_TURF_MASK_HEIGHT, time = mob_leaver.cached_multiplicative_slowdown)
	animate(mob_leaver, pixel_y = mob_leaver.pixel_y - mob_liquid_depth, time = mob_leaver.cached_multiplicative_slowdown , flags = ANIMATION_PARALLEL)
	addtimer(CALLBACK(mob_leaver.remove_filter(MOB_LIQUID_TURF_MASK), mob_leaver.cached_multiplicative_slowdown))

/turf/open/liquid/water
	name = "shallow river water"
	icon_state = "riverwater"// Needs a better sprite.
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER
	var/radioactive = TRUE

/turf/open/liquid/water/deep
	name = "deep river water"
	icon_state = "riverwater_motion"
	mob_liquid_height = 18
	mob_liquid_depth = -8
	slowdown_multiplier = 1.5

/turf/open/liquid/water/safe
	name = "shallow spring water"
	icon_state = "riverwater_motion"// Needs a better sprite.
	radioactive = FALSE

/turf/open/liquid/water/scum
	name = "stagnant water"
	icon_state = "riverwater_mapped"

/turf/open/liquid/water/scum/Initialize(mapload)
	. = ..()
	icon_state = "riverwater_stage"
	setDir(dir)

/turf/open/liquid/water/scum/north
	dir = 1

/turf/open/liquid/water/scum/south
	dir = 2

/turf/open/liquid/water/scum/east
	dir = 4

/turf/open/liquid/water/scum/west
	dir = 8

/turf/open/liquid/water/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	if(!.)
		return

	if(!iscarbon(arrived))
		return

	var/mob/living/carbon/carbon_mob = arrived
	if(carbon_mob.on_fire)
		carbon_mob.ExtinguishMob()
	if(radioactive == TRUE)
		carbon_mob.apply_effect(6, EFFECT_IRRADIATE, 0)

/turf/open/liquid/Entered(atom/movable/AM)
	. = ..()
	SEND_SIGNAL(AM, COMSIG_COMPONENT_CLEAN_ACT, 2)
	if(isliving(AM))
		var/datum/component/swimming/S = AM.GetComponent(/datum/component/swimming)
		if(!S)
			var/mob/living/carbon/C = AM
			var/component_type = /datum/component/swimming
			if(istype(C) && C?.dna?.species)
				component_type = C.dna.species.swimming_component
			AM.AddComponent(component_type)

/turf/open/liquid/Exited(atom/movable/Obj, atom/newloc)
	. = ..()
	if(!istype(newloc, /turf/open/liquid))
		var/datum/component/swimming/S = Obj.GetComponent(/datum/component/swimming) //Handling admin TPs here.
		S?.RemoveComponent()

//Used to determine how zappy to be to a perhaps-electronic user entering this body of water.
/turf/open/liquid/proc/calculate_zap(mob/user)
	var/zap = 0
	if(issilicon(user)) //Do not throw brick. Brick begs.
		zap = 1 //Sorry borgs! Swimming will come at a cost.
	if(ishuman(user))
		var/mob/living/carbon/human/F = user
		var/datum/species/SS = F.dna.species
		if(MOB_ROBOTIC in SS.inherent_biotypes)  //ZAP goes preternis and IPC
			zap = 2 //You can protect yourself from water damage with thick clothing.
		if(F.head && istype(F.head, /obj/item/clothing))
			var/obj/item/clothing/CH = F.head
			if (CH.clothing_flags & THICKMATERIAL) //thick suits should suffice! But preternis are robots and probably not water-sealed.
				zap --
		if(F.wear_suit && istype(F.wear_suit, /obj/item/clothing))
			var/obj/item/clothing/CS = F.wear_suit
			if (CS.clothing_flags & THICKMATERIAL)
				zap --
		if(zap > 0)
			zap = 3 - zap // 1 is higher severity emp than 2
	return zap

/turf/open/liquid/proc/splash(mob/user)
	user.forceMove(src)
	playsound(src, 'modular_badlands/code/modules/fluids/sound/sound_effects_splosh.ogg', 100, 1) //Credit to hippiestation for this sound file!
	user.visible_message("<span class='boldwarning'>SPLASH!</span>")
	var/zap = calculate_zap(user)
	if(zap > 0)
		user.emp_act(zap)
		user.emote("scream") //Chad coders use M.say("*scream")
		do_sparks(zap, TRUE, user)
		to_chat(user, "<span class='userdanger'>WARNING: WATER DAMAGE DETECTED!</span>")
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "robotpool", /datum/mood_event/robotpool)
	else
		if(!check_clothes(user))
			SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "pool", /datum/mood_event/poolparty)
			return
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "pool", /datum/mood_event/poolwet)

/turf/open/liquid/proc/check_clothes(mob/living/carbon/human/H)
	if(!istype(H) || iscatperson(H)) //Don't care about non humans.
		return FALSE
	var/obj/item/clothing/CS = H.wear_suit
	if(H.wear_suit && (CS.clothing_flags & THICKMATERIAL))
		// Do not check underclothing if the over-suit is suitable.
		// This stops people feeling dumb if they're showering
		// with a radiation suit on.
		return FALSE

	. = FALSE
	if(H.wear_suit && !(CS.clothing_flags & THICKMATERIAL))
		return TRUE
	if(H.w_uniform && !(CS.clothing_flags & THICKMATERIAL))
		return TRUE
	if(H.head && !(CS.clothing_flags & THICKMATERIAL))
		return TRUE

/turf/open/liquid/CanPass(atom/movable/mover, turf/target)
	var/turf/open/T = get_turf(target)
	var/datum/component/swimming/S = mover.GetComponent(/datum/component/swimming)
	if(T.has_catwalk || !S)
		return TRUE
	if(mover.throwing)
		return TRUE
	return (isliving(mover)) ? S : ..()

/turf/open/liquid/MouseDrop_T(atom/dropping, mob/user)
	var/turf/open/T = get_turf(src)
	if(!isliving(user) || !isliving(dropping))
		return
	var/datum/component/swimming/S = dropping.GetComponent(/datum/component/swimming)
	if(S)
		return FALSE
	. = ..()
	if(user != dropping)
		dropping.visible_message("<span class='notice'>[user] starts to lower [dropping] down into \the [T].</span>", \
		"<span class='notice'>You start to lower [dropping] down into \the [T].</span>")
	else
		to_chat(user, "<span class='notice'>You start climbing down into \the [T]...")
	if(do_after(user, 4 SECONDS, src))
		splash(dropping)

// General Water Diagonal
/obj/effect/overlay/liquid_diag
	name = "water"
	icon = 'modular_badlands/code/modules/fluids/icons/fluids.dmi'
	icon_state = "diagonalwater"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = BELOW_MOB_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE
