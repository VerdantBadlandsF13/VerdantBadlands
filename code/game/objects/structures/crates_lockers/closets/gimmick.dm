/obj/structure/closet/cabinet
	name = "cabinet"
	desc = "Opens and closes. Just about."
	icon = 'icons/fallout/objects/furniture/closet.dmi'
	icon_state = "cabinet"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	material_drop = /obj/item/stack/sheet/mineral/wood
	cutting_tool = /obj/item/screwdriver
	can_weld_shut = FALSE

/obj/structure/closet/cabinet/anchored
	anchored = TRUE
	storage_capacity = 30

/obj/structure/closet/acloset
	name = "strange closet"
	desc = "It looks alien!"
	icon_state = "alien"

/obj/structure/closet/gimmick
	name = "administrative supply closet"
	desc = "It's a storage unit for things that have no right being here."
	icon_state = "syndicate"
