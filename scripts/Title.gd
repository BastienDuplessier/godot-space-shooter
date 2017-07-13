extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	if Input.is_action_pressed("enter"):
		get_tree().change_scene_to(preload("res://Game.tscn"))

