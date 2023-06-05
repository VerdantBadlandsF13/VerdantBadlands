/*
Pulled from one of the old Russian servers.
Can't recall the name, sadly. Credit to them, if we ever figure out who.
*/
/obj/item/grenade/f13/mine
	name = "dummy mine"
	desc = "Better stay away from that thing."
	density = FALSE
	anchored = FALSE
	icon = 'modular_badlands/code/modules/unsorted/icons/items.dmi'
	icon_state = "landmine"
	var/triggered = FALSE
	var/armed = FALSE
	var/press_bolted = 1
	var/hidden = 0
	var/wire_cut = 0
	det_time = 0

/obj/item/grenade/f13/mine/Initialize()
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = .proc/on_entered,
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/item/grenade/f13/mine/examine(mob/user)
	. = ..()
	. += "<span class='boldnotice'>You can use a shovel to bury this mine, or dig it up.</span>"
	. += "<span class='boldnotice'>Various tools will enable you to deconstruct the mine for its materials.</span>"

/obj/item/grenade/f13/mine/attack_self(mob/user)
	if(!active)
		to_chat(user, "<span class='warning'>You planted [name]!</span>")
		visible_message("<span class='danger'>[user] planted [src]!</span>")
		playsound(user.loc, 'sound/weapons/armbomb.ogg', 60, 1)
		armed = TRUE

		var/turf/bombturf = get_turf(src)
		var/area/A = get_area(bombturf)
		var/message = "[ADMIN_LOOKUPFLW(user)]) has primed a [name] at [ADMIN_COORDJMP(bombturf)]"
		GLOB.bombers += message
		message_admins(message)
		log_game("[key_name(usr)] has primed a [name] for detonation at [A.name] [COORD(bombturf)].")

		if(user)
			user.deleteWornItem(src)
			var/obj/item/grenade/f13/mine/explosive/planted/p = new(user.loc)
			p.add_fingerprint(user)

/obj/item/grenade/f13/mine/proc/triggermine(mob/victim)
	if(triggered)
		return
	visible_message("<span class='danger'>[victim] sets off [icon2html(src, viewers(src))] [src]!</span>")
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	mineEffect(victim)
	triggered = TRUE
	qdel(src)

/obj/item/grenade/f13/mine/proc/mineEffect(mob/victim)
	to_chat(victim, "<span class='danger'>*click*</span>")

/obj/item/grenade/f13/mine/proc/on_entered(datum/source)
	SIGNAL_HANDLER
	if(!armed)
		return
	if(triggered || !isturf(loc) || !isliving(usr) || isstructure(usr) || isnottriggermine(usr))
		return

	var/atom/movable/AM = usr

	if(AM.movement_type & FLYING)
		return

	INVOKE_ASYNC(src, .proc/triggermine, AM)

/obj/item/grenade/f13/mine/explosive
	name = "explosive mine"
	var/range_devastation = 0
	var/range_heavy = 1
	var/range_light = 1
	var/range_flash = 2

/obj/item/grenade/f13/mine/explosive/planted
	active = 1
	anchored = 1
	icon_state = "landmine_active"

/obj/item/grenade/f13/mine/explosive/planted/proc/add_appearance()
	var/image/I = image(icon = 'modular_badlands/code/modules/unsorted/icons/items.dmi', icon_state = "landmine_active", loc = src)
	I.override = TRUE
	add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/landmines/ordinary, "landmine_ordinary", I)

	var/image/I2 = image(icon = 'modular_badlands/code/modules/unsorted/icons/items.dmi', icon_state = "landmine_active", loc = src)
	I2.override = TRUE
	I2.add_overlay(mutable_appearance('icons/mob/talk.dmi', "combat"))
	add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/landmines/large, "landmine_large", I2)

	var/image/I3 = image(icon = 'modular_badlands/code/modules/unsorted/icons/items.dmi', icon_state = "landmine_active", loc = src)
	I3.override = TRUE
	I3.alpha = 80
	add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/landmines/small, "landmine_small", I3)

/obj/item/grenade/f13/mine/explosive/planted/proc/remove_appearance()
	remove_alt_appearance("landmine_small")
	remove_alt_appearance("landmine_ordinary")
	remove_alt_appearance("landmine_large")

/obj/item/grenade/f13/mine/explosive/planted/New()
	. = ..()
	add_appearance()

/obj/item/grenade/f13/mine/explosive/planted/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/shovel))
		if(hidden == 0)
			if(do_after(user, 20, target = loc))
				to_chat(user, "You covered landmine with some sand.")
				icon_state = "landmine_hidden"
				hidden = 1
				remove_appearance()
				return
		else
			if(do_after(user, 20, target = loc))
				to_chat(user, "You uncovered landmine.")
				icon_state = "landmine_active"
				hidden = 0
				add_appearance()
				return
	if(istype(I, /obj/item/screwdriver) && active)
		to_chat(user, "You started carefully removing bolts from the detonating plate.")
		I.play_tool_sound(src, 75)
		if(do_after(user, 15, target = loc))
			to_chat(user, "You carefully remove bolts from the detonating plate.")
			press_bolted = 0
			return
	if(istype(I, /obj/item/wirecutters) && press_bolted == 0)
		if(do_after(user, 15, target = loc))
			I.play_tool_sound(src, 75)
			to_chat(user, "You carefully cut wires inside of this mine. It can now be safely deconstructed...")
			wire_cut = 1
			active = 0
			return
	if(istype(I, /obj/item/wrench) && wire_cut == 1)
		to_chat(user, "You start to dissassemble mine components.")
		I.play_tool_sound(src, 75)
		if(do_after(user, 25, target = loc))
			switch(rand(1,10))
				if(5)
					to_chat(user, "You successfuly disassembled the mine and got all components!")
					new/obj/item/stack/sheet/metal/(get_turf(src), 1)
					new/obj/item/stack/cable_coil/(get_turf(src), 2)
					qdel(src)
				else
					to_chat(user, "Sadly, you didn't get anything useful from this mine...")
					qdel(src)

/obj/item/grenade/f13/mine/explosive/mineEffect(mob/victim)
	var/mob/living/target = victim

	explosion(target.loc, 0, 0, 0, 0, 3)
	var/turf/open/floor/T = get_turf(target)
	if(istype(T))
		if(prob(80))
			T.break_tile_to_plating()
		else
			T.break_tile()

	if(!isliving(victim))
		return

	if(target.health <= 1)
		target.gib(1, 1)
	else
		target.adjustBruteLoss(min(99,(target.health - 1)))
		target.Knockdown(400)
		target.stuttering = 20
