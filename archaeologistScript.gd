extends KinematicBody

var speed = 3  # movement speed
var spin = 0.1  # rotation speed
var velocity = Vector3.ZERO

func get_input():
	velocity = Vector3()
	if Input.is_action_pressed("move_forward"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("move_back"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("move_right"):
		velocity += transform.basis.x * speed
	if Input.is_action_pressed("move_left"):
		velocity += -transform.basis.x * speed
	if Input.is_action_pressed("move_up"):
		velocity += transform.basis.y * speed/2

	if Input.is_action_pressed("move_down"):
		velocity += -transform.basis.y * speed/2

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.relative.x > 0:
			rotate_y(-lerp(0, spin, event.relative.x/10))
		elif event.relative.x < 0:
			rotate_y(-lerp(0, spin, event.relative.x/10))
