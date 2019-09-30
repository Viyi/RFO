extends KinematicBody2D


var action = "none"
var jump_limit = 20
var count = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up") and action == "none":
		action = "jump"
		
	do_action()
	
func do_action():
	if action == "jump":
		jump()
		
func jump():
	if count < jump_limit and count != -1:
		var height = (7 * log(count))/3
		move_and_collide(Vector2(0, -height))
		count += 1
	
	elif count < jump_limit:
		move_and_collide(Vector2(0, -3))
		count = -1
		
	elif !is_on_wall():
		if move_and_collide(Vector2(0, 5)) != null:
			count = 1
			action = "none"
		
		
	