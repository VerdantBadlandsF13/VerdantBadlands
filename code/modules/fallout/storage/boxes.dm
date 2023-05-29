/obj/item/storage/box/sparelimbs
	name = "box of prosthethic limbs"
	desc = "Contains superior prosthethic limbs, one of each type."
	icon_state = "syndiebox"

/obj/item/storage/box/sparelimbs/PopulateContents()
	new /obj/item/bodypart/chest/robot(src)
	new /obj/item/bodypart/l_arm/robot(src)
	new /obj/item/bodypart/r_arm/robot(src)
	new /obj/item/bodypart/l_leg/robot(src)
	new /obj/item/bodypart/r_leg/robot(src)

/obj/item/storage/box/ids/follower
	name = "box of spare medallions"
	desc = "Medallions for issue to recruits."
	illustration = "legauxilia"

/obj/item/storage/box/ids/follower/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/card/id/dogtag/legrecruit

/obj/item/storage/box/deputy_badges
	name = "box of spare badges"
	desc = "A box containing the spare badges for deputies. Use your sheriff badge on a deputy badge to assign its owner."
	illustration = "id"

/obj/item/storage/box/deputy_badges/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/card/id/dogtag/deputy(src)

/obj/item/storage/box/citizenship_permits
	name = "box of citizenship permits"
	desc = "A box containing spare citizenship permits for Bighorn. Use a mayor's ID on a citizenship permit to assign its owner."
	illustration = "id"

/obj/item/storage/box/citizenship_permits/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/card/id/dogtag/town(src)

/obj/item/storage/box/vendingmachine
	name = "Vending Machine Kit"
	desc = "A box containing all the necessary items to construct a vending machine."

/obj/item/storage/box/vendingmachine/PopulateContents()
	. = ..()
	new /obj/item/stack/sheet/metal/twenty(src)
	new /obj/item/stack/crafting/metalparts/five(src)
	new /obj/item/stack/crafting/metalparts/five(src)
	new /obj/item/stack/crafting/electronicparts/five(src)
	new /obj/item/stack/crafting/goodparts/five(src)
	new /obj/item/stack/crafting/goodparts/five(src)
	new /obj/item/stack/cable_coil/ten(src)
	new /obj/item/screwdriver(src)
	new /obj/item/weldingtool(src)
	new /obj/item/stack/f13Cash/random/med(src)
	new /obj/item/stack/f13Cash/random/med(src)
