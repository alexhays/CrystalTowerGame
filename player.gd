extends CharacterBody2D


const SPEED = 600.0
const MAX_ZOOM = 2
const MIN_ZOOM = 1


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("left", "right")
	var directionY = Input.get_axis("up","down")
	var direction = Vector2.ZERO
	if directionX:
		direction.x = directionX
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if directionY:
		direction.y = directionY
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	velocity = direction.normalized()*SPEED

	move_and_slide()
