
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Vending //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/vending
	group = "Vending"

//////////////////////////////////////////////////////////////////////////////
///////////////////////// Service, Medical, Sec //////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/vending/bartending
	name = "Bartending Supply Crate"
	desc = "Bring on the booze with vending machine refills, as well as a free book containing the well-kept secrets to the bartending trade!"
	cost = 2000
	contains = list(/obj/item/vending_refill/boozeomat,
					/obj/item/vending_refill/coffee,
					/obj/item/book/granter/action/drink_fling)
	crate_name = "bartending supply crate"

/datum/supply_pack/vending/hydro
	name = "Cartridge Supply Crate"
	desc = "Restock you cartridges for PDAs. Contains a PTech vending machine refill."
	cost = 5000
	contains = list(/obj/item/vending_refill/cart)
	crate_name = "hydroponics supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/cigarette
	name = "Cigarette Supply Crate"
	desc = "Don't believe the reports - smoke today! Contains a cigarette vending machine refill."
	cost = 1500
	contains = list(/obj/item/vending_refill/cigarette)
	crate_name = "cigarette supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/dinner
	name = "Dinnerware Supply Crate"
	desc = "Use a plate and have some utensils! Contains a dinnerware and sustenance vending machine refill."
	cost = 2500
	contains = list(/obj/item/vending_refill/sustenance,
					/obj/item/vending_refill/dinnerware)
	crate_name = "dinnerware supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/dinner
	name = "Engineering Supply Crate"
	desc = "Packs of tools waiting to be used for repairing. Contains a tool and engineering vending machine refill. Requires CE access."
	cost = 5500 //Powerfull
	contains = list(/obj/item/vending_refill/tool,
					/obj/item/vending_refill/engivend)
	crate_name = "engineering supply crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/vending/games
	name = "Games Supply Crate"
	desc = "Get your game on with this game vending machine refill."
	cost = 1000
	contains = list(/obj/item/vending_refill/games)
	crate_name = "games supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/hydro
	name = "Hydroponics Supply Crate"
	desc = "Arnt you glad you dont have to do it the natural way? Contains a megaseed and nutrimax vending machine refill."
	cost = 5000
	contains = list(/obj/item/vending_refill/hydroseeds,
					/obj/item/vending_refill/hydronutrients)
	crate_name = "hydroponics supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/medical
	name = "Medical Vending Crate"
	desc = "Contains refills for medical vending machines."
	cost = 2000
	contains = list(/obj/item/vending_refill/medical,
					/obj/item/vending_refill/wallmed)
	crate_name = "medical vending crate"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/vending/security
	name = "SecTech Supply Crate"
	desc = "Officer Paul bought all the donuts? Then refill the security vendor with ths crate. Requires Security Access to open."
	cost = 1500
	contains = list(/obj/machinery/vending/security)
	crate_name = "SecTech supply crate"
	crate_type = /obj/structure/closet/crate/secure/gear
	can_private_buy = FALSE

/datum/supply_pack/vending/snack
	name = "Snack Supply Crate"
	desc = "One vending machine refill of cavity-bringin' goodness! The number one dentist recommended order!"
	cost = 1500
	contains = list(/obj/item/vending_refill/snack)
	crate_name = "snacks supply crate"

/datum/supply_pack/vending/cola
	name = "Softdrinks Supply Crate"
	desc = "Got whacked by a toolbox, but you still have those pesky teeth? Get rid of those pearly whites with this soda machine refill, today!"
	cost = 1500
	contains = list(/obj/item/vending_refill/cola)
	crate_name = "soft drinks supply crate"

/datum/supply_pack/vending/vendomat
	name = "Vendomat Supply Crate"
	desc = "Contains a Vendomat restock unit!"
	cost = 1200
	contains = list(/obj/item/vending_refill/assist)
	crate_name = "vendomat supply crate"

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Wardrobe Vendors ////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/vending/wardrobes/general
	name = "General Wardrobes Supply Crate"
	desc = "This crate contains refills for the CuraDrobe, BarDrobe, ChefDrobe, JaniDrobe, ChapDrobe."
	cost = 3750
	contains = list(/obj/item/vending_refill/wardrobe/bar_wardrobe)
	crate_name = "general wardrobes vendor refills"
