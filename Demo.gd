extends Spatial

var door_open = false


func _ready():
	oat_interaction_signals.connect("oat_environment_item_selected", self, "notify", ["Selected: "])
	oat_interaction_signals.connect("oat_environment_item_deselected", self, "notify", ["Deselected: "])
	oat_interaction_signals.connect("oat_environment_item_activated", self, "notify", ["Activated: "])
	
	oat_interaction_signals.connect("oat_environment_item_activated", self, "activate")


func notify(item_name, text):
	$Notification.text = text + item_name
	$Timer.start()


func _on_Timer_timeout():
	$Notification.text = ""


func activate(item_name):
	if item_name == "button_2":
		if door_open:
			$AnimationPlayer.play_backwards("open_door")
		else:
			$AnimationPlayer.play("open_door")
		door_open = not door_open
	if item_name == "button_1":
		$AnimationPlayer.play("drop_crate")
