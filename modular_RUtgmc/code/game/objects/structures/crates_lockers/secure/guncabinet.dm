/obj/structure/closet/secure_closet/guncabinet/canterbury/PopulateContents()
	new /obj/item/weapon/gun/shotgun/combat/standardmarine(src)
	new /obj/item/weapon/gun/rifle/m412(src)
	new /obj/item/weapon/gun/flamer/big_flamer/marinestandard(src)
	new /obj/item/ammo_magazine/flamer_tank/large(src)
	new /obj/item/weapon/gun/smg/m25(src)
	new /obj/item/weapon/gun/revolver/mateba(src)

	var/list/to_spawn = list(
		/obj/item/ammo_magazine/shotgun/incendiary = 2, // Incendiaries are quite rare, soo...
		/obj/item/ammo_magazine/rifle = 3,
		/obj/item/ammo_magazine/smg/m25 = 3,
		/obj/item/clothing/suit/armor/bulletproof = 2, // Synths might make use of it.
		/obj/item/ammo_magazine/revolver/mateba = 2,
		/obj/item/explosive/plastique = 5,
	)
	for(var/typepath in to_spawn)
		for(var/i in 1 to to_spawn[typepath])
			new typepath(src)
