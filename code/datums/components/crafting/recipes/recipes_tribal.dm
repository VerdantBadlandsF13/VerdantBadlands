/datum/crafting_recipe/tribalwar
	category = CAT_PRIMAL

//ARMOR//

/datum/crafting_recipe/tribalwar/bonecodpiece
	name = "Skull Codpiece"
	result = /obj/item/clothing/accessory/skullcodpiece
	time = 20
	reqs = list(/obj/item/stack/sheet/bone = 2,
				/obj/item/stack/sheet/animalhide/deathclaw = 1) //changed from goliath to deathclaw
	always_available = FALSE

//WEAPONS//

/datum/crafting_recipe/tribalwar/blowgun
	name = "Blowgun"
	result = /obj/item/gun/syringe/blowgun
	time = 50
	reqs = list(/obj/item/stack/sheet/mineral/bamboo = 10)
	always_available = FALSE

/datum/crafting_recipe/tribalwar/training_machete
	name = "Training Machete"
	result = /obj/item/melee/onehanded/machete/training
	time = 50
	reqs = list(/obj/item/stack/sheet/mineral/wood = 5,
				/obj/item/stack/sheet/cloth = 2
				)
	tools = list(TOOL_WORKBENCH)

//CLOTHING AND TOOLS

/datum/crafting_recipe/tribal
	category = CAT_PRIMAL

/datum/crafting_recipe/tribal/tikimask
	name = "Tiki mask"
	result = /obj/item/clothing/mask/gas/tiki_mask
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 2)

/datum/crafting_recipe/tribal/bonetalisman
	name = "Bone Talisman"
	result = /obj/item/clothing/accessory/talisman
	time = 20
	reqs = list(/obj/item/stack/sheet/bone = 2,
				/obj/item/stack/sheet/sinew = 1)
	always_available = FALSE

/datum/crafting_recipe/tribal/bonebag
	name = "Tribal Satchel"
	result = /obj/item/storage/backpack/satchel/bone
	time = 30
	reqs = list(/obj/item/stack/sheet/bone = 3,
				/obj/item/stack/sheet/sinew = 2)
	always_available = FALSE

/datum/crafting_recipe/headpike
	name = "Spike Head (Glass Spear)"
	time = 65
	reqs = list(/obj/item/twohanded/spear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/twohanded/spear = 1)
	result = /obj/structure/headpike
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/headpikebone
	name = "Spike Head (Bone Spear)"
	time = 65
	reqs = list(/obj/item/twohanded/spear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/twohanded/spear = 1)
	result = /obj/structure/headpike/bone
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/tribal/mantlebrown
	name = "Brown Mantle"
	result = /obj/item/clothing/neck/mantle/brown
	time = 50
	reqs = list(/obj/item/stack/sheet/cloth = 2,
				/obj/item/stack/sheet/leather = 2)

/datum/crafting_recipe/tribal/mantlegray
	name = "Gray Mantle"
	result = /obj/item/clothing/neck/mantle/gray
	time = 50
	reqs = list(/obj/item/stack/sheet/cloth = 2,
				/obj/item/stack/sheet/leather = 2)

/datum/crafting_recipe/tribal/bonedie
	name = "Carve Bone Die"
	result = /obj/item/dice/d6
	time = 30
	reqs = list(/obj/item/stack/sheet/bone = 1)
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/warpaint
	name = "Body Paint"
	result = /obj/item/warpaint_bowl
	time = 30
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/mutfruit = 2,
				/obj/item/stack/ore/glass = 1,
				/obj/item/pestle = 1,
				/obj/item/reagent_containers/glass/mortar = 1)
	category = CAT_TRIBAL
	always_available = FALSE

/datum/crafting_recipe/warmace
	name = "Carve Wooden Warmace"
	result = /obj/item/twohanded/sledgehammer/warmace
	time = 100
	reqs = list(/obj/item/stack/sheet/mineral/wood = 10,
				/obj/item/stack/sheet/cloth = 3)
	tools = list(TOOL_WORKBENCH)
	category = CAT_TRIBAL
	always_available = FALSE
