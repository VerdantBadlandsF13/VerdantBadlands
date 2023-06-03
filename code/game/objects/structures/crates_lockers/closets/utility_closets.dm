/* Utility Closets
 * Contains:
 *		Fire Closet
 *		Tool Closet
 */

/*
 * Fire Closet
 */
/obj/structure/closet/firecloset
	name = "fire-safety closet"
	desc = "It's a storage unit for fire-fighting supplies."
	icon_state = "fire"

/obj/structure/closet/firecloset/PopulateContents()
	..()
	if (prob(50))
		new /obj/item/reagent_containers/hypospray/medipen/firelocker(src)
	new /obj/item/clothing/suit/fire(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/tank/internals/oxygen/red(src)
	new /obj/item/extinguisher(src)
	new /obj/item/clothing/head/hardhat/red(src)

/obj/structure/closet/firecloset/full/PopulateContents()
	..()
	if (prob(50))
		new /obj/item/reagent_containers/hypospray/medipen/firelocker(src)
	new /obj/item/clothing/suit/fire(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/flashlight(src)
	new /obj/item/tank/internals/oxygen/red(src)
	new /obj/item/extinguisher(src)
	new /obj/item/clothing/head/hardhat/red(src)

/*
 * Tool Closet
 */
/obj/structure/closet/toolcloset
	name = "tool closet"
	desc = "It's a storage unit for tools."
	icon_state = "eng"
	icon_door = "eng_tool"

/obj/structure/closet/toolcloset/PopulateContents()
	..()
	if(prob(70))
		new /obj/effect/spawner/lootdrop/low_tools/no_turf(src) //Spare random basic tool
	if(prob(20))
		new /obj/item/storage/belt/utility(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(5))
		new /obj/item/clothing/gloves/color/yellow(src)
	if(prob(40))
		new /obj/item/clothing/head/hardhat(src)
