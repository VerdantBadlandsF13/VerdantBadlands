// Flora first.
/obj/structure/flora/wasteplant/bl
	name = "PARENT PLANT DO NOT USE ME"
	icon = 'modular_badlands/code/modules/environment/icons/bl_flora.dmi'
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
	Now, when prepared properly? It can be utilised as an incredibly effective broad-spectrum antibiotic."
	produce = /obj/item/reagent_containers/food/snacks/grown/bl/yarrow

// Skullcap
/obj/structure/flora/wasteplant/bl/skullcap
	name = "skullcap flowers"
	icon_state = "skullcap"
	desc = "An odd looking group of flowers. Locals swear by its utility as a painkiller. Others caution against even looking at it. \
	Madness, truly."
	produce = /obj/item/reagent_containers/food/snacks/grown/bl/skullcap

// Produce second. Seeds. These need seedpack icons ASAP.
/obj/item/seeds/bl
	name = "PARENT BADLAND SEED PACK"
	desc = "I SHOULD NOT EXIST AAAAAAAAAAA YELL AT CARL"
	icon = 'modular_badlands/code/modules/environment/icons/bl_seeds.dmi'
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
	growing_icon = 'modular_badlands/code/modules/environment/icons/bl_flora_bw.dmi'
	icon_grow = "ERROR-grow"
	icon_dead = "ERROR-dead"
	icon_harvest = "ERROR-harvest"
	genes = list(/datum/plant_gene/trait/repeated_harvest)

/obj/item/seeds/bl/licorice
	name = "licorice seed pack"
	desc = "An average seed pack for licorice."
	icon_state = "seed"
	species = "licorice"
	plantname = "licorice bush"
	product = /obj/item/reagent_containers/food/snacks/grown/bl/licorice
	lifespan = 100
	endurance = 30
	maturation = 10
	production = 5
	yield = 3
	potency = 30
	growthstages = 1
	rarity = 20
	icon_grow = "licorice-grow"
	icon_dead = "licorice-dead"
	icon_harvest = "licorice-harvest"
	reagents_add = list(/datum/reagent/consumable/sugar = 0.1, /datum/reagent/medicine/salglu_solution = 0.05)

/obj/item/seeds/bl/milkweed
	name = "milkweed seed pack"
	desc = "An average seed pack for milkweed."
	icon_state = "seed"
	species = "milkweed"
	plantname = "milkweed bush"
	product = /obj/item/reagent_containers/food/snacks/grown/bl/milkweed
	lifespan = 100
	endurance = 30
	maturation = 10
	production = 5
	yield = 3
	potency = 30
	growthstages = 1
	rarity = 20
	icon_grow = "milkweed-grow"
	icon_dead = "milkweed-dead"
	icon_harvest = "milkweed-harvest"
	reagents_add = list(/datum/reagent/medicine/silver_sulfadiazine = 0.05, /datum/reagent/consumable/menthol = 0.05)

/obj/item/seeds/bl/yarrow
	name = "yarrow seed pack"
	desc = "An average seed pack for yarrow."
	icon_state = "seed"
	species = "yarrow"
	plantname = "yarrow bush"
	product = /obj/item/reagent_containers/food/snacks/grown/bl/yarrow
	lifespan = 100
	endurance = 30
	maturation = 10
	production = 5
	yield = 3
	potency = 30
	growthstages = 1
	rarity = 20
	icon_grow = "yarrow-grow"
	icon_dead = "yarrow-dead"
	icon_harvest = "yarrow-harvest"
	reagents_add = list(/datum/reagent/medicine/charcoal = 0.1, /datum/reagent/abraxo_cleaner/sterilizine = 0.1, /datum/reagent/medicine/spaceacillin = 0.05, /datum/reagent/medicine/radaway = 0.05)

/obj/item/seeds/bl/skullcap
	name = "skullcap seed pack"
	desc = "An average seed pack for skullcap."
	icon_state = "seed"
	species = "skullcap"
	plantname = "skullcap bush"
	product = /obj/item/reagent_containers/food/snacks/grown/bl/skullcap
	lifespan = 100
	endurance = 30
	maturation = 10
	production = 5
	yield = 3
	potency = 30
	growthstages = 1
	rarity = 20
	icon_grow = "skullcap-grow"
	icon_dead = "skullcap-dead"
	icon_harvest = "skullcap-harvest"
	reagents_add = list(/datum/reagent/medicine/psicodine = 0.1, /datum/reagent/toxin/staminatoxin = 0.1, /datum/reagent/serotrotium = 0.05, /datum/reagent/medicine/synaphydramine = 0.05, /datum/reagent/toxin/leadacetate = 0.01)

// Produce containers third.
/obj/item/reagent_containers/food/snacks/grown/bl
	seed = null
	name = "PARENT BADLAND GROWN HARVESTED THINGY"
	desc = "I SHOULD NOT EXIST AAAAAAAAAAA YELL AT CARL"
	icon = 'modular_badlands/code/modules/environment/icons/bl_produce.dmi'
	icon_state = "ERROR"
	filling_color = "#000000"

/obj/item/reagent_containers/food/snacks/grown/bl/licorice
	seed = /obj/item/seeds/bl/licorice
	name = "licorice"
	desc = "Commonly used by locals as a dietary supplement when times are tough. \
	Alternatively, some swear by its ability to nurse those with internal injuries back to health. One should be careful with dosage, however."
	icon_state = "licorice"
	filling_color = "#999966"
	tastes = list("natural sweetness" = 1)

/obj/item/reagent_containers/food/snacks/grown/bl/milkweed
	seed = /obj/item/seeds/bl/milkweed
	name = "milkweed"
	desc = "Are you sure this is safe? \
	Assuming it isn't a lookalike, the locals are known to use this for lesser burns and head colds."
	icon_state = "milkweed"
	filling_color = "#AAA1C9"
	tastes = list("strong bitterness" = 1)

/obj/item/reagent_containers/food/snacks/grown/bl/yarrow
	seed = /obj/item/seeds/bl/yarrow
	name = "yarrow"
	desc = "Unassuming yarrow. Previously, a little after the bombs fell, it had been used as a home grown medical remedy. \
	Now, when prepared properly? It can be utilised as an incredibly effective broad-spectrum antibiotic."
	icon_state = "yarrow"
	filling_color = "#CBC9D4"
	tastes = list("sweetly bitterness" = 1)

/obj/item/reagent_containers/food/snacks/grown/bl/skullcap
	seed = /obj/item/seeds/bl/skullcap
	name = "skullcap"
	desc = "An odd looking flower. Locals swear by its utility as a painkiller. Others caution against even looking at it. \
	Madness, truly."
	icon_state = "skullcap"
	filling_color = "#B294D1"
	tastes = list("mild bitterness" = 1)
