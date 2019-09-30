extends KinematicBody2D


var action = "none"
var jump_limit = 11
var count = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#move_and_collide(Vector2(0,0))
	if position.y > 720:
		get_tree().change_scene("res://scenes/Stage.tscn")
		
	if Input.is_action_pressed("ui_up") and action == "none":
		action = "jump"
	if Input.is_action_just_pressed("ui_down") and (action == "none" or action == "slide"):	
		action = "slide"
		
	do_action()
	
func do_action():
	if action == "jump":
		jump()
	if action == "slide":
		slide()
	if action == "none":
		#move_and_slide(Vector2(0,1))
		pass
		
func slide():
	look_at(Vector2(296.495,0))
	move_and_collide(Vector2(0,2))			
	
func jump():
	if count < jump_limit and count != -1:
		# var height = (7 * log(count))/3
		var height = -1 * pow(2,(count - 6)) + jump_limit
		move_and_collide(Vector2(0, -height))
		count += 1
	
	elif count < jump_limit:
		move_and_collide(Vector2(0, 0))
		count = -1
		
	elif !is_on_wall():
		if move_and_collide(Vector2(0, 5)) != null:
			count = 1
			action = "none"
		
		
	