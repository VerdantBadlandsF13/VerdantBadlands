/*
The Fat Man.
Properly dangerous.
*/
/obj/item/ammo_box/magazine/internal/fatman
	name = "mini nuke launch platform"
	ammo_type = /obj/item/ammo_casing/caseless/fatman
	caliber = "mn"
	max_ammo = 1

/obj/item/ammo_casing/caseless/fatman
	name = "\improper mini nuke"
	desc = "A football sized nuclear warhead. How'd you get this?"
	caliber = "mn"
	icon = 'modular_badlands/code/modules/unsorted/icons/fatman.dmi'
	icon_state = "mini_nuke"
	projectile_type = /obj/item/projectile/bullet/rocket/fatman
	is_pickable = FALSE

/obj/item/projectile/bullet/rocket/fatman
	name ="\improper mini nuke"
	desc = "Boom."
	icon = 'modular_badlands/code/modules/unsorted/icons/fatman.dmi'
	icon_state = "mini_nuke_proj"
	damage = 250// How would you even get hit by this in the first place?
	armour_penetration = 1
	ricochets_max = 0
	shrapnel_magnitude = 2

/obj/item/projectile/bullet/rocket/fatman/on_hit(atom/target, blocked=0)
	..()
	explosion(target, 0, 3, 12, 12, TRUE, TRUE, 12, FALSE, TRUE)

	for(var/mob/living/carbon/human/victim in view(src,6))//Step of six for radiation.
		if(istype(victim) && victim.stat != DEAD)
			victim.rad_act(12500)//I'm sorry, little one. :(
	new /obj/effect/temp_visual/explosion/nuke(get_turf(target))
	radiation_pulse(src, 3500)
	for(var/turf/open/turf in view(src,2))//Probably too little?
		if(istype(turf))
			var/obj/effect/decal/waste/WS = locate() in turf.contents
			if(!WS)
				WS = new/obj/effect/decal/waste(turf)
	qdel(src)
	return BULLET_ACT_HIT

/obj/item/gun/ballistic/fatman
	name = "\improper Fat Man"
	desc = "A launch platform for a football sized nuclear warhead. <br>\
	This specific model appears to be fitted with a rangefinder."
	icon = 'modular_badlands/code/modules/unsorted/icons/fatman.dmi'
	icon_state = "fatman"
	item_state = "fatman"
	mag_type = /obj/item/ammo_box/magazine/internal/fatman
	fire_sound = 'modular_badlands/code/modules/unsorted/sound/fatman_fire.ogg'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = null// NO
	can_suppress = FALSE
	can_scope = FALSE
	casing_ejector = FALSE
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	burst_size = 1
	slowdown = 1
	fire_delay = 0
	inaccuracy_modifier = 0.25
	scope_name = "rangefinder"
	weapon_weight = WEAPON_HEAVY
	magazine_wording = "mini nuke"

/obj/item/gun/ballistic/fatman/handle_atom_del(atom/A)
	if(A == chambered)
		chambered = null
		if(!QDELETED(magazine))
			QDEL_NULL(magazine)
	if(A == magazine)
		magazine = null
		if(!QDELETED(chambered))
			QDEL_NULL(chambered)
	update_icon()
	return ..()

/obj/item/gun/ballistic/fatman/can_shoot()
	return chambered?.BB

/obj/item/gun/ballistic/fatman/attack_self_tk(mob/user)
	return // Lets not have remote reloads. Thanks.

/obj/item/gun/ballistic/fatman/attack_self(mob/living/user)
	if(magazine)
		var/obj/item/ammo_casing/AC = chambered
		if(AC)
			if(!user.put_in_hands(AC))
				AC.bounce_away(FALSE, NONE)
			to_chat(user, "<span class='notice'>You remove \the [AC] from \the [src]!</span>")
			playsound(src, 'modular_badlands/code/modules/unsorted/sound/fatman_unload.ogg', 70, TRUE)
			chambered = null
		else
			to_chat(user, "<span class='notice'>There's no [magazine_wording] in [src].</span>")
	update_icon()

/obj/item/gun/ballistic/fatman/attackby(obj/item/A, mob/user, params)
	if(magazine && istype(A, /obj/item/ammo_casing))
		if(chambered)
			to_chat(user, "<span class='notice'>[src] already has a [magazine_wording] chambered.</span>")
			return
		if(magazine.attackby(A, user, silent = TRUE))
			to_chat(user, "<span class='notice'>You load a new [A] into \the [src].</span>")
			playsound(src, 'modular_badlands/code/modules/unsorted/sound/fatman_reload.ogg', 70, 1)
			chamber_round()
			update_icon()

/obj/item/gun/ballistic/fatman/update_icon_state()
	icon_state = "[initial(icon_state)]-[chambered ? "1" : "0"]"
