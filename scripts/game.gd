extends Node2D

var p_flore_obs = preload("res://scenes/floor_obstacle.tscn")
var p_flore = preload("res://scenes/floor.tscn")
var speed = 10
var count = 0



func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawn()
	
func spawn():
	if count > 3:
		var flore
		var ran = randi()%11+1
		if (ran == 10):
			flore = p_flore_obs.instance()
		elif (ran == 9):
			flore = p_flore.instance()
		else:
			flore = p_flore.instance()
			
		flore.set_pos(Vector2(1500,350))
		add_child(flore)
		count = 0
	else:
		count += 1