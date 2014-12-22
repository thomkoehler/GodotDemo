
extends Node2D

var screenSize
var padSize
var ballSpeed = 80
var direction = Vector2(-1.1, 2.0)
var outLabel
const PAD_SPEED = 250


func _ready():
	screenSize = get_viewport_rect().size
	padSize = get_node("left").get_texture().get_size()
	set_process(true)
	

func _process(delta):
	moveLeftPad(delta)
	moveRightPad(delta)
	moveBall(delta)


func moveLeftPad(delta):
	var leftPos = get_node("left").get_pos()
	
	if (leftPos.y > 0 and Input.is_action_pressed("leftMoveUp")):
		leftPos.y -= PAD_SPEED*delta
		get_node("left").set_pos(leftPos)
		
	elif (leftPos.y < screenSize.y and Input.is_action_pressed("leftMoveDown")):
        leftPos.y += PAD_SPEED*delta
        get_node("left").set_pos(leftPos)


func moveBall(delta):
	var ballPos = get_node("ball").get_pos()
	var leftRect = Rect2(get_node("left").get_pos() - padSize/2, padSize)
	var rightRect = Rect2(get_node("right").get_pos() - padSize/2, padSize)
	
	if (ballPos.y < 0 and direction.y < 0) or (ballPos.y > screenSize.y and direction.y > 0):
		direction.y = - direction.y 
		
	if (ballPos.x < 0 and direction.x < 0) or (ballPos.x > screenSize.x and direction.x > 0):
		direction.x = - direction.x 
		
	if ((leftRect.has_point(ballPos) and direction.x < 0) or (rightRect.has_point(ballPos) and direction.x > 0)):
		direction.x = - direction.x 
		
		
	ballPos += direction * ballSpeed * delta
	get_node("ball").set_pos(ballPos)
	
	

func moveRightPad(delta):
	var rightPos = get_node("right").get_pos()
	
	if rightPos.y > 0 and Input.is_action_pressed("rightMoveUp"):
		rightPos.y -= PAD_SPEED*delta
		get_node("right").set_pos(rightPos)
		
	if rightPos.y < screenSize.y and Input.is_action_pressed("rightMoveDown"):
        rightPos.y += PAD_SPEED*delta
        get_node("right").set_pos(rightPos)


	
