extends Spatial


func _ready():
	goat.connect("interactive_item_activated", self, "item_activated")


func item_activated(item_name, _position):
	if item_name == "generator":
		var generator_screen_on = load(
			"res://demo/workshop/materials/generator_screen_on.material"
		)
		# Set generator screen's material (surface: 2)
		$InteractiveItem/Model.set_surface_material(2, generator_screen_on)