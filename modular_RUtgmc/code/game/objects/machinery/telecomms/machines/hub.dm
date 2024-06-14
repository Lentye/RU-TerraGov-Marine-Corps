//Preset HUB
/obj/machinery/telecomms/hub/preset
	id = "Hub"
	network = "tcommsat"
	autolinkers = list("hub", "relay", "s_relay", "command", "medical", "ert",
	"requisitions", "alpha","firesupport", "bravo", "charlie", "delta", "foreign", "common", "engineering",
	"receiverA", "receiverB", "broadcasterA", "broadcasterB")

//proper cicbackup machine
/obj/machinery/telecomms/hub/preset/cicbackup
	on = 0
	id = "Backup Hub"
	network = "tcommsat"
	autolinkers = list("hub", "relay", "s_relay", "command", "medical", "ert",
	"requisitions", "alpha","firesupport", "bravo", "charlie", "delta", "foreign", "common", "engineering",
	"receiverA", "receiverB", "broadcasterA", "broadcasterB")

/obj/machinery/telecomms/hub/preset/som
	id = "Hub som"
	autolinkers = list("hub_som", "relay", "s_relay", "command_som", "medical_som", "ert",
	"zulu", "yankee", "xray", "whiskey", "foreign", "common_som", "engineering_som",
	"receiverA_som", "receiverB_som", "broadcasterA_som")
