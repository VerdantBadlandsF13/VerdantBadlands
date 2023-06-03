//IN THIS DOCUMENT: Automatic template, SMGs, Carbines, Semi-auto rifles, Assault rifles, Machineguns and Misc.
//////////////////////
//AUTOMATIC TEMPLATE//
//////////////////////

/obj/item/gun/ballistic/automatic
	name = "automatic gun template"
	desc = "should not be here, bugreport."
	slowdown = 0.5
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = 0
	force = 15
	burst_size = 1
	burst_shot_delay = 3
	var/automatic_burst_overlay = TRUE
	var/semi_auto = FALSE
	var/auto_eject = 0
	var/auto_eject_sound = null
	var/alarmed = 0
	var/select = 1
	var/is_automatic = FALSE
	can_suppress = FALSE
	equipsound = 'sound/f13weapons/equipsounds/riflequip.ogg'
	var/set_burst_size = 1 //Added for Gun Mods System

/obj/item/gun/ballistic/automatic/examine(mob/user)
	. = ..()
	if (auto_sear)
		. += "It has an automatic sear installed."
	else if (can_automatic && semi_auto)
		. += "It has room to install an extra <b>automatic sear</b> for select-fire capabilities."

/obj/item/gun/ballistic/automatic/attackby(obj/item/I, mob/user, params)
	if(user.a_intent == INTENT_HARM)
		return ..()
	else if(istype(I, /obj/item/attachments/auto_sear))
		var/obj/item/attachments/auto_sear/A = I
		if(!auto_sear && can_automatic && semi_auto)
			if(!user.transferItemToLoc(I, src))
				return
			auto_sear = A
			src.burst_size += 1
			src.spread += 6
			src.recoil += 0.1
			src.automatic_burst_overlay = TRUE
			src.semi_auto = FALSE
			to_chat(user, "<span class='notice'>You attach \the [A] to \the [src].</span>")
			update_icon()
	else
		return ..()

/obj/item/gun/ballistic/automatic/update_overlays()
	. = ..()
	if(automatic_burst_overlay)
		if(!select)
			. += ("[initial(icon_state)]semi")
		if(select == 1)
			. += "[initial(icon_state)]burst"

/obj/item/gun/ballistic/automatic/update_icon_state()
	icon_state = "[initial(icon_state)][magazine ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(A, /obj/item/ammo_box/magazine))
		var/obj/item/ammo_box/magazine/AM = A
		if(istype(AM, mag_type))
			var/obj/item/ammo_box/magazine/oldmag = magazine
			if(user.transferItemToLoc(AM, src))
				magazine = AM
				if(oldmag)
					to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src], replacing the magazine.</span>")
					oldmag.forceMove(get_turf(src.loc))
					oldmag.update_icon()
				else
					to_chat(user, "<span class='notice'>You insert the magazine into \the [src].</span>")

				playsound(user, 'sound/weapons/autoguninsert.ogg', 60, 1)
				chamber_round()
				A.update_icon()
				update_icon()
				return 1
			else
				to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")

/obj/item/gun/ballistic/automatic/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_firemode))
		if(is_automatic == FALSE)
			burst_select()
		if(is_automatic == TRUE)
			auto_select()
	else
		return ..()

/obj/item/gun/ballistic/automatic/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	if(semi_auto)
		to_chat(user, "<span class = 'notice'>This weapon is semi-automatic only.</span>")
		return
	else
		select = !select
		if(!select)
			disable_burst()
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
		else
			//enable_burst()//Removed for Gun Mods System
			if(set_burst_size != null && set_burst_size > 1)
				burst_size = set_burst_size
			else
				enable_burst()
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		playsound(user, 'sound/weapons/empty.ogg', 100, 1)
		update_icon()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/gun/ballistic/automatic/proc/auto_select()
	var/mob/living/carbon/human/user = usr
	if(semi_auto)
		to_chat(user, "<span class = 'notice'>This weapon is semi-automatic only.</span>")
		return
	else
		select = !select
		if(!select)
			disable_auto()
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
		else
			enable_auto()
			to_chat(user, "<span class='notice'>You switch to automatic fire.</span>")
		playsound(user, 'sound/weapons/empty.ogg', 100, 1)
		update_icon()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/gun/ballistic/automatic/proc/enable_burst()
	burst_size = initial(burst_size)
	if(auto_sear)
		burst_size += initial(burst_size)
	if(burst_improvement)
		burst_size += initial(burst_size)
	if(burst_improvement && auto_sear)
		burst_size += 1 + initial(burst_size)

/obj/item/gun/ballistic/automatic/proc/disable_burst()
	burst_size = initial(burst_size)

/obj/item/gun/ballistic/automatic/proc/enable_auto()
	automatic = 1

/obj/item/gun/ballistic/automatic/proc/disable_auto()
	automatic = 0

/obj/item/gun/ballistic/automatic/can_shoot()
	return get_ammo()

/obj/item/gun/ballistic/automatic/proc/empty_alarm()
	if(!chambered && !get_ammo() && !alarmed)
		playsound(src.loc, 'sound/weapons/smg_empty_alarm.ogg', 40, 1)
		update_icon()
		alarmed = 1
	return

/obj/item/gun/ballistic/automatic/afterattack(atom/target, mob/living/user)
	..()
	if(auto_eject && magazine && magazine.stored_ammo && !magazine.stored_ammo.len && !chambered)
		magazine.dropped()
		user.visible_message(
			"[magazine] falls out and clatters on the floor!",
			"<span class='notice'>[magazine] falls out and clatters on the floor!</span>"
		)
		if(auto_eject_sound)
			playsound(user, auto_eject_sound, 40, 1)
		magazine.forceMove(get_turf(src.loc))
		magazine.update_icon()
		magazine = null
		update_icon()

///////////////////
//SUBMACHINE GUNS//
///////////////////

/obj/item/gun/ballistic/automatic/smg/
	name = "SMG TEMPLATE"
	desc = "should not exist"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_prefix = "uzi"
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_HEAVY //Automatic fire and onehanded use mix poorly.
	slowdown = 0.4
	fire_delay = 3.75
	burst_shot_delay = 3
	spread = 10
	force = 12
	actions_types = list(/datum/action/item_action/toggle_firemode)

/obj/item/gun/ballistic/automatic/smg/american180
	name = "\improper American-180"
	desc = "An integrally suppressed submachinegun chambered in the common .22 long rifle. It's fed from a top loaded drum magazine."
	icon_state = "smg22"
	item_state = "shotgun"
	slowdown = 0.25
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/m22smg
	can_unsuppress = FALSE
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.75
	spread = 18
	burst_shot_delay = 1.5
	suppressed = 1
	actions_types = null
	fire_sound = 'sound/f13weapons/american180.ogg'

/obj/item/gun/ballistic/automatic/smg/greasegun
	name = "\improper M3A1 'Grease Gun'"
	desc = "An inexpensive submachine gun, rechambered in 9mm."
	icon_state = "grease_gun"
	item_state = "smg9mm"
	mag_type = /obj/item/ammo_box/magazine/greasegun
	spread = 8
	slowdown = 0.3
	burst_shot_delay = 2.75
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.5
	can_attachments = TRUE
	suppressor_state = "uzi_suppressor"
	suppressor_x_offset = 26
	suppressor_y_offset = 19
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/greasegun.ogg'

/obj/item/gun/ballistic/automatic/smg/greasegun/auto_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			automatic = 1
			spread = 14
			fire_delay = 3.25
			recoil = 0.1
			weapon_weight = WEAPON_HEAVY
			to_chat(user, "<span class='notice'>You switch to automatic fire.</span>")
			enable_burst()
		if(1)
			select = 0
			automatic = 0
			fire_delay = 3.25
			spread = 2
			weapon_weight = WEAPON_MEDIUM
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/smg/tommygun
	name = "Thompson SMG"
	desc = "A powerful submachinegun chambered in .45 ACP. \
	This weapon fires at a blistering rate with a heavy pistol cartridge, and can accept very high capacity magazines, to boot."
	icon_state = "tommygun"
	item_state = "shotgun"
	slowdown = 0.4
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/tommygunm45
	init_mag_type = /obj/item/ammo_box/magazine/tommygunm45/stick
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.25
	burst_shot_delay = 2.75
	fire_delay = 3.75
	spread = 15
	recoil = 0.5

//P90				Keywords: 10mm, Automatic, 50 rounds. Special modifiers: damage +1
/obj/item/gun/ballistic/automatic/smg/p90
	name = "\improper FN P90c"
	desc = "The Fabrique Nationale P90c was just coming into use at the time of the war. \
	The weapon's bullpup layout, and compact design, make it easy to control. \
	The durable P90c is prized for its reliability, and high firepower in a ruggedly-compact package. Chambered in 10mm."
	icon_state = "p90"
	item_state = "m90"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m10mm_p90
	burst_size = 1
	fire_delay = 3
	spread = 14
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2
	burst_shot_delay = 2.5
	recoil = 0.25
	can_suppress = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 29
	suppressor_y_offset = 16
	fire_sound = 'sound/f13weapons/10mm_fire_03.ogg'
	slowdown = 0.2

/obj/item/gun/ballistic/automatic/smg/mp5
	name = "\improper H&K MP5SD"
	desc = "An integrally suppressed submachinegun chambered in 9mm."
	icon_state = "mp5"
	item_state = "fnfal"
	mag_type = /obj/item/ammo_box/magazine/uzim9mm
	spread = 6
	fire_delay = 3.5
	slowdown = 0.25
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.15
	burst_shot_delay = 2
	suppressed = 1
	recoil = 0.05
	can_attachments = TRUE
	can_suppress = FALSE
	can_unsuppress = FALSE
	fire_sound = 'sound/weapons/Gunshot_silenced.ogg'

////////////////////
//SEMI-AUTO RIFLES//
////////////////////

/obj/item/gun/ballistic/automatic/rangemaster
	name = "Colt Rangemaster"
	desc = "A Colt Rangemaster semi-automatic rifle, chambered for .223. Single-shot only."
	icon_state = "rangemaster"
	item_state = "308"
	icon_prefix = "308"
	force = 20
	mag_type = /obj/item/ammo_box/magazine/m762
	burst_size = 1
	fire_delay = 4
	slowdown = 0.3
	spread = 1
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	can_attachments = TRUE
	can_scope = TRUE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 24
	knife_y_offset = 21
	scope_state = "scope_long"
	scope_x_offset = 4
	scope_y_offset = 11
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'

/obj/item/gun/ballistic/automatic/m1garand
	name = "\improper M1 Garand"
	desc = "The WWII American Classic. Still has that satisfiying ping."
	icon_state = "m1garand"
	item_state = "rifle"
	icon_prefix = "308"
	force = 20
	slowdown = 0.2
	mag_type = /obj/item/ammo_box/magazine/garand308
	fire_delay = 2
	burst_size = 1
	spread = 1
	en_bloc = 1
	auto_eject = 1
	semi_auto = TRUE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	can_scope = TRUE
	scope_state = "scope_long"
	scope_x_offset = 5
	scope_y_offset = 14
	auto_eject_sound = 'sound/f13weapons/garand_ping.ogg'
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'

/obj/item/gun/ballistic/automatic/m1garand/update_icon()
	..()
	icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/automatic/m1garand/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return

/obj/item/gun/ballistic/automatic/marksman/sniper
	name = "\improper DKS 501"
	desc = "A DKS 501, chambered in .308 Winchester.  With a light polymer body, it's suited for long treks through the desert."
	icon_prefix = "sniperrifle"
	icon_state = "sniper_rifle"
	item_state = "sniper_rifle"
	mag_type = /obj/item/ammo_box/magazine/w308
	fire_delay = 3
	burst_size = 1
	extra_speed = 900
	slowdown = 0.3
	zoom_amt = 10
	zoom_out_amt = 13
	semi_auto = TRUE
	can_automatic = FALSE
	can_bayonet = FALSE
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'
	extra_penetration = 0.25
	extra_damage = 10

//////////////////
//ASSAULT RIFLES//
//////////////////

/obj/item/gun/ballistic/automatic/assault_rifle
	name = "\improper R91 assault rifle"
	desc = "The R91 was the standard US Army assault rifle, and so saw wide-spread use after the war. Most are worn out by now."
	icon_state = "assault_rifle"
	item_state = "fnfal"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_delay = 2.5
	slowdown = 0.35
	spread = 10
	recoil = 0.1
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.5
	can_attachments = TRUE
	can_bayonet = FALSE
	bayonet_state = "rifles"
	knife_x_offset = 23
	knife_y_offset = 11
	can_suppress = TRUE
	suppressor_x_offset = 32
	suppressor_y_offset = 15
	suppressor_state = "ar_suppressor"
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'
	extra_damage = -3
	extra_penetration = 0.05

/obj/item/gun/ballistic/automatic/type93
	name = "\improper Type 93 assault rifle"
	desc = "The Type 93 Chinese assault rifle was designed and manufactured by a Chinese industrial conglomerate for the People's Liberation Army during the Resource Wars, for the purpose of equipping the Chinese infiltrators and American fifth-columnists. Chambered in 5.56x45."
	icon_state = "type93"
	item_state = "handmade_rifle"
	icon_prefix = "handmade_rifle"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_delay = 4
	spread = 10
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 3
	recoil = 0.1
	can_suppress = TRUE
	suppressor_state = "rifle_suppressor"
	suppressor_x_offset = 27
	suppressor_y_offset = 27
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'

/obj/item/gun/ballistic/automatic/bozar
	name = "Bozar"
	desc = "The ultimate refinement of the sniper's art, the Bozar is a scoped, accurate, light machine gun that will make nice big holes in your enemy. Uses 5.56."
	icon_state = "bozar"
	item_state = "sniper"
	slot_flags = SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2
	burst_shot_delay = 1.5
	fire_delay = 3
	spread = 8
	recoil = 0.1
	can_attachments = FALSE
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	can_scope = FALSE
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/bozar_fire.ogg'
	extra_damage = -3

//FN-FAL				Keywords: 7.62mm, Automatic, 10/20 round magazine
/obj/item/gun/ballistic/automatic/fnfal
	name = "FN FAL"
	desc = "This rifle has been more widely used by armed forces than any other rifle in history. \
	A reliable assault weapon for any terrain or tactical situation."
	icon_state = "fnfal"
	item_state = "fnfal"
	force = 20
	extra_speed = 100
	fire_delay = 3.5
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.9
	mag_type = /obj/item/ammo_box/magazine/m762
	spread = 12 //infamously hard to control on full-auto
	recoil = 0.25
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'

//H&K G11				Keywords: 4.73mm, Automatic, 50 round magazine
/obj/item/gun/ballistic/automatic/g11
	name = "\improper G11"
	desc = "This experimental gun fires a caseless cartridge consisting of a block of propellant with a bullet buried inside. \
	The weight and space savings allows for a very high magazine capacity. Chambered in 4.73mm. \
	Given the rarity, it's usually seen in the hands of pre-war fanatics."
	icon_state = "g11"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/m473
	burst_size = 1
	fire_delay = 2
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.5
	burst_shot_delay = 1.5
	spread = 8
	recoil = 0.1
	can_attachments = TRUE
	semi_auto = TRUE
	can_scope = FALSE
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	actions_types = list(/datum/action/item_action/toggle_firemode)
	select = 0

////////////////
//MACHINE-GUNS//
////////////////

/obj/item/gun/ballistic/automatic/lsw
	name = "Light Support Weapon"
	desc = "This squad-level support weapon has a bullpup design. The bullpup design makes it difficult to use while lying down. \
	Because of this it was remanded to National Guard units. It, however, earned a reputation as a reliable weapon that packs a lot of punch for its size."
	icon = 'icons/obj/guns/projectile.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "lsw"
	item_state = "lsw"
	slowdown = 1
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_delay = 4.5
	burst_shot_delay = 2
	is_automatic = TRUE
	automatic = 1
	spread = 12
	spawnwithmagazine = TRUE
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	can_attachments = TRUE
	can_scope = FALSE
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	extra_damage = -5
	extra_penetration = 0.15

/obj/item/gun/ballistic/automatic/m1919
	name = "\improper Browning M1919"
	desc = "An archaic weapon from a simpler time. It's loud, heavy and terrifying."
	icon_state = "M38"
	item_state = "M38"
	slot_flags = 0
	slowdown = 1.25
	mag_type = /obj/item/ammo_box/magazine/mm762
	burst_shot_delay = 1.5
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.1
	fire_delay = 2
	spread = 8
	can_attachments = FALSE
	var/cover_open = FALSE
	var/require_twohands = FALSE
	actions_types = null
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'

/obj/item/gun/ballistic/automatic/m1919/update_icon()
	icon_state = "M38[cover_open ? "open" : "closed"][magazine ? CEILING(get_ammo(0)/20, 1)*20 : "-empty"]"
	item_state = "M38[cover_open ? "open" : "closed"][magazine ? "mag" : "nomag"]"

/obj/item/gun/ballistic/automatic/m1919/examine(mob/user)
	. = ..()
	if(cover_open && magazine)
		. += "<span class='notice'>It seems like you could use an <b>empty hand</b> to remove the magazine.</span>"

/obj/item/gun/ballistic/automatic/m1919/attack_self(mob/user)
	cover_open = !cover_open
	to_chat(user, "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>")
	if(cover_open)
		playsound(user, 'sound/weapons/sawopen.ogg', 60, 1)
	else
		playsound(user, 'sound/weapons/sawclose.ogg', 60, 1)
	update_icon()

/obj/item/gun/ballistic/automatic/m1919/afterattack(atom/target as mob|obj|turf, mob/living/user as mob|obj, flag, params) //what I tried to do here is just add a check to see if the cover is open or not and add an icon_state change because I can't figure out how c-20rs do it with overlays
	if(cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
	else
		. = ..()
		update_icon()

/obj/item/gun/ballistic/automatic/m1919/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(loc != user)
		..()
		return	//let them pick it up
	if(!cover_open || (cover_open && !magazine))
		..()
	else if(cover_open && magazine)
		//drop the mag
		magazine.update_icon()
		magazine.forceMove(drop_location())
		user.put_in_hands(magazine)
		magazine = null
		update_icon()
		to_chat(user, "<span class='notice'>You remove the magazine from [src].</span>")
		playsound(user, 'sound/weapons/magout.ogg', 60, 1)

/obj/item/gun/ballistic/automatic/m1919/attackby(obj/item/A, mob/user, params)
	if(!cover_open && istype(A, mag_type))
		to_chat(user, "<span class='warning'>[src]'s cover is closed! You can't insert a new mag.</span>")
		return
	..()

////////
//MISC//
////////

//M72 Gauss rifle
/obj/item/gun/ballistic/automatic/m72
	name = "\improper M72 gauss rifle"
	desc = "The M72 rifle is of German design. It uses an electromagnetic field to propel rounds at tremendous speed... and pierce almost any obstacle. \
	Its range, accuracy and stopping power is almost unparalleled."
	icon_state = "m72"
	item_state = "sniper"
	slot_flags = SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/m2mm
	burst_size = 1
	fire_delay = 10
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	recoil = 2
	semi_auto = TRUE
	fire_sound = 'sound/f13weapons/gauss_rifle.ogg'
