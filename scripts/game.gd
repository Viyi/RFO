extends Node2D

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
		var flore = p_flore.instance()
		flore.set_pos(Vector2(1500,350))
		get_tree().get_root().add_child(flore)
		count = 0
	else:
		count += 1