extends "res://scenes/floor.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass


func _on_Area2D_body_entered(body):
	print (body.get_parent().name)
	if body.name == "Player":
		#get_tree().get_root().queue_free()
		
		get_tree().change_scene("res://scenes/Stage.tscn")
		
