/obj/machinery/vending/security
	name = "\improper Stent Security Vendor"
	desc = "Stent Security was one of the major defense contractors, supplying the R91 rifle of their design to National Guard of the United States.."
	product_ads = "Crack some skulls!;You are the law!;Hands up buttercup!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Cuff'em!;Tase them!;Why not have a donut?"
	icon_state = "sec"
	icon_deny = "sec-deny"
	products = list(/obj/item/restraints/handcuffs = 8,
					/obj/item/restraints/handcuffs/cable/zipties = 10,
					/obj/item/grenade/flashbang = 4,
					/obj/item/assembly/flash/handheld = 5,
					/obj/item/storage/box/evidence = 6,
					/obj/item/flashlight/seclite = 4,
					/obj/item/storage/bag/ammo = 3)
	contraband = list()
	premium = list()
	armor = list("melee" = 100, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/security
	default_price = PRICE_ALMOST_EXPENSIVE
	extra_price = PRICE_REALLY_EXPENSIVE
	payment_department = ACCOUNT_SEC
	cost_multiplier_per_dept = list(ACCOUNT_SEC = 0)

/obj/machinery/vending/security/pre_throw(obj/item/I)
	if(istype(I, /obj/item/grenade))
		var/obj/item/grenade/G = I
		G.preprime()
	else if(istype(I, /obj/item/flashlight))
		var/obj/item/flashlight/F = I
		F.on = TRUE
		F.update_brightness()

/obj/item/vending_refill/security
	icon_state = "refill_games"
