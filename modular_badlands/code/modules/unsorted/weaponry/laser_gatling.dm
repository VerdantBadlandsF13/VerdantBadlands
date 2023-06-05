/*
Proper GL below.
*/

/obj/item/gun/energy/minigunlas_individual
	name = "\improper H&K L30"
	desc = "An advanced laser cannon with an incredible rate of fire. <br>\
	This specific example has been heavily modified, unable to be recharged with the typical cells it used prior. <br>\
	Because of the modifications, it has been refitted for electron charge packs."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "minigun"
	item_state = "minigun"
	flags_1 = CONDUCT_1
	slowdown = 1// Meant for PA users.
	item_flags = NEEDS_PERMIT | SLOWS_WHILE_IN_HAND
	slot_flags = null// No thanks!
	w_class = WEIGHT_CLASS_HUGE
	custom_materials = null
	burst_size = 1
	burst_shot_delay = 1
	automatic = 1
	autofire_shot_delay = 1
	spread = 8
	fire_delay = 1
	fire_sound = 'sound/f13weapons/WattzRifleFire.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/gatling)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	var/weapon_heat = 1
	var/overheat = 0
	var/overheat_max = 80
	var/heat_stage = 0
	var/heat_diffusion = 2
	special_weapon = TRUE

/obj/item/gun/energy/minigunlas_individual/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/gun/energy/minigunlas_individual/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/gun/energy/minigunlas_individual/process()
	overheat = max(0, overheat - heat_diffusion)

/obj/item/gun/energy/minigunlas_individual/attack_self(mob/living/user)
	return

/obj/item/gun/energy/minigunlas_individual/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0, stam_cost = 0)
	flick("minigun_act", src)
	if(weapon_heat)
		if(overheat > overheat_max * (1 / 3) && heat_stage < 1)
			to_chat(user, "You feel warmth from the handle of the gun.")
			heat_stage += 1
			..()

		if(overheat > overheat_max * (2 / 3) && heat_stage < 2)
			to_chat(user, "The gun's heat sensor beeps rapidly as it reaches its limit!")
			heat_stage += 1
			..()

		if(overheat < overheat_max)
			overheat += burst_size
			..()

		if(overheat < overheat_max)
			overheat += burst_size
			..()
		else
			to_chat(user, "The gun's heat sensor locked the trigger to prevent lens damage.")

/*
Old GL below.
*/

//The ammo/gun is stored in a back slot item
/obj/item/minigunlaspack
	name = "\improper H&K L30 backpack power source"
	desc = "The massive external power source for the laser gatling gun."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "holstered"
	item_state = "backpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	var/obj/item/gun/energy/minigunlas/gun
	var/armed = 0 //whether the gun is attached, 0 is attached, 1 is the gun is wielded.
	var/overheat = 0
	var/overheat_max = 80
	var/heat_stage = 0
	var/heat_diffusion = 2 //How much heat is lost per tick

/obj/item/minigunlaspack/Initialize()
	. = ..()
	gun = new(src)
	START_PROCESSING(SSobj, src)

/obj/item/minigunlaspack/Destroy()
	QDEL_NULL(gun)
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/minigunlaspack/process()
	overheat = max(0, overheat - heat_diffusion)

/obj/item/minigunlaspack/on_attack_hand(mob/living/carbon/user)
	if(src.loc == user)
		if(!armed)
			if(user.get_item_by_slot(SLOT_BACK) == src)
				armed = 1
				if(!user.put_in_hands(gun))
					armed = 0
					to_chat(user, "<span class='warning'>You need a free hand to hold the gun!</span>")
					return
				update_icon()
				user.update_inv_back()
		else
			to_chat(user, "<span class='warning'>You are already holding the gun!</span>")
	else
		..()

/obj/item/minigunlaspack/attackby(obj/item/W, mob/user, params)
	if(W == gun) //Don't need armed check, because if you have the gun assume its armed.
		user.dropItemToGround(gun, TRUE)
	else
		..()

/obj/item/minigunlaspack/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Current heat level: [overheat] / [overheat_max]"

/obj/item/minigunlaspack/dropped(mob/user)
	. = ..()
	if(armed)
		user.dropItemToGround(gun, TRUE)

/obj/item/minigunlaspack/MouseDrop(atom/over_object)
	. = ..()
	if(armed)
		return
	if(iscarbon(usr))
		var/mob/M = usr

		if(!over_object)
			return

		if(!M.incapacitated())

			if(istype(over_object, /obj/screen/inventory/hand))
				var/obj/screen/inventory/hand/H = over_object
				M.putItemFromInventoryInHandIfPossible(src, H.held_index)


/obj/item/minigunlaspack/update_icon_state()
	if(armed)
		icon_state = "notholstered"
	else
		icon_state = "holstered"

/obj/item/minigunlaspack/proc/attach_gun(mob/user)
	if(!gun)
		gun = new(src)
	gun.forceMove(src)
	armed = 0
	if(user)
		to_chat(user, "<span class='notice'>You attach the [gun.name] to the [name].</span>")
	else
		src.visible_message("<span class='warning'>The [gun.name] snaps back onto the [name]!</span>")
	update_icon()
	user.update_inv_back()

/obj/item/gun/energy/minigunlas
	name = "\improper H&K L30"
	desc = "An advanced laser cannon with an incredible rate of fire. <br>\
	This specific example has been heavily modified, unable to be recharged with the typical cells it used prior. <br>\
	Because of the modifications, it requires a bulky backpack power source to use, alongside being refitted for electron charge packs."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "minigun_spin"
	item_state = "minigun"
	flags_1 = CONDUCT_1
	slowdown = 1
	slot_flags = null
	w_class = WEIGHT_CLASS_HUGE
	custom_materials = null
	burst_size = 1
	burst_shot_delay = 1
	automatic = 1
	autofire_shot_delay = 1.2
	spread = 8
	fire_delay = 1
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/f13weapons/WattzRifleFire.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/gatling)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	item_flags = NEEDS_PERMIT | SLOWS_WHILE_IN_HAND
	special_weapon = TRUE
	var/obj/item/minigunlaspack/ammo_pack

/obj/item/gun/energy/minigunlas/Initialize()
	if(istype(loc, /obj/item/minigunlaspack)) //We should spawn inside an ammo pack so let's use that one.
		ammo_pack = loc
	else
		return INITIALIZE_HINT_QDEL //No pack, no gun

	return ..()

/obj/item/gun/energy/minigunlas/Destroy()
	ammo_pack = null
	return ..()

/obj/item/gun/energy/minigunlas/attack_self(mob/living/user)
	return

/obj/item/gun/energy/minigunlas/dropped(mob/user)
	. = ..()
	if(ammo_pack)
		ammo_pack.attach_gun(user)
	else
		qdel(src)

/obj/item/gun/energy/minigunlas/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0, stam_cost = 0)
	if(ammo_pack)
		if(ammo_pack.overheat > ammo_pack.overheat_max * (1 / 3) && ammo_pack.heat_stage < 1)
			to_chat(user, "You feel warmth from the handle of the gun.")
			ammo_pack.heat_stage += 1
			..()

		if(ammo_pack.overheat > ammo_pack.overheat_max * (2 / 3) && ammo_pack.heat_stage < 2)
			to_chat(user, "The gun's heat sensor beeps rapidly as it reaches its limit!")
			ammo_pack.heat_stage += 1
			..()

		if(ammo_pack.overheat < ammo_pack.overheat_max)
			ammo_pack.overheat += burst_size
			..()

		if(ammo_pack.overheat < ammo_pack.overheat_max)
			ammo_pack.overheat += burst_size
			..()
		else
			to_chat(user, "The gun's heat sensor locked the trigger to prevent lens damage.")

/obj/item/gun/energy/minigunlas/afterattack(atom/target, mob/living/user, flag, params)
	if(!ammo_pack || ammo_pack.loc != user)
		to_chat(user, "You need the backpack power source to fire the gun!")
	. = ..()
