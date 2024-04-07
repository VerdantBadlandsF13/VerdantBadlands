//Meant for simple animals to drop lootable human bodies.

//If someone can do this in a neater way, be my guest-Kor

//This has to be separate from the Away Mission corpses, because New() doesn't work for those, and initialize() doesn't work for these.

//To do: Allow corpses to appear mangled, bloody, etc. Allow customizing the bodies appearance (they're all bald and white right now).

//List of different corpse types

/obj/effect/mob_spawn/human/corpse/syndicatesoldier
	name = "Syndicate Operative"
	id_job = "Operative"
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	outfit = /datum/outfit/syndicatesoldiercorpse

/datum/outfit/syndicatesoldiercorpse
	name = "Syndicate Operative Corpse"
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/helmet/swat
	back = /obj/item/storage/backpack
	id = /obj/item/card/id/syndicate

/obj/effect/mob_spawn/human/corpse/syndicatecommando
	name = "Syndicate Commando"
	id_job = "Operative"
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	outfit = /datum/outfit/syndicatecommandocorpse

/datum/outfit/syndicatecommandocorpse
	name = "Syndicate Commando Corpse"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/space/hardsuit/syndi
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/syndicate
	back = /obj/item/tank/jetpack/oxygen
	r_pocket = /obj/item/tank/internals/emergency_oxygen
	id = /obj/item/card/id/syndicate


/obj/effect/mob_spawn/human/corpse/syndicatestormtrooper
	name = "Syndicate Stormtrooper"
	id_job = "Operative"
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	outfit = /datum/outfit/syndicatestormtroopercorpse

/datum/outfit/syndicatestormtroopercorpse
	name = "Syndicate Stormtrooper Corpse"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/elite
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/syndicate
	back = /obj/item/tank/jetpack/oxygen/harness
	id = /obj/item/card/id/syndicate

/obj/effect/mob_spawn/human/corpse/pirate
	name = "Pirate"
	skin_tone = "caucasian1" //all pirates are white because it's easier that way
	outfit = /datum/outfit/piratecorpse
	hair_style = "Bald"
	facial_hair_style = "Shaved"

/datum/outfit/piratecorpse
	name = "Pirate Corpse"
	uniform = /obj/item/clothing/under/costume/pirate
	shoes = /obj/item/clothing/shoes/f13/military
	glasses = /obj/item/clothing/glasses/eyepatch
	head = /obj/item/clothing/head/bandana


/obj/effect/mob_spawn/human/corpse/pirate/ranged
	name = "Pirate Gunner"
	outfit = /datum/outfit/piratecorpse/ranged

/datum/outfit/piratecorpse/ranged
	name = "Pirate Gunner Corpse"
	suit = /obj/item/clothing/suit/pirate
	head = /obj/item/clothing/head/pirate


/obj/effect/mob_spawn/human/corpse/russian
	name = "Russian"
	outfit = /datum/outfit/russiancorpse
	hair_style = "Bald"
	facial_hair_style = "Shaved"

/datum/outfit/russiancorpse
	name = "Russian Corpse"
	uniform = /obj/item/clothing/under/costume/soviet
	shoes = /obj/item/clothing/shoes/f13/rag
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/gas



/obj/effect/mob_spawn/human/corpse/russian/ranged
	outfit = /datum/outfit/russiancorpse/ranged

/datum/outfit/russiancorpse/ranged
	name = "Ranged Russian Corpse"


/obj/effect/mob_spawn/human/corpse/russian/ranged/trooper
	outfit = /datum/outfit/russiancorpse/ranged/trooper

/datum/outfit/russiancorpse/ranged/trooper
	name = "Ranged Russian Trooper Corpse"
	uniform = /obj/item/clothing/under/syndicate/camo
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	head = /obj/item/clothing/head/helmet/alt
	mask = /obj/item/clothing/mask/balaclava


/obj/effect/mob_spawn/human/corpse/russian/ranged/officer
	name = "Russian Officer"
	outfit = /datum/outfit/russiancorpse/officer

/datum/outfit/russiancorpse/officer
	name = "Russian Officer Corpse"
	uniform = /obj/item/clothing/under/costume/russian_officer
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset


/obj/effect/mob_spawn/human/corpse/wizard
	name = "Space Wizard Corpse"
	outfit = /datum/outfit/wizardcorpse
	hair_style = "Bald"
	facial_hair_style = "Long Beard"
	skin_tone = "caucasian1"

/obj/effect/mob_spawn/human/corpse/witch
	name = "Witch Corpse"
	outfit = /datum/outfit/wizardcorpse_other
	hair_style = "Bedhead (Long)"
	skin_tone = "albino"

/datum/outfit/wizardcorpse
	name = "Space Wizard Corpse"
	uniform = /obj/item/clothing/under/color/lightpurple
	suit = /obj/item/clothing/suit/wizrobe
	shoes = /obj/item/clothing/shoes/sandal/magic
	head = /obj/item/clothing/head/wizard

/datum/outfit/wizardcorpse_other
	name = "Witch Corpse"
	uniform = /obj/item/clothing/under/f13/erpdress
	suit = /obj/item/clothing/suit/wizrobe/black
	shoes = /obj/item/clothing/shoes/f13/fancy
	head = /obj/item/clothing/head/wizard/black


/obj/effect/mob_spawn/human/corpse/nanotrasensoldier
	name = "Nanotrasen Private Security Officer"
	id_job = "Private Security Force"
	id_access = "Security Officer"
	outfit = /datum/outfit/nanotrasensoldiercorpse2
	hair_style = "Bald"
	facial_hair_style = "Shaved"

/datum/outfit/nanotrasensoldiercorpse2
	name = "NT Private Security Officer Corpse"
	uniform = /obj/item/clothing/under/rank/security/officer
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	head = /obj/item/clothing/head/helmet/swat/nanotrasen
	back = /obj/item/storage/backpack/security
	id = /obj/item/card/id

/obj/effect/mob_spawn/human/corpse/cat_butcher
	name = "The Cat Surgeon"
	id_job = "Cat Surgeon"
	id_access_list = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MAINT)
	hair_style = "Cut Hair"
	facial_hair_style = "Watson Mustache"
	skin_tone = "caucasian1"
	outfit = /datum/outfit/cat_butcher

/datum/outfit/cat_butcher
	name = "Cat Butcher Uniform"
	uniform = /obj/item/clothing/under/rank/medical/doctor/green
	shoes = /obj/item/clothing/shoes/sneakers/white
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	ears = /obj/item/radio/headset
	back = /obj/item/storage/backpack/satchel/med
	id = /obj/item/card/id
	glasses = /obj/item/clothing/glasses/hud/health

/obj/effect/mob_spawn/human/corpse/bee_terrorist
	name = "BLF Operative"
	outfit = /datum/outfit/bee_terrorist

/datum/outfit/bee_terrorist
	name = "BLF Operative"
	uniform = /obj/item/clothing/under/color/yellow
	suit = /obj/item/clothing/suit/hooded/bee_costume
	shoes = /obj/item/clothing/shoes/sneakers/yellow
	gloves = /obj/item/clothing/gloves/color/yellow
	ears = /obj/item/radio/headset
	id = /obj/item/card/id
	mask = /obj/item/clothing/mask/rat/bee

/obj/effect/mob_spawn/human/corpse/raider
	uniform = /obj/item/clothing/under/jabroni
	shoes = /obj/item/clothing/shoes/f13/military
	hair_style = "Bald"
	facial_hair_style = "Shaved"

/obj/effect/mob_spawn/human/corpse/raidermelee
	name = "Raider Melee Corpse"
	uniform = /obj/item/clothing/under/jabroni
	shoes = /obj/item/clothing/shoes/f13/military
	head = /obj/item/clothing/head/helmet/skull
	hair_style = "Bald"
	facial_hair_style = "Shaved"

/obj/effect/mob_spawn/human/corpse/raiderranged
	name = "Raider Ranged Corpse"
	uniform = /obj/item/clothing/under/jabroni
	shoes = /obj/item/clothing/shoes/f13/military
	head = /obj/item/clothing/head/helmet/skull
	hair_style = "Bald"
	facial_hair_style = "Shaved"

/obj/effect/mob_spawn/human/corpse/raiderrangedsulphite
	name = "Sulphite Raider Ranged Corpse"
	uniform = /obj/item/clothing/under/f13/raiderharness
	shoes = /obj/item/clothing/shoes/f13/military
	hair_style = "Bald"
	facial_hair_style = "Shaved"

/obj/effect/mob_spawn/human/corpse/raiderboss
	name = "Raider Boss"
	uniform = /obj/item/clothing/under/f13/raiderharness
	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/helmet/f13/combat/mk2/raider
	hair_style = "Bald"
	facial_hair_style = "Shaved"

/obj/effect/mob_spawn/human/corpse/raiderbossalt
	name = "Raider Boss Corpse"
	uniform = /obj/item/clothing/under/f13/mercc
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/black
	hair_style = "Bald"
	facial_hair_style = "Shaved"

/obj/effect/mob_spawn/human/corpse/chineseremnant
	name = "Chinese Remnant Corpse"
	uniform = /obj/item/clothing/under/f13/chinese
	shoes = /obj/item/clothing/shoes/f13/military
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	mob_species = /datum/species/ghoul

/obj/effect/mob_spawn/human/corpse/chineseremnant/pistol
	name = "Chinese Remnant Pistoleer Corpse"
	neck = /obj/item/storage/belt/holster

/obj/effect/mob_spawn/human/corpse/chineseremnant/assault
	name = "Chinese Remnant Assault Corpse"
	belt = /obj/item/storage/belt/military/alt
