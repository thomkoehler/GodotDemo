
extends Area2D

var screen_size
var pad_size
var ball_speed = 80
var direction = Vector2(-1,0)
const PAD_SPEED = 250


func _ready():
    screen_size = get_viewport_rect().size
    pad_size = get_node("left").get_texture().get_size()
    set_process(true)


func _process(delta):
	var left_pos = get_node("left").get_pos()
	if (left_pos.y > 0 and Input.is_action_pressed("leftMoveUp")):
		left_pos.y+=-PAD_SPEED*delta
	if (left_pos.y < screen_size.y and Input.is_action_pressed("leftMoveDown")):
        left_pos.y+=PAD_SPEED*delta

	get_node("left").set_pos(left_pos)
