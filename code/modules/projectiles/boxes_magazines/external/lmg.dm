/obj/item/ammo_box/magazine/w308
	name = "sniper rifle magazine (7.62x51)"
	icon_state = "sniper_mag"
	ammo_type = /obj/item/ammo_casing/a762
	caliber = "a762"
	max_ammo = 7
	multiple_sprites = 2

/obj/item/ammo_box/magazine/w308/empty
	start_empty = 1

/obj/item/ammo_box/magazine/lmg
	name = "ammo box (5.56)"
	icon_state = "r80"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 60
	multiple_sprites = 2

/obj/item/ammo_box/magazine/lmg/empty
	start_empty = 1

/obj/item/ammo_box/magazine/cz53
	name = "ammo box (5mm)"
	icon_state = "cz53"
	ammo_type = /obj/item/ammo_casing/m5mm
	caliber = "m5mm"
	max_ammo = 240
	multiple_sprites = 2

/obj/item/ammo_box/magazine/cz53/empty
	start_empty = 1

/obj/item/ammo_box/magazine/vindic
	name = "ammo box (4.7mm)"
	icon_state = "cz53"
	ammo_type = /obj/item/ammo_casing/caseless/g11
	caliber = "473mm"
	max_ammo = 240
	multiple_sprites = 2

/obj/item/ammo_box/magazine/vindic/empty
	start_empty = 1

/obj/item/ammo_box/magazine/mm762
	name = "ammo belt (.308)"
	icon_state = "762belt"
	ammo_type = /obj/item/ammo_casing/a762/a308
	max_ammo = 80
	caliber = "a762"

/obj/item/ammo_box/magazine/mm762/empty
	start_empty = 1

/obj/item/ammo_box/magazine/mm762/can_load()
	return 0

/obj/item/ammo_box/magazine/mm762/update_icon()
	..()
	icon_state = "762belt-[round(ammo_count(),20)]"
