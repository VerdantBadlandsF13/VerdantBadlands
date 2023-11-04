/obj/item/gun/energy/laser
	name = "energy weapon template"
	desc = "Should not exists. Bugreport."
	icon_state = "laser"
	item_state = "laser"
	slowdown = 0.3
	can_charge = 0
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	custom_materials = list(/datum/material/iron=2000)
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun)
	ammo_x_offset = 1
	shaded_charge = 1
	var/select = 1

/obj/item/gun/energy/laser/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(A, /obj/item/stock_parts/cell/ammo))
		var/obj/item/stock_parts/cell/ammo/AM = A
		if(istype(AM, cell_type))
			var/obj/item/stock_parts/cell/ammo/oldcell = cell
			if(user.transferItemToLoc(AM, src))
				cell = AM
				if(oldcell)
					to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src], replacing the cell.</span>")
					oldcell.dropped()
					oldcell.forceMove(get_turf(src.loc))
					oldcell.update_icon()
				//else
				//	to_chat(user, "<span class='notice'>You insert the cell into \the [src].</span>")

				//playsound(src, 'sound/weapons/autoguninsert.ogg', 60, TRUE)
				//chamber_round()
				A.update_icon()
				update_icon()
				return 1
			else
				to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")

/obj/item/gun/energy/laser/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	select = !select
	if(!select)
		disable_burst()
		to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	else
		enable_burst()
		to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")

/obj/item/gun/energy/laser/proc/enable_burst()
	burst_size = initial(burst_size)

/obj/item/gun/energy/laser/proc/disable_burst()
	burst_size = 1

/////////////////
//LASER PISTOLS//
/////////////////

/obj/item/gun/energy/laser/wattz
	name = "\improper Wattz 1000 laser pistol"
	desc = "A Wattz 1000 Laser Pistol. This is a civilian model, so the wattage is lower than military or police versions. Uses small energy cells."
	icon = 'icons/fallout/objects/guns/energy.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "wattz1000"
	item_state = "laser-pistol"
	fire_delay = 0
	slowdown = 0.2
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT //Can dual wield, which makes up for the meh damage. Especially so with the Magneto.
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/wattz)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

/obj/item/gun/energy/laser/wattz/recharger
	name = "Recharger Pistol"
	desc = "A Recharger Pistol prototype, entering limited production prior to the Great War. \
	As the name implied, it charges its capacitor banks over time using radioactive decay. \
	No official name was ever provided by those behind its design, or such has been lost to time."
	can_remove = 0
	can_charge = 0
	selfcharge = 1
	icon_state = "rechargerpistol"
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun/recharger/pistol)
	cell_type = /obj/item/stock_parts/cell/ammo/breeder
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

/obj/item/gun/energy/laser/pistol
	name = "\improper AEP7 laser pistol"
	desc = "A basic energy-based laser gun that fires concentrated beams of light.<br>\
	This specific model includes a top-mounting for an optic."
	slowdown = 0.2
	icon_state = "AEP7"
	item_state = "laser-pistol"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	fire_delay = 0
	scope_state = "AEP7_scope"
	scope_x_offset = 7
	scope_y_offset = 22
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

/obj/item/gun/energy/laser/pistol/finlay_fluff
	name = "\improper weathered AEP7 laser pistol"
	desc = "An old pre-war laser pistol. Judging from the aged exterior, this hasn't seen much use in a long time.<br>\
	That, or it's seen too much in a short period. Regardless, the mounting for a scope atop the weapon has been snapped clean off.<br>\
	Atop that, if it weren't bad enough, it also appears to have a cracked focusing lense."
	extra_damage = -6
	can_scope = FALSE

////////////////
//LASER RIFLES//
////////////////


//Wattz 2000 Laser rifle
/obj/item/gun/energy/laser/wattz2k
	name = "\improper Wattz 2000"
	desc = "A Wattz 2000 Laser Rifle, featuring an integrated scope and extended capacitor banks."
	slowdown = 0.3
	icon = 'icons/fallout/objects/guns/energy.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "wattz2k"
	item_state = "sniper_rifle"
	fire_delay = 1
	ammo_type = list(/obj/item/ammo_casing/energy/wattz2k)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'

//AER9 Laser rifle
/obj/item/gun/energy/laser/aer9
	name = "\improper AER9 laser rifle"
	desc = "A sturdy pre-war laser rifle. Emits beams of concentrated light to kill targets, cutting through both armor and flesh with ease."
	icon_state = "laser"
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	fire_delay = 1
	scope_state = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	equipsound = 'sound/f13weapons/equipsounds/aer9equip.ogg'

/obj/item/gun/energy/laser/aer9/recharger
	name = "Recharger Rifle"
	desc = "A Recharger Rifle prototype, entering limited production prior to the Great War. \
	As the name implied, it charges its capacitor banks over time using radioactive decay. \
	No official name was ever provided by those behind its design, or such has been lost to time."
	icon = 'icons/fallout/objects/guns/energy.dmi'
	icon_state = "rechargerrifle"
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun/recharger)
	cell_type = /obj/item/stock_parts/cell/ammo/breeder
	fire_delay = 1
	can_scope = 1
	can_remove = 0
	can_charge = 0
	selfcharge = 1
	scope_x_offset = 12
	scope_y_offset = 22
	equipsound = 'sound/f13weapons/equipsounds/aer9equip.ogg'
