/obj/machinery/computer/research_intel
	name = "Interesting computer"
	desc = "A computer used to access the colonies central database. The commands require to retrieve data from these comuters"

	icon =
	icon_state = "intel_computer"
	screen_overlay = "intel_computer_screen"
	circuit = /obj/item/circuitboard/computer/research_computer

	resistance_flags = UNACIDABLE
	interaction_flags = INTERACT_MACHINE_TGUI

/obj/machinery/computer/research_intel/process()
	. = ..()
	if(!printing)
		STOP_PROCESSING(SSmachines, src)
		return
	progress += progress_interval
	if(progress >= 100)
		STOP_PROCESSING(SSmachines, src)
		printing = FALSE
		printing_complete = TRUE
		SSpoints.supply_points[faction] += supply_reward
		SSpoints.dropship_points += dropship_reward
		priority_announce("Classified transmission recieved from [get_area(src)]. Bonus delivered as [supply_reward] supply points and [dropship_reward] dropship points.", title = "TGMC Intel Division")
		SSminimaps.remove_marker(src)

/obj/machinery/computer/research_intel/Destroy()
	GLOB.intel_computers -= src
	return ..()

/obj/machinery/computer/research_intel/interact(mob/user)
	if(!active)
		to_chat(user, span_notice("This terminal has nothing of use on it."))
		return
	return ..()

/obj/machinery/computer/research_intel/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ResearchComputer", "ResearchComputer")
		ui.open()

/obj/machinery/computer/research_intel/ui_data(mob/user)
	var/list/data = list()
	data["logged_in"] = logged_in
	data["first_login"] = first_login
	data["progress"] = progress
	data["printing"] = printing
	data["copied"] = copying_complete

	return data

/obj/machinery/computer/intel_computer/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	if(.)
		return
	switch(action)
		if("login")
			logged_in = TRUE
			. = TRUE
		if("first_load")
			first_login = FALSE
			. = TRUE
		if("start_progressing")
			printing = TRUE
			var/mob/living/ui_user = ui.user
			faction = ui_user.faction
			START_PROCESSING(SSmachines, src)
	update_icon()

/// Deactivates this intel computer, for use on hijack
/obj/machinery/computer/intel_computer/proc/disable_on_hijack()
	GLOB.intel_computers -= src // prevents the event running
	if(!active)
		return
	SStgui.close_uis(src)
	SSminimaps.remove_marker(src)
	active = FALSE
	if(printing)
		STOP_PROCESSING(SSmachines, src)
