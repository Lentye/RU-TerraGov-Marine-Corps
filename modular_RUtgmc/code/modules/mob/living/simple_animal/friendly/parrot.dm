/datum/strippable_item/parrot_headset/finish_equip(atom/source, obj/item/equipping, mob/user)
	var/obj/item/radio/headset/radio = equipping
	if(!istype(radio))
		return

	var/mob/living/simple_animal/parrot/parrot_source = source
	if(!istype(parrot_source))
		return

	if(!user.transferItemToLoc(radio, source))
		return

	parrot_source.ears = radio

	to_chat(user, span_notice("You fit [radio] onto [source]"))

	parrot_source.available_channels.Cut()

	for(var/channel in radio.channels)
		switch(channel)
			if(RADIO_CHANNEL_ENGINEERING)
				parrot_source.available_channels.Add(RADIO_TOKEN_ENGINEERING)
			if(RADIO_CHANNEL_COMMAND)
				parrot_source.available_channels.Add(RADIO_TOKEN_COMMAND)
			if(RADIO_CHANNEL_CAS)
				parrot_source.available_channels.Add(RADIO_TOKEN_CAS)
			if(RADIO_CHANNEL_MEDICAL)
				parrot_source.available_channels.Add(RADIO_TOKEN_MEDICAL)
			if(RADIO_CHANNEL_REQUISITIONS)
				parrot_source.available_channels.Add(RADIO_TOKEN_REQUISITIONS)
			if(RADIO_CHANNEL_ALPHA)
				parrot_source.available_channels.Add(RADIO_TOKEN_ALPHA)
			if(RADIO_CHANNEL_BRAVO)
				parrot_source.available_channels.Add(RADIO_TOKEN_BRAVO)
			if(RADIO_CHANNEL_CHARLIE)
				parrot_source.available_channels.Add(RADIO_TOKEN_CHARLIE)
			if(RADIO_CHANNEL_DELTA)
				parrot_source.available_channels.Add(RADIO_TOKEN_DELTA)
			if(RADIO_CHANNEL_FOREIGN)
				parrot_source.available_channels.Add(RADIO_TOKEN_FOREIGN)

