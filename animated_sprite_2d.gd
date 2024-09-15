extends CharacterBody2D


const SPEED = 100.0



func _physics_process(delta: float) -> void:


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var left_right := Input.get_axis("ui_left", "ui_right")
	if left_right:
		velocity.x = left_right * SPEED
	else:
		velocity.x = move_toward(global_position.x, 0, SPEED)
		
	
	var up_down := Input.get_axis("ui_up", "ui_down")
	if up_down:
		velocity.y = up_down * SPEED
	else:
		velocity.y = move_toward(global_position.x, 0, SPEED)
