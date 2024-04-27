extends CharacterBody2D


@export var SPEED = 1000.0 # speed of camera
@export var ZOOM_SLOWDOWN = 200.0 # camera slowdown with zoom
@export var MAX_ZOOM = 3
@export var MIN_ZOOM = 0.5
@export var ZOOM_AMOUNT = 0.2


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
	velocity = direction.normalized()*(SPEED-ZOOM_SLOWDOWN*$Camera2D.zoom.x)

	move_and_slide()

func _input(event):
	if event.is_action_released("zoomIn"):
		$Camera2D.zoom.x = clamp($Camera2D.zoom.x+ZOOM_AMOUNT,MIN_ZOOM,MAX_ZOOM)
		$Camera2D.zoom.y = clamp($Camera2D.zoom.y+ZOOM_AMOUNT,MIN_ZOOM,MAX_ZOOM)
	if event.is_action_released("zoomOut"):
		$Camera2D.zoom.x = clamp($Camera2D.zoom.x-ZOOM_AMOUNT,MIN_ZOOM,MAX_ZOOM)
		$Camera2D.zoom.y = clamp($Camera2D.zoom.y-ZOOM_AMOUNT,MIN_ZOOM,MAX_ZOOM)
