/obj/item/hud_tablet/Initialize(mapload, rank, datum/squad/squad)
	. = ..()
	if(rank)
		var/dat = "marine"
		switch(rank)
			if(/datum/job/terragov/squad/leader)
				if(squad)
					switch(squad.name)
						if("Alpha")
							dat += " alpha"
							network = list("alpha")
							req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_ALPHA)
						if("Bravo")
							dat += " bravo"
							network = list("bravo")
							req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_BRAVO)
						if("Charlie")
							dat += " charlie"
							network = list("charlie")
							req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_CHARLIE)
						if("Delta")
							dat += " delta"
							network = list("delta")
							req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_DELTA)
						if("Foreign Legion")
							dat += " foreign"
							network = list("foreign")
							req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_FOREIGN)
				dat += " squad leader's"
			if(/datum/job/terragov/command/captain)
				dat += " captain's"
				network = list("marinesl", "marine", "marinemainship")
				req_access = list(ACCESS_MARINE_BRIDGE, ACCESS_MARINE_LEADER, ACCESS_MARINE_CAPTAIN)
			if(/datum/job/terragov/command/fieldcommander)
				dat += " field commander's"
				network = list("marinesl", "marine")
				req_access = list(ACCESS_MARINE_BRIDGE, ACCESS_MARINE_LEADER)
			if(/datum/job/terragov/command/pilot)
				dat += " pilot's"
				network = list("dropship1", "dropship2")
				req_access = list(ACCESS_MARINE_PILOT, ACCESS_MARINE_DROPSHIP)
		name = dat + " hud tablet"
	// Convert networks to lowercase
	for(var/i in network)
		network -= i
		network += lowertext(i)
	// Map name has to start and end with an A-Z character,
	// and definitely NOT with a square bracket or even a number.
	// I wasted 6 hours on this. :agony:
	map_name = "hud_tablet_[REF(src)]_map"
	// Initialize map objects
	cam_screen = new
	cam_screen.name = "screen"
	cam_screen.assigned_map = map_name
	cam_screen.del_on_map_removal = FALSE
	cam_screen.screen_loc = "[map_name]:1,1"
	cam_plane_masters = list()
	for(var/plane in subtypesof(/atom/movable/screen/plane_master) - /atom/movable/screen/plane_master/blackness)
		var/atom/movable/screen/plane_master/instance = new plane()
		instance.assigned_map = map_name
		instance.del_on_map_removal = FALSE
		if(instance.blend_mode_override)
			instance.blend_mode = instance.blend_mode_override
		instance.screen_loc = "[map_name]:CENTER"
		cam_plane_masters += instance
	cam_background = new
	cam_background.assigned_map = map_name
	cam_background.del_on_map_removal = FALSE
