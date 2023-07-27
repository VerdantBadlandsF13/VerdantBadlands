// Flora first.
/obj/structure/flora/wasteplant/bl
	name = "PARENT PLANT DO NOT USE ME"
	icon = 'modular_badlands/code/modules/unsorted/icons/bl_flora.dmi'
	icon_state = "ERROR"
	desc = "I SHOULD NOT EXIST AAAAAAAAAAA YELL AT CARL"
	produce = /obj/item/reagent_containers/food/snacks/grown/bl

// Licorice
/obj/structure/flora/wasteplant/bl/licorice
	name = "licorice flowers"
	icon_state = "licorice"
	desc = "A sweet, almost odd smelling bush of flowers. Commonly used by locals as a dietary supplement when times are tough. \
	Alternatively, some swear by its ability to nurse those with internal injuries back to health. One should be careful with dosage, however."
	produce = /obj/item/reagent_containers/food/snacks/grown/bl/licorice

// Milkweed
/obj/structure/flora/wasteplant/bl/milkweed
	name = "milkweed flowers"
	icon_state = "milkweed"
	desc = "A bush of flowers. Not too unique. Are you sure this is safe? \
	Assuming it isn't a lookalike, the locals are known to use this for lesser burns and head colds."
	produce = /obj/item/reagent_containers/food/snacks/grown/bl/milkweed

// Yarrow
/obj/structure/flora/wasteplant/bl/yarrow
	name = "yarrow flowers"
	icon_state = "yarrow"
	desc = "A bush of unassuming yarrow. Previously, a little after the bombs fell, it had been used as a home grown medical remedy. \
	Now, when prepared properly? It can be utilised as an incredibly effective broad-spectrum antibiotic"
	produce = /obj/item/reagent_containers/food/snacks/grown/bl/yarrow

// Skullcap
/obj/structure/flora/wasteplant/bl/skullcap
	name = "skullcap flowers"
	icon_state = "skull_cap"
	desc = "An odd looking group of flowers. Locals swear by its utility as a painkiller. Others caution against even looking at it. \
	Madness, truly."
	produce = /obj/item/reagent_containers/food/snacks/grown/bl/skullcap

// Produce second. Seeds.
/obj/item/seeds/bl
	name = "PARENT BADLAND SEED PACK"
	desc = "I SHOULD NOT EXIST AAAAAAAAAAA YELL AT CARL"
	icon = 'modular_badlands/code/modules/unsorted/icons/bl_produce.dmi'
	icon_state = "ERROR"
	species = "error_or_something_lol"
	plantname = "Error Bush"
	product = /obj/item/reagent_containers/food/snacks/grown/bl
	lifespan = 100
	endurance = 30
	maturation = 10
	production = 5
	yield = 3
	potency = 30
	growthstages = 1
	rarity = 20
	icon = 'modular_badlands/code/modules/unsorted/icons/bl_flora_bw.dmi'
	icon_grow = "ERROR-grow"
	icon_dead = "ERROR-dead"
	icon_harvest = "ERROR-harvest"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list(/datum/reagent/medicine/charcoal = 0.1, /datum/reagent/consumable/nutriment = 0.1, /datum/reagent/medicine/radaway = 0.05)

/obj/item/seeds/bl/licorice
	name = "PARENT BADLAND SEED PACK"
	desc = "I SHOULD NOT EXIST AAAAAAAAAAA YELL AT CARL"
	icon_state = "ERROR"
	species = "error_or_something_lol"
	plantname = "Error Bush"
	lifespan = 100
	endurance = 30
	maturation = 10
	production = 5
	yield = 3
	potency = 30
	growthstages = 1
	rarity = 20
	icon_grow = "ERROR-grow"
	icon_dead = "ERROR-dead"
	icon_harvest = "ERROR-harvest"
	product = /obj/item/reagent_containers/food/snacks/grown/bl
	reagents_add = list(/datum/reagent/medicine/charcoal = 0.1, /datum/reagent/consumable/nutriment = 0.1, /datum/reagent/medicine/radaway = 0.05)

/obj/item/seeds/bl/milkweed

/obj/item/seeds/bl/yarrow

/obj/item/seeds/bl/skullcap

// Produce containers.
/obj/item/reagent_containers/food/snacks/grown/bl
	seed = /obj/item/seeds/punga
	name = "PARENT BADLAND GROWN HARVESTED THINGY"
	desc = "I SHOULD NOT EXIST AAAAAAAAAAA YELL AT CARL"
	icon = 'modular_badlands/code/modules/unsorted/icons/bl_produce.dmi'
	icon_state = "ERROR"
	filling_color = "#000000"
	juice_results = list(/datum/reagent/consumable/ethanol/pungajuice = 0)

/obj/item/reagent_containers/food/snacks/grown/bl/licorice
	seed = /obj/item/seeds/punga
	name = "PARENT BADLAND GROWN HARVESTED THINGY"
	desc = "I SHOULD NOT EXIST AAAAAAAAAAA YELL AT CARL"
	icon = 'modular_badlands/code/modules/unsorted/icons/bl_produce.dmi'
	icon_state = "ERROR"
	filling_color = "#000000"
	juice_results = list(/datum/reagent/consumable/ethanol/pungajuice = 0)

/obj/item/reagent_containers/food/snacks/grown/bl/milkweed
/obj/item/reagent_containers/food/snacks/grown/bl/yarrow
/obj/item/reagent_containers/food/snacks/grown/bl/skullcap

// Reagents third.
