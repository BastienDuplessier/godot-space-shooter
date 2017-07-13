extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 0

const MAX_SPEED = 200
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)

var shootCount = 0
var shoot = preload("res://Shoot.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	set_fixed_process(true)

func _fixed_process(delta):
	var is_moving_left = Input.is_action_pressed("move_left")
	var is_moving_right = Input.is_action_pressed("move_right")
	var is_moving = is_moving_left or is_moving_right

	var direction = Vector2(0, 0)
	speed = 0

	if is_moving:
		speed = MAX_SPEED
	if is_moving_left:
		direction = LEFT
	if is_moving_right:
		direction = RIGHT

	move(direction * speed * delta)

func _input(event):
	if Input.is_action_pressed("shoot"):
		shoot_projectile()

func shoot_projectile():
	get_node("AnimationPlayer").play("Shoot")
	shootCount = shootCount + 1
	var shootInstance = shoot.instance()
	shootInstance.set_name("Shoot" + str(shootCount))
	get_parent().add_child(shootInstance)
	shootInstance.set_pos(self.get_pos())
