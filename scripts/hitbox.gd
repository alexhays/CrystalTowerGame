class_name Hitbox
extends Area2D

@export var Health:Health
signal areaHit
signal areaMissed
var missTimer:Timer
@export var immunity:float = 0.1
var allowMissed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(Health!=null,"Missing Required Health Component")
	if immunity>0.01:
		allowMissed = true
		missTimer = Timer.new()
		add_child(missTimer)
		missTimer.one_shot = true
		missTimer.wait_time = immunity

func hit(damage:float):
	var doDamage = true
	if allowMissed:
		if missTimer.is_stopped():
			emit_signal("areaHit")
			missTimer.start()
		else:
			emit_signal("areaMissed")
			doDamage = false
	else:
		emit_signal("areaHit",damage)
	if doDamage:
		Health.sub(damage)
	return doDamage
