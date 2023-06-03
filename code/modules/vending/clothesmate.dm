/obj/machinery/vending/clothing
	name = "PARENT OBJECT OF CLOTHESMATE VENDING"
	desc = "A vending machine for clothing."
	icon_state = "clothes"
	icon_deny = "clothes-deny"
	product_slogans = "Dress for success!;Prepare to look like a million bucks!;Look at all this style!;Why leave style up to fate? Use the ClothesMate!"
	vend_reply = "Thank you for using the ClothesMate!"
	products = list()
	contraband = list()
	premium = list()
	refill_canister = /obj/item/vending_refill/clothing
	default_price = PRICE_CHEAP
	extra_price = PRICE_BELOW_NORMAL
	payment_department = NO_FREEBIES

/obj/machinery/vending/clothing/canLoadItem(obj/item/I,mob/user)
	return (I.type in products)

/obj/item/vending_refill/clothing
	machine_name = "ClothesMate"
	icon_state = "refill_clothes"

/obj/item/vending_refill/clothing/bos
	machine_name = "Civilian ClothesMate"
	icon_state = "refill_clothes"

/obj/machinery/vending/clothing/heaven
	name = "Heaven's Night ClothesMate"
	desc = "A vending machine supplying club equipment. To put it lightly."
	product_slogans = "Do I look like your girlfriend?;I don't look like a ghost, do I?;Feel how warm I am?;It doesn't matter who I am.;Come and get me.;"
	vend_reply = "Hurry back!"
	products = list(/obj/item/clothing/under/f13/raiderharness = 3,
					/obj/item/clothing/suit/f13/sexymaid = 5,
					/obj/item/clothing/head/helmet/f13/brahmincowboyhat = 3,
					/obj/item/restraints/handcuffs/fake/kinky = 5,
					/obj/item/clothing/mask/muzzle = 5,
					/obj/item/clothing/suit/straight_jacket = 5,
					/obj/item/melee/chainofcommand/fake = 5)
