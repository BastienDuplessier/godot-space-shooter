extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		get_tree().change_scene_to(preload("res://Title.tscn"))
