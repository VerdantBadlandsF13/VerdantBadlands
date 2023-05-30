/obj/structure/closet/wardrobe/black
	name = "black wardrobe"
	desc = "It's a storage unit for standard-issue Nanotrasen attire."
	icon_door = "black"

/obj/structure/closet/wardrobe/black/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/black(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/jumpskirt/black(src)
	if(prob(25))
		new /obj/item/clothing/suit/jacket/leather(src)
	if(prob(20))
		new /obj/item/clothing/suit/jacket/leather/overcoat(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/shoes/sneakers/black(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/soft/black(src)
	new /obj/item/clothing/mask/bandana/black(src)
	new /obj/item/clothing/mask/bandana/black(src)
	if(prob(40))
		new /obj/item/clothing/mask/bandana/skull(src)
	return
