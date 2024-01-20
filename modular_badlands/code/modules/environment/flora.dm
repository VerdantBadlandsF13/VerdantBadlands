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
	reagents_add = list(/datum/reagent/consumable/licoricepulp = 0.05)

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
	reagents_add = list(/datum/reagent/consumable/milkweedpulp = 0.05)

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
	reagents_add = list(/datum/reagent/consumable/yarrowpulp = 0.05)

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
	reagents_add = list(/datum/reagent/consumable/skullcappulp = 0.05)

// Produce containers third.
/obj/item/reagent_containers/food/snacks/grown/bl
	seed = null
	name = "PARENT BADLAND GROWN HARVESTED THINGY"
	desc = "I SHOULD NOT EXIST AAAAAAAAAAA YELL AT CARL"
	icon = 'modular_badlands/code/modules/environment/icons/bl_produce.dmi'
	icon_state = "ERROR"
	filling_color = "#000000"
	foodtype = RAW | VEGETABLES
	list_reagents = list()
	grind_results = list()
	juice_results = list()

/obj/item/reagent_containers/food/snacks/grown/bl/licorice
	seed = /obj/item/seeds/bl/licorice
	name = "licorice"
	desc = "Commonly used by locals as a dietary supplement when times are tough. \
	Alternatively, some swear by its ability to nurse those with internal injuries back to health. One should be careful with dosage, however."
	icon_state = "licorice"
	filling_color = "#999966"
	tastes = list("natural sweetness" = 1)
	list_reagents = list(/datum/reagent/consumable/licoricepulp = 1)
	grind_results = list(/datum/reagent/consumable/licoricepulp = 1)

////////////////////////
//  LICORICE CHEMS   //
///////////////////////
/datum/reagent/consumable/licoricepulp
	name = "licorice pulp"
	description = "Pulped licorice root."
	nutriment_factor = 1 * REAGENTS_METABOLISM
	color = "#14FF3C" // rgb: 48, 32, 0
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = 30

/datum/reagent/consumable/licoricepulp/on_mob_life(mob/living/carbon/M)
	if(prob(20))
		for(var/organ in M.internal_organs)
			M.adjustOrganLoss(-1 *REAGENTS_EFFECT_MULTIPLIER, 150)
	..()
	return TRUE // update health at end of tick

/datum/reagent/consumable/licoricepulp/overdose_process(mob/living/M)
	if(prob(33))
		M.adjustStaminaLoss(2.5*REM, updating_health = FALSE)
		M.adjustToxLoss(1*REM, updating_health = FALSE)
		M.losebreath++
		. = 1
	..()

////////////////////////
//	END CHEMS		 //
///////////////////////

/obj/item/reagent_containers/food/snacks/grown/bl/milkweed
	seed = /obj/item/seeds/bl/milkweed
	name = "milkweed"
	desc = "Are you sure this is safe? \
	Assuming it isn't a lookalike, the locals are known to use this for lesser burns and head colds."
	icon_state = "milkweed"
	filling_color = "#AAA1C9"
	tastes = list("strong bitterness" = 1)
	list_reagents = list(/datum/reagent/consumable/milkweedpulp = 1)
	grind_results = list(/datum/reagent/consumable/milkweedpulp = 1)

////////////////////////
//  MILKWEED CHEMS   //
///////////////////////
/datum/reagent/consumable/milkweedpulp
	name = "milkweed pulp"
	description = "Pulped milkweed flower, pod and sap."
	nutriment_factor = 1 * REAGENTS_METABOLISM
	water_level = -0.05
	color = ""
	taste_description = ""
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	glass_icon_state = ""
	overdose_threshold = 15

/datum/reagent/consumable/milkweedpulp/on_mob_life(mob/living/carbon/M)
	..()
	return TRUE // update health at end of tick

/datum/reagent/consumable/milkweedpulp/overdose_process(mob/living/M)
	..()
////////////////////////
//	END CHEMS		 //
///////////////////////

/obj/item/reagent_containers/food/snacks/grown/bl/yarrow
	seed = /obj/item/seeds/bl/yarrow
	name = "yarrow"
	desc = "Unassuming yarrow. Previously, a little after the bombs fell, it had been used as a home grown medical remedy. \
	Now, when prepared properly? It can be utilised as an incredibly effective broad-spectrum antibiotic."
	icon_state = "yarrow"
	filling_color = "#CBC9D4"
	tastes = list("sweetly bitterness" = 1)
	list_reagents = list(/datum/reagent/consumable/yarrowpulp = 1)
	grind_results = list(/datum/reagent/consumable/yarrowpulp = 1)

////////////////////////
//  YARROW CHEMS     //
///////////////////////
/datum/reagent/consumable/yarrowpulp
	name = "yarrow pulp"
	description = "Pulped yarrow."
	nutriment_factor = 1 * REAGENTS_METABOLISM
	color = ""
	taste_description = ""
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	glass_icon_state = ""
	overdose_threshold = 15

/datum/reagent/consumable/yarrowpulp/on_mob_life(mob/living/carbon/M)
	..()
	return TRUE // update health at end of tick

/datum/reagent/consumable/yarrowpulp/overdose_process(mob/living/M)
	..()
////////////////////////
//	END CHEMS		 //
///////////////////////

/obj/item/reagent_containers/food/snacks/grown/bl/skullcap
	seed = /obj/item/seeds/bl/skullcap
	name = "skullcap"
	desc = "An odd looking flower. Locals swear by its utility as a painkiller. Others caution against even looking at it. \
	Madness, truly."
	icon_state = "skullcap"
	filling_color = "#B294D1"
	tastes = list("mild bitterness" = 1)
	list_reagents = list(/datum/reagent/consumable/skullcappulp = 1)
	grind_results = list(/datum/reagent/consumable/skullcappulp = 1)

////////////////////////
//  SKULLCAP CHEMS   //
///////////////////////
/datum/reagent/consumable/skullcappulp
	name = "skullcap pulp"
	description = "Pulped skullcap."
	nutriment_factor = 1 * REAGENTS_METABOLISM
	water_level = -1
	color = ""
	taste_description = ""
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	glass_icon_state = ""
	overdose_threshold = 5

/datum/reagent/consumable/skullcappulp/on_mob_life(mob/living/carbon/M)
	..()
	return TRUE // update health at end of tick

/datum/reagent/consumable/skullcappulp/overdose_process(mob/living/M)
	..()
////////////////////////
//	END CHEMS		 //
///////////////////////
