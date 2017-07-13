extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var timer
var meteorCount = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_Timer_timeout():
	var meteor = preload("res://Enemy.tscn").instance()
	meteorCount = meteorCount + 1
	meteor.set_name("Meteor" + str(meteorCount))
	meteor.connect("game_over", self, "run_game_over")
	add_child(meteor)

func run_game_over():
	get_tree().change_scene_to(preload("res://GameOver.tscn"))
