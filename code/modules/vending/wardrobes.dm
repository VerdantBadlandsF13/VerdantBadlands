/obj/item/vending_refill/wardrobe
	icon_state = "refill_clothes"

/obj/machinery/vending/wardrobe
	default_price = PRICE_NORMAL
	extra_price = PRICE_EXPENSIVE
	payment_department = NO_FREEBIES
	input_display_header = "Returned Clothing"

/obj/machinery/vending/wardrobe/canLoadItem(obj/item/I,mob/user)
	return (I.type in products)

/obj/machinery/vending/wardrobe/bar_wardrobe
	name = "BarDrobe"
	desc = "A stylish vendor to dispense the most stylish bar clothing!"
	icon_state = "bardrobe"
	product_ads = "Guaranteed to prevent stains from spilled drinks!"
	vend_reply = "Thank you for using the BarDrobe!"
	products = list(/obj/item/radio/headset/headset_srv = 3,
					/obj/item/clothing/under/suit/sl = 3,
					/obj/item/clothing/under/rank/civilian/bartender = 3,
					/obj/item/clothing/under/rank/civilian/bartender/skirt = 2,
					/obj/item/clothing/under/rank/civilian/bartender/purple = 2,
					/obj/item/clothing/accessory/waistcoat = 3,
					/obj/item/clothing/neck/apron/bartender = 2,
					/obj/item/clothing/head/soft/black = 4,
					/obj/item/clothing/shoes/sneakers/black = 4,
					/obj/item/reagent_containers/rag = 4,
					/obj/item/circuitboard/machine/dish_drive = 1,
					/obj/item/clothing/glasses/sunglasses/reagent = 1,
					/obj/item/clothing/neck/petcollar = 3,
					/obj/item/storage/belt/bandolier = 1)
	refill_canister = /obj/item/vending_refill/wardrobe/bar_wardrobe
	payment_department = ACCOUNT_SRV
	cost_multiplier_per_dept = list(ACCOUNT_SRV = 0)

/obj/item/vending_refill/wardrobe/bar_wardrobe
	machine_name = "BarDrobe"
