extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@onready var player = $"."
@onready var animator = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var left := Input.is_action_pressed("left")
	var right := Input.is_action_pressed("right")
	var up := Input.is_action_pressed("up")
	var down := Input.is_action_pressed("down")
	
	if left or right or up or down:
		animator.play("walking_side_to_side")
	else:
		animator.stop()
	
	if left:
		velocity.x = -1.0 * SPEED
		if animator.scale.x > 0.0:
			animator.scale.x *= -1.0
	elif right:
		velocity.x = 1.0 * SPEED
		if animator.scale.x < 0.0:
			animator.scale.x *= -1.0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if up:
		velocity.y = -1.0 * SPEED
	elif down:
		velocity.y = 1.0 * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
