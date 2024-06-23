//Captain

/datum/job/terragov/command/captain/after_spawn(mob/living/new_mob, mob/user, latejoin)
	..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	new_human.dropItemToGround(new_human.head)
	switch(playtime_mins)
		if(0 to 1500) // starting
			new_human.wear_id.paygrade = "O6"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/captain/black, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/captain_cloak_red, SLOT_BACK)
		if(1501 to 3000) // 25hrs
			new_human.wear_id.paygrade = "O7"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/captain/black, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/captain_cloak_red, SLOT_BACK)
		if(3001 to 4500) //50 hrs
			new_human.wear_id.paygrade = "O8"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/captain, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/captain_cloak_red/white, SLOT_BACK)
		if(4501 to INFINITY) //75 hrs
			new_human.wear_id.paygrade = "O9"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/captain, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/captain_cloak_red/white, SLOT_BACK)


/datum/outfit/job/command/captain
	belt = /obj/item/storage/holster/blade/officer/sabre/full
	glasses = /obj/item/clothing/glasses/sunglasses/aviator/yellow
	head = null
	back = FALSE

//Staff officer
/datum/job/terragov/command/staffofficer/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	new_human.dropItemToGround(new_human.head)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 1500) // starting
			new_human.wear_id.paygrade = "O3"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/staff, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/officer_cloak_red, SLOT_BACK)
		if(1501 to 3000) // 25 hrs
			new_human.wear_id.paygrade = "O4"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/staff, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/officer_cloak_red, SLOT_BACK)
		if(3001 to INFINITY) // 50 hrs
			new_human.wear_id.paygrade = "O5"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/staff, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/officer_cloak_red/alt, SLOT_BACK)

/datum/outfit/job/command/staffofficer
	back = FALSE
	head = null
	w_uniform = /obj/item/clothing/under/marine/whites/blacks
	shoes = /obj/item/clothing/shoes/laceup

/datum/job/terragov/engineering/tech
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/medical/medicalofficer
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/medical/researcher
	exp_type = EXP_TYPE_MEDICAL
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/command/pilot
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERIENCED

/datum/job/terragov/command/pilot/radio_help_message(mob/M)
	. = ..()
	to_chat(M, {"Your job is to support marines with either close air support via the Condor, or mobile dropship support with the Tadpole.
While you are in charge of all aerial crafts the Normandy does not require supervision outside of turning automatic mode on or off at crucial times, and you are expected to choose between the Condor and Tadpole.
Though you are a warrant officer, your authority is limited to the dropship and your chosen aerial craft, where you have authority over the enlisted personnel.
"})

/datum/job/terragov/engineering/chief
	exp_type = EXP_TYPE_ENGINEERING
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/requisitions/officer
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERIENCED

/datum/job/terragov/medical/professor
	exp_type = EXP_TYPE_MEDICAL
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/civilian/liaison
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/silicon/ai
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERIENCED

/datum/job/terragov/command/fieldcommander
	exp_type = EXP_TYPE_MARINES
	exp_requirements = XP_REQ_EXPERT

/datum/job/terragov/command/mech_pilot
	exp_type = EXP_TYPE_MARINES
	exp_requirements = XP_REQ_EXPERIENCED

/datum/job/terragov/silicon/synthetic
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERT

/datum/job/terragov/silicon/synthetic/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) //up to 10 hours
			new_human.wear_id.paygrade = "Mk.I"
		if(601 to 3000) // 10 to 50 hrs
			new_human.wear_id.paygrade = "Mk.II"
		if(3001 to 6000) // 50 to 100 hrs
			new_human.wear_id.paygrade = "Mk.III"
		if(6001 to 9000) // 100 to 150 hrs
			new_human.wear_id.paygrade = "Mk.IV"
		if(9001 to 12000) // 150 to 200 hrs
			new_human.wear_id.paygrade = "Mk.V"
		if(12001 to 15000) // 200 to 250 hrs
			new_human.wear_id.paygrade = "Mk.VI"
		if(15001 to 18000) // 250 to 300 hrs
			new_human.wear_id.paygrade = "Mk.VII"
		if(18001 to 21000) // 300 to 350 hrs
			new_human.wear_id.paygrade = "Mk.VIII"
		if(21001 to 60000) // 350 to 1000 hrs
			new_human.wear_id.paygrade = "Mk.IX"
		if(60001 to INFINITY) // 1000 hrs and more
			new_human.wear_id.paygrade = "Mk.X"

/datum/job/terragov/command/captain
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERT

/datum/job/terragov/command/staffofficer
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERIENCED

//Intel Officer
/datum/job/terragov/command/intel_officer
	title = INTELLIGENCE_OFFICER
	req_admin_notify = TRUE
	paygrade = "O4"
	comm_title = "INOF"
	total_positions = 1
	skills_type = /datum/skills/inof
	access = ALL_MARINE_ACCESS
	minimal_access = ALL_MARINE_ACCESS
	display_order = JOB_DISPLAY_ORDER_CORPORATE_LIAISON
	outfit = /datum/outfit/job/command/intel_officer
	exp_requirements = XP_REQ_EXPERT
	exp_type = EXP_TYPE_COMMAND
	job_flags = JOB_FLAG_LATEJOINABLE|JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_PROVIDES_BANK_ACCOUNT|JOB_FLAG_ADDTOMANIFEST|JOB_FLAG_BOLD_NAME_ON_SELECTION|JOB_FLAG_PROVIDES_SQUAD_HUD|JOB_FLAG_CAN_SEE_ORDERS|JOB_FLAG_LOUDER_TTS
	jobworth = list(
		/datum/job/xenomorph = LARVA_POINTS_STRONG,
		/datum/job/terragov/squad/smartgunner = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/silicon/synthetic = SYNTH_POINTS_REGULAR,
		/datum/job/terragov/command/mech_pilot = MECH_POINTS_REGULAR,
	)
	html_description = {"
		<b>Difficulty</b>:Very Hard<br /><br />
		<b>You answer to the</b> Corporate Liaison and Field Commander<br /><br />
		<b>Unlock Requirement</b>: Starting Role<br /><br />
		<b>Gamemode Availability</b>: Distress Signal, Nuclear War<br /><br /><br />
		<b>Duty</b>: Gather intel and important items to corporation for rewards behind enemy's lines. Assist platoon advantage by sharing combat important information and marking enemy's fortifications, dont get yourself killed by any means. Be true commandos.
	"}
	minimap_icon = "intel_officer"

/datum/job/terragov/command/intel_officer/radio_help_message(mob/M)
	. = ..()
	to_chat(M, {"You are charged with gathering important items from the ground and extracting them by fultons packs.
Your duties are to ensure what none of NanoTrasen documents will be left behind and,
none of important research results will be left on computers.
Assist platoon advantage by intelligence and orbital bomb beacons.
Dont forget to order scout clock and make the NT proud!"})

/datum/outfit/job/command/intel_officer
	name = INTELLIGENCE_OFFICER
	jobtype = /datum/job/terragov/command/intel_officer

	id = /obj/item/card/id/silver
	back = /obj/item/storage/backpack/marine/standard/scav
	belt = /obj/item/storage/belt/marine/smg25ap
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/marine/veteran/pmc/leader/inof
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/pmc
	shoes = /obj/item/clothing/shoes/marine/full
	gloves = /obj/item/clothing/gloves/marine/veteran/pmc
	head = /obj/item/clothing/head/helmet/marine/veteran/pmc
	r_store = /obj/item/storage/pouch/tools/full
	l_store = /obj/item/storage/pouch/electronics/inof
	suit_store = /obj/item/weapon/gun/smg/m25/elite
	glasses = /obj/item/clothing/glasses/night/m56_goggles

/datum/outfit/job/command/intel_officer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()

	H.equip_to_slot_or_del(new /obj/item/key/pod, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/beacon/supply_beacon, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/roller/medevac, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/medevac_beacon, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/storage/box/MRE, SLOT_IN_ACCESSORY)

	H.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/plasma_pistol, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/tool/extinguisher, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/storage/box/orbital_beacons, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/box/flashdrivers, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/research_product/money/uncommon, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_hand(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_hand(new /obj/item/stack/sheet/glass/large_stack, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_HEAD)
