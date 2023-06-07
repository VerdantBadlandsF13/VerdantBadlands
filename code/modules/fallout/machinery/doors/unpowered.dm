// ID locked Fallout doors, CANNOT be padlocked. Its a sort of simulated key and lock system for semi-public areas.
// Unpowered being as the name says, simple mechanical doors. Works exactly like airlocks, and less space age, so better.

/obj/machinery/door/unpowered
	icon = 'icons/fallout/structures/doors.dmi'
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 70)
	autoclose = TRUE // Difficulty: Monkey to reduce amount of secure doors left open.
	max_integrity = 500
	obj_integrity = 500
	req_one_access_txt = null // Add the channel for the ID you want to lock this door to, check defines.

// ------------------------------------
// SECURE DOOR

/obj/machinery/door/unpowered/securedoor
	name = "secure door"
	desc = "Door with a built-in lock. Can't be padlocked."
	icon_state = "secure"
	assemblytype = /obj/item/stack/sheet/mineral/wood/five
	opacity = TRUE
	explosion_block = TRUE

/obj/machinery/door/unpowered/securedoor/update_icon()
	if(density)
		icon_state = "secure"
	else
		icon_state = "secureopen"

/obj/machinery/door/unpowered/securedoor/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			flick("secure_opening", src)
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			flick("secure_closing", src)


// ------------------------------------
// SECURE STEEL DOOR - tougher

/obj/machinery/door/unpowered/secure_steeldoor
	name = "locked steel door"
	desc = "Steel-plated door with a built-in lock. Can't be padlocked."
	icon_state = "secure_steel"
	assemblytype = /obj/item/stack/sheet/metal/ten
	max_integrity = 1000
	obj_integrity = 1000
	explosion_block = TRUE

/obj/machinery/door/unpowered/secure_steeldoor/update_icon()
	if(density)
		icon_state = "secure_steel"
	else
		icon_state = "secure_steel_open"

/obj/machinery/door/unpowered/secure_steeldoor/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			flick("secure_steel_opening", src)
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			flick("secure_steel_closing", src)


// ------------------------------------
// CELL DOOR

/obj/machinery/door/unpowered/celldoor
	name = "cell door"
	desc = "Celldoor with a built-in lock. Can't be padlocked."
	icon_state = "cell"
	max_integrity = 1000
	obj_integrity = 1000
	assemblytype = /obj/item/stack/rods
	visible = FALSE
	explosion_block = FALSE
	pass_flags_self = LETPASSTHROW
	barricade = TRUE
	proj_pass_rate = 95

/obj/machinery/door/unpowered/celldoor/update_icon()
	if(density)
		icon_state = "cell"
	else
		icon_state = "cellopen"

/obj/machinery/door/unpowered/celldoor/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/f13machines/doorchainlink_open.ogg',40,1)
			flick("cell_opening", src)
		if("closing")
			playsound(src,'sound/f13machines/doorchainlink_close.ogg',40,1)
			flick("cell_closing", src)


// ------------------------------------
// Badlands
// GMB

/obj/machinery/door/unpowered/securedoor/gmb_exterior_door
	name = "heavy secure door"
	req_access_txt = "143"
	icon_state = "secure_steel"

/obj/machinery/door/unpowered/securedoor/gmb_exterior_door/update_icon()
	if(density)
		icon_state = "secure_steel"
	else
		icon_state = "secure_steel_open"

/obj/machinery/door/unpowered/securedoor/gmb_exterior_door/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/f13machines/doorshutter_open.ogg',40,1)
			flick("secure_steel_opening", src)
		if("closing")
			playsound(src,'sound/f13machines/doorshutter_close.ogg',40,1)
			flick("secure_steel_closing", src)

/obj/machinery/door/unpowered/securedoor/gmb_mp_door
	name = "large secure door"
	req_access_txt = "145"

/obj/machinery/door/unpowered/securedoor/gmb_door
	name = "secure door"
	req_access_txt = "143"

/obj/machinery/door/unpowered/celldoor/gmb_gate
	name = "cell door"
	req_access_txt = "143"

/obj/machinery/door/unpowered/securedoor/gmb_command
	name = "secure door"
	req_access_txt = "144"
	icon_state = "metal"

/obj/machinery/door/unpowered/securedoor/gmb_command/update_icon()
	if(density)
		icon_state = "metal"
	else
		icon_state = "metalopen"

/obj/machinery/door/unpowered/securedoor/gmb_command/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			flick("metalopening", src)
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			flick("metalclosing", src)

// ------------------------------------
// Badlands
// DFS

/obj/machinery/door/unpowered/securedoor/dfs_exterior_door
	name = "heavy secure door"
	req_access_txt = "146"
	icon_state = "secure_steel"

/obj/machinery/door/unpowered/securedoor/dfs_exterior_door/update_icon()
	if(density)
		icon_state = "secure_steel"
	else
		icon_state = "secure_steel_open"

/obj/machinery/door/unpowered/securedoor/dfs_exterior_door/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/f13machines/doorshutter_open.ogg',40,1)
			flick("secure_steel_opening", src)
		if("closing")
			playsound(src,'sound/f13machines/doorshutter_close.ogg',40,1)
			flick("secure_steel_closing", src)

/obj/machinery/door/unpowered/securedoor/dfs_door
	name = "secure door"
	req_access_txt = "146"

/obj/machinery/door/unpowered/celldoor/dfs_gate
	name = "cell door"
	req_access_txt = "146"

/obj/machinery/door/unpowered/securedoor/dfs_command
	name = "secure door"
	req_access_txt = "147"
	icon_state = "metal"

/obj/machinery/door/unpowered/securedoor/dfs_command/update_icon()
	if(density)
		icon_state = "metal"
	else
		icon_state = "metalopen"

/obj/machinery/door/unpowered/securedoor/dfs_command/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			flick("metalopening", src)
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			flick("metalclosing", src)

// ------------------------------------
// Badlands
// LBJ

/obj/machinery/door/unpowered/securedoor/lbj_exterior_door
	name = "heavy secure door"
	req_access_txt = "148"
	icon_state = "secure_steel"

/obj/machinery/door/unpowered/securedoor/lbj_exterior_door/update_icon()
	if(density)
		icon_state = "secure_steel"
	else
		icon_state = "secure_steel_open"

/obj/machinery/door/unpowered/securedoor/lbj_exterior_door/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/f13machines/doorshutter_open.ogg',40,1)
			flick("secure_steel_opening", src)
		if("closing")
			playsound(src,'sound/f13machines/doorshutter_close.ogg',40,1)
			flick("secure_steel_closing", src)

/obj/machinery/door/unpowered/securedoor/lbj_door
	name = "secure door"
	req_access_txt = "148"

/obj/machinery/door/unpowered/celldoor/lbj_gate
	name = "cell door"
	req_access_txt = "148"

// ------------------------------------
// Badlands
// VFE

/obj/machinery/door/unpowered/securedoor/vfe
	name = "vault airlock"
	req_access_txt = "149"
	icon_state = "vault"
	resistance_flags = INDESTRUCTIBLE

/obj/machinery/door/unpowered/securedoor/vfe/update_icon()
	if(density)
		icon_state = "vault"
	else
		icon_state = "vaultopen"

/obj/machinery/door/unpowered/securedoor/vfe/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'modular_badlands/code/modules/rp_misc/sound/vault/vaultairlock_open.ogg',40,1)
			flick("vaultopening", src)
		if("closing")
			playsound(src,'modular_badlands/code/modules/rp_misc/sound/vault/vaultairlock_close.ogg',40,1)
			flick("vaultclosing", src)

/obj/machinery/door/unpowered/securedoor/vfe/glass
	name = "vault airlock"
	req_access_txt = "149"
	icon_state = "vault_glass"

/obj/machinery/door/unpowered/securedoor/vfe/glass/update_icon()
	if(density)
		icon_state = "vault_glass"
	else
		icon_state = "vault_glassopen"

/obj/machinery/door/unpowered/securedoor/vfe/glass/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'modular_badlands/code/modules/rp_misc/sound/vault/vaultairlock_open.ogg',40,1)
			flick("vault_glassopening", src)
		if("closing")
			playsound(src,'modular_badlands/code/modules/rp_misc/sound/vault/vaultairlock_close.ogg',40,1)
			flick("vault_glassclosing", src)

/obj/machinery/door/unpowered/securedoor/vfe/vfe_sci
	name = "vault science airlock"
	req_access_txt = "154"

/obj/machinery/door/unpowered/securedoor/vfe/vfe_eng
	name = "vault engineering airlock"
	req_access_txt = "153"

/obj/machinery/door/unpowered/securedoor/vfe/vfe_med
	name = "vault medical airlock"
	req_access_txt = "152"

/obj/machinery/door/unpowered/securedoor/vfe/vfe_sec
	name = "reinforced vault security airlock"
	req_access_txt = "151"

/obj/machinery/door/unpowered/securedoor/vfe/vfe_res
	name = "reinforced restricted vault airlock"
	req_access_txt = "150"
