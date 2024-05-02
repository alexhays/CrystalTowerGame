extends StaticBody2D


var timer:Timer = Timer.new()

func _ready():
	# timer for repeatable events
	timer.one_shot = true
	timer.wait_time = 0.1
	add_child(timer)
	timer.start()

func _process(delta):
	if $Health.value <= $Health.min_health:
		queue_free()
	if timer.is_stopped():
		$Health.sub(1)
		timer.start()
