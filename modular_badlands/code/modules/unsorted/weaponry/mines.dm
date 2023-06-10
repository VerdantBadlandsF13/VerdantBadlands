/*
Pulled from one of the old Russian servers.
Can't recall the name, sadly. Credit to them, if we ever figure out who.
*/
/obj/item/grenade/f13/mine
	name = "landmine"
	desc = "An explosive charge, designed and produced before the Great War. <br>\
	Many such examples still litter the wasteland, killing indiscriminately."
	density = FALSE
	anchored = FALSE
	icon = 'modular_badlands/code/modules/unsorted/icons/items.dmi'
	icon_state = "landmine"
	var/armed = FALSE //we can be armed and unanchored if we want, but this isn't normally the case
	/// We manually check to see if we've been triggered in case multiple atoms cross us in the time between the mine being triggered and it actually deleting, to avoid a race condition with multiple detonations
	var/triggered = FALSE
	var/hidden = FALSE
	var/range_devastation = 0
	var/range_heavy = 1
	var/range_light = 1
	var/range_flash = 2

/obj/item/grenade/f13/mine/Initialize()
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = .proc/on_entered,
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/item/grenade/f13/mine/planted/New()
	. = ..()
	anchored = TRUE
	armed = TRUE
	add_appearance()

/obj/item/grenade/f13/mine/planted/heavy/New()
	. = ..()
	anchored = TRUE
	armed = TRUE
	range_heavy = 2
	range_light = 2
	range_flash = 3
	add_appearance()

/obj/item/grenade/f13/mine/attack_self(mob/user)
	if(armed)
		to_chat(user, "<span class='danger'>The mine is already armed!</span>") //how did we get here
	if(user.dropItemToGround(src))
		anchored = TRUE
		addtimer(CALLBACK(src, .proc/arm), 5 SECONDS)
		to_chat(user, "<span class='notice'>You drop the mine and activate the 5-second arming process.</span>")
		return

/obj/item/grenade/f13/mine/proc/arm()
	visible_message("<span class='danger'>[src] beeps!</span>")
	if(armed)
		triggermine()
		return
	add_appearance()
	armed = TRUE

/obj/item/grenade/f13/mine/proc/mineEffect(mob/victim)
	to_chat(victim, "<span class='danger'>*click*</span>")
	explosion(loc, range_devastation, range_heavy, range_light, range_flash)

	var/mob/living/target = victim
	if(target.health <= 1)
		target.gib(1, 1)
	else
		target.adjustBruteLoss(min(99,(target.health - 1)))
		target.Knockdown(400)
		target.stuttering = 20

/obj/item/grenade/f13/mine/proc/on_entered(datum/source, atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	SIGNAL_HANDLER
	if(!armed)
		return
	if(triggered || !isturf(loc) || !isliving(arrived) || isstructure(arrived) || isnottriggermine(arrived))
		return

	if(arrived.movement_type & FLYING)
		return

	INVOKE_ASYNC(src, .proc/triggermine, arrived)

/obj/item/grenade/f13/mine/proc/triggermine(mob/victim)
	if(triggered)
		return
	visible_message("<span class='danger'>[victim] sets off [icon2html(src, viewers(src))] [src]!</span>")
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	mineEffect(victim)
	SEND_SIGNAL(src, COMSIG_ITEM_MINE_TRIGGERED)
	triggered = 1
	qdel(src)

/obj/item/grenade/f13/mine/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir)
	. = ..()
	triggermine()

/obj/item/grenade/f13/mine/attackby(obj/item/I, mob/user, params)
	..()

/obj/item/grenade/f13/mine/screwdriver_act(mob/living/user, obj/item/S)
	if(!armed)
		return
	to_chat(user, "<span class='danger'>You begin carefully disarming [src].</span>")
	if(S.use_tool(src, user, 200, volume=100)) //20 seconds base, if you don't want to play the game of chance
		to_chat(user, "<span class='notice'>You carefully destroy the detonator of the mine!</span>")
		qdel(src)
	else
		triggermine(user)

/obj/item/grenade/f13/mine/proc/add_appearance()
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

/obj/item/grenade/f13/mine/proc/remove_appearance()
	remove_alt_appearance("landmine_small")
	remove_alt_appearance("landmine_ordinary")
	remove_alt_appearance("landmine_large")

/obj/item/grenade/f13/mine/attackby(obj/item/I, mob/living/user, params)
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

