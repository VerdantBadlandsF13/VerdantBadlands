//IN THIS DOCUMENT: Rifle template, Lever-action rifles, Bolt-action rifles, Magazine-fed bolt-action rifles
////////////////////
// RIFLE TEMPLATE //
////////////////////

/obj/item/gun/ballistic/rifle
	name = "rifle template"
	desc = "Should not exist"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "shotgun"
	item_state = "shotgun"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	can_automatic = FALSE
	slowdown = 0.5
	fire_delay = 6
	spread = 0
	force = 15 //Decent clubs generally speaking
	flags_1 =  CONDUCT_1
	casing_ejector = FALSE
	var/recentpump = 0 // to prevent spammage
	spawnwithmagazine = TRUE
	var/pump_sound = 'sound/weapons/shotgunpump.ogg'
	fire_sound = 'sound/f13weapons/shotgun.ogg'
	var/pump_stam_cost = 2

/obj/item/gun/ballistic/rifle/process_chamber(mob/living/user, empty_chamber = 0)
	return ..() //changed argument value

/obj/item/gun/ballistic/rifle/can_shoot()
	return !!chambered?.BB

/obj/item/gun/ballistic/rifle/attack_self(mob/living/user)
	if(recentpump > world.time)
		return
	if(IS_STAMCRIT(user))//CIT CHANGE - makes pumping shotguns impossible in stamina softcrit
		to_chat(user, "<span class='warning'>You're too exhausted for that.</span>")//CIT CHANGE - ditto
		return//CIT CHANGE - ditto
	pump(user, TRUE)
	if(HAS_TRAIT(user, TRAIT_FAST_PUMP))
		recentpump = world.time + 2
	else
		recentpump = world.time + 10
		if(istype(user))//CIT CHANGE - makes pumping shotguns cost a lil bit of stamina.
			user.adjustStaminaLossBuffered(pump_stam_cost) //CIT CHANGE - DITTO. make this scale inversely to the strength stat when stats/skills are added
	return

/obj/item/gun/ballistic/rifle/blow_up(mob/user)
	. = 0
	if(chambered && chambered.BB)
		process_fire(user, user, FALSE)
		. = 1

/obj/item/gun/ballistic/rifle/proc/pump(mob/M, visible = TRUE)
	if(visible)
		M.visible_message("<span class='warning'>[M] racks [src].</span>", "<span class='warning'>You rack [src].</span>")
	playsound(M, pump_sound, 60, 1)
	pump_unload(M)
	pump_reload(M)
	update_icon()	//I.E. fix the desc
	return 1

/obj/item/gun/ballistic/rifle/proc/pump_unload(mob/M)
	if(chambered)//We have a shell in the chamber
		chambered.forceMove(drop_location())//Eject casing
		chambered.bounce_away()
		chambered = null

/obj/item/gun/ballistic/rifle/proc/pump_reload(mob/M)
	if(!magazine.ammo_count())
		return 0
	var/obj/item/ammo_casing/AC = magazine.get_round() //load next casing.
	chambered = AC

/obj/item/gun/ballistic/rifle/examine(mob/user)
	. = ..()
	if (chambered)
		. += "A [chambered.BB ? "live" : "spent"] one is in the chamber."



///////////////////
//REPEATER RIFLES//
///////////////////

/obj/item/gun/ballistic/rifle/repeater
	name = "repeater template"
	desc = "should not exist"
	can_scope = TRUE
	scope_state = "scope_long"
	fire_delay = 3
	slowdown = 0.2
	scope_x_offset = 5
	scope_y_offset = 13
	pump_sound = 'sound/f13weapons/cowboyrepeaterreload.ogg'

/obj/item/gun/ballistic/rifle/repeater/shoot_live_shot(mob/living/user, pointblank = FALSE, mob/pbtarget, message = 1, stam_cost = 0)
	..()
	src.pump(user)

/obj/item/gun/ballistic/rifle/repeater/cowboy
	name = "Winchester Model 1873"
	desc = "A lever action rifle chambered in .357 Magnum."
	icon_state = "cowboyrepeater"
	item_state = "cowboyrepeater"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube357
	extra_speed = 300
	recoil = 0.8
	fire_sound = 'sound/f13weapons/cowboyrepeaterfire.ogg'
	extra_damage = 4

/obj/item/gun/ballistic/rifle/repeater/trail
	name = "Marlin Model 1894"
	desc = "A lever action rifle chambered in .44 Magnum."
	icon_state = "trailcarbine"
	item_state = "trailcarbine"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube44
	extra_speed = 200
	recoil = 0.12
	fire_sound = 'sound/f13weapons/44mag.ogg'
	extra_damage = 4

/obj/item/gun/ballistic/rifle/repeater/brush
	name = "Marlin Model 1895"
	desc = "A hefty lever action rifle chambered in the heavy 45-70 round."
	icon_state = "brushgun"
	item_state = "brushgun"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube4570
	extra_speed = 100
	fire_delay = 3
	recoil = 0.15
	fire_sound = 'sound/f13weapons/brushgunfire.ogg'
	extra_penetration = 0.12

////////////////////////
// BOLT ACTION RIFLES //
////////////////////////

/obj/item/gun/ballistic/rifle/hunting
	name = "hunting rifle"
	desc = "A sturdy hunting rifle, chambered in .308. <br>\
	Made some point after the Great War, it's a well crafted firearm."
	icon_state = "308"
	item_state = "308"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/hunting
	sawn_desc = "A hunting rifle, crudely shortened with a saw. It's far from accurate, but the short barrel makes it quite portable."
	fire_delay = 4
	extra_speed = 800
	spread = 0
	force = 18
	can_scope = TRUE
	scope_state = "scope_long"
	scope_x_offset = 4
	scope_y_offset = 12
	pump_sound = 'sound/weapons/boltpump.ogg'
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'

/obj/item/gun/ballistic/rifle/hunting/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/rifle/mosin
	name = "Mosin-Nagant M38"
	desc = "A rusty old Russian bolt action chambered in 7.62."
	icon_state = "mosin"
	item_state = "308"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction
	extra_speed = 600
	fire_delay = 3
	force = 18
	extra_penetration = 0.8
	extra_damage = 6
	can_scope = TRUE
	scope_state = "scope_mosin"
	scope_x_offset = 3
	scope_y_offset = 13
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	pump_sound = 'sound/weapons/boltpump.ogg'
	fire_sound = 'sound/f13weapons/boltfire.ogg'

/obj/item/gun/ballistic/rifle/enfield
	name = "Lee-Enfield rifle"
	desc = "A british rifle sometimes known as the SMLE. It seems to have been re-chambered in .308."
	icon_state = "enfield2"
	item_state = "308"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction_enfield
	extra_speed = 600
	fire_delay = 1
	slowdown = 0.35
	force = 16
	extra_penetration = 0.6
	extra_damage = 12
	can_scope = TRUE
	scope_state = "scope_mosin"
	scope_x_offset = 3
	scope_y_offset = 13
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	pump_sound = 'sound/weapons/boltpump.ogg'
	fire_sound = 'sound/f13weapons/boltfire.ogg'
	pump_stam_cost = 15

/////////////////////////////////////
// MAGAZINE FED BOLT-ACTION RIFLES //
/////////////////////////////////////

/obj/item/gun/ballistic/rifle/mag
	name = "magazine fed bolt-action rifle template"
	desc = "should not exist."
	extra_speed = 800

/obj/item/gun/ballistic/rifle/mag/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Alt-click to remove the magazine.</span>"

/obj/item/gun/ballistic/rifle/mag/AltClick(mob/living/user)
	var/obj/item/ammo_casing/AC = chambered //Find chambered round
	if(magazine)
		magazine.forceMove(drop_location())
		user.put_in_hands(magazine)
		magazine.update_icon()
		if(magazine.ammo_count())
			playsound(src, 'sound/weapons/gun_magazine_remove_full.ogg', 70, 1)
		else
			playsound(src, "gun_remove_empty_magazine", 70, 1)
		magazine = null
		to_chat(user, "<span class='notice'>You pull the magazine out of \the [src].</span>")
	else if(chambered)
		AC.forceMove(drop_location())
		AC.bounce_away()
		chambered = null
		to_chat(user, "<span class='notice'>You unload the round from \the [src]'s chamber.</span>")
		playsound(src, "gun_slide_lock", 70, 1)
	else
		to_chat(user, "<span class='notice'>There's no magazine in \the [src].</span>")
	update_icon()
	return

/obj/item/gun/ballistic/rifle/mag/update_icon_state()
	icon_state = "[initial(icon_state)][magazine ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"]"


//Anti-Material Rifle						Keywords: .50, Bolt-action, 8 round magazine
/obj/item/gun/ballistic/rifle/mag/antimateriel
	name = "\improper Hécate II AMR"
	desc = "The Hécate II is a heavy, high-powered bolt action sniper rifle chambered in .50 caliber ammunition. Lacks an iron sight."
	icon_state = "amr"
	item_state = "amr"
	mag_type = /obj/item/ammo_box/magazine/amr
	fire_delay = 22
	recoil = 10
	slowdown = 1.45 //.20 higher than the M1919 MMG.
	spread = 0
	force = 10 //Big clumsy and sensitive scope, makes for a poor club
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	fire_sound = 'sound/f13weapons/antimaterielfire.ogg'
	pump_sound = 'sound/f13weapons/antimaterielreload.ogg'

/obj/item/gun/ballistic/rifle/mag/antimateriel/shoot_live_shot(mob/living/user, pointblank = FALSE, mob/pbtarget, message = 1, stam_cost = 0)
	..()
	if(HAS_TRAIT(user, TRAIT_FAST_PUMP))
		src.pump(user)
	if((prob(95) && !zoomed))
		var/mob/living/carbon/human/H = user
		playsound(loc, 'sound/f13effects/surrender.ogg', 100, 1)
		shake_camera(user, recoil + 1, recoil)
		to_chat(user, "<span class ='danger'>You attempt to fire the rifle from the hip unprepared, tossing you to the ground!</span>")
		H.visible_message("<span class='danger'>[H] drops to the floor from recoil as they fire unprepared!</span>")
		user.Knockdown(60)
