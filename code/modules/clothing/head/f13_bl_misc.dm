/*
Intended for the GMB's tricorn, alongside various other faction equipment.
*/
/obj/item/clothing/head/gmb
	name = "militia tricorne"
	desc = "A part of the iconic outfit that the militia wears. Does it make you seem cool? Probably not."
	icon = 'icons/fallout/clothing/bl_mountain.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/bl_mountain.dmi'
	icon_state = "gmtricorne"
	item_state = "gmtricorne"

/obj/item/clothing/head/gmb/brimmed
	name = "brimmed militia hat"
	desc = "A part of the iconic outfit that a militia volunteer wears. Does it make you seem cool? Probably not."
	icon_state = "cowboyhat"
	item_state = "cowboyhat"

//DFS

/obj/item/clothing/head/helmet/f13/dfs
	name = "modified firefighter helmet"
	desc = "A firefighter's helmet. Modified heavily by the security team's mechanics and backed by incredible protective material."
	icon = 'icons/fallout/clothing/bl_dfs.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/bl_dfs.dmi'
	icon_state = "dfs_firefighter_helmet"
	item_state = "dfs_firefighter_helmet"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELM_MAX_TEMP_PROTECT
	armor = list("tier" = 4, "energy" = 60, "bomb" = 30, "bio" = 60, "rad" = 60, "fire" = 100, "acid" = 60)
	strip_delay = 120
	resistance_flags = FIRE_PROOF | UNACIDABLE

/obj/item/clothing/head/helmet/f13/dfs_hood
	name = "security hood"
	desc = "A heavy and worn hood. It has been fitted with a small amount of kevlar weave. Unlikely to catch a bullet, but may just save you in a bad situation."
	icon = 'icons/fallout/clothing/bl_dfs.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/bl_dfs.dmi'
	icon_state = "dfs_hood"
	item_state = "dfs_hood"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	armor = list("tier" = 1, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)
	strip_delay = 120
