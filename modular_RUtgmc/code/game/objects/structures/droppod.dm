/obj/structure/droppod
	var/overrided = 1
	var/icon/parashute

/obj/structure/droppod/launch_pod(mob/user)
	. = ..()
	var/turf/target = locate(target_x, target_y, 2)
	var/obj/effect/overlay/blinking_laser/marine/pod_warning/laserpod = new /obj/effect/overlay/blinking_laser/marine/pod_warning(target)
	laserpod.dir = target
	QDEL_IN(laserpod, DROPPOD_TRANSIT_TIME + 1)

/obj/structure/droppod/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/key/pod))
		return attacked_by(I, user)
	else
		return ..()

/obj/structure/droppod/attacked_by(obj/item/I, mob/living/user, def_zone)
	if(istype(I, /obj/item/key/pod))
		allow_drop()
		overrided = 1
		desc += "\nOverrided drop pod, looks like parachute included"
		I.Destroy()
	else
		return ..()

/obj/structure/droppod/finish_drop(mob/user)
	var/turf/targetturf = locate(target_x, target_y, target_z)
	for(var/a in targetturf.contents)
		var/atom/target = a
		if(target.density)	//if theres something dense in the turf try to recalculate a new turf
			if(user)
				to_chat(user, span_warning("[icon2html(src, user)] WARNING! TARGET ZONE OCCUPIED! EVADING!"))
				balloon_alert(user, "EVADING")
			var/turf/T0 = locate(target_x + 2,target_y + 2, target_z)
			var/turf/T1 = locate(target_x - 2,target_y - 2, target_z)
			var/list/block = block(T0,T1) - targetturf
			for(var/t in block)//Randomly selects a free turf in a 5x5 block around the target
				var/turf/attemptdrop = t
				if(!attemptdrop.density && !is_type_in_typecache(attemptdrop, GLOB.blocked_droppod_tiles))
					targetturf = attemptdrop
					break
			if(targetturf.density)//We tried and failed, revert to the old one, which has a new dense obj but is at least not dense
				if(user)
					to_chat(user, span_warning("[icon2html(src, user)] RECALCULATION FAILED!"))
				targetturf = locate(target_x, target_y, target_z)
			break
	if(overrided)
		user.notransform = TRUE
		user.status_flags |= GODMODE
		ADD_TRAIT(user, TRAIT_HANDS_BLOCKED, REF(src))
		user.move_resist = MOVE_FORCE_OVERPOWERING
		user.unset_interaction()
		user.forceMove(targetturf)
		user.pixel_y = 500
		parashute = image(icon = 'icons/obj/items/fulton_balloon.dmi', icon_state = "fulton_balloon")
		user.overlays += parashute
		falltime = 8 SECONDS
		animate(user, pixel_y = initial((user.pixel_y)), time = falltime, easing = LINEAR_EASING)
		addtimer(CALLBACK(src, PROC_REF(dodrop), targetturf, user), falltime)
	else
		forceMove(targetturf)
		SEND_GLOBAL_SIGNAL(COMSIG_GLOB_DROPPOD_LANDED, targetturf)
		pixel_y = 500
		animate(src, pixel_y = initial(pixel_y), time = falltime, easing = LINEAR_EASING)
		addtimer(CALLBACK(src, PROC_REF(dodrop), targetturf, user), falltime)

///Do the stuff when it "hits the ground"
/obj/structure/droppod/dodrop(turf/targetturf, mob/user)
	if(overrided)
		deadchat_broadcast(" has landed at [get_area(targetturf)]!", src, user ? user : null, targetturf)
		completedrop(user)
	else
		deadchat_broadcast(" has landed at [get_area(targetturf)]!", src, user ? user : null, targetturf)
		explosion(targetturf, light_impact_range = 2)
		playsound(targetturf, 'sound/effects/droppod_impact.ogg', 100)
		QDEL_NULL(reserved_area)
		addtimer(CALLBACK(src, PROC_REF(completedrop), user), 7) //dramatic effect

/obj/structure/droppod/completedrop(mob/user)
	if(overrided)
		user.overlays -= parashute
		user.notransform = FALSE
		user.status_flags &= ~GODMODE
		REMOVE_TRAIT(user, TRAIT_HANDS_BLOCKED, REF(src))
		user.move_resist = initial(user.move_resist)
		return src.Destroy()
	else
		drop_state = DROPPOD_LANDED
		for(var/atom/movable/deployed AS in contents)
			deployed.forceMove(loc)
		update_icon()

/obj/item/key/pod
	name = "Drop Pods Override Key"
	desc = "One use key allowing to override drop pod in order to drop early"
	//icon_state = "pod_override"
