extends StaticBody2D

@export var speed = 5
var timer:Timer = Timer.new()

func _ready():
	# timer for repeatable events
	timer.one_shot = true
	timer.wait_time = 0.1
	add_child(timer)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Spike.rotate(delta*speed)
	if $Health.value <= $Health.min_health:
		queue_free()
	if timer.is_stopped():
		$Health.sub(1)
		timer.start()
