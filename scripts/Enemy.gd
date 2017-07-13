extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal game_over

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var x = rand_range(10, 246)
	set_pos(Vector2(x, 0))


func _on_Enemy_body_enter( body ):
	if body.get_name() == "Limits":
		self.queue_free()
	if body.get_name() == "Player":
		emit_signal("game_over")
	if body.get_name().begins_with("Shoot"):
		body.queue_free()
		self.queue_free()
