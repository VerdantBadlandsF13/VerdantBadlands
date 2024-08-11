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
	icon_grow = "licorice-grow"//for checks
	icon_dead = "licorice-dead"//for checks
	icon_harvest = "licorice-harvest"//for checks
	growing_icon = 'modular_badlands/code/modules/environment/icons/bl_flora_bw.dmi'
	product = /obj/item/reagent_containers/food/snacks/grown/bl
	lifespan = 100
	endurance = 30
	maturation = 10
	production = 5
	yield = 3
	potency = 30
	growthstages = 1
	rarity = 20
	genes = list(/datum/plant_gene/trait/repeated_harvest)

/obj/item/seeds/bl/licorice
	name = "licorice seed pack"
	desc = "An average seed pack for licorice."
	icon_state = "seed"
	species = "licorice"
	plantname = "licorice bush"
	icon_grow = "licorice-grow"
	icon_dead = "licorice-dead"
	icon_harvest = "licorice-harvest"
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
	icon_grow = "milkweed-grow"
	icon_dead = "milkweed-dead"
	icon_harvest = "milkweed-harvest"
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
	icon_grow = "yarrow-grow"
	icon_dead = "yarrow-dead"
	icon_harvest = "yarrow-harvest"
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
	icon_grow = "skullcap-grow"
	icon_dead = "skullcap-dead"
	icon_harvest = "skullcap-harvest"
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
	color = "#614100" // rgb: 48, 32, 0
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = 30
	pain_resistance = 3

/datum/reagent/consumable/licoricepulp/on_mob_life(mob/living/carbon/M)
	var/roll = rand(0,100)
	var/organDam = 0
	switch(roll)
		if(81 to 100)
			organDam = -0.45
		if(61 to 80)
			organDam = -0.40
		if(41 to 60)
			organDam = -0.30
		if(20 to 40)
			organDam = -0.20
		if(0 to 20)
			organDam = -0.10
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH,organDam*REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjustOrganLoss(ORGAN_SLOT_HEART,organDam*REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS,organDam*REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER,organDam*REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjustOrganLoss(ORGAN_SLOT_WOMB,organDam*REAGENTS_EFFECT_MULTIPLIER,150)
	..()
	return TRUE // update health at end of tick

/datum/reagent/consumable/licoricepulp/overdose_process(mob/living/M)
	var/roll = rand(0,100)
	var/organDam = 0
	var/toxLoss = 0
	switch(roll)
		if(81 to 100)
			organDam = 0.25
			toxLoss = 1.00
		if(61 to 80)
			organDam = 0.30
			toxLoss = 1.05
		if(41 to 60)
			organDam = 0.40
			toxLoss = 1.10
		if(20 to 40)
			organDam = 0.50
			toxLoss = 1.20
		if(0 to 20)
			organDam = 0.60
			toxLoss = 1.35
	M.adjustOrganLoss(ORGAN_SLOT_HEART,organDam*REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS,organDam*REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjustStaminaLoss(2.5*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	M.adjustToxLoss(toxLoss*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
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
	color = "#F77CA4"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = 15
	pain_resistance = 2

/datum/reagent/consumable/milkweedpulp/on_mob_life(mob/living/carbon/M)
	var/roll = rand(0,100)
	var/organDam = 0
	var/fireLoss = 0
	switch(roll)
		if(81 to 100)
			organDam = -0.25
			fireLoss = -0.25
		if(61 to 80)
			organDam = -0.2
			fireLoss = -0.2
		if(41 to 60)
			organDam = -0.15
			fireLoss = -0.15
		if(20 to 40)
			organDam = -0.1
			fireLoss = -0.1
		if(0 to 20)
			organDam = -0.05
			fireLoss = -0.05
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH,organDam * REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjustFireLoss(fireLoss * REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	..()
	return TRUE // update health at end of tick

/datum/reagent/consumable/milkweedpulp/overdose_process(mob/living/M)
	var/roll = rand(0,100)
	var/toxLoss = 0
	var/dizzy = 0
	switch(roll)
		if(81 to 100)
			toxLoss = 0.1 * REAGENTS_EFFECT_MULTIPLIER
		if(61 to 80)
			toxLoss = 0.2 * REAGENTS_EFFECT_MULTIPLIER
		if(41 to 60)
			toxLoss = 0.3 * REAGENTS_EFFECT_MULTIPLIER
		if(21 to 40)
			toxLoss = 0.4 * REAGENTS_EFFECT_MULTIPLIER
		if(0 to 20)
			toxLoss = 0.5 * REAGENTS_EFFECT_MULTIPLIER
	M.adjustToxLoss(toxLoss, updating_health = FALSE)
	. = 1
	M.Dizzy(dizzy)
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
	var/roll = rand(0,100)
	var/organDam = 0
	var/bruteLoss = 0
	var/tempInc = 0
	switch(roll)
		if(81 to 100)
			organDam = -0.25
			bruteLoss = -0.25
			tempInc = 0.25
		if(61 to 80)
			organDam = -0.2
			bruteLoss = -0.2
			tempInc = 0.25
		if(41 to 60)
			organDam = -0.15
			bruteLoss = -0.15
			tempInc = 0.25
		if(21 to 40)
			organDam = -0.1
			bruteLoss = -0.1
			tempInc = 0.25
		if(0 to 20)
			organDam = -0.05
			bruteLoss = -0.05
			tempInc = 0.25
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH,organDam * REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjustBruteLoss(bruteLoss * REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjust_bodytemperature(tempInc)
	..()
	return TRUE // update health at end of tick

/datum/reagent/consumable/yarrowpulp/overdose_process(mob/living/M)
	var/roll = rand(0,100)
	var/organDam = 0
	var/toxLoss = 0
	var/tempInc = 0
	switch(roll)
		if(81 to 100)
			organDam = 0.5
			toxLoss = 0.1
			tempInc = 0.75
		if(61 to 80)
			organDam = 0.75
			toxLoss = 0.2
			tempInc = 0.85
		if(41 to 60)
			organDam = 1
			toxLoss = 0.3
			tempInc = 0.95
		if(21 to 40)
			organDam = 1.25
			toxLoss = 0.4
			tempInc = 1.05
		if(0 to 20)
			organDam = 1.5
			toxLoss = 0.5
			tempInc = 1.15
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH,organDam * REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjustToxLoss(toxLoss * REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	M.adjust_bodytemperature(tempInc)
	M.losebreath++
	. = 1
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
	addiction_threshold = 1.25
	pain_resistance = 20

/datum/reagent/consumable/skullcappulp/on_mob_life(mob/living/carbon/M)
	var/roll = rand(0,100)
	var/organDam = 0
	var/toxLoss = 0
	switch(roll)
		if(81 to 100)
			organDam = 0.05
			toxLoss = 0.05
		if(61 to 80)
			organDam = 0.1
			toxLoss = 0.1
		if(41 to 60)
			organDam = 0.2
			toxLoss = 0.2
		if(21 to 40)
			organDam = 0.4
			toxLoss = 0.4
		if(0 to 20)
			organDam = 0.8
			toxLoss = 0.8
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH,organDam * REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjustToxLoss(toxLoss * REAGENTS_EFFECT_MULTIPLIER,150)
	..()
	return TRUE // update health at end of tick

/datum/reagent/consumable/skullcappulp/overdose_process(mob/living/M)
	var/roll = rand(0,100)
	var/organDam = 0
	var/toxLoss = 0
	switch(roll)
		if(81 to 100)
			organDam = 0.4
			toxLoss = 0.4
		if(61 to 80)
			organDam = 0.8
			toxLoss = 0.8
		if(41 to 60)
			organDam = 1.6
			toxLoss = 1.6
		if(21 to 40)
			organDam = 3.2
			toxLoss = 3.2
		if(0 to 20)
			organDam = 6.4
			toxLoss = 6.4
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH,organDam * REAGENTS_EFFECT_MULTIPLIER,150)
	M.adjustToxLoss(toxLoss * REAGENTS_EFFECT_MULTIPLIER,150)
	..()
////////////////////////
//	END CHEMS		 //
///////////////////////
