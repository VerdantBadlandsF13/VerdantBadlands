/datum/fantasy_affix/cosmetic_suffixes
	placement = AFFIX_SUFFIX
	alignment = AFFIX_GOOD | AFFIX_EVIL

	var/list/goodSuffixes
	var/list/badSuffixes

/datum/fantasy_affix/cosmetic_suffixes/New()
	goodSuffixes = list(
		"dexterity",
		"constitution",
		"intelligence",
		"wisdom",
		"charisma",
		"the forest",
		"the hills",
		"the plains",
		"the sea",
		"the sun",
		"the moon",
		"the void",
		"the world",
		"many secrets",
		"many tales",
		"many colors",
		"rending",
		"sundering",
		"the night",
		"the day",
		)
	badSuffixes = list(
		"draining",
		"burden",
		"discomfort",
		"awkwardness",
		"poor hygiene",
		"timidity",
		)

	weight = (length(goodSuffixes) + length(badSuffixes)) * 10

/datum/fantasy_affix/cosmetic_suffixes/apply(datum/component/fantasy/comp, newName)
	. = ..()
	if(comp.quality > 0 || (comp.quality == 0 && prob(50)))
		return "[newName] of [pick(goodSuffixes)]"
	else
		return "[newName] of [pick(badSuffixes)]"

//////////// Good suffixes
/datum/fantasy_affix/bane
	placement = AFFIX_SUFFIX
	alignment = AFFIX_GOOD
	weight = 20

/datum/fantasy_affix/bane/apply(datum/component/fantasy/comp, newName)
	. = ..()
	// This is set up to be easy to add to these lists as I expect it will need modifications
	var/static/list/possible_mobtypes
	if(!possible_mobtypes)
		// The base list of allowed mob/species types
		possible_mobtypes = typecacheof(list(
			/mob/living/simple_animal,
			/mob/living/carbon,
			/datum/species,
			))
		// Some particular types to disallow if they're too broad/abstract
		possible_mobtypes -= list(
			/mob/living/simple_animal/hostile,
			)
		// Some types to remove them and their subtypes
		possible_mobtypes -= typecacheof(list(
			/mob/living/carbon/human/species,
			))

	var/mob/picked_mobtype = pick(possible_mobtypes)
	// This works even with the species picks since we're only accessing the name

	var/obj/item/master = comp.parent
	comp.bespoke_components += master.AddComponent(/datum/component/bane, picked_mobtype)
	return "[newName] of [initial(picked_mobtype.name)] slaying"

/datum/fantasy_affix/summoning
	placement = AFFIX_SUFFIX
	alignment = AFFIX_GOOD
	weight = 5

/datum/fantasy_affix/summoning/apply(datum/component/fantasy/comp, newName)
	. = ..()
	// This is set up to be easy to add to these lists as I expect it will need modifications
	var/static/list/possible_mobtypes
	if(!possible_mobtypes)
		// The base list of allowed mob/species types
		possible_mobtypes = typecacheof(list(
			/mob/living/simple_animal,
			/mob/living/carbon,
			/datum/species,
			))
		// Some particular types to disallow if they're too broad/abstract
		possible_mobtypes -= list(
			/mob/living/simple_animal/hostile,
			)
		// Some types to remove them and their subtypes
		possible_mobtypes -= typecacheof(list(
			/mob/living/carbon/human/species,
			/mob/living/simple_animal/hostile/megafauna,
			))

	var/mob/picked_mobtype = pick(possible_mobtypes)
	// This works even with the species picks since we're only accessing the name

	var/obj/item/master = comp.parent
	var/max_mobs = max(CEILING(comp.quality/2, 1), 1)
	var/spawn_delay = 300 - 30 * comp.quality
	master.AddComponent(/datum/component/summoning, list(picked_mobtype), 100, max_mobs, spawn_delay)
	return "[newName] of [initial(picked_mobtype.name)] summoning"

/datum/fantasy_affix/summoning/remove(datum/component/fantasy/comp)
	. = ..()
	var/obj/item/master = comp.parent
	qdel(master.GetComponent(/datum/component/summoning))

/datum/fantasy_affix/shrapnel
	placement = AFFIX_SUFFIX
	alignment = AFFIX_GOOD

/datum/fantasy_affix/shrapnel/validate(datum/component/fantasy/comp)
	if(isgun(comp.parent))
		return TRUE
	return FALSE

/datum/fantasy_affix/shrapnel/apply(datum/component/fantasy/comp, newName)
	. = ..()
	// higher means more likely
	var/list/weighted_projectile_types = list(/obj/item/projectile/energy/nuclear_particle = 1)

	var/obj/item/projectile/picked_projectiletype = pickweight(weighted_projectile_types)

	var/obj/item/master = comp.parent
	master.AddComponent(/datum/component/mirv, picked_projectiletype)
	return "[newName] of [initial(picked_projectiletype.name)] shrapnel"

/datum/fantasy_affix/shrapnel/remove(datum/component/fantasy/comp)
	. = ..()
	var/obj/item/master = comp.parent
	qdel(master.GetComponent(/datum/component/mirv))

/datum/fantasy_affix/strength
	placement = AFFIX_SUFFIX
	alignment = AFFIX_GOOD

/datum/fantasy_affix/strength/apply(datum/component/fantasy/comp, newName)
	. = ..()
	var/obj/item/master = comp.parent
	master.AddComponent(/datum/component/knockback, CEILING(comp.quality/2, 1), FLOOR(comp.quality/10, 1)) // cannot be duplicated, add/remove ourselves
	return "[newName] of strength"

/datum/fantasy_affix/strength/remove(datum/component/fantasy/comp)
	. = ..()
	var/obj/item/master = comp.parent
	qdel(master.GetComponent(/datum/component/knockback)) // cannot be duplicated, add/remove ourselves

//////////// Bad suffixes

/datum/fantasy_affix/fool
	placement = AFFIX_SUFFIX
	alignment = AFFIX_EVIL

/datum/fantasy_affix/fool/apply(datum/component/fantasy/comp, newName)
	. = ..()
	var/obj/item/master = comp.parent
	master.AddComponent(/datum/component/squeak, list('sound/items/bikehorn.ogg'=1), 50) // cannot be duplicated, add/remove ourselves
	return "[newName] of the fool"

/datum/fantasy_affix/fool/remove(datum/component/fantasy/comp)
	. = ..()
	var/obj/item/master = comp.parent
	qdel(master.GetComponent(/datum/component/squeak))
