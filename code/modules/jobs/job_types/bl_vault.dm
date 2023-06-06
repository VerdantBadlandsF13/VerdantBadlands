/datum/job/vault
	department_flag = VFE
	selection_color = "#668959"
	faction = FACTION_VLT
	exp_type = EXP_TYPE_VLT
	access = list(ACCESS_VFE)
	minimal_access = list(ACCESS_VFE)

	forbids = "Dry Fields Security forbids: <br> \
				- Provoking wars. You're tough, but not undefeatable. Know what battles you can and can't afford. <br> \
				- Farming. While not forbidden by any rule or technicality, it is much more cost effective to coerce the locals into giving you what you want. <br> \
				- Overextend. Never isolate yourself unless you're undercover. A team works better together."

	enforces = "Dry Fields Security expects: <br> \
				- Strongarming. Appearing tough and responding to diplomacy with a show of force can work miracles. <br> \
				- Extortion. You want money and people may not want protection. Give them a reason to. <br> \
				- Scavenging. You do not have a stable supply of food, water or components. <br> \
				- Kidnapping. Someone have something you want? Try taking one of their friends, or them. People are usually worth a lot more than their share of cram alive. <br> \
				- Negotiation. Violence has its place, but diplomacy goes a long way when it's backed up by your guns."

/datum/outfit/job/vault/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/*
Overseer
*/

/datum/job/vault/f13overseer
	title = "Vault-Tec Overseer"
	flag = F13VFEOVERSEER
	head_announce = list("Security")
	total_positions = 0
	spawn_positions = 0
	description = "You are the leader of the Vault, and your word is law. \
	Working with the Security team and your fellow Vault Dwellers, your goal is to ensure the continued prosperity and survival of the vault."
	supervisors = "Vault-Tec"
	req_admin_notify = 1
	exp_requirements = 120

	outfit = /datum/outfit/job/vault/f13overseer

	access = list(ACCESS_VFE, ACCESS_VFE_RESTRICT, ACCESS_VFE_SECURITY, ACCESS_VFE_MEDICAL, ACCESS_VFE_SCIENCE, ACCESS_VFE_ENGINEERING)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_RESTRICT, ACCESS_VFE_SECURITY, ACCESS_VFE_MEDICAL, ACCESS_VFE_SCIENCE, ACCESS_VFE_ENGINEERING)

/datum/outfit/job/vault/f13overseer
	name = "Overseer"
	jobtype = /datum/job/vault/f13overseer

	implants = list(/obj/item/implant/mindshield)

	id = 			/obj/item/card/id/gold
	uniform = 		/obj/item/clothing/under/f13/vault
	shoes = 		/obj/item/clothing/shoes/f13/military
	glasses = 		/obj/item/clothing/glasses/sunglasses
	ears = 			/obj/item/radio/headset/headset_overseer
	backpack = 		/obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/box/ids = 1,
		/obj/item/melee/classic_baton/telescopic = 1,
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 3,
		/obj/item/crowbar = 1)

/*
Security Officer
*/

/datum/job/vault/f13officer
	title = "Vault-Tec Security"
	flag = F13VFEOFFICER
	total_positions = 0
	spawn_positions = 0
	description = "You answer directly to the Overseer. You are the first line of defense against civil unrest and outside intrusion. \
	It is your duty to enforce the laws created by the Overseer and proactively seek out potential threats to the safety of Vault residents."
	exp_requirements = 60

	outfit = /datum/outfit/job/vault/f13security

	access = list(ACCESS_VFE, ACCESS_VFE_SECURITY)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_SECURITY)

/datum/outfit/job/vault/f13security
	name = "Vault-Tec Security"
	jobtype = /datum/job/vault/f13officer

	implants = list(/obj/item/implant/mindshield)

	id = /obj/item/card/id/sec
	ears = 			/obj/item/radio/headset/headset_vaultsec
	uniform = 		/obj/item/clothing/under/f13/vault
	head = 			/obj/item/clothing/head/helmet/riot/vaultsec
	suit =			/obj/item/clothing/suit/armored/f13/light/vfe_vest
	glasses = 		/obj/item/clothing/glasses/sunglasses
	shoes = 		/obj/item/clothing/shoes/f13/military
	belt = 			/obj/item/storage/belt/security
	r_hand =		/obj/item/gun/ballistic/automatic/pistol/n99
	l_pocket = 		/obj/item/restraints/handcuffs
	r_pocket = 		/obj/item/assembly/flash/handheld
	backpack = 		/obj/item/storage/backpack/security
	satchel = 		/obj/item/storage/backpack/satchel/sec
	duffelbag = 	/obj/item/storage/backpack/duffelbag/sec
	box = 			/obj/item/storage/box/security
	backpack_contents = list(
		/obj/item/melee/classic_baton/telescopic = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		/obj/item/crowbar = 1)

/*
Medical Doctor
*/

/datum/job/vault/f13doctor
	title = "Vault-Tec Doctor"
	flag = F13VFEDOCTOR
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Overseer. You are tasked with ensuring the medical well-being of everyone in the Vault."

	outfit = /datum/outfit/job/vault/f13doctor

	access = list(ACCESS_VFE, ACCESS_VFE_MEDICAL)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_MEDICAL)

/datum/outfit/job/vault/f13doctor
	name = "Medical Doctor"
	jobtype = /datum/job/vault/f13doctor
	chemwhiz = TRUE

	id = /obj/item/card/id/vaultiecard
	uniform = 		/obj/item/clothing/under/f13/vault
	ears = 			/obj/item/radio/headset/headset_vault/med
	shoes = 		/obj/item/clothing/shoes/f13/military
	suit =			/obj/item/clothing/suit/toggle/labcoat
	l_hand = 		/obj/item/storage/firstaid/regular
	suit_store = 	/obj/item/flashlight/pen
	backpack = 		/obj/item/storage/backpack/medic
	satchel = 		/obj/item/storage/backpack/satchel/med
	duffelbag = 	/obj/item/storage/backpack/duffelbag/med
	backpack_contents = list(
		/obj/item/crowbar = 1)

/datum/outfit/job/vault/f13doctor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/*
Scientist
*/

/datum/job/vault/f13vaultscientist
	title = "Vault-Tec Scientist"
	flag = F13VFESCIENTIST
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Overseer.\
	You are tasked with researching new technologies, conducting mining expeditions, and upgrading the machinery of the Vault."

	outfit = /datum/outfit/job/vault/f13vaultscientist

	access = list(ACCESS_VFE, ACCESS_VFE_SCIENCE)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_SCIENCE)

/datum/outfit/job/vault/f13vaultscientist
	name = "Scientist"
	jobtype = /datum/job/vault/f13vaultscientist
	chemwhiz = TRUE

	id = /obj/item/card/id/vaultiecard
	uniform = 		/obj/item/clothing/under/f13/vault
	ears = 			/obj/item/radio/headset/headset_vault/sci
	shoes = 		/obj/item/clothing/shoes/f13/military
	suit =			/obj/item/clothing/suit/toggle/labcoat
	backpack = 		/obj/item/storage/backpack/science
	satchel = 		/obj/item/storage/backpack/satchel/tox
	backpack_contents = list(/obj/item/crowbar = 1)

/datum/outfit/job/vault/f13vaultscientist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_MID, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/*
Vault Engineer
*/

/datum/job/vault/f13vaultengineer
	title = "Vault-Tec Engineer"
	flag = F13VFEENGINEER
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Overseer. You are tasked with overseeing the Reactor, maintaining Vault defenses and machinery, and engaging in construction projects to improve the Vault as a whole."

	outfit = /datum/outfit/job/vault/f13vaultengineer

	access = list(ACCESS_VFE, ACCESS_VFE_ENGINEERING)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_ENGINEERING)

/datum/outfit/job/vault/f13vaultengineer
	name = "Vault-Tec Engineer"
	jobtype = /datum/job/vault/f13vaultengineer

	id = /obj/item/card/id/vaultiecard
	ears = 			/obj/item/radio/headset/headset_vault/eng
	uniform = 		/obj/item/clothing/under/f13/vault
	belt = 			/obj/item/storage/belt/utility/full/engi
	shoes = 		/obj/item/clothing/shoes/sneakers/red
	head = 			/obj/item/clothing/head/hardhat
	r_pocket = 		/obj/item/t_scanner
	backpack = 		/obj/item/storage/backpack/industrial
	satchel = 		/obj/item/storage/backpack/satchel/eng
	duffelbag = 	/obj/item/storage/backpack/duffelbag/engineering
	box = 			/obj/item/storage/box/engineer
	backpack_contents = list(/obj/item/crowbar = 1)

/*
Vault Dweller
*/

/datum/job/vault/f13vaultDweller
	title = "Vault Dweller"
	flag = F13VFEDWELLER
	department_flag = VAULT
	department_head = list("Overseer")
	total_positions = 0
	spawn_positions = 0
	exp_requirements = 60
	exp_type = EXP_TYPE_FALLOUT

	outfit = /datum/outfit/job/vault/f13vaultDweller

/datum/outfit/job/vault/f13vaultDweller
	name = "Vault Dweller"
	id = /obj/item/card/id/vaultiecard
	jobtype = /datum/job/vault/f13vaultDweller
	backpack = 		/obj/item/storage/backpack/satchel/leather
	backpack_contents = list(/obj/item/crowbar = 1)

// Special - 'Borg
/datum/job/vault/f13borg
	title = "Vault-Tec Robot"
	flag = F13CYBORG
	total_positions = 0
	spawn_positions = 0
	description = "You are a Robotic unit assigned to Vault Fifty-Eight. \
	As a Robot for Vault-Tec, you're bound to the orders of the assigned Overseer, Security and Dwellers, in that order for priority. \
	Should the Overseer or Security declare something, you must follow it."
	exp_requirements = 60

/datum/job/followers/f13folborg/equip(mob/living/carbon/human/H, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, datum/outfit/outfit_override = null, client/preference_source)
	return H.Robotize(FALSE, latejoin)

/datum/job/followers/f13folborg/override_latejoin_spawn()
	return TRUE

/datum/job/followers/f13folborg/after_spawn(mob/living/silicon/robot/R, mob/M)
	. = ..()
	ADD_TRAIT(R, TRAIT_TECHNOPHREAK, TRAIT_GENERIC)
	R.apply_pref_name("human", M.client)
	R.gender = NEUTER
	R.forceMove(pick(GLOB.special_borg_start))
