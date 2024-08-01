/*
Originally from Coyote Bayou, a downstream of Sunset.
Credit to them for their work. Specifically Superlagg, IIRC.
A bunch of edits were made by me to fit Verdant, alongside cleaning it up. - Carl
*/

#define TURRET_STUN 0
#define TURRET_LETHAL 1

#define POPUP_ANIM_TIME 5
#define POPDOWN_ANIM_TIME 5 //Be sure to change the icon animation at the same time or it'll look bad

/// How frequently does the turret visibly swap targets?
#define TURRET_LASER_COOLDOWN_TIME 1 SECONDS
/// How frequently can the turret fire?
#define TURRET_SHOOT_DELAY_BASE 3 SECONDS
/// How frequently does the turret scan for new targets? Beeps if object given loud flag upon scan, too.
#define TURRET_SCAN_RATE 2 SECONDS
/// How much of a grace period do we give players, before hosing them with bullets?
#define TURRET_PREFIRE_DELAY 2 SECONDS
/// How frequently should we fire, when burst firing?
#define TURRET_BURSTFIRE_DELAY 0.2 SECONDS

/// Turret is napping and passively scanning the environment at its own pace
#define TURRET_SLEEP_MODE "sleep_mode"
/// Turret is in Alert Mode and actively shooting a visible target
#define TURRET_ALERT_MODE "alert_mode"
/// Turret is in Caution Mode and actively shooting the last place a target was
#define TURRET_CAUTION_MODE "caution_mode"
/// Turret is in Evasion Mode and actively passively (loudly) scanning the environment for targets
#define TURRET_EVASION_MODE "evasion_mode"

/// The turret becomes angy at whoever shoots it, regardless of other settings
#define TF_SHOOT_REACTION (1<<0)
/// The turret shoots at players
#define TF_SHOOT_PLAYERS (1<<1)
/// The turret shoots at wildlife (ghouls, , etc)
#define TF_SHOOT_SIMPLE_ALL (1<<2)
/// The turret shoots raiders
#define TF_SHOOT_SIMPLE_HOSTILE (1<<3)
/// The turret shoots robots (gutsies, handies)
#define TF_SHOOT_ROBOTS (1<<4)
/// Turret ignores faction checks and treats everything is allowed to shoot as hostile
#define TF_IGNORE_FACTION (1<<5)
/// Turret shines a laser at its target
#define TF_USE_LASER_POINTER (1<<6)
/// Turret stays quiet
#define TF_BE_REALLY_LOUD (1<<7)

/// Default utility flags
#define TURRET_DEFAULT_UTILITY TF_USE_LASER_POINTER | TF_BE_REALLY_LOUD | TF_SHOOT_REACTION
/// Default turret targets
#define TURRET_DEFAULT_TARGET_FLAGS TF_SHOOT_PLAYERS | TF_SHOOT_SIMPLE_ALL | TF_SHOOT_SIMPLE_HOSTILE | TF_SHOOT_ROBOTS

/obj/machinery/porta_turret
	name = "turret"
	icon = 'icons/obj/turrets.dmi'
	icon_state = "turretCover"
	layer = OBJ_LAYER
	invisibility = INVISIBILITY_OBSERVER	//the turret is invisible if it's inside its cover
	density = TRUE
	desc = "An old pre-war turret that shoots at... stuff..."
	use_power = FALSE //this turret does not use and require power
	idle_power_usage = 50 //when inactive, this turret takes up constant 50 Equipment power
	active_power_usage = 300 //when active, this turret takes up constant 300 Equipment power
	req_access = list(ACCESS_LBJ) /// Only people of the sanctuary.
	power_channel = EQUIP //drains power from the EQUIPMENT channel

	max_integrity = 160 //the turret's health
	integrity_failure = 0.5
	armor = list("tier" = 9, "energy" = 100, "bomb" = 60, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)

	/// Base turret icon state
	var/base_icon_state = "standard"
	/// Scan range of the turret for locating targets
	var/scan_range = 7
	/// For turrets inside other objects
	var/atom/base = null
	/// If the turret cover is "open" and the turret is raised
	var/raised = FALSE
	/// If the turret is currently opening or closing its cover
	var/raising = FALSE
	/// If the turret's behaviour control access is locked
	var/locked = TRUE
	/// If the turret responds to control panels
	var/controllock = FALSE
	/// The type of weapon installed by default
	var/installation = /obj/item/gun/energy/e_gun/turret
	/// What stored gun is in the turret
	var/obj/item/gun/stored_gun = null
	/// The charge of the gun when retrieved from wreckage
	var/gun_charge = 0
	/// In which mode is turret in, stun or lethal
	var/mode = TURRET_STUN
	/// Stun mode projectile type
	var/stun_projectile = null
	/// Sound of stun projectile
	var/stun_projectile_sound
	/// Lethal mode projectile type
	var/lethal_projectile = null
	/// Sound of lethal projectile
	var/lethal_projectile_sound
	/// Will stay active
	var/always_up = TRUE
	/// Hides the cover
	var/has_cover = FALSE
	/// The cover that is covering this turret
	var/obj/machinery/porta_turret_cover/cover = null
	/// Turret flags about who is turret allowed to shoot
	var/turret_flags = TURRET_DEFAULT_TARGET_FLAGS | TURRET_DEFAULT_UTILITY
	/// Determines if the turret is on
	var/on = TRUE
	/// Same faction mobs will never be shot at, no matter the other settings
	var/list/faction = list("turret", "wastebot")
	/// The spark system, used for generating... sparks?
	var/datum/effect_system/spark_spread/spark_system
	/// Linked turret control panel of the turret
	var/obj/machinery/turretid/cp = null
	/// The turret will try to shoot from a turf in that direction when in a wall
	var/wall_turret_direction
	/// Only try to shoot people at this status or lower
	var/maximum_valid_stat = /*UN*/CONSCIOUS
	/// The laserpointer the turret uses' icon
	var/icon/turret_pointer_icon = 'icons/obj/projectiles.dmi'
	/// The laserpointer the turret uses
	var/turret_pointer_state = "red_laser"
	/// Time between being told there's a laser there
	COOLDOWN_DECLARE(turret_laser_pointer_antispam)
	/// Minimum time between shots
	var/shot_delay = TURRET_SHOOT_DELAY_BASE
	/// Cooldown for shooting
	COOLDOWN_DECLARE(turret_refire_delay)
	/// Minimum time between shots
	var/prefire_delay = TURRET_PREFIRE_DELAY
	/// Cooldown for shooting
	COOLDOWN_DECLARE(turret_prefire_delay)
	/// Number of "I scanned" beeps to make
	var/scan_ping_max = 3
	/// Number of "I scanned" beeps left to make
	var/scan_pings_left = 0
	/// Rate the turret will scan for targets
	var/scan_rate = TURRET_SCAN_RATE
	/// Number of bursts to make in caution mode
	var/caution_burst_max = 3
	/// Number of bursts left to make in caution mode
	var/caution_bursts_left = 0
	/// We're in caution mode and beeping every time we scan for something
	var/active_scanning = FALSE
	/// Time between scanning for targets
	COOLDOWN_DECLARE(turret_scan_cooldown)
	/// Noise it makes when it sees someone it doesnt like
	var/target_sound = 'modular_badlands/code/modules/rp_misc/sound/turret_active_scan.ogg'
	/// Noise it makes when it scans for targets while interested
	var/scan_ping_sound = 'modular_badlands/code/modules/rp_misc/sound/turret_idle_scan.ogg'
	/// Noise it makes when something activates it
	var/wakeup_sound = 'modular_badlands/code/modules/rp_misc/sound/turret_movement.ogg'
	/// Noise it makes when it gets bored and goes to sleep
	var/sleep_sound = 'modular_badlands/code/modules/rp_misc/sound/turret_sleep.ogg'
	/// Noise it makes when it gets interrupted by someone hitting it
	var/interrupt_sound = 'modular_badlands/code/modules/rp_misc/sound/turret_alarm.ogg'
	/// Are we awake?
	var/awake = FALSE
	/// The last target we had, so we can shoot while still trying to scan
	var/datum/weakref/last_target
	/// For when we can't see our last target, shoot where they were. Kinda obsess on it, too
	var/datum/weakref/last_target_turf
	/// Number of shots in a burst
	var/burst_count = 1
	/// Delay between burst shots
	var/burst_delay = TURRET_BURSTFIRE_DELAY
	/// Inaccuracy in degrees
	var/shot_spread = 15
	/// The bullet we'll use when we try to shoot. This will override the stun and lethal projectile!
	var/obj/item/ammo_casing/casing_type_lethal
	/// The bullet we'll use when we try to shoot. This will override the stun and lethal projectile!
	var/obj/item/ammo_casing/casing_type_stun
	/// Are we shooting?
	var/am_currently_shooting
	/// did we already drop our loot?
	var/dropped_loot
	/// What state are we in?
	var/activity_state = TURRET_SLEEP_MODE

/obj/machinery/porta_turret/Initialize()
	. = ..()
	if(!base)
		base = src
	turret_pointer_state = pick("red_laser","green_laser","blue_laser","purple_laser")
	update_icon()
	//Sets up a spark system
	spark_system = new /datum/effect_system/spark_spread
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)

	setup()
	if(has_cover)
		cover = new /obj/machinery/porta_turret_cover(loc)
		cover.parent_turret = src
		var/mutable_appearance/base = mutable_appearance('icons/obj/turrets.dmi', "basedark")
		base.layer = NOT_HIGH_OBJ_LAYER
		underlays += base
	if(!has_cover)
		INVOKE_ASYNC(src, .proc/popUp)

/obj/machinery/porta_turret/proc/toggle_on(set_to)
	var/current = on
	if (!isnull(set_to))
		on = set_to
	else
		on = !on
	if (current != on)
		check_should_process()
		if (!on)
			popDown()

/obj/machinery/porta_turret/proc/check_should_process()
	if (!on || !anchored || (stat & BROKEN) || !powered())
		//end_processing()
		STOP_PROCESSING(SSfastprocess, src)
		STOP_PROCESSING(SSmachines, src)
		return FALSE
	if(activity_state == TURRET_SLEEP_MODE)
		STOP_PROCESSING(SSfastprocess, src)
		return TRUE
	else
		START_PROCESSING(SSfastprocess, src)
		return TRUE

/obj/machinery/porta_turret/update_icon_state()
	if(!anchored)
		icon_state = "turretCover"
		return
	if(stat & BROKEN)
		icon_state = "[base_icon_state]_broken"
	else
		if(powered())
			if(on && raised)
				switch(mode)
					if(TURRET_STUN)
						icon_state = "[base_icon_state]_stun"
					if(TURRET_LETHAL)
						icon_state = "[base_icon_state]_lethal"
			else
				icon_state = "[base_icon_state]_off"
		else
			icon_state = "[base_icon_state]_unpowered"

/obj/machinery/porta_turret/proc/setup(obj/item/gun/turret_gun)
	if(!stored_gun)
		return
	if(stored_gun)
		qdel(stored_gun)
		stored_gun = null

	if(installation && !turret_gun)
		stored_gun = new installation(src)
	else if (turret_gun)
		stored_gun = turret_gun

	var/list/gun_properties = stored_gun.get_turret_properties()

	//required properties
	stun_projectile = gun_properties["stun_projectile"]
	stun_projectile_sound = gun_properties["stun_projectile_sound"]
	lethal_projectile = gun_properties["lethal_projectile"]
	lethal_projectile_sound = gun_properties["lethal_projectile_sound"]
	base_icon_state = gun_properties["base_icon_state"]

	//optional properties
	if(gun_properties["shot_delay"])
		shot_delay = gun_properties["shot_delay"]

	update_icon()
	return gun_properties

/obj/machinery/porta_turret/Destroy()
	//deletes its own cover with it
	QDEL_NULL(cover)
	base = null
	if(cp)
		cp.turrets -= src
		cp = null
	QDEL_NULL(stored_gun)
	QDEL_NULL(spark_system)
	return ..()

/obj/machinery/porta_turret/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "PortableTurret", name)
		ui.open()

/obj/machinery/porta_turret/ui_data(mob/user)
	var/list/data = list(
		"locked" = locked,
		"on" = on,
		"turret_shoot_players" = turret_flags & TF_SHOOT_PLAYERS,
		"turret_shoot_wildlife" = turret_flags & TF_SHOOT_SIMPLE_ALL,
		"turret_shoot_raiders" = turret_flags & TF_SHOOT_SIMPLE_HOSTILE,
		"turret_shoot_robots" = turret_flags & TF_SHOOT_ROBOTS,
		"turret_shoot_ignore_faction" = turret_flags & TF_IGNORE_FACTION,
		"turret_use_laser_pointer" = turret_flags & TF_USE_LASER_POINTER,
		"turret_make_noise" = turret_flags & TF_BE_REALLY_LOUD,
	)
	return data

/obj/machinery/porta_turret/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	switch(action)
		if("power")
			if(anchored)
				toggle_on()
			else
				to_chat(usr, span_warning("It has to be secured first!"))
				return TRUE
		if("turret_return_shoot_players")
			turret_flags ^= TF_SHOOT_PLAYERS
		if("turret_return_shoot_wildlife")
			turret_flags ^= TF_SHOOT_SIMPLE_ALL
		if("turret_return_shoot_raiders")
			turret_flags ^= TF_SHOOT_SIMPLE_HOSTILE
		if("turret_return_shoot_robots")
			turret_flags ^= TF_SHOOT_ROBOTS
		if("turret_return_ignore_faction")
			turret_flags ^= TF_IGNORE_FACTION
		if("turret_return_use_laser_pointer")
			turret_flags ^= TF_USE_LASER_POINTER
		if("turret_return_make_noise")
			turret_flags ^= TF_BE_REALLY_LOUD
	if(turret_flags & TF_BE_REALLY_LOUD)
		playsound(get_turf(src), "modular_badlands/code/modules/rp_misc/sound/access_accepted.ogg", 100, FALSE, 0, ignore_walls = TRUE)

/obj/machinery/porta_turret/ui_host(mob/user)
	if(has_cover && cover)
		return cover
	if(base)
		return base
	return src

/obj/machinery/porta_turret/power_change()
	. = ..()
	if(!anchored || (stat & BROKEN) || !powered())
		update_icon()
	check_should_process()

/obj/machinery/porta_turret/attackby(obj/item/I, mob/user, params)
	if(stat & BROKEN)
		if(istype(I, /obj/item/crowbar))
			//If the turret is destroyed, you can remove it with a crowbar to
			//try and salvage its components
			to_chat(user, span_notice("You begin prying the metal coverings off..."))
			if(I.use_tool(src, user, 20))
				drop_loot(I, user)
				qdel(src)
				return

	else if((istype(I, /obj/item/wrench)) && (!on))
		if(raised)
			return

		//This code handles moving the turret around. After all, it's a portable turret!
		if(!anchored && !isinspace())
			setAnchored(TRUE)
			invisibility = INVISIBILITY_MAXIMUM
			update_icon()
			to_chat(user, span_notice("You secure the exterior bolts on the turret."))
			if(has_cover)
				cover = new /obj/machinery/porta_turret_cover(loc) //create a new turret. While this is handled in process(), this is to workaround a bug where the turret becomes invisible for a split second
				cover.parent_turret = src //make the cover's parent src
		else if(anchored)
			setAnchored(FALSE)
			to_chat(user, span_notice("You unsecure the exterior bolts on the turret."))
			power_change()
			invisibility = 0
			qdel(cover) //deletes the cover, and the turret instance itself becomes its own cover.

	else if(I.GetID())
		//Behavior lock/unlock mangement
		if(allowed(user))
			locked = !locked
			to_chat(user, span_notice("Controls are now [locked ? "locked" : "unlocked"]."))
		else
			to_chat(user, span_alert("Access denied."))
	else if(istype(I, /obj/item/multitool) && !locked)
		if(!multitool_check_buffer(user, I))
			return
		var/obj/item/multitool/M = I
		M.buffer = src
		to_chat(user, span_notice("You add [src] to multitool buffer."))
	else
		return ..()

/obj/machinery/porta_turret/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	to_chat(user, span_warning("You short out [src]'s threat assessment circuits."))
	audible_message(span_hear("[src] hums oddly..."))
	obj_flags |= EMAGGED
	controllock = TRUE
	toggle_on(FALSE) //turns off the turret temporarily
	update_icon()
	//6 seconds for the traitor to gtfo of the area before the turret decides to ruin his shit
	addtimer(CALLBACK(src, .proc/toggle_on, TRUE), 6 SECONDS)
	//turns it back on. The cover popUp() popDown() are automatically called in process(), no need to define it here

/obj/machinery/porta_turret/emp_act(severity)
	. = ..()
	if (. & EMP_PROTECT_SELF)
		return
	if(on)
		if(prob(50))
			turret_flags |= TF_SHOOT_SIMPLE_ALL

		toggle_on(FALSE)

		addtimer(CALLBACK(src, .proc/toggle_on, TRUE), rand(60,600))

/obj/machinery/porta_turret/take_damage(damage, damage_type = BRUTE, damage_flag = 0, sound_effect = 1, atom/attacked_by)
	. = ..()
	if(. && obj_integrity > 0) //damage received
		spark_system.start()
		if(on && (turret_flags & TF_SHOOT_REACTION) && ismob(attacked_by))
			var/mob/thing_hit_us = attacked_by
			if(!in_faction(thing_hit_us) || CHECK_BITFIELD(turret_flags, TF_IGNORE_FACTION))
				interrupt_and_set_to_alert(attacked_by)

/// dumps loot all over the place
/obj/machinery/porta_turret/proc/drop_loot(obj/item/I, mob/user)
	if(dropped_loot)
		return
	var/turf/right_here = get_turf(src)
	if(!isturf(right_here))
		return
	if(user)
		to_chat(user, span_notice("You remove the turret and salvage some components."))
	if(stored_gun)
		stored_gun.forceMove(right_here)
		stored_gun = null
	new /obj/item/stack/sheet/metal(right_here, rand(10,15))
	new /obj/item/stack/crafting/metalparts(right_here, rand(2,3))
	new /obj/item/stack/crafting/goodparts(right_here, rand(1,2))
	new /obj/item/stack/crafting/electronicparts(right_here, rand(4,6))
	new /obj/item/stack/cable_coil(right_here, rand(15,20))
	if(prob(80))
		new /obj/item/assembly/prox_sensor(right_here)
	if(prob(80))
		new /obj/item/assembly/prox_sensor(right_here)
	var/num_salvage_to_make = 1
	if(user && HAS_TRAIT(user, TRAIT_TECHNOPHREAK))
		num_salvage_to_make++
	for(var/loots in 1 to num_salvage_to_make)
		switch(rand(1,10))
			if(1 to 3)
				new /obj/item/salvage/low(right_here)
			if(4 to 6)
				new /obj/item/salvage/tool(right_here)
			if(7 to 10)
				new /obj/item/salvage/high(right_here)
	dropped_loot = TRUE

/obj/machinery/porta_turret/deconstruct(disassembled = TRUE)
	playsound(get_turf(src), 'modular_badlands/code/modules/rp_misc/sound/interface/break/eqbreak1.ogg', 80, 1, falloff = 10, ignore_walls = TRUE)
	drop_loot(null, null)
	qdel(src)

/obj/machinery/porta_turret/obj_break(damage_flag)
	. = ..()
	if(.)
		playsound(get_turf(src), 'modular_badlands/code/modules/rp_misc/sound/interface/break/eqbreak2.ogg', 80, 1, falloff = 10, ignore_walls = TRUE)
		power_change()
		invisibility = 0
		spark_system.start()	//creates some sparks because they look cool
		qdel(cover)	//deletes the cover - no need on keeping it there!

/obj/machinery/porta_turret/process()
	//the main machinery process
	if(cover == null && anchored)	//if it has no cover and is anchored
		if(stat & BROKEN)	//if the turret is borked
			qdel(cover)	//delete its cover, assuming it has one. Workaround for a pesky little bug
			return
		else
			if(has_cover)
				cover = new /obj/machinery/porta_turret_cover(loc)	//if the turret has no cover and is anchored, give it a cover
				cover.parent_turret = src	//assign the cover its parent_turret, which would be this (src)

	if(!on || (stat & (NOPOWER|BROKEN)))
		return

	if(!check_should_process())
		return
	/// We dont have a target, look for targets. If we just got out of shooting, beep while scanning for a while
	if(activity_state == TURRET_SLEEP_MODE || activity_state == TURRET_EVASION_MODE)
		if(scan_for_targets())
			change_activity_state(TURRET_ALERT_MODE)
		else
			return

	/// We can see our target, start blasting
	if(activity_state == TURRET_ALERT_MODE)
		record_target_weakref(GET_WEAKREF(last_target)) // Update our target and turf's position every time we process
		INVOKE_ASYNC(src, .proc/shine_laser_pointer) // lazer
		if(!can_see_target()) // If we cant see the target, go into caution mode
			change_activity_state(TURRET_CAUTION_MODE)
		else
			INVOKE_ASYNC(src, .proc/open_fire_on_target)

	/// We lost sight of our target, shoot where we last saw them
	if(activity_state == TURRET_CAUTION_MODE)
		INVOKE_ASYNC(src, .proc/shine_laser_pointer)
		INVOKE_ASYNC(src, .proc/open_fire_on_target)
		if(!caution_bursts_left)
			change_activity_state(TURRET_EVASION_MODE)

/// Interrupts our current mode, and sets it to alert
/// For when something hits it and it needs to retaliate
/obj/machinery/porta_turret/proc/interrupt_and_set_to_alert(atom/assailant)
	clear_targets()
	record_target_weakref(assailant)
	if(!last_target && !last_target_turf)
		change_activity_state(TURRET_SLEEP_MODE, TRUE)
		return
	if(turret_flags & TF_BE_REALLY_LOUD)
		playsound(get_turf(src), interrupt_sound, 100, FALSE, falloff = (scan_range + 5), ignore_walls = TRUE)
	change_activity_state(TURRET_ALERT_MODE, TRUE)

/// Interrupts our current mode, and sets it to evasion
/// For when our target is downed
/obj/machinery/porta_turret/proc/interrupt_and_set_to_evasion()
	clear_targets()
	change_activity_state(TURRET_EVASION_MODE, TRUE)

/// Changes our mode to another, and does a thing
/obj/machinery/porta_turret/proc/change_activity_state(new_state, force_it)
	if(new_state == activity_state && !force_it)
		return
	switch(new_state)
		if(TURRET_SLEEP_MODE)
			enter_sleep_mode()
		if(TURRET_ALERT_MODE)
			enter_alert_mode()
		if(TURRET_CAUTION_MODE)
			enter_caution_mode()
		if(TURRET_EVASION_MODE)
			enter_evasion_mode()
	activity_state = new_state
	check_should_process()

/// Clears the cooldowns =3
/obj/machinery/porta_turret/proc/clear_cooldowns()
	COOLDOWN_RESET(src, turret_laser_pointer_antispam)
	COOLDOWN_RESET(src, turret_refire_delay)
	COOLDOWN_RESET(src, turret_prefire_delay)
	COOLDOWN_RESET(src, turret_scan_cooldown)

/// Scans for targets. If we're in evasion mode, also beep
/obj/machinery/porta_turret/proc/scan_for_targets()
	if(COOLDOWN_TIMELEFT(src, turret_scan_cooldown))
		return
	COOLDOWN_START(src, turret_scan_cooldown, scan_rate)
	if(activity_state == TURRET_EVASION_MODE)
		if(scan_pings_left)
			if(turret_flags & TF_BE_REALLY_LOUD)
				playsound(get_turf(src), scan_ping_sound, 100, FALSE, falloff = (scan_range + 5), ignore_walls = TRUE)
			scan_pings_left--
		else
			change_activity_state(TURRET_SLEEP_MODE)
	if(activity_state == TURRET_ALERT_MODE || activity_state == TURRET_CAUTION_MODE)
		return

	for(var/mob/living/potential_target in oview(scan_range, base))
		/// cant shoot whats invisible
		if(potential_target.invisibility > SEE_INVISIBLE_LIVING)
			continue

		/// Ignore target above this stat.
		if(potential_target.stat > maximum_valid_stat)
			continue

		// Ignore stamcritted targets.
		if(IS_STAMCRIT(potential_target))
			continue

		/// If it cares about faction, and the thing's your faction, skip it
		if(!(turret_flags & TF_IGNORE_FACTION))
			if(in_faction(potential_target))
				continue

		/// If its got a client, add it
		if(turret_flags & TF_SHOOT_PLAYERS)
			if(potential_target.client)
				record_target_weakref(potential_target)
				return TRUE

		/// If it's a simple mob, add it. This includes hostiles.
		if(turret_flags & TF_SHOOT_SIMPLE_ALL)
			if(isanimal(potential_target))
				record_target_weakref(potential_target)
				return TRUE

		/// If it's ONLY of the HOSTILE simple mob subpath, we add it.
		if(turret_flags & TF_SHOOT_SIMPLE_HOSTILE)
			if(ishostile(potential_target))
				record_target_weakref(potential_target)
				return TRUE

		/// If if its a robot, add it
		if(turret_flags & TF_SHOOT_ROBOTS)
			if(issilicon(potential_target))
				record_target_weakref(potential_target)
				return TRUE

/// Can we see the target?
/obj/machinery/porta_turret/proc/can_see_target()
	if(!last_target)
		return FALSE
	var/atom/seeable_target = GET_WEAKREF(last_target)
	if(!seeable_target)
		return FALSE
	for(var/turf/T in getline(src,seeable_target))
		if(T.opacity)
			return FALSE
	return TRUE

/// Enter alert mode!
/obj/machinery/porta_turret/proc/enter_alert_mode()
	clear_cooldowns()
	COOLDOWN_START(src, turret_prefire_delay, prefire_delay)
	awake = TRUE

	popUp()
	if(turret_flags & TF_BE_REALLY_LOUD)
		playsound(get_turf(src), target_sound, 100, FALSE, falloff = (scan_range + 5), ignore_walls = TRUE)

	var/mob/our_target = GET_WEAKREF(last_target)

	if(!istype(our_target))
		return

	our_target.visible_message(
		span_alert("[src] swivels its gun around to face <b>[our_target]</b>!"),
		span_userdanger("[src] suddenly aims at you!"),
		span_alert("You hear mechanical whirring!")
		)

/// caution mode is mostly handled elsewhere
/obj/machinery/porta_turret/proc/enter_caution_mode()
	caution_bursts_left = caution_burst_max
	return

/// Set up the beeps
/obj/machinery/porta_turret/proc/enter_evasion_mode()
	clear_cooldowns()
	scan_pings_left = scan_ping_max
	caution_bursts_left = 0

	if(always_up)
		visible_message(span_alert("[src] acquires a new target!"))
	else
		visible_message(span_alert("[src] deploys its active sensors!"))

	if(turret_flags & TF_BE_REALLY_LOUD)
		playsound(get_turf(src), wakeup_sound, 100, FALSE, falloff = (scan_range + 5), ignore_walls = TRUE)

/// telll everyone we're going to sleep
/obj/machinery/porta_turret/proc/enter_sleep_mode()
	clear_cooldowns()
	clear_targets()
	scan_pings_left = 0
	awake = FALSE

	popDown()
	if(always_up)
		visible_message(span_alert("[src] loses its target and goes into passive scanning mode!"))
	else
		visible_message(span_alert("[src] retracts its active sensors and goes into passive scanning mode!"))

	if(turret_flags & TF_BE_REALLY_LOUD)
		playsound(get_turf(src), sleep_sound, 100, FALSE, falloff = (scan_range + 5), ignore_walls = TRUE)

/// clears our targets
/obj/machinery/porta_turret/proc/clear_targets()
	last_target = null
	last_target_turf = null

/// Points a laser at something
/// Kinda ignores line of sight
/obj/machinery/porta_turret/proc/shine_laser_pointer()
	if(!(turret_flags & TF_USE_LASER_POINTER))
		return
	if(COOLDOWN_TIMELEFT(src, turret_laser_pointer_antispam))
		return
	var/turf/where_to_shine = get_turf(activity_state == TURRET_CAUTION_MODE ? GET_WEAKREF(last_target_turf) : GET_WEAKREF(last_target))
	if(!isturf(where_to_shine))
		return
	var/image/I = image(turret_pointer_icon, where_to_shine, turret_pointer_state, -10)
	I.pixel_x = rand(-5,5)
	I.pixel_y = rand(-5,5)
	flick_overlay_view(I, where_to_shine, TURRET_LASER_COOLDOWN_TIME*2)
	COOLDOWN_START(src, turret_laser_pointer_antispam, TURRET_LASER_COOLDOWN_TIME)

/obj/machinery/porta_turret/proc/popUp()	//pops the turret up

	if(!anchored)
		return
	if(raising || raised)
		return
	if(stat & BROKEN)
		return

// Are we a tripod/always up? Skip some and return.
	if(always_up)
		invisibility = 0
		raising = 1
		sleep(POPUP_ANIM_TIME)
		raising = 0
		raised = 1
		layer = MOB_LAYER
		update_icon()
		return

	invisibility = 0
	raising = 1
	if(cover)
		flick("popup", cover)
	sleep(POPUP_ANIM_TIME)
	raising = 0
	if(cover)
		cover.icon_state = "openTurretCover"
	raised = 1
	layer = MOB_LAYER

/obj/machinery/porta_turret/proc/popDown()	//pops the turret down
	if(raising || !raised)
		return
	if(stat & BROKEN)
		return

// Are we a tripod/always up? Skip some and return.
	if(always_up)
		layer = OBJ_LAYER
		raising = 1
		sleep(POPDOWN_ANIM_TIME)
		raising = 0
		raised = 0
		update_icon()
		return

	layer = OBJ_LAYER
	raising = 1
	if(cover)
		flick("popdown", cover)
	sleep(POPDOWN_ANIM_TIME)
	raising = 0
	if(cover)
		cover.icon_state = "turretCover"
	raised = 0
	invisibility = 2
	update_icon()

/// Checks if the target is in the turret's faction
/obj/machinery/porta_turret/proc/in_faction(mob/target)
	for(var/faction1 in faction)
		if(faction1 in target.faction)
			return TRUE
	return FALSE

/// Records our target's weakref, and their turf's weakref
/// Defaults to whatever's being targetttttttttttttttttted
/obj/machinery/porta_turret/proc/record_target_weakref(atom/new_target, just_turf)
	if(!new_target)
		new_target = GET_WEAKREF(last_target)
	var/turf/target_turf = get_turf(new_target)
	if(isturf(target_turf))
		last_target_turf = WEAKREF(target_turf)
	if(just_turf)
		return
	last_target = WEAKREF(new_target)

/// Read our stored weakref targets, pick if we're aiming at the mob or their last turf
/// then pass that to start_shooting to start shooting at it
/// If passed a target, it'll try to shoot at that target. Mainly used for direct control
/obj/machinery/porta_turret/proc/open_fire_on_target(atom/forced_target)
	if(istype(forced_target))
		record_target_weakref(forced_target)
	if((!last_target && !last_target_turf))
		return FALSE
	if(COOLDOWN_TIMELEFT(src, turret_prefire_delay))
		return
	if(COOLDOWN_TIMELEFT(src, turret_refire_delay))
		return
	if(am_currently_shooting)
		return TRUE
	var/turf/target_turf = get_turf(activity_state == TURRET_CAUTION_MODE ? GET_WEAKREF(last_target_turf) : GET_WEAKREF(last_target))
	if(!istype(target_turf))
		return FALSE
	setDir(get_dir(base, target_turf)) //even if you can't shoot, follow the target

	var/turf/our_turf = get_turf(src)
	if(!istype(our_turf))
		return

	//Wall turrets will try to find adjacent empty turf to shoot from to cover full arc
	if(our_turf.density)
		if(wall_turret_direction)
			var/turf/closer = get_step(our_turf,wall_turret_direction)
			if(istype(closer) && !is_blocked_turf(closer) && our_turf.Adjacent(closer))
				our_turf = closer
		else
			var/target_dir = get_dir(our_turf,target_turf)
			for(var/d in list(0,-45,45))
				var/turf/closer = get_step(our_turf,turn(target_dir,d))
				if(istype(closer) && !is_blocked_turf(closer) && our_turf.Adjacent(closer))
					our_turf = closer
					break

	update_icon()

	COOLDOWN_START(src, turret_refire_delay, shot_delay)
	am_currently_shooting = TRUE
	for(var/burst in 1 to burst_count)
		setDir(get_dir(base, target_turf))
		if(shoot_at_target(target_turf, our_turf))
			sleep(burst_delay)
		else
			interrupt_and_set_to_evasion()
			am_currently_shooting = FALSE
			caution_bursts_left = 0
			return FALSE
	am_currently_shooting = FALSE
	if(caution_bursts_left)
		caution_bursts_left--
	if(forced_target)
		clear_targets()
	return TRUE

/// Fires one shot at the target -- but only if they're okay
/// typically only fed a turf, so if nyou're gonna ncheck for nmobs, locate them on the turf
/obj/machinery/porta_turret/proc/shoot_at_target(atom/movable/target, turf/our_turf)
	if(!target || !our_turf)
		return FALSE
	target = turf_has_valid_target(get_turf(target))
	if(!target)
		return FALSE
	if(mode == TURRET_STUN)
		playsound(src, stun_projectile_sound)
	else
		playsound(src, lethal_projectile_sound)

	var/the_spread = rand(-shot_spread, shot_spread)
	if(casing_type_lethal)
		var/obj/item/ammo_casing/casing
		if(mode == TURRET_STUN)
			casing = new casing_type_stun(our_turf)
		else
			casing = new casing_type_lethal(our_turf)
		if(!casing)
			return FALSE
		casing.fire_casing(
			target = target,
			user = src,
			params = null,
			distro = shot_spread,
			quiet = null,
			zone_override = ran_zone(),
			spread = the_spread,
			fired_from = src
			)
		qdel(casing)
	else
		var/obj/item/projectile/turret_projectile
		if(mode == TURRET_STUN)
			turret_projectile = new stun_projectile(our_turf)
		else
			turret_projectile = new lethal_projectile(our_turf)
		turret_projectile.preparePixelProjectile(target, our_turf, spread = the_spread)
		turret_projectile.firer = src
		turret_projectile.fired_from = src
		turret_projectile.fire()
	return TRUE

/// Checks if someone on the turf is okay to shoot
/// Returns true if someone in the turf is alive and well
/// Also returns true if nobody's on the turf
/// otherwise it returns false and interrupts the shooting loop
/// oh yeah it returns the mob on the turf if it finds a shootable one
/// and the turf if nobody's on the turf
/// basically throw a corpse at the dot to make it think ur dead
/obj/machinery/porta_turret/proc/turf_has_valid_target(turf/the_turf)
	var/turf_has_nobody_on_it = TRUE
	for(var/mob/living/person in the_turf.contents)
		turf_has_nobody_on_it = FALSE
		if(person.health <= 0)
			continue // Stop stop, its probably dead!
		if(person.stat > maximum_valid_stat)
			continue // Stop stop, he's likely dead!
		if(IS_STAMCRIT(person))
			continue // Stop stop, he's stamcritted to shit!
		return person
	return turf_has_nobody_on_it ? the_turf : null

/obj/machinery/porta_turret/proc/setState(on, mode)
	if(controllock)
		return

	toggle_on(on)
	src.mode = mode
	power_change()

/obj/machinery/porta_turret/example
	installation = null
	use_power = NO_POWER_USE
	has_cover = 0
	scan_range = 9
	mode = TURRET_LETHAL
	stun_projectile = /obj/item/projectile/bullet
	lethal_projectile = /obj/item/projectile/bullet
	lethal_projectile_sound = 'sound/weapons/gunshot.ogg'
	stun_projectile_sound = 'sound/weapons/gunshot.ogg'
	icon_state = "syndie_off"
	base_icon_state = "syndie"
	desc = "A ballistic machine gun auto-turret."

/obj/machinery/porta_turret/example/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_SELF | EMP_PROTECT_WIRES)

/obj/machinery/porta_turret/example/setup()
	return

////////////////////////
//Turret Control Panel//
////////////////////////

/obj/machinery/turretid
	name = "turret control panel"
	desc = "Used to control a room's automated defenses."
	icon = 'icons/obj/machines/turret_control.dmi'
	icon_state = "control_standby"
	density = FALSE
	req_access = list(ACCESS_LBJ)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	/// Variable dictating if linked turrets are active and will shoot targets
	var/enabled = TRUE
	/// Variable dictating if linked turrets will shoot lethal projectiles
	var/lethal = FALSE
	/// Variable dictating if the panel is locked, preventing changes to turret settings
	var/locked = TRUE
	/// An area in which linked turrets are located, it can be an area name, path or nothing
	var/control_area = null
	/// AI is unable to use this machine if set to TRUE
	var/ailock = FALSE
	/// List of all linked turrets
	var/list/turrets = list()

/obj/machinery/turretid/Initialize(mapload, ndir = 0, built = 0)
	. = ..()
	if(built)
		setDir(ndir)
		locked = FALSE
		pixel_x = (dir & 3)? 0 : (dir == 4 ? -24 : 24)
		pixel_y = (dir & 3)? (dir ==1 ? -24 : 24) : 0
	power_change() //Checks power and initial settings

/obj/machinery/turretid/Destroy()
	turrets.Cut()
	return ..()

/obj/machinery/turretid/Initialize(mapload) //map-placed turrets autolink turrets
	. = ..()
	if(!mapload)
		return

	if(control_area)
		control_area = get_area_instance_from_text(control_area)
		if(control_area == null)
			control_area = get_area(src)
			stack_trace("Bad control_area path for [src], [src.control_area]")
	else if(!control_area)
		control_area = get_area(src)

	for(var/obj/machinery/porta_turret/T in control_area)
		turrets |= T
		T.cp = src

/obj/machinery/turretid/examine(mob/user)
	. += ..()
	if(issilicon(user) && !(stat & BROKEN))
		. += {"<span class='notice'>Ctrl-click [src] to [ enabled ? "disable" : "enable"] turrets.</span>
					<span class='notice'>Alt-click [src] to set turrets to [ lethal ? "stun" : "kill"].</span>"}

/obj/machinery/turretid/attackby(obj/item/I, mob/user, params)
	if(stat & BROKEN)
		return

	if (istype(I, /obj/item/multitool))
		if(!multitool_check_buffer(user, I))
			return
		var/obj/item/multitool/M = I
		if(M.buffer && istype(M.buffer, /obj/machinery/porta_turret))
			turrets |= M.buffer
			to_chat(user, span_notice("You link \the [M.buffer] with \the [src]."))
			return

	if (issilicon(user))
		return attack_hand(user)

	if ( get_dist(src, user) == 0 )		// trying to unlock the interface
		if (allowed(usr))
			if(obj_flags & EMAGGED)
				to_chat(user, span_warning("The turret control is unresponsive!"))
				return

			locked = !locked
			to_chat(user, span_notice("You [ locked ? "lock" : "unlock"] the panel."))
		else
			to_chat(user, span_alert("Access denied."))

/obj/machinery/turretid/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	to_chat(user, span_notice("You short out the turret controls' access analysis module."))
	obj_flags |= EMAGGED
	locked = FALSE

/obj/machinery/turretid/attack_ai(mob/user)
	if(!ailock || IsAdminGhost(user))
		return attack_hand(user)
	else
		to_chat(user, span_warning("There seems to be a firewall preventing you from accessing this device!"))

/obj/machinery/turretid/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "TurretControl", name)
		ui.open()

/obj/machinery/turretid/ui_data(mob/user)
	var/list/data = list()
	data["locked"] = locked
	data["siliconUser"] = hasSiliconAccessInArea(user) || IsAdminGhost(user)
	data["enabled"] = enabled
	data["lethal"] = lethal
	return data

/obj/machinery/turretid/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	switch(action)
		if("lock")
			if(!hasSiliconAccessInArea(usr) && !IsAdminGhost(usr))
				return
			if((obj_flags & EMAGGED) || (stat & BROKEN))
				to_chat(usr, span_warning("The turret control is unresponsive!"))
				return
			locked = !locked
			return TRUE
		if("power")
			toggle_on(usr)
			return TRUE
		if("mode")
			toggle_lethal(usr)
			return TRUE

/obj/machinery/turretid/proc/toggle_lethal(mob/user)
	lethal = !lethal
	add_hiddenprint(user)
	log_combat(user, src, "[lethal ? "enabled" : "disabled"] lethals on")
	updateTurrets()

/obj/machinery/turretid/proc/toggle_on(mob/user)
	enabled = !enabled
	add_hiddenprint(user)
	log_combat(user, src, "[enabled ? "enabled" : "disabled"]")
	updateTurrets()

/obj/machinery/turretid/proc/updateTurrets()
	for (var/obj/machinery/porta_turret/aTurret in turrets)
		aTurret.setState(enabled, lethal)
	update_icon()

/obj/machinery/turretid/update_icon_state()
	if(stat & NOPOWER)
		icon_state = "control_off"
	else if (enabled)
		if (lethal)
			icon_state = "control_kill"
		else
			icon_state = "control_stun"
	else
		icon_state = "control_standby"

/obj/item/wallframe/turret_control
	name = "turret control frame"
	desc = "Used for building turret control panels."
	icon_state = "apc"
	result_path = /obj/machinery/turretid
	custom_materials = list(/datum/material/iron=MINERAL_MATERIAL_AMOUNT)

/obj/item/gun/proc/get_turret_properties()
	. = list()
	.["lethal_projectile"] = null
	.["lethal_projectile_sound"] = null
	.["stun_projectile"] = null
	.["stun_projectile_sound"] = null
	.["base_icon_state"] = "standard"

/obj/item/gun/energy/get_turret_properties()
	. = ..()

	var/obj/item/ammo_casing/primary_ammo = ammo_type[1]

	.["stun_projectile"] = initial(primary_ammo.projectile_type)
	.["stun_projectile_sound"] = initial(primary_ammo.fire_sound)

	if(ammo_type.len > 1)
		var/obj/item/ammo_casing/secondary_ammo = ammo_type[2]
		.["lethal_projectile"] = initial(secondary_ammo.projectile_type)
		.["lethal_projectile_sound"] = initial(secondary_ammo.fire_sound)
	else
		.["lethal_projectile"] = .["stun_projectile"]
		.["lethal_projectile_sound"] = .["stun_projectile_sound"]

/obj/item/gun/ballistic/get_turret_properties()
	. = ..()
	var/obj/item/ammo_box/mag = mag_type
	var/obj/item/ammo_casing/primary_ammo = initial(mag.ammo_type)

	.["base_icon_state"] = "syndie"
	.["stun_projectile"] = initial(primary_ammo.projectile_type)
	.["stun_projectile_sound"] = initial(primary_ammo.fire_sound)
	.["lethal_projectile"] = .["stun_projectile"]
	.["lethal_projectile_sound"] = .["stun_projectile_sound"]

/obj/item/gun/energy/e_gun/turret/get_turret_properties()
	. = ..()

/* * * * * * * * * * * *
 * Fallout 13 turrets  *
 * * * * * * * * * * * */

/// Generic 9mm hates-everything turret
/obj/machinery/porta_turret/f13
	name = "old autoturret"
	icon = 'icons/obj/turrets.dmi'
	icon_state = "syndie_off"
	base_icon_state = "syndie"
	desc = "An old automatic gun turret chambered in 9mm. Would rather to be left alone to ponder how it's still shooting after all these years."
	density = TRUE
	max_integrity = 160
	integrity_failure = 0.5
	always_up = TRUE
	scan_range = 9
	mode = TURRET_LETHAL
	installation = null
	turret_flags = TURRET_DEFAULT_TARGET_FLAGS | TURRET_DEFAULT_UTILITY
	stun_projectile = /obj/item/projectile/bullet/c9mm
	lethal_projectile = /obj/item/projectile/bullet/c9mm
	lethal_projectile_sound = 'sound/f13weapons/9mm.ogg'
	stun_projectile_sound = 'sound/f13weapons/9mm.ogg'
