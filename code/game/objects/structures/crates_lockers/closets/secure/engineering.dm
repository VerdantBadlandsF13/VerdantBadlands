/obj/structure/closet/secure_closet/engineering_electrical
	name = "electrical supplies locker"
	req_access = list(ACCESS_ENGINE_EQUIP)
	icon_state = "eng"
	icon_door = "eng_elec"

/obj/structure/closet/secure_closet/engineering_electrical/PopulateContents()
	..()
	new /obj/item/clothing/gloves/color/yellow(src)
	new /obj/item/clothing/gloves/color/yellow(src)
	new /obj/item/inducer(src)
	new /obj/item/inducer(src)
	for(var/i in 1 to 3)
		new /obj/item/storage/toolbox/electrical(src)
	for(var/i in 1 to 3)
		new /obj/item/electronics/apc(src)
	for(var/i in 1 to 3)
		new /obj/item/multitool(src)

/obj/structure/closet/secure_closet/engineering_welding
	name = "welding supplies locker"
	req_access = list(ACCESS_ENGINE_EQUIP)
	icon_state = "eng"
	icon_door = "eng_weld"

/obj/structure/closet/secure_closet/engineering_welding/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/welding(src)
	for(var/i in 1 to 3)
		new /obj/item/weldingtool/largetank(src)

/*
 * Empty lockers
 * Some of the lockers are filled with junk, and sometimes its nice to just fill it with your own set-up for your own map gimmicks.
 */

/obj/structure/closet/secure_closet/engineering_electrical/empty

/obj/structure/closet/secure_closet/engineering_electrical/empty/PopulateContents()
	return

/obj/structure/closet/secure_closet/engineering_welding/empty

/obj/structure/closet/secure_closet/engineering_welding/empty/PopulateContents()
	return
