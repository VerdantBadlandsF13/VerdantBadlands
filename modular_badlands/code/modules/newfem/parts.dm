//alternate female sprite datum.
#define NOT_ALTFEM					0
#define IS_ALTFEM					1
/*
Alternate femoid sprites.
These can be expanded in the future, and probably should be.
Credits to Lowry for these sprites, which were a rework of a long lost set.
He did both the mob and onmob sprites.
*/
/obj/item/bodypart
	var/use_fem2 = NOT_ALTFEM

/obj/item/bodypart/head/f2
	icon = 'icons/mob/human_parts.dmi'
	icon_state = "humanf2_head"
	use_fem2 = IS_ALTFEM

/obj/item/bodypart/chest/f2
	icon = 'icons/mob/human_parts.dmi'
	icon_state = "humanf2_chest"
	use_fem2 = IS_ALTFEM

/obj/item/bodypart/l_arm/f2
	icon = 'icons/mob/human_parts.dmi'
	icon_state = "humanf2_l_arm"
	use_fem2 = IS_ALTFEM

/obj/item/bodypart/r_arm/f2
	icon = 'icons/mob/human_parts.dmi'
	icon_state = "humanf2_r_arm"
	use_fem2 = IS_ALTFEM

/obj/item/bodypart/l_leg/f2
	icon = 'icons/mob/human_parts.dmi'
	icon_state = "humanf2_l_leg"
	use_fem2 = IS_ALTFEM

/obj/item/bodypart/r_leg/f2
	icon = 'icons/mob/human_parts.dmi'
	icon_state = "humanf2_r_leg"
	use_fem2 = IS_ALTFEM
