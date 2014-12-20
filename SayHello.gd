
extends Panel


func onButtonPressed():
	get_node("Label").set_text("Hello World")

func _ready():
	get_node("Button").connect("pressed", self, "onButtonPressed")

