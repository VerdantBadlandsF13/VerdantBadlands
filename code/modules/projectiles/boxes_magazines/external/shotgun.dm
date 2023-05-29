/obj/item/ammo_box/magazine/m12g
	name = "shotgun magazine (12g buckshot)"
	desc = "A drum magazine."
	icon_state = "m12gb"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = "shotgun"
	max_ammo = 8

/obj/item/ammo_box/magazine/m12g/update_icon()
	..()
	icon_state = "[initial(icon_state)]-[CEILING(ammo_count(0)/8, 1)*8]"

/obj/item/ammo_box/magazine/m12g/slug
	name = "shotgun magazine (12g slugs)"
	icon_state = "m12gsl"
	ammo_type = /obj/item/ammo_casing/shotgun

/*
---Fallout 13---
*/

/obj/item/ammo_box/magazine/d12g
	name = "shotgun drum magazine (12g slugs)"
	desc = "A 12g drum magazine."
	icon_state = "riotmag"
	ammo_type = /obj/item/ammo_casing/shotgun
	caliber = "shotgun"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/d12g/empty
	start_empty = 1
