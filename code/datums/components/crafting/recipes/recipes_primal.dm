/datum/crafting_recipe/tribal_torch
	name = "Tribal Torch"
	result = /obj/item/candle/tribal_torch
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 4)
	category = CAT_PRIMAL

/datum/crafting_recipe/handheld_torch
	name = "Handheld Torch"
	result = /obj/item/flashlight/flare/torch
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 3,
				/obj/item/stack/sheet/cloth = 1)
	category = CAT_PRIMAL

/datum/crafting_recipe/bonfire
	name = "Bonfire"
	time = 60
	reqs = list(/obj/item/stack/sheet/mineral/wood = 30)
	result = /obj/structure/bonfire
	category = CAT_PRIMAL

/datum/crafting_recipe/bonfirecaps
	name = "Bonfire"
	time = 60
	reqs = list(/obj/item/grown/log = 5)
	result = /obj/structure/bonfire
	category = CAT_PRIMAL

/datum/crafting_recipe/headpikelegion
	name = "Spike Head (Throwing Spear)"
	time = 65
	reqs = list(/obj/item/throwing_star/spear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/throwing_star/spear = 1)
	result = /obj/structure/headpike
	category = CAT_PRIMAL

/datum/crafting_recipe/headpike
	name = "Spike Head (Glass Spear)"
	time = 65
	reqs = list(/obj/item/twohanded/spear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/twohanded/spear = 1)
	result = /obj/structure/headpike
	category = CAT_PRIMAL

/datum/crafting_recipe/headpikebone
	name = "Spike Head (Bone Spear)"
	time = 65
	reqs = list(/obj/item/twohanded/spear/bonespear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/twohanded/spear/bonespear = 1)
	result = /obj/structure/headpike/bone
	category = CAT_PRIMAL

/datum/crafting_recipe/rib
	name = "Collosal Rib"
	always_available = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 10,
			/datum/reagent/oil = 5)
	result = /obj/structure/statue/bone/rib
	category = CAT_PRIMAL

/datum/crafting_recipe/skull
	name = "Skull Carving"
	always_available = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 6,
			/datum/reagent/oil = 5)
	result = /obj/structure/statue/bone/skull
	category = CAT_PRIMAL

/datum/crafting_recipe/halfskull
	name = "Cracked Skull Carving"
	always_available = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 3,
			/datum/reagent/oil = 5)
	result = /obj/structure/statue/bone/skull/half
	category = CAT_PRIMAL

/datum/crafting_recipe/boneshovel
	name = "Serrated Bone Shovel"
	always_available = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 4,
			/datum/reagent/oil = 5,
			/obj/item/shovel/spade = 1)
	result = /obj/item/shovel/serrated
	category = CAT_PRIMAL

/datum/crafting_recipe/punji_sticks
	name = "Punji stick Trap"
	time = 180
	reqs = list(
			/obj/item/stack/sheet/mineral/bamboo = 5)
	result = /obj/structure/punji_sticks
	category = CAT_PRIMAL

//ARROWS

/datum/crafting_recipe/tribalwar/arrowburn
	name = "Burning Oil Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/burning
	time = 30
	reqs = list(/obj/item/ammo_casing/caseless/arrow = 1,
				/datum/reagent/fuel = 10)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/arrowap
	name = "Sturdy Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/ap
	time = 40
	reqs = list(
		/obj/item/stack/rods = 2,
		/obj/item/stack/crafting/metalparts = 2,
		)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/arrowbronze
	name = "Bronze Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/bronze
	time = 30
	reqs = list(/obj/item/stack/sheet/bronze = 1,
				/obj/item/stack/sheet/mineral/wood = 1)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/campfire //Adding a campfire; it takes less expertise, and less ingredients than the bonfire available to primals, but it's also less grand and takes more time.
	name = "Campfire"
	time = 75
	reqs = list(/obj/item/stack/sheet/mineral/wood = 20)
	result = /obj/structure/campfire
	category = CAT_TRIBAL
	always_available = TRUE

/datum/crafting_recipe/tribalwar/arrowpoison
	name = "Poison Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/poison
	time = 30
	reqs = list(
		/obj/item/ammo_casing/caseless/arrow = 1,
		/obj/item/reagent_containers/food/snacks/grown/feracactus = 1,
		)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/arrowbone
	name = "Bone Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/bone
	time = 30
	reqs = list(/obj/item/stack/sheet/bone = 1,
				/obj/item/stack/sheet/mineral/wood = 1)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)
	always_available = FALSE


/datum/crafting_recipe/tribalwar/cheaparrow
	name = "Lightweight Wooden Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/cheap
	time = 15
	reqs = list(/obj/item/stack/sheet/mineral/wood = 1,
				/obj/item/stack/sheet/mineral/sandstone = 2)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)


/datum/crafting_recipe/tribalwar/arrowwound
	name = "Serrated Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/serrated
	time = 10
	reqs = list(
		/obj/item/stack/rods = 1,
		/obj/item/stack/crafting/goodparts = 1
		)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/arrowembed
	name = "Broadhead Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/broadhead
	time = 10
	reqs = list(
		/obj/item/stack/rods = 1,
		/obj/item/stack/crafting/goodparts = 1
		)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

//MELEE

/datum/crafting_recipe/tribalwar/bonespear
	name = "Bone Spear"
	result = /obj/item/twohanded/spear/bonespear
	time = 30
	reqs = list(/obj/item/stack/sheet/bone = 4,
				/obj/item/stack/sheet/sinew = 1)
	category = CAT_TRIBAL
	always_available = FALSE

/datum/crafting_recipe/tribalwar/boneaxe
	name = "Bone Axe"
	result = /obj/item/twohanded/fireaxe/boneaxe
	time = 50
	reqs = list(/obj/item/stack/sheet/bone = 6,
				/obj/item/stack/sheet/sinew = 3)
	category = CAT_TRIBAL
	always_available = FALSE

/datum/crafting_recipe/tribalwar/warclub
	name = "Wooden Warclub"
	result = /obj/item/melee/onehanded/club/warclub
	time = 80
	reqs = list(/obj/item/stack/sheet/mineral/wood = 10,
				/obj/item/stack/sheet/cloth = 1)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)
	always_available = FALSE

/datum/crafting_recipe/tribalwar/tribe_quiver
	name = "Craft Quiver and Arrows"
	result = /obj/item/storage/belt/tribe_quiver
	time = 80
	reqs = list(/obj/item/stack/sheet/mineral/wood = 8,
				/obj/item/stack/sheet/metal = 4,
				/obj/item/stack/sheet/leather = 1)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/spearquiver
	name = "Spear Quiver"
	result = /obj/item/storage/backpack/spearquiver/empty
	time = 60
	reqs = list(/obj/item/stack/sheet/leather = 3,
				/obj/item/stack/sheet/metal = 1)
	category = CAT_TRIBAL

/datum/crafting_recipe/tribalradio
	name = "Primitive Radio"
	result = /obj/item/radio/tribal
	time = 25
	reqs = list(/obj/item/stack/crafting/electronicparts = 2,
				/obj/item/stack/crafting/metalparts = 2,
				/obj/item/stack/cable_coil = 1)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)
	always_available = FALSE
