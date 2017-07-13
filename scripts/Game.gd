extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var timer
var meteorCount = 0
var score = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	update_score_label()

func _on_Timer_timeout():
	var meteor = preload("res://Enemy.tscn").instance()
	meteorCount = meteorCount + 1
	meteor.set_name("Meteor" + str(meteorCount))
	meteor.connect("game_over", self, "run_game_over")
	meteor.connect("dead", self, "update_score")
	add_child(meteor)

func run_game_over():
	get_tree().change_scene_to(preload("res://GameOver.tscn"))

func update_score_label():
	get_node("ScoreLabel").set_text("Score : " + str(score))

func update_score():
	score = score + 1
	update_score_label()
