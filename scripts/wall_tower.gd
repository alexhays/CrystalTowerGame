extends StaticBody2D


var timer:Timer = Timer.new()

func _ready():
	# timer for repeatable events
	timer.one_shot = false
	timer.wait_time = 0.5
	add_child(timer)
	timer.start()
	timer.timeout.connect(_timer_queue)

func _process(delta):
	if $Health.value <= $Health.min_health:
		queue_free()

func _timer_queue():
	# test health decrease
	$Health.sub(1)
