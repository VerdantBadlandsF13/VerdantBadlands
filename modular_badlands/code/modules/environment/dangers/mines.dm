/*
Landmines used by players, and pre-spawned.
*/
/obj/item/grenade/f13/mine
	name = "landmine"
	desc = "An explosive charge, designed and produced before the Great War. <br>\
	Many such examples still litter the wasteland, killing indiscriminately. <br>\
	<span class='revenminor'>You can bury and uncover this with a shovel, making it near impossible to detect or visible once more. <br>\
	Additionally, you can use wirecutters and wire manipulating tools to disarm it.</span>"
	density = FALSE
	anchored = FALSE
	icon = 'modular_badlands/code/modules/unsorted/icons/items.dmi'
	icon_state = "landmine"
	var/armed = FALSE //we can be armed and unanchored if we want, but this isn't normally the case
	/// We manually check to see if we've been triggered in case multiple atoms cross us in the time between the mine being triggered and it actually deleting, to avoid a race condition with multiple detonations
	var/triggered = FALSE
	var/hidden = FALSE
	var/range_devastation = 0
	var/range_heavy = 0
	var/range_light = 2
	var/range_flash = 0

/*
Init stuff.
*/
/obj/item/grenade/f13/mine/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_WIRES)

/obj/item/grenade/f13/mine/Initialize()
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = .proc/on_entered
	)
	AddElement(/datum/element/connect_loc, loc_connections)
	wires = new /datum/wires/explosive/f13_mine(src)

/obj/item/grenade/f13/mine/Destroy()
	qdel(wires)
	wires = null
	return ..()

/obj/item/grenade/f13/mine/planted/New()
	. = ..()
	icon_state = "landmine_active"
	anchored = TRUE
	armed = TRUE
	add_appearance()

/obj/item/grenade/f13/mine/planted/heavy/New()
	. = ..()
	range_heavy = 1
	range_light = 2
	range_flash = 1

/*
Arming Self
*/
/obj/item/grenade/f13/mine/attack_self(mob/user)
	if(armed)
		to_chat(user, "<span class='danger'>The mine is already armed!</span>") //how did we get here
	if(user.dropItemToGround(src))
		anchored = TRUE
		addtimer(CALLBACK(src, PROC_REF(arm)), 5 SECONDS)
		to_chat(user, "<span class='notice'>You drop the mine and activate the 5-second arming process.</span>")
		add_appearance()
		return

/*
Destruction
*/
/obj/item/grenade/f13/mine/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir)
	. = ..()
	triggermine()

/obj/item/grenade/f13/mine/screwdriver_act(mob/living/user, obj/item/S)
	if(!armed)
		return
	to_chat(user, "<span class='danger'>You begin carefully disarming [src].</span>")
	if(S.use_tool(src, user, 200, volume=100)) //20 seconds base, if you don't want to play the game of chance
		to_chat(user, "<span class='notice'>You carefully discard the detonator of the mine!</span>")
		qdel(src)
	else
		triggermine(user)

/obj/item/grenade/f13/mine/attackby(obj/item/I, mob/user, params)
	if(is_wire_tool(I))
		wires.interact(user)
	if(istype(I, /obj/item/shovel))
		if(hidden == 0)
			if(do_after(user, 20, target = loc))
				to_chat(user, "You covered the landmine with some debris.")
				icon_state = "landmine_hidden"
				hidden = 1
				remove_appearance()
				return
		else
			if(do_after(user, 20, target = loc))
				to_chat(user, "You uncover the landmine.")
				icon_state = "landmine_active"
				hidden = 0
				add_appearance()
				return
	else ..()

/*
Procs
*/
/obj/item/grenade/f13/mine/proc/arm()
	visible_message("<span class='danger'>[src] beeps!</span>")
	if(armed)
		triggermine()
		return
	add_appearance()
	armed = TRUE

/*
Enter & Exit stuff.
*/

/obj/item/grenade/f13/mine/proc/on_entered(datum/source, atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	SIGNAL_HANDLER
	if(!armed)
		return
	if(triggered || !isturf(loc) || !isliving(arrived) || isstructure(arrived) || isnottriggermine(arrived))
		return

	if(arrived.movement_type & FLYING)
		return

	var/mob/living/target = arrived
	if(target.special_a >= 8)
		visible_message("<span class='danger'>[arrived] deftly avoids \the [icon2html(src, viewers(src))] [src]!</span>")
		return

	INVOKE_ASYNC(src, PROC_REF(triggermine), arrived)

/*
The big bang.
*/

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

/obj/item/grenade/f13/mine/proc/mineEffect(mob/victim)
	explosion(loc, range_devastation, range_heavy, range_light, range_flash)

	var/mob/living/target = victim

// Not carbon? Gib.
	if(!ishuman(target))
		target.gib(1, 1)

// Continue otherwise.
	else
		target.adjustBruteLoss(10,65)
		target.Knockdown(400)

		// Pick us a leg, if one exists.
		var/obj/item/bodypart/target_limb = target.get_bodypart(pick(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG))
		// Dismember it.
		target_limb.dismember()

		// Now do wounding damage to the main body.
		var/obj/item/bodypart/chest/O = target.get_bodypart(BODY_ZONE_CHEST)
		O.force_wound_upwards(/datum/wound/burn/critical)
		O.force_wound_upwards(/datum/wound/blunt/critical)

/*
Other stuff.
*/

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
