
extends Label


var lastAccum = 0
var currAccum = 0

var sprite


func _ready():
	set_process(true)
	
	sprite = Sprite.new()
	add_child(sprite)
	
	
	
	
func _process(delta):
	currAccum += delta
	if currAccum >= lastAccum + 1.0:
		lastAccum = currAccum
		set_text(" " + str(lastAccum) + "\n " + str(1 / delta))



