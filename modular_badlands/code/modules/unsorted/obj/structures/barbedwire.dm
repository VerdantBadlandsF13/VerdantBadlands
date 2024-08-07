/////////////////
// BARBED WIRE //
/////////////////

/obj/structure/obstacle/barbedwire
	name = "barbed wire"
	desc = "Don't walk into this."
	icon_state = "barbed"
	density = FALSE
	var/slowdown = 40
	pass_flags_self = LETPASSTHROW

/obj/structure/obstacle/barbedwire/end
	icon_state = "barbed_end"

/obj/structure/obstacle/barbedwire/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/caltrop, 20, 30, 100, CALTROP_BYPASS_SHOES)

/obj/structure/obstacle/barbedwire/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/wirecutters))

		to_chat(user, span_notice("You start cutting the [src]..."))
		if(!I.use_tool(src, user, 4 SECONDS, volume=50) && !QDELETED(src))
			return ..()
		if(QDELETED(src)) // if we were deconstructed while sleeping in use_tool
			return STOP_ATTACK_PROC_CHAIN // don't do anything to a deleted atom
		playsound(src.loc, 'sound/items/deconstruct.ogg', 50, 1)
		deconstruct(TRUE)
		return STOP_ATTACK_PROC_CHAIN

	return ..()

/obj/structure/obstacle/barbedwire/proc/shock(mob/user, prb) 	// war crime mode, if you can find an electrical generator

	if(!in_range(src, user))// To prevent TK and mech users from getting shocked
		return FALSE
	var/turf/T = get_turf(src)
	var/obj/structure/cable/C = T.get_cable_node()
	if(C)
		if(electrocute_mob(user, C, src, 1, TRUE))
			var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
			s.set_up(3, 1, src)
			s.start()
			return TRUE
		else
			return FALSE
	return FALSE

// For adding to tops of fences/walls etc
/obj/effect/overlay/barbed
	name = "razorwire"
	icon = 'icons/fallout/structures/barricades.dmi'
	icon_state = "barbed_single"
	plane = MOB_PLANE
	layer = ABOVE_ALL_MOB_LAYER

// Escal wire coils.

/obj/item/stack/barbwire_coil
	name = "barbed wire coil"
	desc = "A coil of thorny wire. You could probably use this to set up some manner of barrier."
	icon = 'modular_badlands/code/modules/unsorted/icons/items.dmi'
	icon_state = "barbwire_coil"
	item_state = "rods"
	flags_1 = CONDUCT_1
	w_class = WEIGHT_CLASS_NORMAL
	amount = 10
	max_amount = 10
	attack_verb = list("hit", "bludgeoned", "whacked")
	merge_type = /obj/item/stack/barbwire_coil

//checking to see there's no wire on the turf, prevents stacking it, outside of the original object.
/obj/item/stack/barbwire_coil/proc/check_for_wire(mob/user as mob)
	if(locate(/obj/structure/obstacle/barbedwire) in user.loc.contents)
		to_chat(user, "<span class='warning'>There is already some wire there.</span>")
		return 1
	return 0

/obj/item/stack/barbwire_coil/attack_self(mob/user as mob)
	if(check_for_wire(user))
		return

	if(!isturf(user.loc))
		to_chat(user, "<span class='warning'>How?</span>")
		return

	if(do_after(user, 30, src))
		to_chat(user, "<span class='notice'>You finish setting up the barbwire!</span>")
		use(1)
		var/obj/structure/obstacle/barbedwire/W = new /obj/structure/obstacle/barbedwire(get_turf(user))
		W.dir = user.dir
		return

	if(!do_mob(user, 30, src))
		to_chat(user, "<span class='warning'>You must stand still to do that.</span>")
		return
