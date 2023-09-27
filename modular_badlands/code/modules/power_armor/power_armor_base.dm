/////////////////
// Power Armor //
/////////////////
/datum/action/item_action/toggle/pa_cell
	button_icon_state = "pa_cell"

/datum/action/item_action/toggle/pa_toggle
	button_icon_state = "pa_onoff"

/obj/item/clothing/suit/armored/f13/power_armor
	w_class = WEIGHT_CLASS_HUGE
	slowdown = 4
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES
	item_flags = SLOWS_WHILE_IN_HAND
	clothing_flags = THICKMATERIAL
	equip_delay_self = 50
	equip_delay_other = 60
	strip_delay = 600
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	protected_zones = list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

	repair_kit = /obj/item/repair_kit/pa_repair_kit

	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 20)
	salvage_tool_behavior = TOOL_WELDER
	/// Path of item that this set of armor gets salvaged into
	var/obj/item/salvaged_type = null
	/// Used to track next tool required to salvage the suit
	var/salvage_step = 0

	deflection_chance = 50// Chance for the power armor to redirect a low AP projectile.
	armor_block_chance = 100// Chance for the power armor to ignore a low AP projectile.
	melee_block_threshold = 42// If an object's force is lower than this, the PA ignores it.
	dmg_block_threshold = 42// Damage from ANYTHING at or above this value bypasses PA protection.
	durability_threshold = 15
	var/emped = 0
	var/requires_training = TRUE
	var/armor_block_threshold = 0.6 //projectiles with AP below this will be ignored.

	actions_types = list(/datum/action/item_action/toggle/pa_cell, /datum/action/item_action/toggle/pa_toggle)

	var/obj/item/stock_parts/cell_pa/power_cell = null
	var/mob/living/carbon/human/current_user = null

	var/default_power_usage = 10
	var/current_power_usage = null
	var/enabled = FALSE

/obj/item/clothing/suit/armored/f13/power_armor/mob_can_equip(mob/user, mob/equipper, slot, disable_warning = 1)
	var/mob/living/carbon/human/H = user
	if(src == H.wear_suit) //Suit is already equipped
		return ..()
	if (!HAS_TRAIT(H, TRAIT_PA_WEAR) && slot == SLOT_WEAR_SUIT && requires_training)
		to_chat(user, "<span class='warning'>You don't have the proper training to operate the power armor!</span>")
		return FALSE
	if(slot == SLOT_WEAR_SUIT)
		return ..()
	return

/obj/item/clothing/suit/armored/f13/power_armor/Initialize()
	. = ..()
	current_power_usage = default_power_usage

/obj/item/clothing/suit/armored/f13/power_armor/process(mob/user)
	if(!power_cell || !power_cell.using(current_power_usage) || !enabled)
		enabled = FALSE
		remove_traits(user)
		to_chat(usr, "<span class='boldwarning'>[src] deactivates!.</span>")
		STOP_PROCESSING(SSobj, src)

/obj/item/clothing/suit/armored/f13/power_armor/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle/pa_cell))
		ejectInsertCell()
		return

	if(istype(actiontype, /datum/action/item_action/toggle/pa_toggle))
		onOffPA()
		return

/obj/item/clothing/suit/armored/f13/power_armor/verb/onOffPA(mob/user)
	set name = "Toggle Power"
	set category = "Power Armor"
	set src in view(1)

	if(!power_cell || power_cell.charge <= 0)
		to_chat(usr, "<span class='userdanger'>There's no power.</span>")
		return

	if(enabled)
		if(do_after(usr, 5, target = loc))
			to_chat(usr, "<span class='green'>[src] activated.</span>")
			powerControl()
			assign_traits(user)// Just in case, so we're sure it's assigned.
	else
		if(do_after(usr, 5, target = loc))
			remove_traits(user)// Just in case, so we're sure it's removed.
			to_chat(usr, "<span class='notice'>[src] deactivated.</span>")

/obj/item/clothing/suit/armored/f13/power_armor/verb/ejectInsertCell()
	set name = "Manipulate Fusion Core"
	set category = "Power Armor"
	set src in view(1)

	if(!power_cell)
		if(istype(usr.get_active_held_item(), /obj/item/stock_parts/cell_pa))
			if(do_after(usr, 15, target = loc))
				power_cell = usr.get_active_held_item()
				usr.drop_all_held_items()
				power_cell.forceMove(src)
				powerControl()
				to_chat(usr, "<span class='notice'>You inserted [power_cell.name] to [src].</span>")
				playsound(src.loc, "modular_badlands/code/modules/rp_misc/sound/access_rejected.ogg", 40, 0, 0)
				return
		to_chat(usr, "<span class='warning'>There's no fusion core!</span>")
		return
	else
		if(do_after(usr, 10, target = loc))
			to_chat(usr, "<span class='green'>You ejected [power_cell.name] from [src].</span>")
			playsound(src.loc, "modular_badlands/code/modules/rp_misc/sound/pulling/pull_closet[rand(1,6)].ogg", 40, 0, 0)
			usr.put_in_hands(power_cell)
			power_cell = null

/obj/item/clothing/suit/armored/f13/power_armor/proc/powerControl(mob/user)
	var/mob/living/L = loc
	if(!power_cell || power_cell.charge <= 0)
		enabled = FALSE
		remove_traits(user)
		var/unpowered_slowdown = 4
		unpowered_slowdown = 4
		slowdown += unpowered_slowdown
		L.update_equipment_speed_mods()
		playsound(src.loc, "modular_badlands/code/modules/rp_misc/sound/access_rejected.ogg", 40, 0, 0)
		STOP_PROCESSING(SSobj, src)
		return
	else
		enabled = TRUE
		assign_traits(user)
		var/powered_slowdown = 1
		powered_slowdown = 1
		slowdown += powered_slowdown
		L.update_equipment_speed_mods()
		playsound(src.loc, 'modular_badlands/code/modules/rp_misc/sound/access_accepted.ogg', 40, 0, 0)
		START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/armored/f13/power_armor/equipped(mob/user, slot)
	..()
	if(slot == SLOT_WEAR_SUIT && enabled)
		enabled = TRUE
		assign_traits(user)
		START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/armored/f13/power_armor/dropped(mob/user)
	..()
	if(enabled)
		enabled = FALSE
		remove_traits(user)
		STOP_PROCESSING(SSobj, src)

/obj/item/clothing/suit/armored/f13/power_armor/proc/assign_traits(mob/user)
	ADD_TRAIT(user, TRAIT_STUNIMMUNE, PA_TRAIT)
	ADD_TRAIT(user, TRAIT_PUSHIMMUNE, PA_TRAIT)
	ADD_TRAIT(user, SPREAD_CONTROL, PA_TRAIT)
	ADD_TRAIT(user, TRAIT_SHOCKIMMUNE, PA_TRAIT)
	ADD_TRAIT(user, TRAIT_IGNOREDAMAGESLOWDOWN, PA_TRAIT)
	ADD_TRAIT(user, TRAIT_NOSLIPALL, PA_TRAIT)
	ADD_TRAIT(user, TRAIT_NODISMEMBER, PA_TRAIT)
	ADD_TRAIT(user, TRAIT_FORCED_STANDING, PA_TRAIT)
	ADD_TRAIT(user, TRAIT_POWER_ARMOR, PA_TRAIT) // General effects from being in PA

/obj/item/clothing/suit/armored/f13/power_armor/proc/remove_traits(mob/user)
	REMOVE_TRAIT(user, TRAIT_STUNIMMUNE, PA_TRAIT)
	REMOVE_TRAIT(user, TRAIT_PUSHIMMUNE, PA_TRAIT)
	REMOVE_TRAIT(user, SPREAD_CONTROL, PA_TRAIT)
	REMOVE_TRAIT(user, TRAIT_SHOCKIMMUNE, PA_TRAIT)
	REMOVE_TRAIT(user, TRAIT_IGNOREDAMAGESLOWDOWN, PA_TRAIT)
	REMOVE_TRAIT(user, TRAIT_NOSLIPALL, PA_TRAIT)
	REMOVE_TRAIT(user, TRAIT_NODISMEMBER, PA_TRAIT)
	REMOVE_TRAIT(user, TRAIT_FORCED_STANDING, PA_TRAIT)
	REMOVE_TRAIT(user, TRAIT_POWER_ARMOR, PA_TRAIT) // General effects from being in PA

/obj/item/clothing/suit/armored/f13/power_armor/emp_act(mob/living/carbon/human/owner, severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		to_chat(loc, "<span class='warning'>Warning: An electromagnetic pulse has been detected, but was negated by automated rerouting.</span>")
		return
	if(!enabled)
		return
	if(!emped)
		if(isliving(loc))
			var/mob/living/L = loc
			var/induced_slowdown = 0
			if(severity >= 41) //heavy emp
				induced_slowdown = 4
				power_cell.emp_act(severity)
				to_chat(L, "<span class='boldwarning'>Warning: Severe electromagnetic surge detected in armor. Rerouting power to emergency systems.</span>")
				playsound(src, 'sound/f13effects/emp_pa.ogg', 80, 1)
			else
				induced_slowdown = 2
				power_cell.emp_act(severity)
				to_chat(L, "<span class='warning'>Warning: Light electromagnetic surge detected in armor. Rerouting power to emergency systems.</span>")
				playsound(src, 'sound/f13effects/emp_pa.ogg', 80, 1)
			emped = TRUE
			slowdown += induced_slowdown
			L.update_equipment_speed_mods()
			addtimer(CALLBACK(src, .proc/end_emp_effect, induced_slowdown), 50)
	return

/obj/item/clothing/suit/armored/f13/power_armor/proc/end_emp_effect(slowdown_induced)
	emped = FALSE
	slowdown -= slowdown_induced // Even if armor is dropped it'll fix slowdown
	if(isliving(loc))
		var/mob/living/L = loc
		to_chat(L, "<span class='warning'>Armor power reroute successful. All systems operational.</span>")
		L.update_equipment_speed_mods()

/obj/item/clothing/suit/armored/f13/power_armor/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	. = ..()

	if(damage >= src.dmg_block_threshold && check_armor_penetration(object) >= 0)
		return

	if(src.armor_durability<60)
		return

// Only AP of a certain caliber should present a threat. Otherwise? Ignore.
	if(check_armor_penetration(object) <= src.armor_block_threshold && (attack_type == ATTACK_TYPE_PROJECTILE) && (def_zone in protected_zones))
		if(prob(armor_block_chance))
			var/ratio = rand(0,100)
			if(ratio <= deflection_chance)
				block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
				return BLOCK_SHOULD_REDIRECT | BLOCK_REDIRECTED | BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>Your power armor absorbs the projectile's impact!</span>")
				shake_camera(owner, 3, 1)
			block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
			return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

// Melee should very rarely do anything.
	if(damage <= src.melee_block_threshold && (attack_type == ATTACK_TYPE_MELEE) && (def_zone in protected_zones))
		if(prob(armor_block_chance))
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>Your power armor shrugs off the strike!</span>")
				shake_camera(owner, 3, 1)
			block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
			return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

// Unarmed should NEVER do anything.
	if(attack_type == ATTACK_TYPE_UNARMED)
		to_chat(loc, "<span class='warning'>Your power armor shrugs off the strike!</span>")
		shake_camera(owner, 3, 1)
		block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
		return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

	return

/obj/item/clothing/suit/armored/f13/power_armor/attackby(obj/item/I, mob/living/carbon/human/user, params)
	if(ispath(salvaged_type))
		switch(salvage_step)
			if(0)
				// Salvage
				if(istype(I, /obj/item/screwdriver))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before salvaging it.</span>")
						return
					to_chat(user, "<span class='notice'>You begin unsecuring the wiring cover...</span>")
					if(I.use_tool(src, user, 60, volume=50))
						salvage_step = 1
						to_chat(user, "<span class='notice'>You unsecure the wiring cover.</span>")
					return
			if(1)
				// Salvage
				if(istype(I, /obj/item/wirecutters))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before salvaging it.</span>")
						return
					to_chat(user, "<span class='notice'>You start to cut down the wiring...</span>")
					if(I.use_tool(src, user, 80, volume=50))
						salvage_step = 2
						to_chat(user, "<span class='notice'>You disconnect the wires.</span>")
					return
				// Fix
				if(istype(I, /obj/item/screwdriver))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before fixing it.</span>")
						return
					to_chat(user, "<span class='notice'>You begin securing the wiring cover...</span>")
					if(I.use_tool(src, user, 60, volume=50))
						salvage_step = 0
						to_chat(user, "<span class='notice'>You secure the wiring cover.</span>")
					return
			if(2)
				// Salvage
				if(istype(I, /obj/item/wrench))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before salvaging it.</span>")
						return
					to_chat(user, "<span class='notice'>You start loosening the bolts that secure components to the frame...</span>")
					if(I.use_tool(src, user, 100, volume=50))
						salvage_step = 3
						to_chat(user, "<span class='notice'>You disconnect the inner components.</span>")
					return
				// Fix
				if(istype(I, /obj/item/wirecutters))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before fixing it.</span>")
						return
					to_chat(user, "<span class='notice'>You begin placing wires back into their place...</span>")
					if(I.use_tool(src, user, 80, volume=50))
						salvage_step = 1
						to_chat(user, "<span class='notice'>You re-connect the wires.</span>")
					return
			if(3)
				// Salvage
				if(istype(I, /obj/item/weldingtool))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before salvaging it.</span>")
						return
					to_chat(user, "<span class='notice'>You begin slicing the servomotors apart from the frame...</span>")
					if(I.use_tool(src, user, 150, volume=60))
						salvage_step = 4
						to_chat(user, "<span class='notice'>You disconnect servomotors from the main frame.</span>")
					return
				// Fix
				if(istype(I, /obj/item/wrench))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before fixing it.</span>")
						return
					to_chat(user, "<span class='notice'>You start securing components to the frame...</span>")
					if(I.use_tool(src, user, 100, volume=50))
						salvage_step = 2
						to_chat(user, "<span class='notice'>You re-connect the inner components.</span>")
					return
			if(4)
				// Salvage
				if(istype(I, /obj/item/crowbar))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before salvaging it.</span>")
						return
					to_chat(user, "<span class='notice'>You start to remove remaining components...</span>")
					if(I.use_tool(src, user, 50, volume=70))
						to_chat(user, "<span class='notice'>You finish salvaging the suit.</span>")
						var/obj/item/ST = new salvaged_type(src)
						user.put_in_hands(ST)
						qdel(src)
					return
				// Fix
				if(istype(I, /obj/item/weldingtool))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before fixing it.</span>")
						return
					to_chat(user, "<span class='notice'>You begin welding the servomotors to the frame...</span>")
					if(I.use_tool(src, user, 150, volume=60))
						salvage_step = 3
						to_chat(user, "<span class='notice'>You re-connect servomotors to the main frame.</span>")
					return
	return ..()

/obj/item/clothing/suit/armored/f13/power_armor/examine(mob/user)
	. = ..()
	. += "If armor durability falls below 60%, the suit will no longer fully protect you."
	if(ispath(salvaged_type))
		. += salvage_hint()


/obj/item/clothing/suit/armored/f13/power_armor/proc/salvage_hint()
	switch(salvage_step)
		if(0)
			return "<span class='notice'>The wiring cover is <i>screwed</i> in place.</span>"
		if(1)
			return "<span class='notice'>The cover is <i>screwed</i> open and <i>wires</i> are visible.</span>"
		if(2)
			return "<span class='warning'>The wiring has been <i>cut</i> and components connected with <i>bolts</i> are visible.</span>"
		if(3)
			return "<span class='warning'>The components have been <i>unanchored</i> servomotors inside the suit can be <i>sliced through</i>.</span>"
		if(4)
			return "<span class='warning'>The servomotors have been <i>sliced apart</i> from the frame and remaining components can be <i>pried away</i>.</span>"
