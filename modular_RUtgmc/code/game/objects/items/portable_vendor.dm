/obj/item/portable_vendor/ex_act(severity)
	if(prob(severity / 4))
		qdel(src)

/obj/item/portable_vendor/corporate
	listed_products = list(
		list("INCENTIVES", 0, null, null, null),
		list("Cash", 2, /obj/item/spacecash/c500, "white", "$500 USD, unmarked bills"),
		list("Cigars", 5, /obj/item/storage/fancy/cigar, "white", "Case of premium cigars, untampered."),
		list("Space Drug Autoinjector", 10, /obj/item/reagent_containers/hypospray/autoinjector/spacedrugs, "white", "Drugs for junkie marines who still need that fix."),
		list("Nanotrasen 'Space-Aged' 60-Year Old Whiskey", 20, /obj/item/reagent_containers/food/drinks/bottle/specialwhiskey, "white", "Aged at the bottom of a starship since 2378. You can guess how much it's worth."),
		list("Mindbreaker Toxin Autoinjector", 30, /obj/item/reagent_containers/hypospray/autoinjector/mindbreaker, "white", "Drugs for people whose PTSD have permanently scarred them."),
		list("Roulettium Autoinjector", 30, /obj/item/reagent_containers/hypospray/autoinjector/roulettium, "white", "Drugs for people who really, really miss gambling. Enough for their life." ),
		list("NT-06 Experimental Liquor", 40, /obj/item/reagent_containers/food/drinks/bottle/experimentalliquor, "white", "An experimental liquor we cooked up in the lab a few years back. Composed of ██████."),
		list("Elite Autoinjector", 50, /obj/item/reagent_containers/hypospray/autoinjector/elite, "white", "A combat injector 'supposedly' used by our 'Deathsquads'. Don't give it out unless they have something to give in return."),
		list("De Void of Soul", 51, /obj/item/clothing/under/liaison_suit/galaxy_blue, "white", "The latest in ultrafashion. for those with a cool demeanor."),
		list("Pulsar Gonne", 51, /obj/item/clothing/under/liaison_suit/galaxy_red, "white", "The latest in ultrafashion. for those with a fiery temper."),
		list("MG-42-RAT", 51, /obj/item/weapon/gun/rifle/standard_lmg/elite, "white", "The latest in ultrafashion. for those with a fiery temper."),
		list("PR-412E battle rifle", 51, /obj/item/weapon/gun/rifle/m412/elite, "white", "The latest in ultrafashion. for those with a fiery temper."),
		list("PR-412 AP magazine", 51, /obj/item/ammo_magazine/rifle/ap, "white", "The latest in ultrafashion. for those with a fiery temper."),
		list("Valkyrie PMC edition", 51, /obj/item/armor_module/module/valkyrie_autodoc/pmc, "white", "The latest in ultrafashion. for those with a fiery temper."),
		list("Valipire module", 51, /obj/item/armor_module/module/chemsystem/vampire, "white", "The latest in ultrafashion. for those with a fiery temper."),
		list("Mimir", 51, /obj/item/armor_module/module/mimir_environment_protection, "white", "The latest in ultrafashion. for those with a fiery temper."),
		list("PMC advanced body vest", 51, /obj/item/clothing/suit/storage/marine/veteran/pmc/leader, "white", "The latest in ultrafashion. for those with a fiery temper."),
		list("Cargo Money", 51, /obj/item/research_product/money/rare, "white", "The latest in ultrafashion. for those with a fiery temper."),
	)
